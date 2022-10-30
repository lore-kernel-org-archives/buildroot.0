Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AACAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 17:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76FB54031B;
	Sun, 30 Oct 2022 17:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76FB54031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n51uNibpyaPt; Sun, 30 Oct 2022 17:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31914030F;
	Sun, 30 Oct 2022 17:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C31914030F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B56231BF402
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 17:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A80C4031B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 17:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A80C4031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E54NYWrnQXBh for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 17:56:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0123E4030F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0123E4030F
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 17:56:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so6820455wmb.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OpgQmkmmidRrq4mR4uVIh+6Mj/vvIz3BxAG3lQO6dE=;
 b=yoWII8NKnlLzUrMBkLgft+544A4Re2LRV0So+aeu24zER6mTItt4vhQUcR/CAEUeS5
 8EqZzRE01xaDu3fI7C1PtF/tXAYxSEJkodHGDZe8n2W6fmplG36WFR8Uv7zGKwe4Kr/u
 4fBbkiqJev7oZ9G0Nie+ttYjOAtDHilpoagwEqDFokf/sKzYlPFgIbVgLXultsTUHk/E
 z5DBlWnVd5iXROXRfUJu6+kah0yA0Ek7kDxr7rYQyAfyLuaz2h5YKCoIaELi/JXEAFam
 u2N898eT3bfYuPG6SAFUlpTLqUBpNm1nn0B/Lr56AVOXYHNAJZZS6G9jr3pSKl3QwEOj
 sSTQ==
X-Gm-Message-State: ACrzQf2DZtGVPKAHdShAfRfMqnBSQXyZEVUKu2nF1J5aD27mkP1ehAa2
 ie6QPNt03MJ3lTDTNK2jWceilav+d9c=
X-Google-Smtp-Source: AMsMyM5ef5e5vQ/36RgIpoAUim/P+JDoBbt2Wnhikipwhu9Yqs9FMqOQIOWsK0r6Ezhjz1ElqTK5eg==
X-Received: by 2002:a7b:c845:0:b0:3cf:62af:e353 with SMTP id
 c5-20020a7bc845000000b003cf62afe353mr5816253wml.43.1667152596653; 
 Sun, 30 Oct 2022 10:56:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003c71358a42dsm5398764wmi.18.2022.10.30.10.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 10:56:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 18:56:32 +0100
Message-Id: <20221030175632.4139-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030175632.4139-1-fontaine.fabrice@gmail.com>
References: <20221030175632.4139-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OpgQmkmmidRrq4mR4uVIh+6Mj/vvIz3BxAG3lQO6dE=;
 b=S/K8dVhobuYMLjWRemjLfURO0SXD+LD5tMyz2mup49ImlRbCy6SyXO1wy/V7De5Ono
 IUij3li9/WuRv/xrgpfC3EsOv8g7xfswh3+BHWEMe0K63LC24StWTWbobqyBiCQzfhpb
 yok3UDdMFgrjcFyNrxv9R5IpMP6uFctjt3nG91mY2VuVDEElNw+r5qbpiLKXRpxUP2/E
 fYLookjPIMZ/chDuo12ka+EECjLxQ56vnkPafpU9KCiS0vINsZ0Ky3NaVxdoKC/N7bSd
 0gkn2TYuX8+ThX2ck0ShHKnAaQOU7dAg3DUN7hbbOd5cpDgYU4waACO3coX5nvSgOI1u
 J31Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S/K8dVho
Subject: [Buildroot] [PATCH v2, 2/2] package/openipmi: bump to version 2.0.33
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

Drop patch (already in version) and so also drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Avoid-searching-host-library-path.patch | 53 -------------------
 package/openipmi/openipmi.hash                |  6 +--
 package/openipmi/openipmi.mk                  |  4 +-
 3 files changed, 4 insertions(+), 59 deletions(-)
 delete mode 100644 package/openipmi/0001-Avoid-searching-host-library-path.patch

diff --git a/package/openipmi/0001-Avoid-searching-host-library-path.patch b/package/openipmi/0001-Avoid-searching-host-library-path.patch
deleted file mode 100644
index 15b4510f67..0000000000
--- a/package/openipmi/0001-Avoid-searching-host-library-path.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 22 Jul 2015 07:04:33 +0300
-Subject: [PATCH] Avoid searching host library path
-
-The $(libdir) variable points to the location of the directory on the target
-system, /usr/lib by default. When cross compiling this directory contains the
-host libraries which may be different than target libraries. Don't use
-$(libdir) in the library search path.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Joel Stanley <joel@jms.id.au>
-[Fabrice: refresh patch for 2.0.32]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/openipmi/patches/35]
----
- cmdlang/Makefile.am | 3 +--
- unix/Makefile.am    | 6 ++----
- 2 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 264ee12be79f..0b3843784656 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -15,7 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
- 	$(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(top_builddir)/lib/libOpenIPMI.la
- libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- bin_PROGRAMS = openipmish
- 
-diff --git a/unix/Makefile.am b/unix/Makefile.am
-index 5128839dad13..bd0f897ba8d6 100644
---- a/unix/Makefile.am
-+++ b/unix/Makefile.am
-@@ -10,12 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
- libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
- libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB) $(RT_LIB)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- noinst_HEADERS = heap.h
- 
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index eded076ade..fc3cf1a520 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1  73d7dce4312b006983b11367e4a43d4ec52cf888  OpenIPMI-2.0.32.tar.gz
-md5  532404c9df7d0e8bde975b95b9e6775b  OpenIPMI-2.0.32.tar.gz
+sha1  4387f227aad92756e296d1c9421e83231d355dbd  OpenIPMI-2.0.33.tar.gz
+md5  923d2914dbbc3307712f8c58401bab0f  OpenIPMI-2.0.33.tar.gz
 # Locally computed
-sha256  f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945  OpenIPMI-2.0.32.tar.gz
+sha256  fb53e9ea5e2681cf8af7cda024b1a0044c675f84116ca27ae9616c8b7ad95b49  OpenIPMI-2.0.33.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 81492ec131..ccf86f93cd 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.32
+OPENIPMI_VERSION = 2.0.33
 OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses readline host-pkgconf
 OPENIPMI_INSTALL_STAGING = YES
-# Patching Makefile.am
-OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
 	--with-glib=no \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
