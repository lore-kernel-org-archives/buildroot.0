Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96664C02193
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 02:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 601F26104F;
	Wed,  5 Feb 2025 02:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZafqOEjpNDj; Wed,  5 Feb 2025 02:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B0E261051
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0E261051;
	Wed,  5 Feb 2025 02:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2175612F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 02:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061A441655
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 02:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dItHka4vtx8O for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 02:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 184C341685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 184C341685
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 184C341685
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 02:01:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [212.166.21.66])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A51442003BE;
 Wed,  5 Feb 2025 03:01:50 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Date: Wed,  5 Feb 2025 03:01:43 +0100
Message-ID: <20250205020143.72649-2-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205020143.72649-1-vjardin@free.fr>
References: <20250205020143.72649-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738720915;
 bh=yKVNU/dEP4AA/NP5gDBxgF9F+Grz4rmnYraX8Awzk90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kSvDDNBLzqLEAJ91mXxhKUuEcpmXqDzdjEOL6XWRY33gcR1a+bIN8oUFTSUgJZ6Bf
 NL6YlQP+xAKoYwx4Qg/TrGNnoDzdBEw0CWm4ihrNIBWhRoZDs5ndrjswtLNX0Ou4MT
 AmzUT6EKDwEStlQMgakcOjx4rM1z8jMDYoF+tsEysuFteRblE9FKBCegJzdMe7q65O
 +Bjnjsfz2/5dyTzVZQwhZYbsZZV1yKwU1hPkhNbCDxse32vt5d4Y5aJfvXCqx5aD9y
 /BYBdtm5e4T3oIQ2S6PrOtKqQj/UtOjhkYgBwtRwi+DgarKewYHyT8GYq+P30kufpB
 yyo8uHYZ9gotQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kSvDDNBL
Subject: [Buildroot] [PATCH v1 1/1] package/binutils: bump to 2.44
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From the commit a42041575e5, it seem that the intend was 2.44
There is no hash for the version 2.43, but 2.43.1

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 227eeefc4f..8581e1ee0c 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2023.09-release
 else
-BINUTILS_VERSION = 2.43
+BINUTILS_VERSION = 2.44
 endif
 endif # BINUTILS_VERSION
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
