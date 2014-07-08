From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jul 2014 18:42:05 +0200
Subject: [Buildroot] [PATCH 2/5] support/download: properly use temp
	files
In-Reply-To: <20140707213802.GC3806@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <3c2e529b6f9c542dba662b08b54f844f275e23ee.1404681878.git.yann.morin.1998@free.fr>
 <53BA3A1A.1000307@mind.be> <20140707213802.GC3806@free.fr>
Message-ID: <53BC1F5D.2050407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/14 23:38, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-07-07 08:11 +0200, Arnout Vandecappelle spake thusly:
>> On 06/07/14 23:27, Yann E. MORIN wrote:
>>> When using 'mv' to move files to temp files, the existing temp file is
>>> forcibly removed by 'mv', and a new file is created.
>>>
>>> Although this should have little impact to us, there is still a race
>>> conditions in case two parallel downloads would step on each other's
>>> toes, and it goes like that:
>>>
>>>     Process 1                       Process 2
>>>     mktemp tmp_output
>>>     mv tmp_dl tmp_output
>>>         removes tmp_output
>>>                                     mktemp tmp_ouput
>>>         writes to tmp_output
>>>                                     mv tmp_dl tmp_output
>>>                                         removes tmp_output
>>>                                         writes to tmp_output
>>>     mv tmp_output output
>>>                                     mv tmp_output output
>>>
>>> In this case, mktemp has the opportunity to create the same tmp_output
>>> temporary file, and we trash the content from one with the content
>>> from the other, and the last to do the final 'mv' breaks horibly.
>>>
>>> Instead, use 'cat', which guarantees that tmp_output is not removed
>>> before writing to it.
>>
>>  Not that it makes a real difference, but I think that 'cp' is a more natural
>> way to do this.
> 
> I am not sure how cp handles copying over an existing file. I'll
> check...

 It does. It only unlinks if open(O_TRUNC) fails. (Checked with strace for
coreutils and my reading the source for busybox.)


