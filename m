From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 00:28:50 +0200
Subject: [Buildroot] [PATCH 2/2] .gitlab-ci.yml: run our runtime tests
In-Reply-To: <20170701222850.2215-1-thomas.petazzoni@free-electrons.com>
References: <20170701222850.2215-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170701222850.2215-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit improves our .gitlab-ci.yml logic to execute our runtime
tests located in support/testing/. To do so, this commit:

 - Adds more Debian packages to be installed, namely the nose2 and
   pexpect packages needed by the runtime testing infrastructure, as
   well as the necessary Qemu emulators

 - The description of how to run the runtime tests. Each test is
   executed as a separate Gitlab CI job, so that the status of each
   test is easily visible in the Gitlab CI web interface.

 - The Makefile is improved to auto-generate .gitlab-ci.yml from
   .gitlab-ci.yml.in, like we're doing for defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 37 +++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml.in | 12 ++++++++++++
 Makefile          |  7 +++++--
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0980ee2..ff271a1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -14,6 +14,7 @@ before_script:
     - apt-get install -y -qq --no-install-recommends
         build-essential locales bc ca-certificates file rsync gcc-multilib
         git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
+        python-nose2 python-pexpect qemu-system-arm qemu-system-x86
     # To be able to generate a toolchain with locales, enable one UTF-8 locale
     - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
     - /usr/sbin/locale-gen
@@ -29,6 +30,10 @@ before_script:
             exit 1
         }
 
+.runtime_test_script: &runtime_test_script
+    - mkdir test-output test-dl
+    - ./support/testing/run-tests -o test-output/ -d test-dl/ ${CI_BUILD_NAME}
+
 check-gitlab-ci.yml:
     script:
         - mv .gitlab-ci.yml .gitlab-ci.yml.orig
@@ -55,6 +60,13 @@ check-DEVELOPERS:
             - output/build/build-time.log
             - output/build/packages-file-list.txt
 
+.runtime_test: &runtime_test
+    script: *runtime_test_script
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - test-output/*.log
 acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
@@ -207,3 +219,28 @@ zynq_microzed_defconfig: *defconfig
 zynq_zc706_defconfig: *defconfig
 zynq_zed_defconfig: *defconfig
 zynq_zybo_defconfig: *defconfig
+tests.core.test_post_scripts.TestPostScripts: *runtime_test
+tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
+tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
+tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
+tests.core.test_timezone.TestNoTimezone: *runtime_test
+tests.fs.test_ext.TestExt2: *runtime_test
+tests.fs.test_ext.TestExt2r1: *runtime_test
+tests.fs.test_ext.TestExt3: *runtime_test
+tests.fs.test_ext.TestExt4: *runtime_test
+tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
+tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
+tests.fs.test_iso9660.TestIso9660GrubExternal: *runtime_test
+tests.fs.test_iso9660.TestIso9660GrubInternal: *runtime_test
+tests.fs.test_iso9660.TestIso9660SyslinuxExternal: *runtime_test
+tests.fs.test_iso9660.TestIso9660SyslinuxInternal: *runtime_test
+tests.fs.test_jffs2.TestJffs2: *runtime_test
+tests.fs.test_squashfs.TestSquashfs: *runtime_test
+tests.fs.test_ubi.TestUbi: *runtime_test
+tests.fs.test_yaffs2.TestYaffs2: *runtime_test
+tests.package.test_dropbear.TestDropbear: *runtime_test
+tests.package.test_python.TestPythonBase: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: *runtime_test
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index aed24e1..c5200b4 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -14,6 +14,7 @@ before_script:
     - apt-get install -y -qq --no-install-recommends
         build-essential locales bc ca-certificates file rsync gcc-multilib
         git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
+        python-nose2 python-pexpect qemu-system-arm qemu-system-x86
     # To be able to generate a toolchain with locales, enable one UTF-8 locale
     - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
     - /usr/sbin/locale-gen
@@ -29,6 +30,10 @@ before_script:
             exit 1
         }
 
+.runtime_test_script: &runtime_test_script
+    - mkdir test-output test-dl
+    - ./support/testing/run-tests -o test-output/ -d test-dl/ ${CI_BUILD_NAME}
+
 check-gitlab-ci.yml:
     script:
         - mv .gitlab-ci.yml .gitlab-ci.yml.orig
@@ -55,3 +60,10 @@ check-DEVELOPERS:
             - output/build/build-time.log
             - output/build/packages-file-list.txt
 
+.runtime_test: &runtime_test
+    script: *runtime_test_script
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - test-output/*.log
diff --git a/Makefile b/Makefile
index 8111582..86a9b5e 100644
--- a/Makefile
+++ b/Makefile
@@ -1105,8 +1105,11 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
-.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
-	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@
+FORCE:
+.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig FORCE
+	cp $< $@
+	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' >> $@
+	./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)
-- 
2.9.4
