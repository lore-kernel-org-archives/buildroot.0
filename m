Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4449C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBC68429F;
	Sun,  2 Jun 2024 20:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi7aIXif-_Sn; Sun,  2 Jun 2024 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC36842A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC36842A4;
	Sun,  2 Jun 2024 20:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA321BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 883EE832DB
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViLP_A0HDC0V for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2C64820E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C64820E2
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C64820E2
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4210aa012e5so35454495e9.0
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360797; x=1717965597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FE6CaGhI8bz9Ka2zxRHI4oBVPdmniC9tYmmMatqguXA=;
 b=ggz8eDW4zh/DwAXWCBgqQywiU/m1PcbrPRHp4lu2YGqnsB6LIfejlHUEPoMxBvbYyc
 s9J6xtvPnzdsVMonhtlTeS3LpZM9bPy4AxNTGiI30msaDEcpYVVrezcPcB1fkL5YETr/
 pw2aL+fdv1Dr3+AMOHp/0NypX4P5sO367RywLIB5+mNeRKZUKMN84Zo0tOtfidS+iBM9
 OPKEmKZRaZq3rBaGP1JVxoUbHVW8y/8HDHMkda7OLwk7g3vCoXtwN92DAmvHXHf+Xjlk
 WsJa8/ocYGzYFNJOKgKEOwmG/6374Y2DJ1pcJgGQlGlwSePPcRWKGOA2N2ASCPXsuQU4
 wPSA==
X-Gm-Message-State: AOJu0Yw3iFfQjWiXDGSbuJqYe3OINM9YZlTDMvWNBs+SDtngu2fAmeTy
 FoOdldyokbE7btlskYlN0Np4xvZgrgpIPD88IrmN5ZudO18XBU7bJyZz1A==
X-Google-Smtp-Source: AGHT+IHcBrNr/5k8J1QCmuAprnt+x/rGbfzXZ69MnT4Exp7uUKEUJwU8Lc5asxOpuPs3Yg3xK3gO7A==
X-Received: by 2002:a05:600c:198b:b0:421:2b3e:3a22 with SMTP id
 5b1f17b1804b1-4212e04a0d7mr58947105e9.14.1717360796688; 
 Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:45 +0200
Message-ID: <5c70195af305d79dc79b92f278269f93ffdb44b3.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360797; x=1717965597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FE6CaGhI8bz9Ka2zxRHI4oBVPdmniC9tYmmMatqguXA=;
 b=jtBKCVZ4g8HwLkmWgjuSfP6j5V+51g4TvIFGmfXE79ugsOR06zKNBRZXdjlHwUARS+
 d7idS6KblobwFuMn1etsxNax6Ig+cUIN9IbDERzry2q6dUUyRU5kaVM2GxU95L3l5Yxs
 cOMTxgNRnbadjarnaf72i1V5rxc8JdxIlhDYwHDWUlca8V8C8oeFIhcjNYP4QK70YbDJ
 37JEYOnbEUIb2V5hnSLY2l4/GXE283v7h/pcbtGjBNVmvElxLzpPEOI0FdcRQgpxvEuU
 ZkzLpGiN1oG00EIrejvJjIML/z7A8bkdY1OPp3F3/vmkVKMdvqP8A8fV9357LPdoSAI6
 GCNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jtBKCVZ4
Subject: [Buildroot] [PATCH 09/16] pakcage/pkg-cargo: use post-process opts
 to pass manifest path
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47ce68bf02..41dfcbd096 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -192,7 +192,7 @@ $(2)_DL_ENV += CARGO_HOME=$$(BR_CARGO_HOME)
 
 # If building in a sub directory, use that to find the Cargo.toml
 ifneq ($$($(2)_SUBDIR),)
-$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 
 # Because we append vendored info, we can't rely on the values being empty
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
