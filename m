Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78105CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50ADD60F83;
	Wed,  6 May 2026 22:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gaRVZ0uTv8A; Wed,  6 May 2026 22:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1732760F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106841;
	bh=b45+JYE2kucdOkT3UzR40Bz/kMB21ALF8SAjiLIWGrI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZcZ32CM4t4g9UUB08tBrA9g+9K1t0qWrsUY6IVGRe+8WbOnMLqikUpjVmOHtlv8MS
	 BzGWusictYs6LNI5tZ2C6g81yfFWbKQD5eUmcM3Jp0wPDEWafM0isY8rs+8WubM/jE
	 fax3Am+vEf9B0Q7sF+GDFzGvrl12s2K5ZHYD8z31e7+e88pCM7izNSkrBwK6r5rKcE
	 R6F5e00+0aFmttAmDaYov1JILF4ejrEUEawVJMGt906oh225P7r7X76ziAVenfEzDU
	 xOsMOihtUIlE0FEQ2etm46ilQJPBiOY73dY6DL2m7AzuqMad/ZfAQvvLDUE3ZF9335
	 SIW5GRVGLDvTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1732760F7B;
	Wed,  6 May 2026 22:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1046A280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58835606CB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drctls7fY1pI for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F4CA60F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F4CA60F6C
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F4CA60F6C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:56 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7dccda31d3eso66278a34.3
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106835; x=1778711635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OAjDK0RP/wemNs0MjZuViOPi4ORprJniZ8RLV7Z7beY=;
 b=o2/8oSfvrte3IgoeI36d0aslYY4/YOGswf20/LGXEqyYDcppkA3Z+DZMkrxJnMQKkY
 VOJbY4Bk1O1xSIGndgtjSnjOf5pbLRl5JYUmXmzACQR8JT0iFcypTvFk/odhDg3rltBO
 6uEvm499kOVyQe9GCCca5xPfLPNDxdFwnng/f1khiUAd+CIefdWVYL1RA29Jf4RZVDNI
 Ui/R3dwvSpvsYTmaBJwqk5lAWqNJiglU2YSJhs9GIO1MMgDKMiBogRkZjiz8REEgtCbY
 VVuUbhsVJgac0u2u5NCtxd5/b9hxMSOKt0ejUrJ2eZEkjmJzTosMEsZFmJmK4zjvx6xK
 LpsA==
X-Gm-Message-State: AOJu0YyZzGDURRhwsHHIZ0Qfd8UFwhiDeGkAN2qFrjjwhdOz0TjXo50A
 mupwgHWuh5Xucg09ZNWuYounccjYiamr8TXD9MX1uz42oAjZBTpTrpNqjuIZWF7v
X-Gm-Gg: AeBDietXUoZH6Xb0sJ3v3PBOE+LbC/oobFm/j3jV5961pNcu2f1HUQo0hjIItqafzy8
 8fWQuhWLB43IH//rFOS9JT+IwSkFeU9TUPjys04ZTM8dzN+oFOX0ZDIa2dKLPt3vYtydpCIX7AW
 oVctcCr9Ja29Ssic14bQQxMwn0FRaWCU4uLOwsW2ni27Tr9wcCW/1ydCUI0Za2qYEcwH2X98Cz9
 wa7pfV1aEOblRnT5c/UZ3eTLHHRf05VLPzOZoefr5uvkn3Xangc85NNZo4vlsvMsMeJjnuxxe9s
 ObzJDoS8S8+rA9AGxD0IFLb/S1H3PePYedctsxMr2J9t+cUmHXXCgu9RWayKwArnN5PJuDuyxAK
 gZKT+WmRR9+YTpeGtTMlWo06mFk01Ptlppmi6tzKIoNQTsz++S3mmgIMlqOgy41qj9pcHrkebvO
 sBdwXfrrHz327VxgTIhwMM3ysHpSdXIH316sE2+72JEyRfLZ9WeVOBPDdmYVnnwpjeOqBC+A7HX
 Yb7EWJ8GS1m5OiO9CxwC+LgotIeGpCRi4rI3iEApxCB+aP8r9QJoRm37fAYiU3Kl4RY2pMpH/bH
 IK/aoJyV+/uFQIPjEg==
X-Received: by 2002:a05:6830:6f8f:b0:7dc:da06:c0f0 with SMTP id
 46e09a7af769-7e1deebe189mr3277769a34.4.1778106835080; 
 Wed, 06 May 2026 15:33:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:08 -0600
Message-ID: <20260506223341.1759760-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106835; x=1778711635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAjDK0RP/wemNs0MjZuViOPi4ORprJniZ8RLV7Z7beY=;
 b=Q7aRTX1xEq9RSwfQyMXElimk/t7WEGobh24y6v2z10zuPbMV+phGHiUY06sJ1AXBzP
 eZigmnp0+U3+2VWMungejzuQxm7eA8OlX2Aoa85RanvSp5pAfv74DPnZUaP0zWtsRDMk
 PG4pWNliUW85INejCSTpSjRv2lFCTQHUx16AepaKwYj0nm9zAkPXRE++Fs9Ap1psINF+
 3GMTOrM1GA26QJkHbK1yaq+DPHt3cH0PssAWrhOAqWQc20X1qPMecUHxZ/U69wzhG/tq
 z/m3roQG7qsM3XMaBCYH161hC2jAMVGGBZlgYRyXOUwAza6p0/03QjBQODgPcFJyKWKR
 YIGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Q7aRTX1x
Subject: [Buildroot] [PATCH 07/40] package/fbset: preserve /usr/sbin symlink
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
 package/fbset/fbset.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 526cba40d3..7010560248 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -15,7 +15,7 @@ define FBSET_BUILD_CMDS
 endef
 
 define FBSET_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
+	$(INSTALL) -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
