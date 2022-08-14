Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752F9C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC8E660BB4;
	Sun, 14 Aug 2022 12:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC8E660BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZyUnjakfhoQ; Sun, 14 Aug 2022 12:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96BB260759;
	Sun, 14 Aug 2022 12:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96BB260759
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97E701BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8090181A4E
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8090181A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1oAhOEILm1n for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:56:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81BFC82B3E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81BFC82B3E
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:56:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b96so6644222edf.0
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/tgKWWM79B0bzh3njm3lGj5vqEMlLIqrCvQbaddTlTs=;
 b=uTBUJ7FndN/2MgyCkm5WGxxUh82wpGfH3gBncUPRuAJ3xwR872wE4xfVHZq9OTBt/m
 sKGkQVJ0HLuZMKZIDuwiNkJlABJ/KGCvSIxIDfu4ErtlU44dtk6vDqvcK3ez6yWzKuKv
 6XRW9I4c4f5e/YMSbcMWN9ezdtcEMD9Ccft0pSEXWdhoR7U+QpQQMRthemI4A964RDap
 v+uaQ8E770mar7ibWSxidiaaCd9B4CE54YuSFfBlaGrDKcbdsUQtpqegDXcNecpKBz2p
 +8Kef/lvvBzAID/m8Ll8x1u5pyn4DYJSA/M/UACNoljodv1SL07EzvmOPtxmPNVqL6+U
 5G8A==
X-Gm-Message-State: ACgBeo1XM5/ouzTyN85fdtiVn+iKc/krW5PuvRZGemQntv+v1/6xDOtP
 naIdNrADKdXhHNHOxPliYuaSH9YFIFg=
X-Google-Smtp-Source: AA6agR787y5KY3NGB0a9UFK9iC1ZKmzvWixqZHjlC/vzmwtWtxmu79+rofER+J+tqaluMz/rDH3ajg==
X-Received: by 2002:a05:6402:540f:b0:440:d9a4:aebf with SMTP id
 ev15-20020a056402540f00b00440d9a4aebfmr10656457edb.196.1660481766538; 
 Sun, 14 Aug 2022 05:56:06 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a50fd8a000000b0043ba1ecb0dfsm4702194edt.75.2022.08.14.05.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:56:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:56:01 +0200
Message-Id: <20220814125601.1227888-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/tgKWWM79B0bzh3njm3lGj5vqEMlLIqrCvQbaddTlTs=;
 b=A2snX6+9/9PF6ipEbJJYLgBbCw/WPxB9IAQC/S2R8P4pYfWaPs6LCmtXpmJ20+w/RG
 sj+ZJdFLU9bPtSflFmLOowo06ub+SZY0ssb9Ptz6HgYgI0nNQZn7U8ilKQOO13eQ7jn8
 RD5ZWOR9AbYoR10y/qVtfD2w5VnL8O1pqAE2K1nEba9OFY7tTjAkXUXCn4zXArWQ2/ca
 F/nCbe0OLI/BQkiUEW+eiuu1cBSMdYb+9IaufNOBOrmaoKE5N5o1I6wRKmWttPEDM/Q+
 BrI41JjJq7w7jsyUxHpZVEgz91BIxZKyoTqfkATGbHyEBmUy8Af4VSIO+wQc6d77O5Gt
 9Qvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A2snX6+9
Subject: [Buildroot] [PATCH] package/nano: bump to version 6.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 8308005bb..83de85b41 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v6/nano-6.3.tar.xz.asc
+# https://www.nano-editor.org/dist/v6/nano-6.4.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  eb532da4985672730b500f685dbaab885a466d08fbbf7415832b95805e6f8687  nano-6.3.tar.xz
+sha256  4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0  nano-6.4.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index cad215bed..ecfc37412 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 6
-NANO_VERSION = $(NANO_VERSION_MAJOR).3
+NANO_VERSION = $(NANO_VERSION_MAJOR).4
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
