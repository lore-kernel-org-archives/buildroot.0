Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC55C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8004880DB9;
	Wed, 28 Dec 2022 22:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8004880DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWESxFMAR9Rv; Wed, 28 Dec 2022 22:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9675680C5E;
	Wed, 28 Dec 2022 22:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9675680C5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3A81BF3D1
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED7F607F1
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED7F607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwzlzheoKwr6 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:00:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A0C600CC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7A0C600CC
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:00:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bk16so2732603wrb.11
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 14:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eN/oyrehRCXqFEzME42BFMlOdy6+pNnnTXSJ3hG67ck=;
 b=FNr8lf0bs47L0vtTX79ykAyNb98xja4aIIUCQwkwyy5vP62YHuLvP1xQViE1q5lNtH
 7QnZ8vSaSKBcQRdj+js2q6ZANonV8Q9/82KIp3HP1BQHnR2RfKoujaRitvKfviML4ybM
 qq0eUGB5BzCFI0YhrWI3pXeKsxLA1Wv/gJE00lF9jrXc7jzrSBrteuM3AyLV1p0yrWU8
 7rqLTi5QA59aVfH8uCACGnvyRVs/mzSy4yWJkT4LiZkK+FE+zFo/Trns7ZPOktCZ59ad
 9G1yE3fpdBd6U5vT4KJOOWOapWWIA48JIrgkW15hu0w/4Pb2BNjfJS5gwTZAWOaCvPwy
 w5Wg==
X-Gm-Message-State: AFqh2krhUM8iuAOATXVs6T/XZ7GlfL0Rp5/5Cy90JD4XLS/9ak6Ofejw
 nmILb3ysQBFMGDN3oe/potxRHqiMJVo=
X-Google-Smtp-Source: AMrXdXs0WrOcYTbUyGGacW8anr6JDnaC0bMIrSe2PX3YByW4U9yA+078xnU9jl3FHvlp+gYzp8DBEQ==
X-Received: by 2002:a05:6000:108:b0:284:8d4d:e7f8 with SMTP id
 o8-20020a056000010800b002848d4de7f8mr3783404wrx.54.1672264851285; 
 Wed, 28 Dec 2022 14:00:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h15-20020adfaa8f000000b002421888a011sm16568265wrc.69.2022.12.28.14.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 14:00:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 23:00:44 +0100
Message-Id: <20221228220044.260042-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eN/oyrehRCXqFEzME42BFMlOdy6+pNnnTXSJ3hG67ck=;
 b=nWyegq2liKQLOT43HnvjEdNEum8p2QK2UACZIMB3DR/5c/LDbJJ2+huJJC8t4dbjoT
 qIBfJns9hd1glAJ6D88l7Zkeq6HRfLuq8AwOIspEanJOlhz9xITmyhGCu/fl1s6DAHSl
 xFXN3WJ9d6wMHTjfhxvJ7RBlmk1tCrDE5NWUIKQc1Wtih0ev9XZ/SboVwqdKt4gLItyq
 F67ruyoXzkZvmH17+tS+aWiVqYpfKvIVmF4CQ/4lrVQOBhdEL6S/7aiLRktCKjTUHfoB
 mwXAn6NgJUR9Ko5YxoMi+9n+VPF76aE9LwTKEI00o3H5moi0BdB7C4V0CqbyYZ3WPJcV
 +eZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nWyegq2l
Subject: [Buildroot] [PATCH 1/1] package/libdnet: fix python build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...02-Correct-path-to-string-h-from-bsd.patch | 26 +++++++++++++++++++
 package/libdnet/Config.in                     | 11 ++++++++
 package/libdnet/libdnet.mk                    |  2 +-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
