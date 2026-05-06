Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D6CD3444
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A0A60F68;
	Wed,  6 May 2026 22:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gcqim9BAKyUb; Wed,  6 May 2026 22:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FED760F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106847;
	bh=GyXAXvgia8kpEfi631631pBWzzWhIrVwEbuxuiEynhs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PcoRN/7dNpKcyTG2a/oblkk5sJEwd57F/pG4yyjFX60J2gITkXienjvnNmXyKqlFQ
	 9S1Hm0JvMOmc+WUR28kQLfbfXoNhDqH+5P9j6ZjvR5eT3DxRteXjz2OfeZrLZEyHtJ
	 NQ3MTnWt6LRhLRV2cqN0y8YJkBRgb91BNmytvJbYQ4VbmbYAQO2S45jTZpnYBWw8lY
	 drQNefSQ94e0KY2+52iWeePQLwey9l7RPESPvXf+Y6zW+Hc0HOsHOvmLU2wz99+BRl
	 Edxu0RKhgrdBCWJdMxKCe1qA1GIkbN3Y3H4D2expi32q9zs8RcP9P/JFE8KhNYACLR
	 qehiuxYLYu+VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FED760F8C;
	Wed,  6 May 2026 22:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58821317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A7F583449
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hy3J5hkixIiH for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 589138349A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589138349A
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 589138349A
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:03 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7de431da8fbso201057a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106842; x=1778711642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SY43b8cawy5NhY88fk1k2BN8TtFupkQSjhzaxiPbjdw=;
 b=s799eaHy8XPG5l8dSTw1N7Ms4LqnnvWuNwm2Izt74wLhkQdc4/YaieVOoy8K0hKZCT
 lb9wQeeJ7e1cmty0ZAnVIlE14HrzHwW4LE1v3qsgd5v2Yyr4vfqPIBT1q2gIMn3OKeHf
 CjjBr3ZWNPumAmFUofrO7OV+HVp7v7+vsJGDrjJuKDKwNkjaBTgyvdphPgsl/uUbV8Os
 Qfhc+FeUEWV+1S4CioKFiIlmV3AfMK53aSXrwRpfQ6w9PEIbv5eH01E2FFyOzEfwZ2Oy
 J9chq2rMNA41YibR76YjXNhgaLX97fZC3DTXFt71Q3ziJHKlnc4D+UQm2FvULh9SJaK3
 grpw==
X-Gm-Message-State: AOJu0YybQtFqj8euNqdCLYuJCHyAeg2J7AXmi2+8po+UM/1M26b+qXeQ
 Ad8Mvj61GvK4kBeI83cWzOEmZWeQdzT5Iw44pboga9jS1xnsqXD/PEPzHNj5yeFW
X-Gm-Gg: AeBDievMAacrUdfYByEdcCxWY5e/VzkdfdEasOZ/6qs0MFE3/90SfrB6EWpPj4uq2Ld
 cquZK+H35sBKFZTldEsjPFyzFWbCR7C9dFV1BPDVvo1FWSBlga8qV8gJce734ckCkukIBSQsOKu
 2ebye83L2iIH7GYO4QmVXFrNmfYDERftjsbfT+Y0fVBmS/9mWtp/AkxXmakwAiQdeWvXTzCEobB
 Qyy7w4P/aaJHKhXn6d6/1gamGUPuI9kbtFBVQ0a5yvUCeSin0T9cmMYVZwGU7xpW73zGq9BQgI8
 ZLMq4Y6vCn1YUKl0LyvFFqh4bvdnfN4ovocnwO/+ObLfXk2TFpHut8quuOO3qLBuI4EeqiR7Mfv
 v2NVYn8mq+wkdssGLC2VfnWTHYRzDmrct7RMNG0rUj2R7RribNEev2AIg/YBhbi9VRqZul36KEu
 vWA60Q7sQNFtJgF+l7eZLpamGI+NTbB9DDMzurSsz6oTdhnMUtiUTczs57vxv8LUNB/baPW7kyH
 NQzq6sPi+iYPV/5boFyb2XjgNDapFzMADNVHHkssZiho/Ht1sW83cA3BVohY2OBh4QWwCQVce9k
 +HPgWS/Iqn+M3kFsOw==
X-Received: by 2002:a05:6830:6a0c:b0:7e1:f7e9:327e with SMTP id
 46e09a7af769-7e1f7e9388dmr590634a34.22.1778106842218; 
 Wed, 06 May 2026 15:34:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:15 -0600
Message-ID: <20260506223341.1759760-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106842; x=1778711642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SY43b8cawy5NhY88fk1k2BN8TtFupkQSjhzaxiPbjdw=;
 b=AHM0L4CXFYCkuG34WLoRXMOloRqR8Pt7z6hLYZ3I749RUYWmVkPskrSLSLhpfW0ikX
 Pj2kP4iAwsxV9+pHVUuuVxUgNQdtq6ETCXGiNO3zB7qTHvk88OvefjA7/OI4PTqHUsTH
 DzAL9QAPPdDbcNCSUUIqcwxhQHiYyYds0k8YQhjB9O4PIPpEEfcZ6UpK6MHD2vHnwotC
 8ZCkr7j6UrT9xckbTPuMwDXisIZ1/1ce3ArRgNBEnd+RxKNljOlY523evdL9AJE6OFl+
 1bKV5cxuAd9n/Gw2/3OKWSjbEeZ2OJIk2ER+aqhYUS+GXUaVMjji1FGFz4vFs+eO40yv
 FmYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AHM0L4CX
Subject: [Buildroot] [PATCH 14/40] package/libpri: preserve /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libpri/libpri.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
index 48a1019210..4b359008ba 100644
--- a/package/libpri/libpri.mk
+++ b/package/libpri/libpri.mk
@@ -46,7 +46,7 @@ endef
 
 define LIBPRI_INSTALL_TARGET_CMDS
 	$(foreach u,$(LIBPRI_UTILS),\
-		$(INSTALL) -D -m 0755 $(@D)/$(u) $(TARGET_DIR)/usr/sbin/$(u)$(sep))
+		$(INSTALL) -m 0755 $(@D)/$(u) $(TARGET_DIR)/usr/sbin/$(u)$(sep))
 	$(call LIBPRI_INSTALL_SO,$(TARGET_DIR))
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