> 
>>> This complexifies a bit the local-files (cp) helper, but better safe
>>> than sorry.
>>>
>>> (Note: this is a purely theoretical issue, I did not observe it yet, but
>>> it is slated to happen one day or the other, and will be very hard to
>>> debug then.)
>>
>>  Actually, since the mktemp string is based on time and PID, the chance of this
>> happening is really vanishingly small. That said, better safe than sorry.
> 
> Yes, the opportunity for a collision is very low, but it's not
> impossible. After all, that's the problem with race conditions: given
> sufficient time and trials, you'll hit it, and it is very hard to debug,
> especially in this case, since the condition is not reproducible (random
> names.)

 Well, since mktemp uses /dev/urandom to generate the file pattern (I was wrong
about time/pid, that's only if urandom is not available), the 6-character random
number has a collision frequency of about 10^10. The chance that such a
collision occurs at exactly the moment that we're doing two parallel downloads
of the same source is pretty darn small - much smaller than the chance of a sha1
collision I think.

> 
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> ---
>>>  support/download/bzr  | 2 +-
>>>  support/download/cp   | 9 ++++++---
>>>  support/download/cvs  | 2 +-
>>>  support/download/git  | 4 ++--
>>>  support/download/hg   | 2 +-
>>>  support/download/scp  | 2 +-
>>>  support/download/svn  | 2 +-
>>>  support/download/wget | 2 +-
>>>  8 files changed, 14 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/support/download/bzr b/support/download/bzr
>>> index 19d837d..f86fa82 100755
>>> --- a/support/download/bzr
>>> +++ b/support/download/bzr
>>> @@ -27,7 +27,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>>>  
>>>  ret=1
>>>  if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
>>> -    if mv "${tmp_dl}" "${tmp_output}"; then
>>> +    if cat "${tmp_dl}" >"${tmp_output}"; then
>>>          mv "${tmp_output}" "${output}"
>>>          ret=0
>>>      fi
>>
>>  Not really related to this patch, but why do we need this ${tmp_dl} to begin
>> with? Especially since we're already "occupying" a tempfile in DL_DIR anyway.
> 
> The idea was not to pollute BR2_DL_DIR, in case the download fails.
> Hence this dance:
>   - download to a disposable area (BUILD_DIR);
>   - move to a temp file in BR2_DL_DIR;
>   - atomically rename to the final file.
> 
> But granted, since  we remove failed downloads, we can skip the
> intermediary temp file in BUILD_DIR (although I still do not like much
> the idea of polluting BR2_DL_DIR.)

 Well, now you pollute BR2_DL_DIR with ${tmp_output} instead of ${tmp_dl}. Oh,
now I get it: if a download is interrupted, you'll leave the partial download in
BUILD_DIR instead of DL_DIR. OK, sorry about the noise.

> 
> I think there is still a case for which we can't remove the temp file...
> Ah yes, if the user cancels a build with Ctrl-C, the script is aborted,
> so we leave a .XXXXXX file in BR2_DL_DIR.

 Ctrl-C is SIGINT so it can be trap'ped.

> 
> But even with the three-step dance above, there is still a small window
> for leaving out cruft in BR2_DL_DIR; but that window is much, much
> smaller than the download window.

 Ack.

> 
>>  Also, with this added complexity, the download helper scripts are becoming
>> quite similar. So wouldn't it be a good idea to refactor them?
> 
> I think we already had this discussion back when I introduced the series:
>     http://lists.busybox.net/pipermail/buildroot/2014-January/086826.html
> 
> But for now, there are a few important fixes I'd like be applied before
> going further.

 OK.


> 
>> I'm thinking of
>> something like this:
>>
>> support/download/helper:
>>
>> #!/bin/bash
>>
>> # We want to catch any command failure, and exit immediately
>> set -e
>>
>> # Generic download helper
>> # Call it with:
>> #   $1: specific download helper
>> #   $2: output file
>> #   ...: arguments for the specific download helper
>>
>> download="${1}"
>> output="${2}"
>> shift 2
>>
>> tmp_output="$( mktemp ... )"
>> if "${download}" "${tmp_output}" "$@"; then
>> 	# Blah blah need things to be atomic blah blah
>> 	mv "${tmp_output}" "${output}"
>> fi
> 
> Oh, you meant having a wrapper script above all the other helpers, and
> delegate to the helpers only the download, and handle the atomicity
> dance to the wrapper. Hmmm... Might be worth looking at, probably, yes.

 But if you have more urgent fixes, that's OK.

> 
>>  I expect there will be even more common stuff between the download helpers in
>> the future, so it makes sense to have this.
> 
> Well, for one, moving the hash check in that wrapper, for example...
> 
[snip]
>>> diff --git a/support/download/git b/support/download/git
>>> index badb491..b0031e5 100755
>>> --- a/support/download/git
>>> +++ b/support/download/git
>>> @@ -43,8 +43,8 @@ fi
>>>  
>>>  ret=1
>>>  pushd "${repodir}" >/dev/null
>>> -if ${GIT} archive --prefix="${basename}/" -o "${tmp_tar}" \
>>> -                  --format=tar "${cset}"; then
>>> +if ${GIT} archive --prefix="${basename}/" --format=tar "${cset}" \
>>> +                  >"${tmp_tar}"; then
>>
>>  What's the reason for this change? I've checked with strace, and git archive
>> doesn't seem to unlink, it just does open(O_TRUNC) like cp.
> 
> Ah, so you did strace both? I straced scp, and it does unlink.
> Are we sure all cp and all tar we can encounter will all use
> open(O_TRUNC) ?

 Well, the unlink behaviour of mv is rather surprising if you ask me. Normally
when you create a file that already exists, you'd want it to retain the
attributes it has (owner, group, mod, acl, symlink, hardlinks).

> 
> It'd rather go on the safe side, and not assume much about this,
> especially since that behaviour may change in the future, or may not
> show in older versions, or different versions.

 OK, fair enough.

> 
>>>      if gzip -c "${tmp_tar}" >"${tmp_output}"; then
>>>          mv "${tmp_output}" "${output}"
>>>          ret=0
>>> diff --git a/support/download/hg b/support/download/hg
>>> index 6e9e26b..8b36db9 100755
>>> --- a/support/download/hg
>>> +++ b/support/download/hg
>>> @@ -35,7 +35,7 @@ ret=1
>>>  if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
>>>      if ${HG} archive --repository "${repodir}" --type tgz \
>>>                       --prefix "${basename}" --rev "${cset}" \
>>> -                     "${tmp_output}"; then
>>> +                     - >"${tmp_output}"; then
>>
>>  I didn't check for hg, but I also don't expect it to unlink() first. In fact,
>> it's mv's behaviour of unlinking first that is surprising.
> 
> Well, scp also unlinks first.

 No it doesn't... Or else I'm doing something really wrong with my strace...


 Regards,
 Arnout

> 
> And same answer, I don;t want to rely on such a behaviour. Redirecting
> works the same everywhere, though.
> 
>>>          mv "${tmp_output}" "${output}"
>>>          ret=0
>>>      fi
>>> diff --git a/support/download/scp b/support/download/scp
>>> index d3aad43..e16ece5 100755
>>> --- a/support/download/scp
>>> +++ b/support/download/scp
>>> @@ -17,7 +17,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>>>  
>>>  ret=1
>>>  if ${SCP} "${url}" "${tmp_dl}"; then
>>> -    if mv "${tmp_dl}" "${tmp_output}"; then
>>> +    if cat "${tmp_dl}" >"${tmp_output}"; then
>>>          mv "${tmp_output}" "${output}"
>>>          ret=0
>>>      fi
>>> diff --git a/support/download/svn b/support/download/svn
>>> index 39cbbcb..259d3ed 100755
>>> --- a/support/download/svn
>>> +++ b/support/download/svn
>>> @@ -33,7 +33,7 @@ rm -rf "${repodir}"
>>>  
>>>  ret=1
>>>  if ${SVN} export "${repo}@${rev}" "${repodir}"; then
>>> -    if tar czf "${tmp_output}" "${repodir}"; then
>>> +    if tar czf - "${repodir}" >"${tmp_output}"; then
>>
>>  Again, tar doesn't unlink so this isn't needed.
> 
> Ditto.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
