From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Feb 2021 11:58:21 +0100
Subject: [Buildroot] [PATCH] support/download/svn: fix date format for
 archive creation
In-Reply-To: <20210220095148.GI2276@scaer>
References: <20210219212154.27107-1-vfazio@xes-inc.com>
 <20210220095148.GI2276@scaer>
Message-ID: <4cba7ba3-06c7-b45b-81c8-4746bcee2bcf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/02/2021 10:51, Yann E. MORIN wrote:
> Vincent, All,
> 
> Arnout, question for you toward the end...
> 
> On 2021-02-19 15:21 -0600, Vincent Fazio spake thusly:
>> Previously we would use the date provided by:
>> `svn info --show-item last-changed-date ...`
>>
>> The date returned from this command could include sub-second precision
>> which is not compatible with the PAX options we specify to GNU tar.
>>
>> Now the returned date is massaged to drop the sub-seconds.
>>
>> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> 
> Thank you for spinning this one right before you sprung on the train to
> your holidays!
> 
>> ---
>>  support/download/svn | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/support/download/svn b/support/download/svn
>> index 839dccaf62..ea1032267f 100755
>> --- a/support/download/svn
>> +++ b/support/download/svn
>> @@ -52,6 +52,9 @@ _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
>>  # last line (svn outputs everything on stdout)
>>  date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
>>  
>> +# Drop sub-second precision to play nice with GNU tar's valid_timespec check
>> +date="$( date -d "${date}" -uIseconds )"
> 
> So, I did some checks about when 'date -d' learnt to deal with
> sub-second precision. Not sure when, but it is suported in all the
> major distributions still maintained (centos 7, debian jessie, ubuntu
> trusty), while it was not in some earlier versions (centos 6, debian
> squeeze).

A much simpler solution is

date="$( date -d "${date}" -u +%Y-%m-%dT%T%:z )"

which is fully portable over any POSIX-compliant version of date.

> 
> So that's fine for me.
> 
> But I wonder whether this should be svn-specific, or whether we should
> move it into the generic herlper mk_tar_gz()... Arnout, thoughts?

 I would expect any sane VCS to be able to show the last change date in ISO 8601
format - I'd hope that SVN is the exception rather than the rule...

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>>  # Generate the archive.
>>  # We did a 'svn export' above, so it's not a working copy (there is no .svn
>>  # directory or file to ignore).
>> -- 
>> 2.30.0
>>
> 
