From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 31 Aug 2020 14:58:33 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: include
 Branches workflow
In-Reply-To: <20200831124350.GP14354@scaer>
References: <20200830155953.1650346-1-arnout@mind.be>
 <20200831124350.GP14354@scaer>
Message-ID: <2388ea60-a8cb-9685-b075-11b1a49be9ff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/08/2020 14:43, Yann E. MORIN wrote:
> Arnout, All,
> 
> +Romain and +Jugurtha, as we've had some discussions on that topic
> publicly and privately before.
> 
> On 2020-08-30 17:59 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> Recently, gitlab-ci has gained a lot more flexibility in when pipelines
>> are created. As a side-effect of this, double pipelines may be created
>> when a `when` clause is used in some job. Avoid this by adding a
>> workflow that launches it only on branches. See [1] and [2].
>>
>> Note that in reality, the duplicate pipelines only occur for merge
>> requests. Since we don't have merge requests, we don't have this
>> problem. Howver, gitlab also displays an annoying error message on the
>> pipeline page [3], and it sends an error mail to the triggerer (i.e.,
>> Arnout), so it's still useful to do this.
>>
>> [1] https://docs.gitlab.com/ee/ci/yaml/README.html#prevent-duplicate-pipelines
>> [2] https://docs.gitlab.com/ee/ci/yaml/README.html#workflowrules-templates
>> [3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/183589361/builds
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> I'd like to get this one in master, because the e-mails are annoying me
>> :-)
> 
> I'd like to suggest an alternative: move all the conditions into the
> generating script, now that we do have a script that generates the
> pipeline description.

 Note that it's not the complicated conditions on the defconfig and test jobs
that are the issue. The warning is also issued for check-flake8... So I think
the workflow will still be needed (or alternatively, every job should have a
condition to run only on branches).

 Also, I would like to move the "constant" bits back out to the top-level
gitlab-ci.yml, so the first page already shows the quick test results.

> Having the conditions in the script will help handle such cases, by only
> ever emitting those jobs we actually want to run. This would allow for
> more flexibility than the limited micro-language used by gitlab-ci.yml.
> 
> Also, this will allow us to not care about the evolutions of that micro-
> language.
> 
> To that effect, I already started workign on that two weeks ago, and I
> have omething that works as before (even better I think):
> 
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/gitlab-ci-cond
> 
> I just need to cleanup that last commit (and remember why I started
> doing it. meh...). I hope I'll be able to send it tonight.

 I think that's a great idea. However, that sounds like a bigger change which
probably shouldn't go into master. So I'd prefer to still merge my patch as well.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  support/misc/gitlab-ci.yml.in | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
>> index dddebf09e9..8a031898ef 100644
>> --- a/support/misc/gitlab-ci.yml.in
>> +++ b/support/misc/gitlab-ci.yml.in
>> @@ -1,6 +1,9 @@
>>  # Configuration for Gitlab-CI.
>>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
>>  
>> +include:
>> +  - template: 'Workflows/Branch-Pipelines.gitlab-ci.yml'
>> +
>>  image: buildroot/base:20200814.2228
>>  
>>  .check_base:
>> -- 
>> 2.26.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
