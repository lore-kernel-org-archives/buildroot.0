Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE3AC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D71A41B14;
	Thu, 29 Feb 2024 15:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5AW50fkYNPv; Thu, 29 Feb 2024 15:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F02B241C51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F02B241C51;
	Thu, 29 Feb 2024 15:53:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8201BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32372827D9
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPV0e5hlyMnj for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29CA88237F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29CA88237F
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2520D87D45; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:29:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 49df708cde6598602cc4a7828c2ccbbef78825f1
X-Git-Newrev: 63bf07c42614b085c95916d045f75a4623ad8f3e
X-Patchwork-Hint: ignore
Message-Id: <20240229153200.2520D87D45@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/ngrep: fix build
 with libnet
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

commit: https://git.buildroot.net/buildroot/commit/?id=63bf07c42614b085c95916d045f75a4623ad8f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Use pkg-config to find libnet and avoid the following build failure
raised since commit 100ba8351c088fd764effdcaba848cfd92de79dd if
libnet-config is found on the host:

/home/autobuild/autobuild/instance-4/output-1/host/bin/mips64el-buildroot-linux-gnu-gcc -s -o ngrep ngrep.o  tcpkill.o   -lpcap -lnet   -lpcre -L/usr/lib -lnet
mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

While at it, format Upstream tag of other patches

Fixes:
 - http://autobuild.buildroot.org/results/05c916162b9c1027cf53f1699a1f5653151098ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14c0c37eaf0f91ef61a88b3085c15028f566a394)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 --
 ...in-configure-in-when-testing-for-use_pcre.patch |  3 +-
 ...002-Check-for-libnet_init-in-configure-in.patch |  3 +-
 package/ngrep/0003-fix-disable-tcpkill.patch       |  2 +-
 ...onfigure.in-use-pkg-config-to-find-libnet.patch | 38 ++++++++++++++++++++++
 package/ngrep/ngrep.mk                             |  2 +-
 6 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 47074570f8..94b24b2545 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -929,9 +929,6 @@ package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch Up
 package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch Upstream
 package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch Upstream
 package/nginx/S50nginx Indent Variables
-package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch Upstream
-package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch Upstream
-package/ngrep/0003-fix-disable-tcpkill.patch Upstream
 package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch Upstream
 package/nmap/0001-libdnet-wrapper-configure.patch Upstream
 package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch Upstream
diff --git a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
index 69c5c887e8..c7f0dec360 100644
--- a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
+++ b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
@@ -4,8 +4,7 @@ Date: Mon, 1 Jan 2018 18:00:34 +0100
 Subject: [PATCH] Fix typo in configure.in when testing for use_pcre
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe]
+Upstream: https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
index 22b18ab7ee..7fa2e2f3bc 100644
--- a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
+++ b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
@@ -7,8 +7,7 @@ libnet_init_packet was the old libnet 1.0 function which is now long
 deprecated.
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5]
+Upstream: https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ngrep/0003-fix-disable-tcpkill.patch b/package/ngrep/0003-fix-disable-tcpkill.patch
index 1264fd7e3b..894cd95b0f 100644
--- a/package/ngrep/0003-fix-disable-tcpkill.patch
+++ b/package/ngrep/0003-fix-disable-tcpkill.patch
@@ -9,7 +9,7 @@ found on the system.
 To fix this, move AC_CHECK_LIB to found libnet outside AC_ARG_ENABLE
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/jpr5/ngrep/pull/15]
+Upstream: https://github.com/jpr5/ngrep/pull/15
 ---
  configure.in | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
diff --git a/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
new file mode 100644
index 0000000000..71550da943
--- /dev/null
+++ b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
@@ -0,0 +1,38 @@
+From 4788988827bf4c0d996d3e1e3b6ac52a23b97941 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Jan 2024 21:15:47 +0100
+Subject: [PATCH] configure.in: use pkg-config to find libnet
+
+libnet-config is deprecated:
+https://github.com/libnet/libnet/commit/1ec4a6e7d1d23811f0a14ecb51e46489a0175727
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: unsent (upstream seems dead, no commit since 5 years
+---
+ configure.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 7c3dd43..882ff86 100644
+--- a/configure.in
++++ b/configure.in
+@@ -176,12 +176,14 @@ AC_ARG_ENABLE(tcpkill,
+ [ use_tcpkill="$enableval" ],
+ [ use_tcpkill="no" ])
+ 
++PKG_PROG_PKG_CONFIG
+ if test $use_tcpkill = yes; then
+   AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+   USE_TCPKILL="1"
+   EXTRA_OBJS="$EXTRA_OBJS tcpkill.o"
+-  EXTRA_DEFINES="$EXTRA_DEFINES $(libnet-config --defines)"
+-  EXTRA_LIBS="$EXTRA_LIBS $(libnet-config --libs)"
++  PKG_CHECK_MODULES(LIBNET, libnet)
++  EXTRA_DEFINES="$EXTRA_DEFINES $LIBNET_CFLAGS"
++  EXTRA_LIBS="$EXTRA_LIBS $LIBNET_LIBS"
+ else
+   USE_TCPKILL="0"
+ fi
+-- 
+2.43.0
+
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index c4750f7504..dc69a34235 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -22,7 +22,7 @@ NGREP_CONF_OPTS = \
 	--disable-dropprivs \
 	--disable-pcap-restart
 
-NGREP_DEPENDENCIES = libpcap pcre
+NGREP_DEPENDENCIES = host-pkgconf libpcap pcre
 
 ifeq ($(BR2_PACKAGE_LIBNET),y)
 NGREP_DEPENDENCIES += libnet
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
