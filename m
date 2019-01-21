From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Jan 2019 23:11:10 -0200
Subject: [Buildroot] [PATCH v3 0/5] .gitlab-ci.yml: rework and add trigger
 per job
In-Reply-To: <20190116224556.8619-1-ricardo.martincoski@gmail.com>
References: <20190116224556.8619-1-ricardo.martincoski@gmail.com>
Message-ID: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Beside the current subsets of jobs that can be triggered by pushing temporary
branches with special names:
 - all defconfigs: /.*-defconfigs$/
 - all runtime tests: /.*-runtime-tests$/
This series allows the user of GitLab pipeline to trigger some interesting
subsets of jobs by pushing temporary branches with names that match regexps:
 - one defconfig: /.*-defconfig_name$/
 - one test case: /.*-test_case_name$/
Pushing a tag still triggers all jobs.
Using an API token still triggers all jobs.

Patches 1 to 3 rework .gitlab-ci.yml to make maintenance easier:
 - do not copy anymore the content of the template into .gitlab-ci.yml, use
   instead the new keywords "extends" and "include";
 - reorder the template so similar keys stay together;
Patch 4 could be merged to patch 5, but for the sake of easier review/testing I
had split them.
Patches 1 to 4 do not change any functionality.

Finally patch 5 actually adds the per defconfig and per runtime test triggers.

Regards,
Ricardo

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ricardo Martincoski (5):
  .gitlab-ci.yml: use "extends" keyword
  .gitlab-ci.yml: use "include" keyword
  .gitlab-ci.yml: reorder jobs
  .gitlab-ci.yml: prepare to reuse scripts
  .gitlab-ci.yml: add trigger per job

 .gitlab-ci.yml.in => .gitlab-ci-template.yml |  94 ++-
 .gitlab-ci.yml                               | 703 ++++++++-----------
 Makefile                                     |   4 +-
 support/scripts/generate-gitlab-ci-yml       |  13 +-
 4 files changed, 384 insertions(+), 430 deletions(-)
 rename .gitlab-ci.yml.in => .gitlab-ci-template.yml (60%)

-- 
2.17.1
