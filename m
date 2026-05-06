Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62520CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305EF40F45;
	Wed,  6 May 2026 22:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnZu-KJ6lyiE; Wed,  6 May 2026 22:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B8340F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106845;
	bh=bBdBH3VKE+aF8+LlSkLeE3AfePf0u5Jb+9psf0QIFUs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pl5K+D/een6sHlQ1EBYLM3v8wDF9L2ZfvG2pG85BF2/WzBqgJx8VooGt4QJmBqxSA
	 iUkiPWbIobebgcKrytS2KcAv/EG4tfh4VLY7y1LwHEm0ZL3WerCkwx0OjELFZczVKI
	 6wb3jWxy9JiIq+WpJ9c4NPTVHYxSPzKUY44IFPumI5rTgEnOAviFMjeoPJChtSOFlq
	 Yf1VW8mbq6PBLc5c/gzs/JFiXavO9MD7aHHm0QejUvKEZBQvtbFDbVEfJg1fOWFWxY
	 codPsZVgPwjvhVhL+JTKZIyO3MJd7Ne+IfJdrUKrQwZVh16ZBWgGuXXat356sBacky
	 xWpywTqcvN6Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B8340F48;
	Wed,  6 May 2026 22:34:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BBE9317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C7F260F7D
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XqBRKcEogMw for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9835A60F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9835A60F6E
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9835A60F6E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:00 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7dd73b7c757so137655a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106839; x=1778711639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B0ptM0d/doCelB8mRLAxIhz81tWP5okBY3itE1X8dL8=;
 b=RuGLkrIm24JjIWbgR1foRFADvQqD0YmSAn2GpTXrkzSIAXNHMW5/sQRs1OXENHIRXh
 si5giC99BePHKEXAVUPSkCUrVHi0Aqou0dZfFxOLYEyKHT19IVGBFmESqLdpj9IcISoZ
 Th6eeybre4647CgZzEL8Z8bzpbKCk1IPQ43MC3Z/uygGzbYo4dENxSz74pcI185OLl5f
 3MINqIyV9K/JsRJodqaRD4DI8QWz3LHNohkvpCkaA6zcqny5yXS02NXi2Jx2GGOFke/m
 L4Yp5zq9xxS3l4Xy0n+M/yh+SQR8Lm76txes6aV6ldpMouyD/+FWYnSu4aMkiXDBK2To
 OniQ==
X-Gm-Message-State: AOJu0YxQ+Te4cfO+hVjoiyYkqvBz51jHpgaQ+Cpl58xnR7LmrrERxkMD
 DMp80sM8vy0lY/BtTCQYlo9X26cnWgR4oTTp5BrdnkSQuqXYg1VsppUtWNM3SKpv
X-Gm-Gg: AeBDieuR6dCjm+/5HMw8Qf6C80KzIU16A5pKst2e0mAjAqPV/vuqz+MEgU284NrVRLr
 dnEj/KHFHIyY4sSELFxT347IAK82XSnvgQD1O/0tlDTfYc+Vv8u5CfOnnocVacq+QJ8HHAabbCS
 dcrcs/zWZfvcOLskl6sFHIO3On81ui8NCociWTPProj2aee9VsFdxhpFiyXphJbDzuVBKsg7WLv
 a+WUIWDKrw+BsMmd9AosQCTEIM/eZzhTOKO5nGxMGnkLYtCn0um0mKW02muspZamb+s+eeijn/M
 Rr96J2TCVQ3KCaGEcHQh23NHSHoSJJOGX5fnSjx6V0BjHmVlGImWSZFfKXgm0vF7eQEdbxF3JG0
 SwQ9dC83no4nygsk0VO57cSCodH8AauE3QZCSRrj8vELoe/gaQFwgz4T+H2cdds8XrtSGaun6hg
 uS3G7XAL1sz6m45JHlaIp1dFNa4+hk5FAZD/4U+uzStcCVqzh+iGDd4PctFY5kLN0U5rEZj5jWW
 vwj3BsNpba1ZVqqiR5S01Da4MYf6Nk3biqARDRIYeDWVA497tWhUSb/BYSMr/SZjdbtvD/TEWKT
 cnFUkYg=
X-Received: by 2002:a05:6830:6588:b0:7dc:d7e8:cb37 with SMTP id
 46e09a7af769-7e1df194411mr3047298a34.21.1778106839364; 
 Wed, 06 May 2026 15:33:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:12 -0600
Message-ID: <20260506223341.1759760-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106839; x=1778711639; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0ptM0d/doCelB8mRLAxIhz81tWP5okBY3itE1X8dL8=;
 b=B/RKb5ytwTZ2iEU+xt0tzfGFJfvzWZvDLuga7oEmViFJTM3iDZnYD81hgCIuFMx5ne
 TGWoZE5ZPUFCxyeJlx6t/D9TicOFa9hdzmFWxZbOrwgI66ecClxJSgeB/MritiRXBsO9
 3wAjHM6STLwx+DwSTheDgEba/VmHNYsFsDooJ2aV15eor2YbldR7UwgM/8V+bPk5Mh5p
 w787kqUIUxmuNW/b9uRSK8+Y+/KdYlxJht0xT9oqtZcaCf473ZKgXmquldszNaF0RnU2
 D53ki04uqfvREC862Gr97lraunleTO3EWTP2X5HvD5+7fq/hACFX2QrFARa9T43l1/Ee
 ximA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=B/RKb5yt
Subject: [Buildroot] [PATCH 11/40] package/hans: preserve /usr/sbin symlink
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
 package/hans/hans.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index 6d2b1dabe5..07ae336329 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -14,7 +14,7 @@ define HANS_BUILD_CMDS
 endef
 
 define HANS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/hans $(TARGET_DIR)/usr/sbin/hans
+	$(INSTALL) -m 755 $(@D)/hans $(TARGET_DIR)/usr/sbin/hans
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
