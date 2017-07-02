From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 2 Jul 2017 18:13:22 +0200
Subject: [Buildroot] [PATCH 1/3] .gitlab-ci.yml: run our runtime tests
Message-ID: <20170702161324.485-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit improves our .gitlab-ci.yml logic to execute our runtime
tests located in support/testing/. To do so, this commit:

 - Adds more Debian packages to be installed, namely the nose2 and
   pexpect packages needed by the runtime testing infrastructure, as
   well as the necessary Qemu emulators

 - The description of how to run the runtime tests. Each test is
   executed as a separate Gitlab CI job, so that the status of each
   test is easily visible in the Gitlab CI web interface.

 - The Makefile is improved to auto-generate .gitlab-ci.yml from
   .gitlab-ci.yml.in, like we're doing for defconfigs. Since the
   dependencies of .gitlab-ci.yml are no longer correct, we abandon
   them and instead make it a PHONY target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Arnout: simplify .gitlab-ci.in a little, removing redundant stuff;
         make .gitlab-ci.yml a PHONY target]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 33 +++++++++++++++++++++++++++++++++
 .gitlab-ci.yml.in |  8 ++++++++
 Makefile          |  7 +++++--
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index eda8af4997..7acf4b620e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,6 +13,7 @@ before_script:
     - apt-get install -y -qq --no-install-recommends
         build-essential locales bc ca-certificates file rsync gcc-multilib
         git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
+        python-nose2 python-pexpect qemu-system-arm qemu-system-x86
     # To be able to generate a toolchain with locales, enable one UTF-8 locale
     - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
     - /usr/sbin/locale-gen
@@ -57,6 +58,13 @@ check-DEVELOPERS:
             - output/build/build-time.log
             - output/build/packages-file-list.txt
 
+.runtime_test: &runtime_test
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ ${CI_BUILD_NAME}
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - test-output/*.log
 acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
@@ -209,3 +217,28 @@ zynq_microzed_defconfig: *defconfig
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
index 24a1888c1e..c69f9de99c 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -13,6 +13,7 @@ before_script:
     - apt-get install -y -qq --no-install-recommends
         build-essential locales bc ca-certificates file rsync gcc-multilib
         git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
+        python-nose2 python-pexpect qemu-system-arm qemu-system-x86
     # To be able to generate a toolchain with locales, enable one UTF-8 locale
     - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
     - /usr/sbin/locale-gen
@@ -57,3 +58,10 @@ check-DEVELOPERS:
             - output/build/build-time.log
             - output/build/packages-file-list.txt
 
+.runtime_test: &runtime_test
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ ${CI_BUILD_NAME}
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - test-output/*.log
diff --git a/Makefile b/Makefile
index 811158295a..36231fa9d6 100644
--- a/Makefile
+++ b/Makefile
@@ -1105,8 +1105,11 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
-.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
-	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@
+.PHONY: .gitlab-ci.yml
+.gitlab-ci.yml: .gitlab-ci.yml.in
+	cp $< $@
+	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' >> $@
+	./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)
-- 
2.13.2
