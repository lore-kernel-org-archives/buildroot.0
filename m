From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 02 Nov 2018 01:22:55 -0300
Subject: [Buildroot] [PATCH 0/3] .gitlab-ci.yml: add trigger per job and
 per type of job
References: <20181031101314.48ef5e39@windsurf>
Message-ID: <5bdbd11f86fc6_1f63f9dfc0dc0bc5864a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, Oct 31, 2018 at 06:13 AM, Thomas Petazzoni wrote:

> On Sun, 28 Oct 2018 20:58:36 -0300, Ricardo Martincoski wrote:
> 
>> This series allows the user of GitLab pipeline to trigger some interesting
>> subsets of jobs by pushing temporary branches with names that match regexps:
>>  - all defconfigs: /.*-defconfigs$/
>>  - all runtime tests: /.*-runtime-tests$/
>>  - one defconfig: /.*-defconfig_name$/
>>  - one test case: /.*-test_case_name$/
>> The check-* jobs keep being triggered for all pushes: branches that match one of
>> the regexps above, branches that don't match them, and tags.
>> Pushing a tag still triggers all jobs.
>> 
>> The first patch adds the first two regexps.
>> The second patch prepares to add the per job trigger but don't change any
>> functionality.
>> The last patch actually adds the per defconfig and per runtime test triggers.
> 
> Thanks for working on this! Overall, it looks good to me. The only
> thing that I find a bit disturbing is that the "generic" tests (i.e
> check-package and al.) are always done, even if you specifically ask to
> only run a specific defconfig build or a specific runtime test.
> 
> I.e, something like:
> 
>> $ git push gitlab HEAD:test3-qemu_arm_versatile_defconfig
>> results in 5 jobs
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614400
> 
> is a bit weird, because one would expect to have only a single job,
> building qemu_arm_versatile_defconfig.

Yes. It's a bit weird. I did like this to avoid messing with the generic tests
running on every push.

The correct solution to get ride of them IMO is to create yet another specific
regexp for the generic tests.
/-generic-tests(-[\d+])?$/
There are only 4 and they run fast, so I think there is no need for per job
trigger for them.
Notice that it implies in not running any jobs for ordinary pushes.

But maybe even the generic tests running on every push is too much.
Automatically running them once a day seems reasonable to me.

And whenever the gut feeling tells that a patch or patch series can break any of
them (or even when a runtime test or defconfig should be run to detect possible
regressions) we would still be allowed to manually trigger them by using the
special branch names, even before the patch is applied to the main repo.
And if the asked test fails with the patch, asking the same test for the current
master is also easy, so we can be sure the patch being tested is the culprit,
not any other commit that was applied to master after the last cronjob ran.

> 
> Not directly related to patch series, but related to gitlab CI testing,
> I have a few questions where you could possibly help.
> 
> Currently:
> 
>  - at every push, gitlab CI is doing the "generic" tests. This happens
>    for all branches, because it takes place for every push. This looks
>    good to me, the only change I'd like to make is to redirect the
>    e-mail notifications to the mailing list.

So maybe it could also be a cronjob, running once a day.

> 
>  - every week, a cronjob does a trigger:
> 
>    curl -X POST -F token=SOMETHING -F ref=master
>    https://gitlab.com/api/v4/projects/2648174/trigger/pipeline
> 
>    First, this does not test all branches, which could trivially be
>    fixed by doing several triggers, one per branch with different
>    ref=<value>.
> 
>    However, the output at
>    https://gitlab.com/buildroot.org/buildroot/pipelines is not very
>    nice, as everything is fixed together: we cannot distinguish easily the
>    pipelines that ran just the generic tests or the ones who ran the
>    runtime tests and defconfig tests. Ideally, it would be nice to have
>    separately the results for the runtime tests and defconfig tests.
> 
> So, with your feature, I'm wondering if instead of using this explicit
> trigger mechanism, we shouldn't have a cronjob that pushes branches
> with a name that will trigger what we want, i.e something like this
> (pseudo-code):
> 
> # perhaps we could automatically grab this from
> # http://autobuild.buildroot.net/branches
> BRANCHES="2018.02.x 2018.08.x master"
> 
> timestamp=$(date +%s)

Maybe 'date +%Y%m%d' is more friendly for those like me that don't know which
day it is by just looking at a number of seconds since epoch :-)
But I don't care much.

> for branch in ${BRANCHES} ; do
>   git push gitlab ${branch}:${branch}-defconfigs-${timestamp}
>   git push gitlab ${branch}:${branch}-runtime-tests-${timestamp}
> done

So perhaps these are more suitable regexps:
/-defconfigs(-[\d+])?$/
/-runtime-tests(-[\d+])?$/

> 
> This would give us separate branch names for every test, which would
> make the output in https://gitlab.com/buildroot.org/buildroot/pipelines
> a lot more readable.

Indeed. The GUI has a small column for this and will display only
master-runt...
when the mouse pointer is not hovering the name, but it gives a good idea what
the pipeline did tested.

> 
> What do you think about this? Is this a good idea? Do you see other
> solutions with what Gitlab CI provides?

I think it is a good idea.
I don't see any better solution using only Gitlab.

Using different branches for each pipeline that cronjob triggers have 2 small
downsides I can think of:
 - we lose the 'latest' label from the 'Pipeline' column because all pipelines
   will have it. I don't think it adds much info anyway.
 - the list of stale branches will grow. That shouldn't bring problems, and we
   can always remove branches from time to time (yearly?) if we like. Removing a
   branch does not seem to remove the associated pipelines.

So, +1 to adopt this.


Regards,
Ricardo
