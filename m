Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED1EC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B68540866;
	Mon,  2 Jan 2023 12:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B68540866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ga02Tk_0DFVR; Mon,  2 Jan 2023 12:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B3C2404AA;
	Mon,  2 Jan 2023 12:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B3C2404AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E149E1BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C998281E7C
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C998281E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGVqwHJId29V for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0988381349
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0988381349
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:21:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id az7so1755789wrb.5
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmBOHauBOabMOsOqrGCgY25+RM3+gvfezqBuwp4dPno=;
 b=dNwbeJDL8N3ITWIi2+VNtaaRBhI40CBm3MWBRiw5JQeeAlCSejEyGpRRo+tizNs5K9
 CQ/x7AynoOW8Ugz6Zp+EGMPX0VKsFe7o3d7ZA2fJMcoOwoIfAmu+njDmaL+7+ZGjJjv7
 04OF1FCxP/94b2TlmbO/ZPm0rGyBjrfkFYBGkresLw8iUTqPxfHNOLxZrmljrPpCerxQ
 YH896ZJFNb5Jm6x6tL4LZ0cRoSXnJ1hWTn9JDLwOX60FtunQpqcZRtnIUKu8ErhNZALc
 whT160x7Bu0xTCd52zXaijq+njfGulBUdlspdafz/1Awb9VYmrCY33SppcSiBC+Fa+oQ
 nKHw==
X-Gm-Message-State: AFqh2kplwg/UMAMq3hE+b1Bt1zuyRWLUdEhiqrlz6AsdFZ0ZuxXYk/1W
 9PnY64EYZDKWny6+UBaT53MloRn8Yjg=
X-Google-Smtp-Source: AMrXdXtwwsnttEB56xISl2jDvhI2LkZxuQIamW/9wtVdU6ievTcVU05VsEleD5jFSjmo9w4NmU2U5w==
X-Received: by 2002:a5d:6591:0:b0:277:cd3d:be10 with SMTP id
 q17-20020a5d6591000000b00277cd3dbe10mr18719953wru.17.1672662100206; 
 Mon, 02 Jan 2023 04:21:40 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d42c4000000b002876ab9debcsm17514866wrr.36.2023.01.02.04.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:21:39 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:21:33 +0100
Message-Id: <20230102122133.1912278-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UmBOHauBOabMOsOqrGCgY25+RM3+gvfezqBuwp4dPno=;
 b=B5OlfxfJY0TcRpQ95cZOXkHiWZGqFhZUayCe2qBF4ZEPc7xFSWGRUPgiQ44gcRXe0I
 60n0rQkV0IMm1yPJRm9G5UJ0RBUa4Jox1nX7gFzswJBZVEJF3nS3ZWQROTRmJmb1IvrO
 x4HAfuklGRzLocLuHtQg/CeaUyUEcVNyeUCNnDY3jYYPGfZ48gOBVwX2OpSIdyfvkdyP
 5CU4t7e9vQJoW3IBBzBVFjnJPzjyNXY1X9JYqeJec7xqL+3gQcwbcQ2jqyqRXvYqWX4g
 K7n9HCBZk20OZ4WUlx9aFjAvvPrW8H9m2Ci63ktsHZKattrXPwLLp40X3gXuGhVaH1Mc
 nOlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B5OlfxfJ
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.96.5
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
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 9649e24f7..29cf443a2 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2753fc01452a3d2ee665e8365afdac0e9683197f3ec06231aa684a48b286d11c  lsof-4.96.3.tar.gz
+sha256  e9030af1123ff052ab69e12ef55b8a17dc47ac4bccfba85ee1ca1f31acf29607  lsof-4.96.5.tar.gz
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 8c8c46c4e..fd5887141 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.96.3
+LSOF_VERSION = 4.96.5
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
