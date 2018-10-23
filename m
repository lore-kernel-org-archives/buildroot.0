From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 23 Oct 2018 00:13:37 -0300
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: do runtime tests only on
 explicit trigger
References: <4e9b7774-6f73-418b-eba3-0036b8d7a239@mind.be>
Message-ID: <5bce91e173201_161d2af64544f82051e8@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 22, 2018 at 08:08 PM, Arnout Vandecappelle wrote:

> On 10/22/18 3:35 AM, Ricardo Martincoski wrote:
>> 
>> On Sun, Oct 21, 2018 at 08:23 AM, Arnout Vandecappelle wrote:
[snip]
>>>  Would it be possible to also define branches for a specific test or defconfig?
>> 
>> Yes.
>> 
>> Using the same commit, I pushed 3 branches and a tag:
>> git push gitlab HEAD:test2               #jobs = 4
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/33765315
>> git push gitlab HEAD:test2-TestSyslogNg  #jobs = 5
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/33765342
>> git push gitlab HEAD:test2-runtime_test  #jobs = 72
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/33765317
>> git push gitlab test2-tag                #jobs = 260
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/33765321
> 
>  Nice! I suppose test2-tag is actually a tag, not a branch, so it matches the
> 'tags' trigger?

Yes. It is a tag.

> 
>> 
>> We will need some extra 'sed' trickery to create a regexp for each test case:
>> -tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
>> +tests.package.test_syslog_ng.TestSyslogNg:
>> +    <<: *runtime_test
>> +    only:
>> +        - triggers
>> +        - tags
>> +        - /^.*-runtime_test$/
>> +        - /^.*-TestSyslogNg$/
> 
>  Maybe you can use variables in there? So, in the only specification of
> .runtime_test:
> 
>     only:
>         - triggers
>         - tags
>         - /^.*-runtime_test$/
>         - /^.*-${CI_JOB_NAME}$/
> 
>  Hm, unlikely, otherwise the other $ would have to be quoted.

Maybe using %variable%. I didn't tested yet.

> 
>  Apparently nowadays there is also support for more complex only specifications
> using variables. Perhaps you could take a look at that? I'm afraid though that
> it's always an AND of the conditions you specify, so no way to specify that it's
> for tags OR for things matching the CI_JOB_NAME.

I will take a look.


Regards,
Ricardo
