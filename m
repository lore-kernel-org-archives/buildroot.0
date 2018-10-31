From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:13:14 +0100
Subject: [Buildroot] [PATCH 0/3] .gitlab-ci.yml: add trigger per job and
 per type of job
In-Reply-To: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
References: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
Message-ID: <20181031101314.48ef5e39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Sun, 28 Oct 2018 20:58:36 -0300, Ricardo Martincoski wrote:

> This series allows the user of GitLab pipeline to trigger some interesting
> subsets of jobs by pushing temporary branches with names that match regexps:
>  - all defconfigs: /.*-defconfigs$/
>  - all runtime tests: /.*-runtime-tests$/
>  - one defconfig: /.*-defconfig_name$/
>  - one test case: /.*-test_case_name$/
> The check-* jobs keep being triggered for all pushes: branches that match one of
> the regexps above, branches that don't match them, and tags.
> Pushing a tag still triggers all jobs.
> 
> The first patch adds the first two regexps.
> The second patch prepares to add the per job trigger but don't change any
> functionality.
> The last patch actually adds the per defconfig and per runtime test triggers.

Thanks for working on this! Overall, it looks good to me. The only
thing that I find a bit disturbing is that the "generic" tests (i.e
check-package and al.) are always done, even if you specifically ask to
only run a specific defconfig build or a specific runtime test.

I.e, something like:

> $ git push gitlab HEAD:test3-qemu_arm_versatile_defconfig
> results in 5 jobs
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614400

is a bit weird, because one would expect to have only a single job,
building qemu_arm_versatile_defconfig.

Not directly related to patch series, but related to gitlab CI testing,
I have a few questions where you could possibly help.

Currently:

 - at every push, gitlab CI is doing the "generic" tests. This happens
   for all branches, because it takes place for every push. This looks
   good to me, the only change I'd like to make is to redirect the
   e-mail notifications to the mailing list.

 - every week, a cronjob does a trigger:

   curl -X POST -F token=SOMETHING -F ref=master
   https://gitlab.com/api/v4/projects/2648174/trigger/pipeline

   First, this does not test all branches, which could trivially be
   fixed by doing several triggers, one per branch with different
   ref=<value>.

   However, the output at
   https://gitlab.com/buildroot.org/buildroot/pipelines is not very
   nice, as everything is fixed together: we cannot distinguish easily the
   pipelines that ran just the generic tests or the ones who ran the
   runtime tests and defconfig tests. Ideally, it would be nice to have
   separately the results for the runtime tests and defconfig tests.

So, with your feature, I'm wondering if instead of using this explicit
trigger mechanism, we shouldn't have a cronjob that pushes branches
with a name that will trigger what we want, i.e something like this
(pseudo-code):

# perhaps we could automatically grab this from
# http://autobuild.buildroot.net/branches
BRANCHES="2018.02.x 2018.08.x master"

timestamp=$(date +%s)
for branch in ${BRANCHES} ; do
  git push gitlab ${branch}:${branch}-defconfigs-${timestamp}
  git push gitlab ${branch}:${branch}-runtime-tests-${timestamp}
done

This would give us separate branch names for every test, which would
make the output in https://gitlab.com/buildroot.org/buildroot/pipelines
a lot more readable.

What do you think about this? Is this a good idea? Do you see other
solutions with what Gitlab CI provides?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
