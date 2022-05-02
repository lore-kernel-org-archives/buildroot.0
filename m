Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8421DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3081A40989;
	Mon,  2 May 2022 22:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAMz-Ds85LG1; Mon,  2 May 2022 22:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B904091F;
	Mon,  2 May 2022 22:03:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9C691BF2C0
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B05E04156D
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYcEKf9ugKdx for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B1B415AA
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4CDC684EC9; Mon,  2 May 2022 21:48:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:56:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a9d1ae972e9a6729c9655e0c36d1e2b93198efd
X-Git-Newrev: 3fa79c038ec75228015ea0022de80c5e7a2003f8
X-Patchwork-Hint: ignore
Message-Id: <20220502214851.4CDC684EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 7.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0612273908457758276=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0612273908457758276==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3fa79c038ec75228015ea0022de80c5e7a2003f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch 0002-build-disable-fcf-protection-on-march-486-m16.patch

Handle new or removed configure options:
- disable dbus-display
- remove libxml2 configure option

Support for for ARMv4 and ARMv5 hosts has been dropped, Qemu target
package needs at least ARMv6. The architecture test is done at runtime,
so qemu package for ARMv4 or ARMv5 target would build but will error
out at runtime:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=01dfc0ed7f2c5f8dbab65f31228a2888c7b85a07

See:
https://wiki.qemu.org/ChangeLog/7.0

Runtime tested in gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/520991787

Add a new patch fixing the build with seccomp support enabled.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ests-fp-disable-fp-bench-build-by-default.patch |  8 ++--
 ...d-disable-fcf-protection-on-march-486-m16.patch | 50 ----------------------
 ...u-seccomp.c-add-missing-header-for-CLONE_.patch | 42 ++++++++++++++++++
 package/qemu/Config.in                             |  2 +-
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  5 ++-
 6 files changed, 51 insertions(+), 58 deletions(-)

diff --git a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
index 9bc8d43d59..60518bcfa3 100644
--- a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
+++ b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
@@ -1,4 +1,4 @@
-From f82238299d3c4cd23ca60cfc0cf4271f5c860873 Mon Sep 17 00:00:00 2001
+From 83d976d6d7f0357659d5daa0f01c52048a609e88 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 Aug 2021 21:55:53 +0200
 Subject: [PATCH] tests/fp: disable fp-bench build by default
@@ -12,10 +12,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/fp/meson.build b/tests/fp/meson.build
-index 07e2cdc8d2..c96460b7f1 100644
+index 8bd0979f67..2fe019d2c6 100644
 --- a/tests/fp/meson.build
 +++ b/tests/fp/meson.build
