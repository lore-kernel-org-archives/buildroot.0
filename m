Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6091140866;
	Tue,  6 Feb 2024 22:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHkycbmdMgUa; Tue,  6 Feb 2024 22:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F0C740868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F0C740868;
	Tue,  6 Feb 2024 22:59:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7634B1BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 638C340868
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dS7UlaGtF_3C for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE87C40866
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE87C40866
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE87C40866
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:59:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9D7511C0004;
 Tue,  6 Feb 2024 22:59:32 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Tue,  6 Feb 2024 23:59:27 +0100
Message-ID: <20240206225928.2290100-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707260373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kTEcLPckfIfJi0NqUSsjdjjrz8AXlBs9up9rd4lbDmU=;
 b=OMtjRSeXeP2BA5Voi+InL86Z4UD1449nKWpBK8WIg16T0/xnjkpH/1e06hpAepkWgRyLPn
 Ho0At7uipaaTdoOoMnYx8ZcsgTgaWg2y91zKNV3lBtthE/xM55CB1aqn1ZuWc0lYT3xsST
 wk2Hao3Cs5eZEPi0xye3pzYLOA/UeFYzlvwWtK0v8Cs/Pv6AHjxN2vpMQihH/zHJfU8EU+
 FMz9y/jOGFU1teAO2L+XB8nBVi3iE2s9CSgeQDE3IQTrT3oQd3ks3RpolZ8zw7bVw2Yc+K
 YwZ6zHv7jiYzy8IhCCql7T0qpbJZszM3Cyq4eTZr22/4JIvuRVlMIbJycqrRQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OMtjRSeX
Subject: [Buildroot] [PATCH] package/python3: add option to disable ensurepip
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This module takes 2.1 MB and is not needed in most Python
installations.

Reported-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-add-disable-ensurepip-module-option.patch | 68 +++++++++++++++++++
 package/python3/Config.in                     |  5 ++
 package/python3/python3.mk                    |  6 ++
 3 files changed, 79 insertions(+)
 create mode 100644 package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch

diff --git a/package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch b/package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch
new file mode 100644
index 0000000000..2761236c9b
--- /dev/null
+++ b/package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch
@@ -0,0 +1,68 @@
+From 10b67aeb6a6be10218c3dd675d3e54874ced1a55 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Feb 2024 23:49:32 +0100
+Subject: [PATCH] configure.ac: add --disable-ensurepip-module option
+
+The ensurepip module weights 2.1 MB and is only needed if you need
+"support for bootstrapping the pip installer into an existing Python
+installation or virtual environment" [1].
+
+This patch adds a --disable-ensurepip-module option that allows to not
+install it. It should not be confused with --without-ensurepip, which
+already exists, but even with --without-ensurepip, the ensurepip
+module gets installed, but not used during the build to bootstrap the
+pip installer.
+
+[1] https://docs.python.org/3/library/ensurepip.html
+
+Upstream: non-cooperative upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile.pre.in | 5 ++++-
+ configure.ac    | 7 +++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index d9fae62aa9c..3a8e6200891 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -2096,7 +2096,6 @@ LIBSUBDIRS=	asyncio \
+ 		dbm \
+ 		email email/mime \
+ 		encodings \
+-		ensurepip ensurepip/_bundled \
+ 		html \
+ 		http \
+ 		importlib importlib/resources importlib/metadata \
+@@ -2274,6 +2273,10 @@ ifeq (@EXPAT@,yes)
+ LIBSUBDIRS += $(XMLLIBSUBDIRS)
+ endif
+ 
++ifeq (@ENSUREPIP_MODULE@,yes)
++LIBSUBDIRS += ensurepip ensurepip/_bundled
++endif
++
+ TEST_MODULES=@TEST_MODULES@
+ 
+ .PHONY: libinstall
+diff --git a/configure.ac b/configure.ac
+index 06df165ccc8..5774297b9da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6944,6 +6944,13 @@ AS_CASE([$with_ensurepip],
+ AC_MSG_RESULT([$ENSUREPIP])
+ AC_SUBST([ENSUREPIP])
+ 
++AC_ARG_ENABLE([ensurepip-module],
++              AS_HELP_STRING([--disable-ensurepip-module], [disable ensurepip module installation]),
++	      [ENSUREPIP_MODULE="${enableval}"],
++	      [ENSUREPIP_MODULE="yes"])
++AS_IF([test "${ENSUREPIP}" != "no"], [ENSUREPIP_MODULE="yes"])
++AC_SUBST([ENSUREPIP_MODULE])
++
+ # check if the dirent structure of a d_type field and DT_UNKNOWN is defined
+ AC_CACHE_CHECK([if the dirent structure of a d_type field], [ac_cv_dirent_d_type], [
+ AC_LINK_IFELSE(
+-- 
+2.43.0
+
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 38f0580aa4..a398a1d7dd 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -75,6 +75,11 @@ config BR2_PACKAGE_PYTHON3_DECIMAL
 	help
 	  decimal module for Python3.
 
+config BR2_PACKAGE_PYTHON3_ENSUREPIP
+	bool "ensurepip module"
+	help
+	  ensurepip module for Python3.
+
 config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
 	bool "ossaudiodev module"
 	help
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 42765abcf4..8685ca238d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -107,6 +107,12 @@ else
 PYTHON3_CONF_ENV += py_cv_module__decimal=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_ENSUREPIP),y)
+PYTHON3_CONF_OPTS += --enable-ensurepip-module
+else
+PYTHON3_CONF_OPTS += --disable-ensurepip-module
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
 PYTHON3_DEPENDENCIES += expat
 PYTHON3_CONF_OPTS += --with-expat=system
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
