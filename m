Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E612CD3444
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2369960F84;
	Wed,  6 May 2026 22:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwU33lv538Sp; Wed,  6 May 2026 22:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E2D760F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106844;
	bh=s8pz08fUJfASxGYaeRmb73Xbhf78uvStORpTRTpMWxQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aouOTCXRXJt8y9bBRySsvRNedy4FKkLsQ1rfnFxeb4Kd1oBzckdlWKyJqA8cL+S8d
	 lkDRHloGSkUH0OqVHGDbMSc1voLa5fnc3ZrMCD3Qt56fsE4OQJdG7I01Q52QiLz70X
	 A2RPJBFNUn6xOOVHLx0COW/Vq+pbpB6u+42K3QYar9c66ZWKXNUySaipF9VP66S+jC
	 /Bn7C7Oo+R8qLte/4nXmG21eqNwuculykmyVxpATdK/ctRW/mb3Kx0HG6IYYeTmpx1
	 nWDlffAd39Gu/rmdzXdRnZVphHiTxD9eBguk6Y+iTWzQUdjimug2lAytlGPNQYTDn9
	 U6Fh51AYy4LBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2D760F7C;
	Wed,  6 May 2026 22:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52EB7280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 449784077C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY9bSTRmGH0l for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D56B4058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D56B4058B
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D56B4058B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:59 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7dca5f64e86so219456a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106838; x=1778711638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xOkFNHGu/EtVRMgPEV2j8HkbBAWsDPrq5RiK3Yd0CDQ=;
 b=WSRPZiqCF49wqGW+oUYuYbnTYrf+LRPVoqQe87/wOk6A9nWN2/khAD9XXPFBD9D5wy
 sflwMrtpr+4slhrGq1hX7LiTc6C9gSNSdW3YSs8T7TjKPKC3HrAiAF8JyBOxmsNAnfrL
 F0R6bJT1oh+vNlxdZWbM7G6tq/tZf5Gni0c2DqTt+aGeO8fbaQLKXbrQ/1xg/x/ds4zW
 tBLbxGgR1vxOEZDXwo6W5bC3n7r61BRCJcXbfl+nzlOAnq81s5M9/etc89SgE4j9lWro
 JjpTRTe4OUjMFE/kUVwg4nKIHysLNmGh0HtDgnz7EDDztazC8skjAvP6AQEgDdG9H4fl
 XZnQ==
X-Gm-Message-State: AOJu0Yzp2xmFiofx6tkpLLvFq3yEC740MgN5dKlzjCaBJgv9NcYZZkkm
 IaC9Z5HsUeJmiW2zqCd1Ed4j3MR6PPqDBzJwuxMhsZYL82Wh3HJ7hae477SYK+0y
X-Gm-Gg: AeBDievQcmCPxXpjJ3LabWYk3hVfVmVWtGeEXkzvBUGeWHE+V47zdLmFleQBnCalQFi
 l6SMYuAEIvDC9r6uXeJOiGcaFwz+sVqWRUqtPv8cGwIkQt6YBkQskRYwivBfM46zHsT3yo7gtwC
 LfndinLYQ3iFtv3QHjZDOWYCc9/JtYU1hZNNYULGGaYPDujTZovtm+27Px7k/uMbIhhxlt1DnRL
 SMBt50v0gIILLHIPOQkMzWffvXhSDbXsS4QfYKaZe1RYbjY53TEvu8HFfSQX+zBImnwc54Acdfd
 w56DXBMViriMoz4yReKDzTC7455E2thfXyhDHBRCJikw8uOgmlalyYJKa8jbHx+rtC0SwsjztW0
 +CpaC9mGM8EWH8tzeQGneGg+1aZ4ybsFL/wDE3VqDtrLt/0rFHwO88/ZhTcjiGbeEbG+OBRb+xL
 qQOc84jwFMhYoNNjfhyNJViJcv/5PzX5cpiCpRF08lTqMzUBChgzdkM54jGbJ5A6oE3dg2wMP3X
 9r3H3FRYRjhO7Qod+tF2iou+9rXqJ86nnzm4FG2BHN4hsGQVs/OUzyK7Gcxs0x490GuZPYV95dQ
 0V3h490mn09Iqw97bg==
X-Received: by 2002:a05:6830:67d4:b0:7dc:2f4f:17b4 with SMTP id
 46e09a7af769-7e1df13b220mr3240273a34.21.1778106838171; 
 Wed, 06 May 2026 15:33:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:11 -0600
Message-ID: <20260506223341.1759760-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106838; x=1778711638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOkFNHGu/EtVRMgPEV2j8HkbBAWsDPrq5RiK3Yd0CDQ=;
 b=P4CvPdhg7H8OgBtPxT/fLYcL8sYRsBAwOFK7ebsjR8jHVCSQmiehOJM5ww1o2XyZLX
 GQ9lMdPM6un94UtPxLhM13zgbMdq/ZU8pUJxL0uBVQwLerUXX34azfYjsk1e3x/c/OBp
 DxbvB/KYiJFELWIIEcNvUN6OMZyEsVBe5/RX3b0Vhx1Zo11BMGlygljdvbqWBFQDX8dk
 vsCMC3ZkxmYGz+Guj6rc3PwVn+z6ebYsDwYTa5IXisDGWLB3m6zs9gXl7VKidNu+uzL6
 dn5vNJotYCB7hXa6h8vgbIn/Gm4UccYEO8OlTcdulSmEZCsBeXLNylU9PZEhxhRNmqWn
 IoOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=P4CvPdhg
Subject: [Buildroot] [PATCH 10/40] package/gptfdisk: preserve /usr/sbin
 symlink
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
 package/gptfdisk/gptfdisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index b35899bf9b..cdb7bfb7ca 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -41,7 +41,7 @@ endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
 	for i in $(GPTFDISK_TARGETS_y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
+		$(INSTALL) -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
 	done
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
