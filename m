Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F8AC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDB3E60ECC;
	Sat, 30 Dec 2023 18:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDB3E60ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7x3SZhYQxc1; Sat, 30 Dec 2023 18:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135DD60881;
	Sat, 30 Dec 2023 18:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135DD60881
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A242B1BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 797874044D
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797874044D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUMjhZ3lItfV for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:18:35 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E1F40444
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E1F40444
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so43705895e9.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 10:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703960312; x=1704565112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9YI56tfMxWInic33LLHufwQO4KdVlE549pALYe4NUgs=;
 b=tDckHPn1DDZrcwG1RPRBDL77CCMyzfb5FK93WUwEnflmWgfW29c4Zx4ke4uhNgXeTY
 oRiWbP+4Ze8mDp4nVVMWSY3K1ZAdXqeDRbVIDO5IpB19ffS+6bstVmoau3VxAPG+gt5+
 b5pwBhZo52j5Gu3LoV6S+Kkd5Jsmxy/RF2URU7PdFlPEm6hv3+r4bs9nquWvCmd4IMDi
 aIbhWbKUxR56JhxxjgD2n9AmJPvR11+smijlkqhq6IzhAaFSNR6szfehFzyz8ZUsMOSU
 b26n2f2C3DXWTVYdQXAl3cdJ7JI5AZBI1Rgg09GZEzJfG9JmWz6JUxkI2lajmvp+hk5z
 x/3w==
X-Gm-Message-State: AOJu0Yw9XR1QYqmGA72vTA3cYK/8gi5B1HWaiLGtgvsF7BCCgMQgkjFD
 /lSo2UDP9ePfwRn4XF9CXPBSfXjhRvQ=
X-Google-Smtp-Source: AGHT+IGkO0D9gcbGDSeFlvs5A/FU5dLZGTawuI8VctWUbdRSrmoP/RixhCswc/EFTn0WGhoUy/pDYw==
X-Received: by 2002:a05:600c:b88:b0:40d:838f:8105 with SMTP id
 fl8-20020a05600c0b8800b0040d838f8105mr547313wmb.154.1703960311887; 
 Sat, 30 Dec 2023 10:18:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b0040d3dc78003sm34024707wmq.17.2023.12.30.10.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 10:18:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 19:18:29 +0100
Message-ID: <20231230181829.1014195-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703960312; x=1704565112; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9YI56tfMxWInic33LLHufwQO4KdVlE549pALYe4NUgs=;
 b=l6/Oz3wI5TirZZ660GZRgC8D2WRrchUdXE81IWRysPaqXLML6OChv+VYVtqGMI9LiE
 PjhIZcKbGums/xY2ocq+iEXoE1cVWQzE31WjyyV35vPUIYS5srEgi8f1Lq3CLwCaS0uR
 FvTxVGFS2K6/yeT82uYBNz9lGhlI58wKvky5+r2aUBKs0uENTDOwEHSRKWWlRHBBHdxO
 8QdWDNsIUbGpxcehsgQvXa0k5yZSSd9mm5nshDe6sie/dtBTdt71SKK95Whb6xf5bCnv
 7Zq8FdqklbKzFgDdKeWT0PfpIVu1kjPSoTD/tQLtDBCn7/45DKaU2hwLh1MWsZ0KM4en
 YbeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l6/Oz3wI
Subject: [Buildroot] [PATCH 1/1] package/autofs: bump to version 5.1.9
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autofs/autofs.hash | 2 +-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 97bc757d6b..67d09e859a 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256  b33d1059855664b20eeda26f3e28ff518fb0c3d58f565570af2ae569dc73c0fd  autofs-5.1.8.tar.xz
+sha256  87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b  autofs-5.1.9.tar.xz
 
 # Hash for license files
 sha256  458028929f712b4795bc5adc31a1d6a2151364ce1b372ac43f613f56c8448fed  COPYING
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 42639e30a0..42dd4e2731 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.8
+AUTOFS_VERSION = 5.1.9
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
