Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D458FC433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 16:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5506242266;
	Thu, 20 Oct 2022 16:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5506242266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxtOE-jj4HjL; Thu, 20 Oct 2022 16:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A9F4226B;
	Thu, 20 Oct 2022 16:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A9F4226B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1D71BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 16:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03B1642264
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 16:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03B1642264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOtV6WUbnsrN for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 16:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EF142263
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90EF142263
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 16:33:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so2816097wma.3
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 09:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ICbpE4TTj9HNm+RnkGm+e9Q3FijaM+Y3Cga8Tg+rwss=;
 b=W5L7CKfpV21pRc5Rk677hcgSTMxpGIpFmclHyz96qDMDQXo/46bNjxii86uuYrD+nQ
 SeMWOx/OyEZGV0GA3QeLKOwWvSGCnXOl6fomsdQ3PqlytuN3SRujhedI2DbTGfUr2S+p
 GDz7mrbBugmLkw3w9t1Q4YAGUTAz/eQ2PGmwEDp7up+3vDS3QoY3JHTTNkEGYPQD5T9L
 CZvD7MrAMlYKAk6p6dfuX9YIda4WUrOPW8qiIN1WWNQvesxDq6qBWGW2ST45M5zSM59M
 LAlDybFlAuG9rtWlSMg9d2OdCN8JTK9mW+uHEBhW7OA/dMPxkjfxdAqav4NDFeb5HJQV
 pErg==
X-Gm-Message-State: ACrzQf3WoR/bsA3c5sfCLN/pSGq6kge6FOBCBqgSqdCF8QtPyrKVBXwg
 npvl6Bkra8lUVHG32ce56VS6xChKgNE=
X-Google-Smtp-Source: AMsMyM7cc1v4NcHvHA4rxCJNUg61Fbdx15A2cjvXTHLQJu3GzQjSoMSdu2ARWFRfCTZsHRGY0XgVEA==
X-Received: by 2002:a05:600c:4f91:b0:3c6:fcce:e545 with SMTP id
 n17-20020a05600c4f9100b003c6fccee545mr9763565wmq.17.1666283597139; 
 Thu, 20 Oct 2022 09:33:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b00228fa832b7asm16746789wro.52.2022.10.20.09.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:33:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 18:33:12 +0200
Message-Id: <20221020163312.203021-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ICbpE4TTj9HNm+RnkGm+e9Q3FijaM+Y3Cga8Tg+rwss=;
 b=hkpGy6/w1OChnX2rxmVb8tSwvkbJAVLldPkUxuwGqQa+05qxP+ybc9+v08anylBTyU
 PhypiomnYicP7r9lu3l5Qnh9WTJM4bYl5zq+m8PdaBfvYVsyhxTgnXbaryEPk+6MqroY
 daVDlcyJ/lRIm/jb4BnCzW2lWr8Wc2EWCU7cZAOoLJ9nDZW0K0lkCLQjqFzxMuXYJIxw
 D7R538IhxUOnlds0f/qGbivlBgjaRgKQIzG3/VhvJskVE6nxSaM7uIdJlPPTnENNzkXN
 wu8/9kJ3+M/m2yqr0fpO03iP0uwt07pF96FUpNmej4O8qoDkQk/hG9lXAbfD8mGZ4XlU
 nHow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hkpGy6/w
Subject: [Buildroot] [PATCH v2,1/1] package/zlog: bump to version 1.2.16
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

Drop patch (already in version)

https://github.com/HardySimpson/zlog/releases/tag/1.2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop ZLOG_IGNORE_CVES

 ...verflow-at-zlog_conf_build_with_file.patch | 25 -------------------
 package/zlog/zlog.hash                        |  2 +-
 package/zlog/zlog.mk                          |  5 +---
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch

diff --git a/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch b/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
deleted file mode 100644
index d5f23e1b26..0000000000
--- a/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a5be8b3a8ddc498de4ad041757285136a55d97e3 Mon Sep 17 00:00:00 2001
-From: XiangfeiCH <chenthrone@163.com>
-Date: Tue, 12 Apr 2022 00:13:35 +0800
-Subject: [PATCH] Fix stack-buffer-overflow at zlog_conf_build_with_file
-
-[Retrieved from:
-https://github.com/HardySimpson/zlog/commit/a5be8b3a8ddc498de4ad041757285136a55d97e3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/conf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/conf.c b/src/conf.c
-index 0f862fa..9a4cb75 100644
---- a/src/conf.c
-+++ b/src/conf.c
-@@ -305,7 +305,7 @@ static int zlog_conf_build_with_file(zlog_conf_t * a_conf)
- 				/* Oops the buffer is full - what now? */
- 				pline = line;
- 			} else {
--				for (p--; isspace((int)*p); --p)
-+				for (p--; p >= line && isspace((int)*p); --p)
- 					/*EMPTY*/;
- 				p++;
- 				*p = 0;
diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index c39505b2c6..3b7c6aa78c 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00037ab8d52772a95d645f1dcfd2c292b7cea326b54e63e219a5b7fdcb7e6508  zlog-1.2.15.tar.gz
+sha256  742401902f2134eb272c49631fe5c38d7aeb9a2ad56fa3ec3d15219b371ba655  zlog-1.2.16.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 1929a45a3e..329f2cfe2c 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.15
+ZLOG_VERSION = 1.2.16
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
 ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
-# 0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
-ZLOG_IGNORE_CVES += CVE-2021-43521
-
 define ZLOG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
