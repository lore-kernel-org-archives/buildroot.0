Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA071C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5283560D4D;
	Thu, 29 Dec 2022 09:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5283560D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0ezexri3Vz2; Thu, 29 Dec 2022 09:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FBE60C31;
	Thu, 29 Dec 2022 09:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FBE60C31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9F81BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2111940573
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2111940573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqnqaGXiChix for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F92040102
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F92040102
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:17:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o15so12734314wmr.4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0oWLV9vvhNCwuw7/aW6lXWxBpQgisVHoCoJN8bJRQE8=;
 b=V0ZHvE1cJkbWsQC2+n/SLFp9pxYFM7EWaXURnYDz1edb4eLS6/VJF2GKpEayyyiiJ9
 INJYm1lLQkPobn0Te2NHqrHq/Hla+e15YlL8x3PEY/s2JUOdfqubpIA7uIbQduobtDiL
 wEndAHtIdClUue7RXpUGOxZcnuKbfMudUlcB9YC16FWx4dKSNT2iGHKsuj1V7USaE/ca
 k3ULcjkNxJ6RWr3ghI9aTpEYS1pZAeAYYBTptoEIuu/et22s5bLgZPIFN6HdlMbTszCH
 9VjlQiYBd43jIZnkLPzTgYUudg8cTksVPzNiwtBB3CphmBud8UrB0ugXqL2iL4SewML6
 XL/A==
X-Gm-Message-State: AFqh2kpJ4baa09TX3q5yr+/ICKJ9VimlYkN8W0Oy7pB8YgUAMukWc169
 v4FW8esODp6aCk4SNSMz7PayVEEpAOk=
X-Google-Smtp-Source: AMrXdXvTPUEx569VrMAgJGBpls5pm2eCQwxkXksADIksZTNqFdNMy1GvNn+CMYYLgmciDW8DjfiiBA==
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id
 e15-20020a05600c218f00b003d1fbf93bd4mr19967930wme.10.1672305457815; 
 Thu, 29 Dec 2022 01:17:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003cfaae07f68sm30363844wmq.17.2022.12.29.01.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:17:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:17:35 +0100
Message-Id: <20221229091735.216076-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0oWLV9vvhNCwuw7/aW6lXWxBpQgisVHoCoJN8bJRQE8=;
 b=jLHWRTQUnH9ES3hgK/3jwlrTniVpXvjczD2TBTdnWoVqx/KxkORE3XoeW8YIZ6eqSh
 cKo1Q0B/sNeSvPAdi28C/JYLjWSRwj7OZg8Ue0IO//QNyz0G7bMyu28BDemOLZuN9Pu2
 sy/TevoEcW1vBom5rVATF6AoK3SzsjrKzAyiQlpOd9p+VGod2ZZfm+jklXiScgcEr0BF
 RtbKvptBXE+23qcu/K0/A0kaV9N9UPDaq7x5fC3i2iaGqjAzjsKYnBGw/y6DQf2kwSUj
 mSeTy4qCJHqk/AWD4olG+eTEFY/nGK5oqg7BxwsPaHJGsuK/mwGN72zI3esZqmBrPxID
 zXpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jLHWRTQU
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.4.16
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

Fix CVE-2022-3190: Infinite loop in the F5 Ethernet Trailer protocol
dissector in Wireshark 3.6.0 to 3.6.7 and 3.4.0 to 3.4.15 allows denial
of service via packet injection or crafted capture file

https://www.wireshark.org/security/wnpa-sec-2022-06.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index db1f71e9ef..56363e717f 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.12.txt
-sha1  91ca69b0029e58b9c824266237ab392a62f0a248  wireshark-3.4.12.tar.xz
-sha256  881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca  wireshark-3.4.12.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.16.txt
+sha1  b0e64d5fdd6701106d94bdc8f59dd40a34c7c807  wireshark-3.4.16.tar.xz
+sha256  6acb3155b89b65bcdbcdac7a9e6a59013a6e21d8ae6a8249a9af4fe9ce3d91ba  wireshark-3.4.16.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e5d5e6f677..5da344fc55 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.12
+WIRESHARK_VERSION = 3.4.16
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
