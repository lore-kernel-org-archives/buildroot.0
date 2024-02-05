Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D1DC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35A9040BFD;
	Mon,  5 Feb 2024 11:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A9040BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ui5eTLvIxKju; Mon,  5 Feb 2024 11:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3024140B42;
	Mon,  5 Feb 2024 11:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3024140B42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3BA31BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD1A60F92
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD1A60F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-H_OMH-x2A8 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:00:11 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7130060F91
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7130060F91
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d751bc0c15so36547735ad.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 03:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130810; x=1707735610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4UOX7+vY0BZbyUOoaqR8WvemvpmD3v87tgK5jqb1/ds=;
 b=DQ4VfUuterH5aQ+hXxw8bXmWsua2Iajnx11KKE9lxVZypgQDTXbml4XDzyKSZ2xbFv
 wk4cKaA6+MOpD3M2BhLUdXZ6HQsPlzOMyOKE7tGb7x76SalwAm5fy1VRkxcy6KBOtrNZ
 1kOSW2ktz1eDrw4lL1J0aSYGw6/YtQkstI3Ni4Nqf5LSPx/UilYjVBRR+L7h0EvNjMcP
 U183nta8J6JOs4FPcqLfvxJxQu2Z6E6kTpjYxI/M2tG8dn/6Hd0EkK2mrH151okn+Z4R
 E2uVHCwaL6/Bafj7gb1951v7FP0/odmYqE5Vf2DJI6P2TxsjTm843817+2a+c1zK38YA
 RqIg==
X-Gm-Message-State: AOJu0Yw16I1ozNpx7Z5KTg7fG+t5UWSOeuAHMHLqwBX7oHM5kaZU1mfL
 UiVE9w+wipJE03V4OSk2Cn4YRsQEehjgwd9KaiKdhcYRijII45SMsCjlLuR4KbhQkLuc6lruOKn
 E6m4=
X-Google-Smtp-Source: AGHT+IGTcJ24bLURXJNTVYbNbzT0GETgEWcSyxzY1NaBzYjXC6C9UWCkiMMJYvOLc5/DDegyjjcEXA==
X-Received: by 2002:a05:6a21:3889:b0:19c:7e6f:85f2 with SMTP id
 yj9-20020a056a21388900b0019c7e6f85f2mr14819024pzb.1.1707130810026; 
 Mon, 05 Feb 2024 03:00:10 -0800 (PST)
Received: from desktop.. ([2804:7f0:6401:3d0a:b6eb:312a:be61:822e])
 by smtp.gmail.com with ESMTPSA id
 ka15-20020a056a00938f00b006e043d3e5c2sm1771014pfb.162.2024.02.05.03.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 03:00:09 -0800 (PST)
From: sergio.prado@e-labworks.com
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 08:00:00 -0300
Message-Id: <20240205110000.1869845-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20230601.gappssmtp.com; s=20230601; t=1707130810; x=1707735610;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4UOX7+vY0BZbyUOoaqR8WvemvpmD3v87tgK5jqb1/ds=;
 b=roF9yxs4icKTIo/Kg5gKV6uFZAPSG83iad+nQQMNjDEuSfeaExqhrJ5qhUmSjtl6E4
 lD66GJ/OMFrhuKas8C9vm03q8okuVsjoUcIDT7cHTfE5VfjgvxSFmSDyQ87ICCYqqJ8h
 3YT6AsYXK7ffFx6ZVtyZPGu7J7IX1X8wA69Y1+coTD3cQY8TTAEhmZkrJ2KKSXZRcga1
 tXODZNtUYg+ub4Yj1ftkavAKCWf7VENzIb9bZD7K/ebRYIP9karmEw6Xi69FMrKHGB+u
 D/Driht4qMdpN/Mvn8zymNZ67IwzeJK6ynwBzXWFWyMe+xp9asedBQ1opGMOy5AClQ64
 6Pcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=e-labworks-com.20230601.gappssmtp.com
 header.i=@e-labworks-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=roF9yxs4
Subject: [Buildroot] [PATCH] package/stella: bump to version 6.7.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergio Prado <sergio.prado@e-labworks.com>

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 17d059226cfd..59c68064590b 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  babfcbb39abbd1a992cb1e6d3b2f508df7ed19cb9d0b5b5d624828bb98f97267  stella-6.7-src.tar.xz
+sha256  9ef880df87f2d3ffebfbad915247d1fd5a3aca41dfd6a754dcf7a142ac826752  stella-6.7.1-src.tar.xz
 sha256  e82dd017fea2c70a16726aa1d7c05c5b7597e10f7229511c1b110bf84cb507c0  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index aa5da1996e1f..c48bb593a42a 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.7
+STELLA_VERSION = 6.7.1
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
