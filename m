Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B2EC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1756F429FE;
	Sat,  8 Feb 2025 14:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUShf3v-URQV; Sat,  8 Feb 2025 14:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFC01429BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC01429BB;
	Sat,  8 Feb 2025 14:23:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73736CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759A5607C0
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ih8ktLzdpT8z for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0779607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0779607CA
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0779607CA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dd14c99d3so755982f8f.3
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024615; x=1739629415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIZHj/RNDERDQd6/QvNZFAHtNWwb3KzAdCtzRMm5GDQ=;
 b=LWLzTvq6rTmo6jA667fHNvxXK82O25Pdpsb2gk+fSezHMmBKb7EgfE9y6crXYQ++HY
 aTnAcxo9smUuKMmvKlJhyUSwUawiSm3/HB6C33Og8xh5BRmjwRx02lrz/pJ5Fvvs1MCr
 uWKPCaPBwHxFUPKVtfHhV/FzrHtSTD1bv3DAAjDI7S1fCfeii2sVXKf7aSNOb+axF+Gl
 2o0sefMS3IJm+3gHzZYYeA50tZOW9/A/bBlquDrvjcjbAsjuGz09XRDIG3VE56K2mBxf
 WHf6BEtWNRZOs8pQ0yW4vq4Ln9MZsQWyqu38yDOglzjm8BhM0+v8ewKkvJk0G9VwHq72
 QJOw==
X-Gm-Message-State: AOJu0Ywm2mHv9QhJQ1PBcAN9fA6/QN+jHy9DaaSRvolTS6fOsoqYvmYW
 YoI8hZhui9x9GN1TXaSYg1p9c1pujUfTL8iI4nj3qMzlK4jUYpqqlidk4HT2DPWHePrIwCPhGWA
 7
X-Gm-Gg: ASbGnctgkv8+GGrjoh/xqjV/WM/heYeKOiNchrefFkq5nVy2uA55mzV67qZ/EEBjVVW
 VnCYSsn09DT/psSfTOdSC91RLydn+u5htlJZc+XZ6vuOPfG1iwmPMq244pxjnNucflkS/ljk3Qv
 StI9q2f0XCWfwKg4HuwjYxmNkvjgokbfmZ8rCbFldWl3zH6fOJY+In63HRfMCcPryO3f1859wa5
 s6hpogGATCvwnsKkE1iM9X8hm+f/d9V9/LxzmWce9ibfGqpnptsIpsH0xvcVem34HuAMQT51VIs
 VxLieUzSfd0AgZZBjjIne40c9JRkpdMxyGOstPa3SbFkXUFVRbxgdhxjbxO0ZMQ/cVkgwT/z4WF
 XzXWZktGRiBA4
X-Google-Smtp-Source: AGHT+IFHFAoXmN2dRnTFO9YoW49tTJL9/58ay/LCTPgxSp/uq++0wxG40Vzr5CnpbMDNmFHz3QN9KA==
X-Received: by 2002:a5d:6d0d:0:b0:38d:c087:98d5 with SMTP id
 ffacd0b85a97d-38dc8da6713mr5904845f8f.8.1739024614636; 
 Sat, 08 Feb 2025 06:23:34 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:34 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:24 +0100
Message-ID: <20250208142327.418271-9-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024615; x=1739629415; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MIZHj/RNDERDQd6/QvNZFAHtNWwb3KzAdCtzRMm5GDQ=;
 b=w9+TNvg5dSKaiN8hlAeof3aIkej/SBAEFpyx7o6GhaZfkoeFWnOv8JW60AHeKN6G4l
 9E98RSISKvWp6KLcD6quDmQotWjcA6htTAKuhjiVhjeE7ygs1qqehb7kYk+S3gmBefOe
 qKSVJ81nNgNdYqXys/gPXbgwaa/yD8iPuL5X0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=w9+TNvg5
Subject: [Buildroot] [PATCH 08/11] support/scripts/mkusers: fix shellcheck
 errors
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Integer variables need not be quoted (SC2086). In any case, should
there be an actual issue and they be set empty, that would cause a
runtime issue, wether they be quoted or not.

SC2086 is now reported for auto_id since shellcheck 0.9.0.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/mkusers | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 08f3344518..1400ea1b36 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -449,6 +449,7 @@ main() {
             else
                 auto_id=${AUTO_USER_ID}
             fi
+            # shellcheck disable=SC2086  # auto_id is a non-empty int
             for g in ${groups//,/ }; do
                 add_one_group "${g}" ${auto_id}
             done
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
