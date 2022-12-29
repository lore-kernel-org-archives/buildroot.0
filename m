Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC44EC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96DD64F38B;
	Mon, 20 Feb 2023 22:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96DD64F38B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdcZi5K3qKHo; Mon, 20 Feb 2023 22:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34D14F383;
	Mon, 20 Feb 2023 22:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A34D14F383
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 462BA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C79440C31
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C79440C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xU_lEerDPmh1 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2D8A416DB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D8A416DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B083186494; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 09:59:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 482d18a40d98dcc156437c9a01b869b510e93fc4
X-Git-Newrev: 14bb74b4617df6fe511e638147cbde01fd7637a1
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.B083186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libdnet: fix python
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=14bb74b4617df6fe511e638147cbde01fd7637a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure raised with python >= 3.11 by
backporting a patch and adding libbsd dependency as suggested by
upstream in https://github.com/ofalk/libdnet/issues/74:

./dnet.c: In function '__Pyx_AddTraceback':
./dnet.c:456:62: error: invalid use of incomplete typedef 'PyFrameObject' {aka 'struct _frame'}
  456 |   #define __Pyx_PyFrame_SetLineNumber(frame, lineno)  (frame)->f_lineno = (lineno)
      |                                                              ^~
./dnet.c:25190:5: note: in expansion of macro '__Pyx_PyFrame_SetLineNumber'
25190 |     __Pyx_PyFrame_SetLineNumber(py_frame, py_line);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/78dff4b514fb7c510f5a745ee6cbbc049ceb2794

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Correct-path-to-string-h-from-bsd.patch   | 26 ++++++++++++++++++++++
 package/libdnet/Config.in                          | 11 +++++++++
 package/libdnet/libdnet.mk                         |  2 +-
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch b/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch
new file mode 100644
index 0000000000..2aa4f4516b
--- /dev/null
+++ b/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch
@@ -0,0 +1,26 @@
+From 347c23da1ec6f19b0b0143d53edcc209e522bbf2 Mon Sep 17 00:00:00 2001
+From: Oliver Falk <oliver@linux-kernel.at>
+Date: Wed, 29 Jun 2022 13:27:45 +0200
+Subject: [PATCH] Correct path to string.h (from bsd); Fixes #74
+
+[Retrieved (and backported) from:
+https://github.com/ofalk/libdnet/commit/347c23da1ec6f19b0b0143d53edcc209e522bbf2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ python/dnet.c   | 64 +++++++++++++++++++++++--------------------------
+ python/dnet.pyx |  2 +-
+ 2 files changed, 31 insertions(+), 35 deletions(-)
+
+diff --git a/python/dnet.pyx b/python/dnet.pyx
+index d9cbc90..af65a11 100644
+--- a/python/dnet.pyx
++++ b/python/dnet.pyx
+@@ -40,7 +40,7 @@ cdef extern from *:
+     unsigned long htonl(unsigned long n)
+     unsigned long ntohl(unsigned long n)
+ 
+-cdef extern from "string.h":
++cdef extern from "bsd/string.h":
+     int     strlcpy(char *dst, char *src, int size)
+ 
+ cdef __memcpy(char *dst, object src, int n):
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index f853e4e12d..473e8aea22 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -10,11 +10,22 @@ if BR2_PACKAGE_LIBDNET
 
 config BR2_PACKAGE_LIBDNET_PYTHON
 	bool "libdnet python module"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_STATIC_LIBS # libbsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	select BR2_PACKAGE_LIBBSD
 	help
 	  dnet module for python
 
 comment "dnet module for python requires python3 package"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_PYTHON3
 
+comment "dnet module for python needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
+
 endif
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index dc56b892b4..14af07e6d5 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -17,7 +17,7 @@ LIBDNET_CONFIG_SCRIPTS = dnet-config
 LIBDNET_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
-LIBDNET_DEPENDENCIES += host-python-cython python3
+LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
 LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
 LIBDNET_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
