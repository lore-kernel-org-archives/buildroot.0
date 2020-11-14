From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 14 Nov 2020 17:58:12 +0100
Subject: [Buildroot] [RFC] support/scripts: reduce the number of jobs
 created when a tag is added
Message-ID: <20201114165812.1912291-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently when a tag is added to the Buildroot git tree, the gitlab-ci
create 613 jobs. This trigger the error "pipeline job activity limit exceeded"
and created jobs are stuck indefinitely (we need to restart manually a
job to execute the pipeline).

In order to reduce the number of jobs created, we keep only the runtime
tests and the Qemu's defconfigs.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
I would like to keep Qemu runtime testing when a tag is added because
it test the toolchain provided by default by Buildroot on several
architectures.
---
 support/scripts/generate-gitlab-ci-yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 4d979dd819..eaa3b226aa 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -36,6 +36,9 @@ gen_tests() {
              )
 
     if [ -n "${CI_COMMIT_TAG}" ]; then
+        # When a tag is added to the Buildroot git tree, we want
+        # to run the runtime tests and only testing Qemu defconfigs.
+        defconfigs=( $(cd configs; LC_ALL=C ls -1 qemu_*_defconfig) )
         do_basics=true
         do_defconfigs=base
         do_runtime=true
-- 
2.25.4
