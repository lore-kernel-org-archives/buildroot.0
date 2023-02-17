Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9A1C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE273610ED;
	Tue, 21 Feb 2023 00:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE273610ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqXXwHaR_VVV; Tue, 21 Feb 2023 00:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE2E61056;
	Tue, 21 Feb 2023 00:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE2E61056
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9EBD1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA27F4182C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA27F4182C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFzvSlkoq56c for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAD3241805
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD3241805
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C84C08648F; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 16:02:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5b597d5d839486e82a80f1c59c2a91a5af87c06
X-Git-Newrev: c5357f650d7e58043a5b8ab820972984eb07fef4
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.C84C08648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openipmi: add
 libexecinfo optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5357f650d7e58043a5b8ab820972984eb07fef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add libexecinfo optional dependency as upstream rejected the patch to
add --with-execinfo=no

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-configure.ac-add-without-execinfo-option.patch | 55 ----------------------
 package/openipmi/openipmi.mk                       |  6 ++-
 2 files changed, 5 insertions(+), 56 deletions(-)

diff --git a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
deleted file mode 100644
index e1838a06f4..0000000000
--- a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 388033e3d0129510c3884333bc428cefeb75e0b8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 3 Jan 2022 23:27:21 +0100
-Subject: [PATCH] configure.ac: add --without-execinfo option
-
-Add an option to allow the user to disable execinfo to avoid the
-following build failure on musl with
-https://github.com/mikroskeem/libexecinfo:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'
-
-Fixes:
- - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/openipmi/patches/36]
----
- configure.ac | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 607864b9..f369166f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,16 @@ AC_ARG_WITH(poptlibs,
-     POPTLIBS="$withval"
- )
- 
-+tryexecinfo=yes
-+AC_ARG_WITH(execinfo,
-+[  --with-execinfo[[=yes|no]]      Look for execinfo.],
-+    if test "x$withval" = "xyes"; then
-+      tryexecinfo=yes
-+    elif test "x$withval" = "xno"; then
-+      tryexecinfo=no
-+    fi,
-+)
-+
- # If UCD SNMP requires OpenSSL, this tells where to find the crypto lib
- tryopenssl=yes
- AC_ARG_WITH(openssl,
-@@ -275,7 +285,9 @@ AM_PROG_CC_C_O
- AC_PROG_LIBTOOL
- AC_STDC_HEADERS
- 
--AC_CHECK_HEADERS(execinfo.h)
-+if test "x$tryexecinfo" != "xno"; then
-+   AC_CHECK_HEADERS(execinfo.h)
-+fi
- AC_CHECK_HEADERS([netinet/ether.h])
- AC_CHECK_HEADERS([sys/ethernet.h])
- 
--- 
-2.34.1
-
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index b3a4d90d4b..81492ec131 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -15,7 +15,6 @@ OPENIPMI_INSTALL_STAGING = YES
 OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
-	--with-execinfo=no \
 	--with-glib=no \
 	--with-tcl=no \
 	--with-perl=no \
@@ -26,6 +25,11 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
 OPENIPMI_DEPENDENCIES += gdbm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+OPENIPMI_DEPENDENCIES += libexecinfo
+OPENIPMI_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENIPMI_DEPENDENCIES += openssl
 OPENIPMI_CONF_OPTS += --with-openssl=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
