Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C2CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C81AE83641;
	Wed,  6 May 2026 22:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tD12R-gpRKQC; Wed,  6 May 2026 22:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1CA2836A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106868;
	bh=UhiKviW9i2bo2N6miIMyBrsmx4AYDVeiYjvM1l1KTS4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e4mzgxXXnwcCG6u2fnuQl2JPzvIMXUc1wDtdb6FqtMPzzZb0D7uSetI9OpDcV/gD4
	 VkZCUtlWE8eks/zWPlKnRUawRTBbWQ2StiUyafiB17cKfuMR9+Rxi3hyw4fKBeEQ8f
	 qo3i5lF31T7IzWS1DRemMnogygINScVFs8KJMfJ1udLu97Pp79W/yV3gulmH3kT5vv
	 mYlAxoR91mMAw2dTr8A+cLk4bPzOirbs0klpJxClznmB6uo0EQZIe4bd69S6yWfZZY
	 Hz6JMG/XahzzHi6vVk0JWsvRlQTGm3yoIEh0JUUglzLU/XzvsZGGhq3D9SsDG4tJwW
	 teGCEJqZh47vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CA2836A7;
	Wed,  6 May 2026 22:34:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0485D377
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE2C74106F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3S0edaiAHzBA for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DD154105E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD154105E
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DD154105E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:21 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7dbca22dbfeso150871a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106860; x=1778711660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DxtMAPifdm/l+K0SV1gtAjxUQN4Kk0yFqCh8B3+hSkI=;
 b=QcxVmmblF0oAnn3hLUi5gdPAA2gXQDrv4MvGVH/A8ZUKEtC354Bi57qmsMpi7g9dio
 b1F/OsZyqz2lEuVghpb4NhVRTId918mJg48UXwDMrflMjVvClFjTKv2uO1fETge7c6HH
 +/bRB0zE9XzvvJCjzYg9AyPXYqEYNGJPDK48yZDJiYVc07PpVOY/YEsdk671YI02WheD
 afV61f+AOqZkLVBXgEe4rL/jVkEchYhA2A8r6WhxwCZm06TwXeoUXEryfBwV6kmgnYHa
 Kpq1ScWriE7buKVSxMz8wrgZwBMPGvzQ05CPNLTfeFhh8wxwc/hgHbaD1qIth7npQ0Fm
 8rvQ==
X-Gm-Message-State: AOJu0Yx5K/+2uWTXG+qGYKbnzuuhtKk5lIzAEvBfyqq4rb/JYzPTAnRr
 BVsXioVtdpiUQOEUm+z3YUKJ02vwJCYVSmD08mNpa6tu1JWGptZwQoNJy3hLVhAM
X-Gm-Gg: AeBDieu77LJIfmaq88lDtlz/cI39ZXLmcnJeRW8P4PRhzrisL7EFsNakfOfAWDMt14y
 yGwoxkHwrN0++FMwyuLm67bTP9JALbwIaDVQYOiSVIZWaWxZuvn+BJUACtWllixcTt/fHfoJ4NI
 ybn04QnlHfbJH99JXJ1xDqNGWFhXDRsuWOD+pLQQQ9/jypD2xNOgOTV24P7zdgKdGH0fjEZ4S4H
 K19nT8PhPW13EXfgyPPjq1MFdf07fznDrrph7liDf4ma38XlnjuatS9yVVIA8zxP6ltRPizp2+e
 sSgUiSQimCjT0lPdQ1qSTkkKiOGbWE36/Et5ZVz8s3J7b+Ak1eRYzLB0i0+2OGYj6D84thbRgQu
 yAxIddIE4XjVep7xUVgtp/jT6KwUjCO4Qf+SKQnzqbsmxWNZZqaBQBFznTOoGT/YsfxbLKOHAGE
 lk2DDRVqDVyUjDrIRzVrMrhjxLB/BozgdvRp5jwRalqyQh8+Baguttmk/VzE3OUCe8cFxFQW2yB
 TrQVhTaTwG2HgoRg4B9NVI/699Ib9q9UTS/YxAWD7iiggV/VZG2kAXhSqRAusH0VEsuzjF6RaFV
 w98TmR8=
X-Received: by 2002:a05:6830:3708:b0:7dc:c43b:959d with SMTP id
 46e09a7af769-7e1dee8dfd8mr2826820a34.9.1778106860129; 
 Wed, 06 May 2026 15:34:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:32 -0600
Message-ID: <20260506223341.1759760-31-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106860; x=1778711660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxtMAPifdm/l+K0SV1gtAjxUQN4Kk0yFqCh8B3+hSkI=;
 b=FHFlPReq4uy+fz3j4vVjWne0kauDrCU7u1OQxPvdI/YoKvmNRTbHJO74N/P4kacTnd
 njYIFGAluLlPq9D7Dub7UBnl1qkRiuvlXs82wE1vPSBpFIlBcv3gmINwQVJAJKY3Ezga
 3LBfivNX6gaT8MkXmN9SccMDnKblkekCS+z1wc/2q+SzrKvq18dhxLcZA3AaidbtIBUn
 eD8wh/S27rmk/XwkYjwVL7uttu3xwD9RPPtng10Eb/PRFiY715ClnCZeU2SlhLRXpdgU
 ESNyssp0yUuhSe+Kh9fCSx2jPuD1L7YysZVEJis2sso4USUTcr4Q2E+gSFASw45eTFuN
 wY0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FHFlPReq
Subject: [Buildroot] [PATCH 31/40] package/ti-gfx: preserve /usr/sbin symlink
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
 package/ti-gfx/ti-gfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 2728572776..b67162dfa9 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -165,7 +165,7 @@ define TI_GFX_INSTALL_BINS_CMDS
 			$(TARGET_DIR)/usr/bin/$(bin)
 	)
 	$(if $(BR2_PACKAGE_TI_GFX_DEBUG),
-		$(INSTALL) -D -m 0755 package/ti-gfx/esrev.sh \
+		$(INSTALL) -m 0755 package/ti-gfx/esrev.sh \
 			$(TARGET_DIR)/usr/sbin/esrev
 	)
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
