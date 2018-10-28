From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 28 Oct 2018 20:58:36 -0300
Subject: [Buildroot] [PATCH 0/3] .gitlab-ci.yml: add trigger per job and per
 type of job
Message-ID: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series allows the user of GitLab pipeline to trigger some interesting
subsets of jobs by pushing temporary branches with names that match regexps:
 - all defconfigs: /.*-defconfigs$/
 - all runtime tests: /.*-runtime-tests$/
 - one defconfig: /.*-defconfig_name$/
 - one test case: /.*-test_case_name$/
The check-* jobs keep being triggered for all pushes: branches that match one of
the regexps above, branches that don't match them, and tags.
Pushing a tag still triggers all jobs.

The first patch adds the first two regexps.
The second patch prepares to add the per job trigger but don't change any
functionality.
The last patch actually adds the per defconfig and per runtime test triggers.


With only patch 1 applied, using a local branch named test1:

$ git tag tag1
$ git push gitlab tag1
results in 260 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34613530

$ git push gitlab test1
results in 4 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34613494

$ git push gitlab HEAD:test1-defconfigs
results in 192 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34613558

$ git push gitlab HEAD:test1-runtime-tests
results in 72 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34613616


With all patches applied, using a local branch named test3:

$ git tag tag3
$ git push gitlab tag3
results in 260 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614775

$ git push gitlab test3
results in 4 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614682

$ git push gitlab HEAD:test3-defconfigs
results in 192 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614821

$ git push gitlab HEAD:test3-runtime-tests
results in 72 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614415

$ git push gitlab HEAD:test3-tests.core.test_file_capabilities.TestFileCapabilities
results in 5 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614380

$ git push gitlab HEAD:test3-qemu_arm_versatile_defconfig
results in 5 jobs
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/34614400


Regards,
Ricardo

Ricardo Martincoski (3):
  .gitlab-ci.yml: add trigger per type of job
  Makefile: offload .gitlab-ci.yml generation
  .gitlab-ci.yml: add trigger per job

 .gitlab-ci.yml                         | 2050 +++++++++++++++++++++---
 .gitlab-ci.yml.in                      |    2 +
 Makefile                               |    4 +-
 support/scripts/generate-gitlab-ci-yml |   37 +
 4 files changed, 1834 insertions(+), 259 deletions(-)
 create mode 100755 support/scripts/generate-gitlab-ci-yml

-- 
2.17.1
