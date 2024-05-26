Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10373C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF866083F;
	Sun, 26 May 2024 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 800D-TGufBjr; Sun, 26 May 2024 20:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77977608E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77977608E7;
	Sun, 26 May 2024 20:47:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 989A01D144F
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 312DD40267
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaMkG6PdwGSb for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19DA4023F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E19DA4023F
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:46:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9BA887672; Sun, 26 May 2024 20:46:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 21:46:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 330a987a5396d13e20b385a0c14a8936d9d2bba7
X-Git-Newrev: 55a7000a7d369e14d935b966ab986cb040c662d8
X-Patchwork-Hint: ignore
Message-Id: <20240526204658.A9BA887672@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qemu: fix
 disabling fp-bench test compilation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55a7000a7d369e14d935b966ab986cb040c662d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

With the bump to version 8.1.1, the patch that disabled the compilation
of the fp-bench test is no longer applicable, even though the package
compilation process does not report any errors in applying the patch
itself. The new patch does not disable the test by default but only if
the file fenv.h is not missing, with the hope that this approach will be
considered acceptable by the maintainer and merged upstream.

The patch is an adaptation of the one sent upstream.

Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2bb0c57ca273d9a2348e468bcdedad696b24ee8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...ests-fp-disable-fp-bench-build-by-default.patch | 28 -------------
 ...son-don-t-build-fp-bench-test-if-fenv.h-i.patch | 49 ++++++++++++++++++++++
 3 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 426aedd476..a5d56b3d8e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1081,7 +1081,6 @@ package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch Upstream
-package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch Upstream
 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch Upstream
diff --git a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
deleted file mode 100644
index fb7a9a6989..0000000000
--- a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 83d976d6d7f0357659d5daa0f01c52048a609e88 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 25 Aug 2021 21:55:53 +0200
-Subject: [PATCH] tests/fp: disable fp-bench build by default
-
-Fixes:
-https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00947.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- tests/fp/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/fp/meson.build b/tests/fp/meson.build
-index 8bd0979f67..2fe019d2c6 100644
---- a/tests/fp/meson.build
-+++ b/tests/fp/meson.build
-@@ -640,6 +640,7 @@ fpbench = executable(
-   dependencies: [qemuutil],
-   include_directories: [sfinc, include_directories(tfdir)],
-   c_args: fpcflags,
-+  build_by_default: false,
- )
- 
- fptestlog2 = executable(
--- 
-2.35.1
-
diff --git a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
new file mode 100644
index 0000000000..b7e41d6f23
--- /dev/null
+++ b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
@@ -0,0 +1,49 @@
+From b4a692f46135af1011bf0adbfeb19abf354ca191 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 30 Apr 2024 09:40:55 +0200
+Subject: [PATCH] tests/fp/meson: don't build fp-bench test if fenv.h is
+ missing
+
+The fp-bench test (i. e. tests/fp/fp-bench.c) use fenv.h that is not
+always provided by the libc (uClibc). The patch disables its compilation
+in case the header is not available.
+
+The patch is based on a suggestion from Paolo Bonzini, which you can
+find at the following link.
+
+Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/
+---
+ tests/fp/meson.build | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/tests/fp/meson.build b/tests/fp/meson.build
+index cbc17392d678..cd052667e940 100644
+--- a/tests/fp/meson.build
++++ b/tests/fp/meson.build
+@@ -126,12 +126,14 @@ test('fp-test-mulAdd', fptest,
+            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
+      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
+ 
+-executable(
+-  'fp-bench',
+-  ['fp-bench.c', '../../fpu/softfloat.c'],
+-  dependencies: [qemuutil, libtestfloat, libsoftfloat],
+-  c_args: fpcflags,
+-)
++if cc.has_header('fenv.h')
++  executable(
++    'fp-bench',
++    ['fp-bench.c', '../../fpu/softfloat.c'],
++    dependencies: [qemuutil, libtestfloat, libsoftfloat],
++    c_args: fpcflags,
++  )
++endif
+ 
+ fptestlog2 = executable(
+   'fp-test-log2',
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
