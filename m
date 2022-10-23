Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F077C433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AF336072A;
	Sun, 23 Oct 2022 21:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AF336072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMwjKKmXYIUU; Sun, 23 Oct 2022 21:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B902606DC;
	Sun, 23 Oct 2022 21:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B902606DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 241131BF33F
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3CD740134
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 21:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3CD740134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUMELze5pBtx for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 21:09:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E286E4010E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E286E4010E
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 21:09:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so5529194wmb.0
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 14:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KME/9JfW1CRRHh5aiqlArQ7MaDFXCaBi6Qz7+nzrqAg=;
 b=Z+i/fBUNHWxRHxuaq9oWkoa2Z9RQOSdgKHl3/+HNIrLbtBSNOhBcUEhTqKNqxYXqlm
 oCgN09RXIiP7T5RD11KHSnyZul7d1cTQCjLX5uCIBbxlz+Aj4GT1WqGkynX0whj7AEqJ
 gILLE8WPHPK112SOkaBJ0OLayBTK3ghP/jIMSI0N6OFXOkniSSaevy9Lzg5wZHcbKwqm
 QZgQdxyYPAaDxYRYMd0wZ0Kg2MVI+KwsYG6aR/duhfGxGivauR5C9wfwmokxF065PY76
 GJFzUgHvlOZApmjg0HfX/P/2J2rAlbKW/bGY5khKH2I99Xx/3L+BKnGa5lrqxS4sSm5Q
 /3DQ==
X-Gm-Message-State: ACrzQf3Nvy5pWUPK1BrNo8W8FfmK0AePkn05ZPOqbcfveAZVtjXv1DYR
 1wdi/SkRma4cGN63/HepHBGZ3jms2RA=
X-Google-Smtp-Source: AMsMyM6+fZ6b9NxZ1NcEmme59Ndt1r60pzWJSwRvrJgTmxD3Dt3oxrMlesxEVulLa2kLGYWiIkd3hQ==
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id
 bg10-20020a05600c3c8a00b003b4eff4a94fmr40168743wmb.105.1666559393747; 
 Sun, 23 Oct 2022 14:09:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4803000000b0022e47b57735sm2846836wrq.97.2022.10.23.14.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 14:09:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 23:09:51 +0200
Message-Id: <20221023210951.48256-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KME/9JfW1CRRHh5aiqlArQ7MaDFXCaBi6Qz7+nzrqAg=;
 b=dx+kLKpj9Hc1xNrv9ur01voLhamIge5+VYvllk93A8KGeilSI7ci72V3xdI33ByKHI
 A43JXlTlZN4uWofKerBuaUZbXPftbZzhWpRHsgvFbvrrh80x+7kEr24Q1Tltd5axsNIT
 zfnsjOwzmyhY7VBFLboDLJXVYGBeR6X0u7fZr0w0mTVXCXj7VhimG76s4yNicxqDffmE
 Fjj4VVovAZ5p1HoWBlBEhFzDQKIDE4fikWXZtkOFi6lVgLTzIpzXRAScxz/xkGg991Q6
 nlX5qdL6aMt9xsQcAgYyIaNOWYxyamOz+S4SNUETDLON4qW0HA+2cCeJ8Pn0iR72Dpc0
 j37Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dx+kLKpj
Subject: [Buildroot] [PATCH 1/1] package/lensfun: bump to version 0.3.3
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to new upstream site to get latest release

https://lensfun.github.io/changelog/2022/02/22/Release-0.3.3-Changelog/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lensfun/Config.in    | 2 +-
 package/lensfun/lensfun.hash | 5 +----
 package/lensfun/lensfun.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/lensfun/Config.in b/package/lensfun/Config.in
index 7ec49020ee..7c424f5351 100644
--- a/package/lensfun/Config.in
+++ b/package/lensfun/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LENSFUN
 	  actually use Lensfun to process your images you need an
 	  image editing application with Lensfun support.
 
-	  http://lensfun.sourceforge.net
+	  https://lensfun.github.io
 
 if BR2_PACKAGE_LENSFUN
 
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index cb56f32b56..f03d0b54ae 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/lensfun/files/0.3.2
-sha1  1d978b15aa7304d66a4931fa37ca9f8f89396c16  lensfun-0.3.2.tar.gz
-md5  247e59a0812ec451f6cd0d20b3379cb5  lensfun-0.3.2.tar.gz
 # Locally calculated
-sha256  ae8bcad46614ca47f5bda65b00af4a257a9564a61725df9c74cb260da544d331  lensfun-0.3.2.tar.gz
+sha256  57ba5a0377f24948972339e18be946af12eda22b7c707eb0ddd26586370f6765  lensfun-0.3.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 9258409f57..f82ed44495 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LENSFUN_VERSION = 0.3.2
-LENSFUN_SITE = https://sourceforge.net/projects/lensfun/files/$(LENSFUN_VERSION)
+LENSFUN_VERSION = 0.3.3
+LENSFUN_SITE = $(call github,lensfun,lensfun,v$(LENSFUN_VERSION))
 LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
