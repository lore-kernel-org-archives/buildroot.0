Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A0C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 896CA4019E;
	Sat,  4 Nov 2023 17:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896CA4019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ejt7JR4kUKfT; Sat,  4 Nov 2023 17:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E8D74014D;
	Sat,  4 Nov 2023 17:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E8D74014D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B16F81BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9841B60BAD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9841B60BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jefNEWQ5SG4G for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:40:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B4BD60774
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4BD60774
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 720CC866AE; Sat,  4 Nov 2023 17:40:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 18:40:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f6e6080570d542852b416a72f04a07760808c7e
X-Git-Newrev: 2a9b47a8dbb1e7b709704239b578474a20d84c89
X-Patchwork-Hint: ignore
Message-Id: <20231104174019.720CC866AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: replace NUT_FIX_CONFIGURE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a9b47a8dbb1e7b709704239b578474a20d84c89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace NUT_FIX_CONFIGURE by an upstreamable patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ..._compiler_family.m4-fix-cross-compilation.patch | 55 ++++++++++++++++++++++
 package/nut/nut.mk                                 |  9 +---
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch b/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
new file mode 100644
index 0000000000..6356990749
--- /dev/null
+++ b/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
@@ -0,0 +1,55 @@
+From a743617099ea50fcce333a8a074751434d25b7ac Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Nov 2023 18:29:29 +0100
+Subject: [PATCH] m4/nut_compiler_family.m4: fix cross-compilation
+
+Do not use isystem with host paths when cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/networkupstools/nut/pull/2146
+---
+ m4/nut_compiler_family.m4 | 28 +++++++++++++++-------------
+ 1 file changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/m4/nut_compiler_family.m4 b/m4/nut_compiler_family.m4
+index f47b1ae9..99608bab 100644
+--- a/m4/nut_compiler_family.m4
++++ b/m4/nut_compiler_family.m4
+@@ -178,19 +178,21 @@ dnl # confuse the compiler assumptions - along with its provided headers)...
+ dnl # ideally; in practice however cppunit, net-snmp and some system include
+ dnl # files do cause grief to picky compiler settings (more so from third
+ dnl # party packages shipped via /usr/local/... namespace):
+-    AS_IF([test "x$CLANGCC" = xyes -o "x$GCC" = xyes], [
+-dnl #        CFLAGS="-isystem /usr/include $CFLAGS"
+-        AS_IF([test -d /usr/local/include],
+-            [CFLAGS="-isystem /usr/local/include $CFLAGS"])
+-        AS_IF([test -d /usr/pkg/include],
+-            [CFLAGS="-isystem /usr/pkg/include $CFLAGS"])
+-    ])
+-    AS_IF([test "x$CLANGXX" = xyes -o "x$GXX" = xyes], [
+-dnl #        CXXFLAGS="-isystem /usr/include $CXXFLAGS"
+-        AS_IF([test -d /usr/local/include],
+-            [CXXFLAGS="-isystem /usr/local/include $CXXFLAGS"])
+-        AS_IF([test -d /usr/pkg/include],
+-            [CXXFLAGS="-isystem /usr/pkg/include $CXXFLAGS"])
++    AS_IF([test "x$cross_compiling" != xyes], [
++        AS_IF([test "x$CLANGCC" = xyes -o "x$GCC" = xyes], [
++dnl #            CFLAGS="-isystem /usr/include $CFLAGS"
++            AS_IF([test -d /usr/local/include],
++                [CFLAGS="-isystem /usr/local/include $CFLAGS"])
++            AS_IF([test -d /usr/pkg/include],
++                [CFLAGS="-isystem /usr/pkg/include $CFLAGS"])
++        ])
++        AS_IF([test "x$CLANGXX" = xyes -o "x$GXX" = xyes], [
++dnl #           CXXFLAGS="-isystem /usr/include $CXXFLAGS"
++            AS_IF([test -d /usr/local/include],
++                [CXXFLAGS="-isystem /usr/local/include $CXXFLAGS"])
++            AS_IF([test -d /usr/pkg/include],
++                [CXXFLAGS="-isystem /usr/pkg/include $CXXFLAGS"])
++        ])
+     ])
+ 
+ dnl # Default to avoid noisy warnings on older compilers
+-- 
+2.42.0
+
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index c376ffb2e2..ba71319f90 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -11,13 +11,8 @@ NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf
-
-# prevent usage of unsafe paths
-define NUT_FIX_CONFIGURE
-	$(SED) 's%CFLAGS="-isystem /usr/local/include%_UNUSED_CFLAGS="-isystem /usr/local/include%' $(@D)/configure
-	$(SED) 's%CXXFLAGS="-isystem /usr/local/include%_UNUSED_CXXFLAGS="-isystem /usr/local/include%' $(@D)/configure
-endef
-NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
+# We're patching m4/nut_compiler_family.m4
+NUT_AUTORECONF = YES
 
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
