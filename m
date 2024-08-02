Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B94C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C8581959;
	Fri,  2 Aug 2024 17:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfiLccOEjaUw; Fri,  2 Aug 2024 17:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73CA84532
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E73CA84532;
	Fri,  2 Aug 2024 17:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3CD21BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFD6781177
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi2PEHmuRUXO for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9479E81186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9479E81186
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:50:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8196383B73; Fri,  2 Aug 2024 17:50:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 19:50:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 668867bfed9a4decd7fd74d87d742368030b9399
X-Git-Newrev: e4109c1d2d28f737409dce2e346661cbf20084c6
X-Patchwork-Hint: ignore
Message-Id: <20240802175033.8196383B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcusdk: fix build with host GCC
 14.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4109c1d2d28f737409dce2e346661cbf20084c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With GCC 14.x as the host compiler, bcusdk fails to build as follows:

configure: error: Specified CC_FOR_BUILD doesn't seem to work

This is due to missing includes in the test programs used in the
configure script to check the host compiler. We fix this with patch
0003.

However, this patch requires to autoreconf the package, and autoreconf
would need the definition of AM_PATH_XML2, which would require libxml2
even though we don't have libxml2 as a dependency of this package (we
don't enable the features that requires libxml2). As it turns out that
the AM_PATH_XML2 macro is in fact deprecated, we replaced it by its
equivalent using PKG_CHECK_MODULES(), which is in fact exactly how
AM_PATH_XML2 is implemented in upstream libxml2.

Fixes:

  http://autobuild.buildroot.net/results/458880bd6c207e5bb7afce1a1186f204c30c0941/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build.m4-include-stdlib.h-in-test-program.patch | 50 ++++++++++++++++++++++
 ...n-replace-obsolete-AM_PATH_XML2-by-PKG_CH.patch | 40 +++++++++++++++++
 package/bcusdk/bcusdk.mk                           |  6 ++-
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/package/bcusdk/0003-m4-ccforbuild.m4-include-stdlib.h-in-test-program.patch b/package/bcusdk/0003-m4-ccforbuild.m4-include-stdlib.h-in-test-program.patch
new file mode 100644
index 0000000000..36b8f3d744
--- /dev/null
+++ b/package/bcusdk/0003-m4-ccforbuild.m4-include-stdlib.h-in-test-program.patch
@@ -0,0 +1,50 @@
+From 1c78aa3541f730e9624504168fb0e1f413e5cbb8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 2 Aug 2024 19:28:36 +0200
+Subject: [PATCH] m4/ccforbuild.m4: include <stdlib.h> in test program
+
+The GMP_PROG_CC_FOR_BUILD_WORKS and GMP_PROG_EXEEXT_FOR_BUILD macros
+do various checks to verify if the host compiler works, but their test
+programs lack the inclusion of <stdlib.h>, needed for exit(). This
+causes a build failure with gcc 14.x:
+
+conftest.c: In function 'main':
+conftest.c:4:3: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
+    4 |   exit(0);
+
+which then causes the configure script to think that the host compiler
+does not work:
+
+configure: error: Specified CC_FOR_BUILD doesn't seem to work
+
+so let's include <stdlib.h> to fix this issue.
+
+Upstream: https://sourceforge.net/p/bcusdk/patches/4/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ccforbuild.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/ccforbuild.m4 b/m4/ccforbuild.m4
+index a466cab..389deaa 100644
+--- a/m4/ccforbuild.m4
++++ b/m4/ccforbuild.m4
+@@ -66,6 +66,7 @@ AC_DEFUN([GMP_PROG_CC_FOR_BUILD_WORKS],
+ # remove anything that might look like compiler output to our "||" expression
+ rm -f conftest* a.out b.out a.exe a_out.exe
+ cat >conftest.c <<EOF
++#include <stdlib.h>
+ int
+ main ()
+ {
+@@ -140,6 +141,7 @@ AC_DEFUN([GMP_PROG_EXEEXT_FOR_BUILD],
+ AC_CACHE_CHECK([for build system executable suffix],
+                gmp_cv_prog_exeext_for_build,
+ [cat >conftest.c <<EOF
++#include <stdlib.h>
+ int
+ main ()
+ {
+-- 
+2.45.2
+
diff --git a/package/bcusdk/0004-configure.in-replace-obsolete-AM_PATH_XML2-by-PKG_CH.patch b/package/bcusdk/0004-configure.in-replace-obsolete-AM_PATH_XML2-by-PKG_CH.patch
new file mode 100644
index 0000000000..899f8c0f3b
--- /dev/null
+++ b/package/bcusdk/0004-configure.in-replace-obsolete-AM_PATH_XML2-by-PKG_CH.patch
@@ -0,0 +1,40 @@
+From 8402c1ffccb2eeb47581d2d80b81e94433cdacb7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 2 Aug 2024 19:35:02 +0200
+Subject: [PATCH] configure.in: replace obsolete AM_PATH_XML2 by
+ PKG_CHECK_MODULES
+
+According to the libxml2 code:
+
+  AM_PATH_XML2 is deprecated, use PKG_CHECK_MODULES instead
+
+See:
+
+  https://gitlab.gnome.org/GNOME/libxml2/-/blob/master/libxml.m4
+
+Upstream: https://sourceforge.net/p/bcusdk/patches/5/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 7f3a8bd..82176d9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -81,7 +81,11 @@ AM_CONDITIONAL(HAVE_ONLYEIBD, test x$onlyeibd = xtrue)
+ 
+ if test x$onlyeibd = xfalse ; then
+ 
+-AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
++PKG_CHECK_MODULES(XML, [libxml-2.0 >= 2.6.16], [], [AC_MSG_ERROR([limxml2 not found])])
++XML_CPPFLAGS=$XML_CFLAGS
++AC_SUBST(XML_CPPFLAGS)
++AC_SUBST(XML_LIBS)
++
+ AC_PATH_PROG(TAS,[m68hc05-as],,[$PATH:$bindir:$prefix/bin])
+ AC_PATH_PROG(TLD,[m68hc05-ld],,[$PATH:$bindir:$prefix/bin])
+ AC_PATH_PROG(TAR,[m68hc05-ar],,[$PATH:$bindir:$prefix/bin])
+-- 
+2.45.2
+
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index f14b23c7cc..4defd29ba1 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -10,6 +10,9 @@ BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib
 BCUSDK_LICENSE = GPL-2.0+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
+# 0003-m4-ccforbuild.m4-include-stdlib.h-in-test-program.patch
+# 0004-configure.in-replace-obsolete-AM_PATH_XML2-by-PKG_CH.patch
+BCUSDK_AUTORECONF = YES
 BCUSDK_CONF_OPTS = \
 	--enable-onlyeibd \
 	--enable-ft12 \
@@ -21,7 +24,8 @@ BCUSDK_CONF_OPTS = \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr
 
-BCUSDK_DEPENDENCIES = libpthsem
+# host-pkgconf is only needed because of autoreconf
+BCUSDK_DEPENDENCIES = libpthsem host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 BCUSDK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
