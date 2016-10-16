From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 09:25:49 +0200
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
In-Reply-To: <580308adbc1c4_26773ff56a3c4b24498bb@ultri3.mail>
References: <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
 <580308adbc1c4_26773ff56a3c4b24498bb@ultri3.mail>
Message-ID: <97a00115-1935-4e29-05b6-55d781f2c11b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-10-16 06:57, Ricardo Martincoski wrote:
> Hello,
> 
> On Fri, Oct 14, 2016 at 07:50 PM, Arnout Vandecappelle wrote:
> 
>> On 13-10-16 17:50, Bryce Ferguson wrote:
> [snip]
>>> +++ b/support/download/git
>>> @@ -55,6 +55,23 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>>>      fi
>>>  fi
>>>  if [ ${git_done} -eq 0 ]; then
>>> +    # See if $cset is a sha that maps to a branch, then shallow clone that branch
>>> +    equivalent_ref="$(_git ls-remote --heads --tags "'${repo}'" | awk "/^${cset}/{ print \$2; exit }" | sed 's,refs/\(tags\|heads\)/,,')"
>>
>>  There should be a redirect of stderr of ls-remote (we don't want to see any
>> errors from it, the relevant error is the one coming from git clone).
>>
>>  This line is way too long.
>>
>>  Also, you can get rid of the sed by including it in awk:
>>
>> 	{ split(\$2, a, \"/\"); print a[3]; exit }
> 
> This expression will need be more complex in order to support refs like this:
> 74c4e04dbb10a5cdeac36e3f1057946e551beb84        refs/heads/feature/vxlan

 Actually, it is better to use the whole ref, includes refs/*/ because there may
be a branch and tag with the same name. And incidentally this simplifies the awk
expression :-)

 Grmbl, git clone doesn't support refs/.../... style of refs. git clone sucks.
Why don't we do

git init
git fetch

all the time? We're anyway doing a git fetch down there... Could just as well be
done always. Oh, and git fetch does support --depth so no issue there.

>>  Also, wouldn't it be better to merge this into the first one? ls-remote takes a
>> relatively long time, and it seems to be independent of how much refs are
>> actually printed, so it seems a waste to do it twice. It does mean that the awk
>> program would become a little more complicated because it also has to match the
>> cset as a ref.
> 
> I agree with merging this 'if' to the previous one.
> It also will make the log cleaner, see example messages at the end.
> 
>>
>>  Hm, actually, cset may be something like refs/tags/foo so the awk program would
>> get quite a bit more complicated... Still, I think it's worth it.
> 
> It worth a try.
> 
> But maybe it can turn out to be challenging to achieve a single line that
> generates the proper reference to be used in the git clone.
> In this case we could achieve the same behavior keeping the 2 ifs.
> Something like this:
> 
> if _git check-ref-format "'${cset}'"; then
> # branch or tag, so use the old if (if 'git ls-remote', 'git clone')
> else
> # sha1, so use the new if (ref='git ls-remote | awk', if ref 'git clone')
> fi
> 
> Do you think it would be acceptable?

 Certainly acceptable, especially if you write a nice commit message explaining
why it is better like that.

> 
> And yet another approach would be to first of all save the output of 'git
> ls-remote' with all refs to a temporary file. And then use this file to check
> ${cset} is a sha1, branch or tag. Later on, in the same script this temp file
> could be checked for special refs too (in another patch).
> But I don't know if this approach would be acceptable either.

 That would certainly be acceptable.


 Regards,
 Arnout

> 
>>
>>> +    if [ -n "$equivalent_ref" ]; then
>>> +        printf "Doing shallow clone with cset '%s' as '%s'\n" "$cset" "$equivalent_ref"
>>> +        if _git clone ${verbose} "${@}" --depth 1 -b "'${equivalent_ref}'" "'${repo}'" "'${basename}'"; then
>>> +            if (cd "${basename}" && _git show "'${cset}'" >/dev/null 2>&1); then
>>
>>  Can you explain why this bit is still needed? Is there any way that the clone
>> could succeed but the cset not be present? It would mean that ls-remote was
>> lying to us, no?
>>
>>  I can invent one scenario: the symbolic ref got updated between the ls-remote
>> and the clone, which means that the wrong commit got shallow-cloned, and the
>> actual cset is not reachable. Hm, ok, can you add a comment to explain that?
>>
>>
>>  Otherwise looks good :-)
>>
>>  Regards,
>>  Arnout
> [snip]
> 
> With this patch applied and using this dirty hack:
> 
> TMUX_VERSION = 74c4e04dbb10a5cdeac36e3f1057946e551beb84
> TMUX_SITE = https://review.openswitch.net/openswitch/ops
> TMUX_SITE_METHOD = git
> 
> I get these log messages:
> 
> Doing shallow clone
> Cloning into 'tmux-74c4e04dbb10a5cdeac36e3f1057946e551beb84'...
> warning: Could not find remote branch 74c4e04dbb10a5cdeac36e3f1057946e551beb84 to clone.
> fatal: Remote branch 74c4e04dbb10a5cdeac36e3f1057946e551beb84 not found in upstream origin
> Shallow clone failed, falling back to doing a full clone
> Doing shallow clone with cset '74c4e04dbb10a5cdeac36e3f1057946e551beb84' as 'feature/vxlan'
> Cloning into 'tmux-74c4e04dbb10a5cdeac36e3f1057946e551beb84'...
> remote: Counting objects: 585, done
> 
> Regards,
> Ricardo
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
