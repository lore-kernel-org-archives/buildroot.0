Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8681EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 16:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 177A7410D2;
	Thu, 20 Oct 2022 16:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177A7410D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erysBg_Zj-M2; Thu, 20 Oct 2022 16:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39C4D410BE;
	Thu, 20 Oct 2022 16:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C4D410BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FCC51BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 16:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18B46842ED
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 16:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18B46842ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGvlztsoTZva for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 16:29:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DF484295
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5DF484295
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 16:29:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i9so2333612wrv.5
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 09:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d7sBPlg/BWFPbwCfYmW6dY12ZYQqgeOCDiJM8JmWF+U=;
 b=wUZ1k0IYNvElT+5DDXsJ88DVqMuPbHB2xE1Cd69jChSz6dkaoBFeg5S0+ToSgwYHvR
 cky7zQyIZZ7uqSdU9gH0xeKkgFsPZvFlysYuXkrYtLVAxmptHOwHhuKGYM0JTutD+q9+
 SUAt5Aiw6/R83mg17tEnOxGb3PbyjT735AMiywZ7hgUZ5zvwV1ESOv8oIRN/hGQopm0k
 xai+ohPuiMi0AbWwt7ZAb8WxpHlMWtXU4ip6OUOu66kwGG3cqA4+RCoo5t56V6j1Z66j
 dsaqDg2Z6ZNyOopcHzLFBFdqO6r+gMjV6O13BC+o6OohQ9p0VpYYjbEmjOWWJIqxLbPp
 SL1g==
X-Gm-Message-State: ACrzQf0VYO6RjHHqGoUYzSEhNePZiZwaU63YF0U+LMFo+jiGMaWp1HaI
 UJauSe8+LyK/vezpxIjp2W1ULrdw7t4=
X-Google-Smtp-Source: AMsMyM6rfvzoNIqurfP1oWXVv6F6n0m696izrL5s5V1R9KGrZoXtC/AuXjzNjMKAXJplEXCfuZK0tQ==
X-Received: by 2002:a05:6000:2aa:b0:231:ac4f:196d with SMTP id
 l10-20020a05600002aa00b00231ac4f196dmr8891021wry.121.1666283394629; 
 Thu, 20 Oct 2022 09:29:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003b4868eb6bbsm88388wmc.23.2022.10.20.09.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:29:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 18:29:48 +0200
Message-Id: <20221020162948.201798-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7sBPlg/BWFPbwCfYmW6dY12ZYQqgeOCDiJM8JmWF+U=;
 b=lJ+FbB+VBiPf0EjPVIhw7c60+2noPbRVSp25NyFdgfXescygKZwqhADzB7lTrFgPcR
 m/ErQEEXCtXyPNU5G313YbjjyTqpIWG9y+JA76Qs20c6mX05/ebsa7N6jouyQ4mMA+ej
 bYsrZQ01ecmAZqvTBxaO7223HqrW11JSQfkOHy2KaV6/HGNWbwwuIOFVXliMabcnzvQW
 4f6XYcglHDDDNRpJdYcGGMb7Mgd5TblLO4+c89BiyqWM6MERqX7l3rFHaZhH8gAecobr
 p3pl094P3YO7WodbNb/0kLqFEpsyIXBZuJ5FKL9/Umy8PFY5rFIyCJojUD4s7msfoI7D
 ryhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lJ+FbB+V
Subject: [Buildroot] [PATCH 1/1] package/zlog: bump to version 1.2.16
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
 ...verflow-at-zlog_conf_build_with_file.patch | 25 -------------------
 package/zlog/zlog.hash                        |  2 +-
 package/zlog/zlog.mk                          |  2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)
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
index 1929a45a3e..6e85cf409b 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.15
+ZLOG_VERSION = 1.2.16
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
