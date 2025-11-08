Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAB1CCFA13
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 19:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A513605A5;
	Sat,  8 Nov 2025 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yy8dqTmyuzjB; Sat,  8 Nov 2025 19:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 351EA605B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351EA605B1;
	Sat,  8 Nov 2025 19:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 693D72CD
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500CB4009E
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-5hlWmFGr36 for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 19:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D4940073
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35D4940073
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 19:38:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 301AB84016; Sat,  8 Nov 2025 19:38:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Nov 2025 17:00:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 566bb2bb76acadd9225b281f39bf030d28b2020b
X-Git-Newrev: 7085d1c48b55b2ff85e82be35a8a6a22755e9758
X-Patchwork-Hint: ignore
Message-Id: <20251108193805.301AB84016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: bump version to 9.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7085d1c48b55b2ff85e82be35a8a6a22755e9758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/coreutils-announce/2025-01/msg00000.html
https://lists.gnu.org/archive/html/coreutils-announce/2025-04/msg00000.html
https://lists.gnu.org/archive/html/coreutils-announce/2025-09/msg00000.html

Removed patch which is included in this release.

Added tarball hashes provided by upstream.

With the bump to 9.8, the build will fail on systems that are not
Y2038, such as some uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), tar will be Y2038 compliant.

[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-coreutils-mcel-port-to-uClibc-ng.patch    | 35 ----------------------
 package/coreutils/coreutils.hash                   |  5 ++--
 package/coreutils/coreutils.mk                     |  6 +++-
 3 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch b/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
deleted file mode 100644
index 7639509ff2..0000000000
--- a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c4e923a98f34fe5f5ec3b49543e90716ec2a45fc Mon Sep 17 00:00:00 2001
-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
-Date: Tue, 24 Sep 2024 18:08:31 +0200
-Subject: [PATCH] coreutils: mcel: port to uClibc-ng
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Waldemar Brodkorb in:
-https://lists.gnu.org/r/bug-gnulib/2024-08/msg00130.html
-* lib/mcel.h (mcel_scan): Don't treat uClibc-ng like glibc.
-
-Upstream: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249
-Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
----
- lib/mcel.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/mcel.h b/lib/mcel.h
-index f6f006c..dca4d08 100644
---- a/lib/mcel.h
-+++ b/lib/mcel.h
-@@ -221,7 +221,8 @@ mcel_scan (char const *p, char const *lim)
- 
-   /* An initial mbstate_t; initialization optimized for some platforms.
-      For details about these and other platforms, see wchar.in.h.  */
--#if defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__)
-+#if (defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__) \
-+	&& !defined __UCLIBC__)
-   /* Although only a trivial optimization, it's worth it for GNU.  */
-   mbstate_t mbs; mbs.__count = 0;
- #elif (defined __FreeBSD__ || defined __DragonFly__ || defined __OpenBSD__ \
--- 
-2.39.2
-
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 3455c95c58..d01955d927 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a  coreutils-9.5.tar.xz
+# From https://lists.gnu.org/archive/html/coreutils-announce/2025-09/msg00000.html
+sha1  a6a58e00688fe0705a7051b36592f1e43e89a9ef  coreutils-9.8.tar.xz
+sha256  e6d4fd2d852c9141a1c2a18a13d146a0cd7e45195f72293a4e4c044ec6ccca15  coreutils-9.8.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 60772c9e7b..b764cb5843 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.5
+COREUTILS_VERSION = 9.8
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_CPE_ID_VENDOR = gnu
 
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. util-linux-libs will support year2038
+# if the system is compliant even with this option passed
 COREUTILS_CONF_OPTS = --disable-rpath \
+	--disable-year2038 \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
