Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5321EC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC2EE40472;
	Sat, 29 Oct 2022 08:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2EE40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCw6hpxZArCf; Sat, 29 Oct 2022 08:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D53D9401A0;
	Sat, 29 Oct 2022 08:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D53D9401A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFAAF1BF348
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE8281464
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE8281464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzaXxbUUBRLw for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:31:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791F281462
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 791F281462
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:31:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk15so9278696wrb.13
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0OpgQmkmmidRrq4mR4uVIh+6Mj/vvIz3BxAG3lQO6dE=;
 b=TQeIwOxTLHhcXjg70XFjSQ2voSNunujR6Ogb4Dn1Zfmq5qdHGqIhJsdj9lFquL2VOi
 9OcbNm0v8k4554bfjbmzxovRr7okb9+zHMrbWTAVKr+L6aTNYypHeX06CjbugD8J3Cow
 cNrO9/04sNUQBK8Zd/cCmBOvVzOb5zK7K63lGNA0z7Z9TWeIPp6Kg/hXyZkJ301FosbV
 EIltCdtxj4Pj122mwqbzm692JKAxux/EuBWtTkbvs0YYp+lEBu3oPLXDwf0MMpyTCEUu
 zNxSQ8jz51xh9Z2vkooP3R32U2cLV8RjAZTroEH3z6bjgrgWWiKFeLF0Km9nI4npgTs9
 gSuA==
X-Gm-Message-State: ACrzQf3ZzYBPjNZfibeVA78LgQPYpNLu5VBq37cGDAE7SOk8f5UW09rw
 sw1qq6t2kCXZwY38QIV8IZ0Y9Mu4fY8=
X-Google-Smtp-Source: AMsMyM6mKPYrinfoQfx6jGRNNiOYqNaXUxJKqhlehOz8gSARrPlsA0vEK84xwW/gH/N+5E4ibws++A==
X-Received: by 2002:a5d:47c7:0:b0:236:64a4:6d5a with SMTP id
 o7-20020a5d47c7000000b0023664a46d5amr1761271wrc.666.1667032296221; 
 Sat, 29 Oct 2022 01:31:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bcb88000000b003c6d21a19a0sm922862wmi.29.2022.10.29.01.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:31:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:31:30 +0200
Message-Id: <20221029083130.77419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0OpgQmkmmidRrq4mR4uVIh+6Mj/vvIz3BxAG3lQO6dE=;
 b=h7mnCichak69ANH2lTRC32OaNHPz4dG3EmisODbzamQLoL/WbFro704JNxk2ahpWf7
 VG2B40sp8CN7HxELoKsOqFZ9XDFFC2h8XFRoX7q5yKz98WgoKruhfjvFm2W8xmM5s2AF
 A/oKbomf7Jm8pA5ucpg1wT+WVvYjx6pgtCeLUuYbxkOA+4ZSC4q0B/vHBH527tqQuwXp
 6jieeMAVgP22kKg19kXDAo8epycXMrXqyQzLaPFrCE1hd7S+YxzZYdPUjJqxi1tWEtm5
 qET37s4I6PoFjU9ITkSuGQKDinbmdf0V2kacgxpUwgEETy7BEPYjKqL6/oOvja9ds6ED
 Aciw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h7mnCich
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.33
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
