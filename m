Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9287C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67DB640002;
	Fri,  7 Jan 2022 18:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9PAKsNjQ-2tz; Fri,  7 Jan 2022 18:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62FE2400E5;
	Fri,  7 Jan 2022 18:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2001BF291
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B8BA81467
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEegzHKTkkjv for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:14:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC2381458
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:14:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A000A826D2; Fri,  7 Jan 2022 18:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:14:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f27270705762b1c0c142127fb8b6007102f9c331
X-Git-Newrev: feda801885091a9e41faa45aa0416afa67a0e2ce
X-Patchwork-Hint: ignore
Message-Id: <20220107180756.A000A826D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openipmi: fix musl build with
 libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=feda801885091a9e41faa45aa0416afa67a0e2ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable execinfo to avoid the following musl build failure raised since
the addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-configure.ac-add-without-execinfo-option.patch | 55 ++++++++++++++++++++++
 package/openipmi/openipmi.mk                       |  1 +
 2 files changed, 56 insertions(+)

diff --git a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
new file mode 100644
index 0000000000..e1838a06f4
--- /dev/null
+++ b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
@@ -0,0 +1,55 @@
+From 388033e3d0129510c3884333bc428cefeb75e0b8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Jan 2022 23:27:21 +0100
+Subject: [PATCH] configure.ac: add --without-execinfo option
+
+Add an option to allow the user to disable execinfo to avoid the
+following build failure on musl with
+https://github.com/mikroskeem/libexecinfo:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/openipmi/patches/36]
+---
+ configure.ac | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 607864b9..f369166f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,16 @@ AC_ARG_WITH(poptlibs,
+     POPTLIBS="$withval"
+ )
+ 
++tryexecinfo=yes
++AC_ARG_WITH(execinfo,
++[  --with-execinfo[[=yes|no]]      Look for execinfo.],
++    if test "x$withval" = "xyes"; then
++      tryexecinfo=yes
++    elif test "x$withval" = "xno"; then
++      tryexecinfo=no
++    fi,
++)
++
+ # If UCD SNMP requires OpenSSL, this tells where to find the crypto lib
+ tryopenssl=yes
+ AC_ARG_WITH(openssl,
+@@ -275,7 +285,9 @@ AM_PROG_CC_C_O
+ AC_PROG_LIBTOOL
+ AC_STDC_HEADERS
+ 
+-AC_CHECK_HEADERS(execinfo.h)
++if test "x$tryexecinfo" != "xno"; then
++   AC_CHECK_HEADERS(execinfo.h)
++fi
+ AC_CHECK_HEADERS([netinet/ether.h])
+ AC_CHECK_HEADERS([sys/ethernet.h])
+ 
+-- 
+2.34.1
+
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index ad2f2d2f4f..b3a4d90d4b 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -15,6 +15,7 @@ OPENIPMI_INSTALL_STAGING = YES
 OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
+	--with-execinfo=no \
 	--with-glib=no \
 	--with-tcl=no \
 	--with-perl=no \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
