Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CC2C83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 11:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033B881164;
	Tue, 29 Jul 2025 11:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHo9e22RQV2H; Tue, 29 Jul 2025 11:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCBA8113F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCBA8113F;
	Tue, 29 Jul 2025 11:50:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC108229
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D261C60818
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CEiz-2k9bVF for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 11:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29FAD60A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FAD60A95
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29FAD60A95
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:50:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae6fa02d8feso838477266b.0
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 04:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753789806; x=1754394606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxJ8kC2LB3UWN8MhaL78KDEi7nlMAJ7EcwWfYO/FT6o=;
 b=r5PXr2MFHgKRibnBtzuBFEkBg9TkBBCvqAo7Hqmb5c2c1Y1YX4ebXwg+saauRLUYpv
 aW/B8u33LOgNYo0CF3EWa2ixt4bwdnrtG2dYd0PyRRreELD8waluNeEAaVdte0t186gm
 QXmQtY4T8b5Z4iHXyo2W5oovm6F0MLrhqPrbPCbnhy+WvzjgInTnNNr+XHr12SJH1SBV
 OrkHHZDXwdG8p0huxYAhZEk15s2JhLqPod/NBAn7+IsT5EwZjuUtZ5zXiOVAFFWOLwuV
 J2Xc4bPR6Lmm8tfy0bQs/U9LKIR78OZR3OoUQah6x8weUSOHW0b6l0nnstPaaQDnh8Ut
 8EOg==
X-Gm-Message-State: AOJu0YyKlnmgaHoctIdTgoL/9OyUhEKQzxXbSXsAHQlIKiWb3M98VlCl
 gcdDFwNmbILWpzrRFbdK+jBNGVOlYFZxzKMrG0zpZD6FVU07Xa4//pp2g6Te
X-Gm-Gg: ASbGnctRk7S0uG3kIa4QQhKX+NiHj/Ry/uYS0m7/iPGUPjK/moqPMBgBosqVSxIk7Sg
 UTeEHRpDWdsk+7v98NjSxwTDpxHucitIoYWdyZ9jpZvihHOOmX/yLig5L/Xzjd/TBCL3l2fimVu
 ddsisfGEtviAfwDQruWnPk28S+FBnVnpH5kfMpLVAxhuavLwKdVRuebrjSbsy/GCH7eznTyrS+7
 ELmD2WJgEOT9CUnMfBFNwC+tfIPbg4Aac2u+gGZDvXbBXA14Qgf8C+iOS1z9SBMmPPLsLh8qZAS
 72YhqBRXLyyT22nQEWePViU7Yo1dii39a9RtH+xuLE2FpPboDENDf3r4e4ik8me/I68V2/vp8zl
 9f63JjQYjZ8Se/B9dPOWA5zhxxL+6n4ejhHENs5AQy0SnO0M=
X-Google-Smtp-Source: AGHT+IGJtUlYYQf30H0Qz3TUweOOH+Z/yRlnzd0El2nV7tbkiQZoIi9cWnIX1StfA69xa58KJkpP/w==
X-Received: by 2002:a17:907:3cc9:b0:ae0:d4b1:b5f0 with SMTP id
 a640c23a62f3a-af61df52e60mr1500965566b.35.1753789805463; 
 Tue, 29 Jul 2025 04:50:05 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af6358a1aa1sm565979366b.36.2025.07.29.04.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:50:05 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 29 Jul 2025 13:49:51 +0200
Message-ID: <20250729114951.230203-2-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729114951.230203-1-shirokovalexs@gmail.com>
References: <20250728131926.848832-1-shirokovalexs@gmail.com>
 <20250729114951.230203-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753789806; x=1754394606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxJ8kC2LB3UWN8MhaL78KDEi7nlMAJ7EcwWfYO/FT6o=;
 b=cUKaYHYLFoZZPLpB9Gv9kv27/FI7MyKlSYHQtqsoHmLo8wHpPv5OI/8fR+0CejEyPA
 ChSzVmCkh8dz9FKptIrKMOSTezHzs9159E2Ouwm0tZgzG5ExRRcbfJRrx8CNY/gBF2e9
 3cImmTUzC6ym3n8qDqYWLUN7URYRIC1va2mhSOQokKbt/dKCN5M4HGFgP0CJ8By893qq
 Hzyfxj3z8hpf3IXEOCxhqEo/CY+frrKXDONsXQx1xdvKlIurSbzOo4MCP5Uo1aJ8ZWIP
 Zeyh8PvGGcaUf5o1AFse1JI3jp8qt8i5zH+Al4GoZBadkM4AYmPYk0ZGljYHexL8tBjy
 HcMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cUKaYHYL
Subject: [Buildroot] [v2,
 2/2] DEVELOPERS: add Alexander Shirokov for package/zellij
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

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ed4acdc5..5eb4f33f80 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -132,6 +132,9 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
+N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/zellij/
+
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