-@@ -631,6 +631,7 @@ fpbench = executable(
+@@ -636,6 +636,7 @@ fpbench = executable(
    dependencies: [qemuutil],
    include_directories: [sfinc, include_directories(tfdir)],
    c_args: fpcflags,
@@ -24,5 +24,5 @@ index 07e2cdc8d2..c96460b7f1 100644
  
  fptestlog2 = executable(
 -- 
-2.31.1
+2.35.1
 
diff --git a/package/qemu/0002-build-disable-fcf-protection-on-march-486-m16.patch b/package/qemu/0002-build-disable-fcf-protection-on-march-486-m16.patch
deleted file mode 100644
index 7595d31c8d..0000000000
--- a/package/qemu/0002-build-disable-fcf-protection-on-march-486-m16.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9584d3d00a454f47b0341465142bcf0735d734ae Mon Sep 17 00:00:00 2001
-From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
-Date: Wed, 23 Mar 2022 10:07:13 +0100
-Subject: [PATCH] build: disable fcf-protection on -march=486 -m16
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some of the roms build with -march=i486 -m16 which is incompatible
-with -fcf-protection. That in turn is can be set by default, for
-example in Ubuntu [1].
-That causes:
- cc1: error: ‘-fcf-protection’ is not compatible with this target
-
-This won't work on -march=i486 -m16 and no matter if set or not we can
-override it to "none" if the option is known to the compiler to be
-able to build reliably.
-
-Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889
-
-[1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection
-
-Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
-Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Reviewed-by: Thomas Huth <thuth@redhat.com>
-Message-Id: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: Dario Binacchi <dariobin@libero.it>
----
- pc-bios/optionrom/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
-index 5d55d25acca2..f1ef89807355 100644
---- a/pc-bios/optionrom/Makefile
-+++ b/pc-bios/optionrom/Makefile
-@@ -14,6 +14,10 @@ cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
- 
- override CFLAGS += -march=i486 -Wall
- 
-+# If -fcf-protection is enabled in flags or compiler defaults that will
-+# conflict with -march=i486
-+override CFLAGS += $(call cc-option, -fcf-protection=none)
-+
- # Flags for dependency generation
- override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
- 
--- 
-2.32.0
-
diff --git a/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch b/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch
new file mode 100644
index 0000000000..91506b14d9
--- /dev/null
+++ b/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch
@@ -0,0 +1,42 @@
+From df07d3754bdf15e0efac244cfee290c9bac86352 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 2 May 2022 23:17:46 +0200
+Subject: [PATCH] softmmu/qemu-seccomp.c: add missing header for CLONE_NEWGROUP
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With seccomp support enabled Qemu 7.0.0 fail to build with the
+following error:
+
+../softmmu/qemu-seccomp.c:116:19: error: ‘CLONE_NEWCGROUP’ undeclared here (not in a function)
+  116 | FORBID_CLONE_FLAG(CLONE_NEWCGROUP);
+      |                   ^~~~~~~~~~~~~~~
+../softmmu/qemu-seccomp.c:73:18: note: in definition of macro ‘FORBID_CLONE_FLAG’
+   73 |       .datum_a = flag, .datum_b = flag } }
+      |                  ^~~~
+
+CLONE_NEWCGROUP has been added in Qemu 7.0.0 by commit [1].
+
+[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2f693f07a1e93ada5277b2fb1530b2698be0fa
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ softmmu/qemu-seccomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
+index deaf8a4ef5..96c83e121f 100644
+--- a/softmmu/qemu-seccomp.c
++++ b/softmmu/qemu-seccomp.c
+@@ -21,6 +21,7 @@
+ #include <sys/prctl.h>
+ #include <seccomp.h>
+ #include "sysemu/seccomp.h"
++#include <linux/sched.h>
+ #include <linux/seccomp.h>
+ 
+ /* For some architectures (notably ARM) cacheflush is not supported until
+-- 
+2.35.1
+
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 1afbc6c364..e960a062cb 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
 	default y if BR2_aarch64
-	default y if BR2_arm
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	default y if BR2_i386
 	default y if BR2_mips
 	default y if BR2_mipsel
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 9411832384..9c1a85a347 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  68e15d8e45ac56326e0b9a4afa8b49a3dfe8aba3488221d098c84698bca65b45  qemu-6.2.0.tar.xz
+sha256  f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839  qemu-7.0.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e69e813059..9c2b819174 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 6.2.0
+QEMU_VERSION = 7.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -197,12 +197,12 @@ define QEMU_CONFIGURE_CMDS
 			--disable-coreaudio \
 			--disable-curl \
 			--disable-curses \
+			--disable-dbus-display \
 			--disable-docs \
 			--disable-dsound \
 			--disable-hvf \
 			--disable-jack \
 			--disable-libiscsi \
-			--disable-libxml2 \
 			--disable-linux-aio \
 			--disable-linux-io-uring \
 			--disable-malloc-trim \
@@ -369,6 +369,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-containers \
 		--disable-coreaudio \
 		--disable-curl \
+		--disable-dbus-display \
 		--disable-docs \
 		--disable-dsound \
 		--disable-jack \

--===============0612273908457758276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0612273908457758276==--
