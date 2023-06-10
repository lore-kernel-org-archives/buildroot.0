Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE88EC7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 13:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FBEC60E63;
	Sat, 10 Jun 2023 13:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBEC60E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ul3EMjxnx5HH; Sat, 10 Jun 2023 13:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A2C60BA6;
	Sat, 10 Jun 2023 13:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A2C60BA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF891BF343
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6593083B23
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6593083B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVl2KDcCbtlj for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 13:53:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08FC483B01
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08FC483B01
 for <buildroot@busybox.net>; Sat, 10 Jun 2023 13:53:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f732d37d7bso19694715e9.0
 for <buildroot@busybox.net>; Sat, 10 Jun 2023 06:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686405194; x=1688997194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BUOhqRu2qay6sTJeY0G5Of2E3s193h5F8aeoNkToMfU=;
 b=kA2BbO8O1xUfJHZqaWBsnA1Uzrp/j1vSlDIu3JKALS82iqDKpQ0HJUv/H8bOVmpR1x
 ePKZb+vtnsTrZwi73Iub6Seb57vpeyt5dfaxfxqOtzZ3Ah5CRQBLk6IXQVxiVsHQetkT
 H7hqHVP7ud08dPASdQTQstnjsdhKwL+0uD2nc5UFxKHdRsTyUDBFMd7pJkA43hingbTk
 HT8DwkUNsXvT6c8md4oSs5ANVeJV0UcyBo8Amhq+EHUZ4GXtswE9Ye1DDMo8R1t3wcIe
 MVfxORAmJNmHSsEuaL3Drgb70vsZQUoexo9ZBEYdot6jO4d/osI4ThdJK+0gpAOiBjIF
 TkoQ==
X-Gm-Message-State: AC+VfDw4hwj8iq1JzOf0aYCDFm59aPdI0eEPaevBJ1QyJ7OTyOdA1vnE
 r9FWyuqeqVEcj7PMy7T0GYemReU8/hw=
X-Google-Smtp-Source: ACHHUZ5JFQBjMsDHPMWif/5R1p5nTV8lygVT1f7XkpKvdLqmy+yTBF/2ZzM0mTF2zCc/shzMR7cMyQ==
X-Received: by 2002:a1c:7903:0:b0:3f5:60b:33 with SMTP id
 l3-20020a1c7903000000b003f5060b0033mr2451277wme.5.1686405193508; 
 Sat, 10 Jun 2023 06:53:13 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a7bc7cf000000b003f6129d2e30sm5833564wmk.1.2023.06.10.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 06:53:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Jun 2023 15:53:06 +0200
Message-Id: <20230610135307.1721115-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686405194; x=1688997194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BUOhqRu2qay6sTJeY0G5Of2E3s193h5F8aeoNkToMfU=;
 b=PqYBksg15uSQrTOGjtW58wdOCefXfQFTPNM73QYJEslP4FHP9I2HU0gzzF0jjVXeU1
 YrQ0M5SBo+M37okLj4B0TTS+d38+Yh2KlSyJtfo1JVZIqZaD7bkNOdtoSCy1hF/5MMja
 s4oU2dCENS4y2vCQBorET9MZy1pRenKuUw/Ig7BXOfFb8O3uMca2bWc23ZwmfH9pUKUS
 EmREsM+b1+uvEen94051dRtVMOQgJaKeGXiwyPn7chYn50MAo+nPMULMWtc9YYf2ohJz
 2cpz5JNgMU4rR+8lX8a1unjTsKLVCJMrBcXCzQBVaG/fRXKd5LcdgahyctH/Qi0idWRf
 mHHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PqYBksg1
Subject: [Buildroot] [PATCH] package/mc: bump to version 4.8.29
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
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index b0381474f..5edfc7911 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.28.sha256
-sha256  e994d9be9a7172e9ac4a4ad62107921f6aa312e668b056dfe5b8bcebbaf53803  mc-4.8.28.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.29.sha256
+sha256  01d8a3b94f58180cca5bf17257b5078d1fd6fd27a9b5c0e970ec767549540ad4  mc-4.8.29.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 3858d6288..894b23144 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.28
+MC_VERSION = 4.8.29
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
