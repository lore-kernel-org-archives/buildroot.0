Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA9DC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 22:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B585A81975;
	Fri,  8 Aug 2025 22:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfEHThDHtnYa; Fri,  8 Aug 2025 22:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB302812F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB302812F9;
	Fri,  8 Aug 2025 22:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 759111D3
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 22:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC7381301
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 22:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ek1kTiD54h5i for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 22:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4697D81309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4697D81309
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4697D81309
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 22:07:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so2118576f8f.2
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 15:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754690833; x=1755295633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ZZqcaAOJA0CEx1zuhFQZYHHl4rLQonyC0fYMHjkMBg=;
 b=CY6oVqV6dgpqBYgdHsO76scOMwDZ/Vs7jA3fCaHeTMRP/ClGD68W6QEnXGgs/TNo2D
 4RFY3bKsvHTGCe82KPHnOnQ1q5SN3PksJ4sJ/eAkmopfJFM9EwJ9fv+rw4DlQmsAWiC7
 S51Esy9Izm0SDuUQp6nkki8SK2uFrL/71M1/iTVsB8p8FmXA5KQapfovSJDn4GwMk6fO
 0l0Q5NuJmbv9rgaENY7GCLQn5rudNhvC4ZrgP+imz+kWGM9gCo4X0bpNttQsGm60dL0i
 zuPPK2sABfO/aIZhwehcz8QM0Gb8P+5isJvGCwcWIcZ3+aA/rQxKq4YgjVIIiul7O4DG
 6tcg==
X-Gm-Message-State: AOJu0YxVBd/xGD1YEVgXJcSrdk9/HQ6ebl3OVwnaIvEtxqZFhMaYn7T3
 h3rj3n8I4NrxuDVvNmQDptTuKba3Rp+oEtd/G8/i+NqD1RPNfnGSSwCf6xV0zBW0w/LGekRGo6E
 lNH7d
X-Gm-Gg: ASbGncv+mbriyJWeJAtqdUw0P7mlz0KKUb/I8rmG3immPTey0qzcrGvIYxLJYp6SVW7
 ho+TaHazMGDdaOLJsMyH1+xu3/WLzGaqc2I9/JB3odbSvt1oUBLOWC3aPE0aSHpNd1uR6JfHCnc
 yt+B135kEkjuiGSUWfvRkm3VXBopX4ReDFe2LKMKCsTKDmtwemv3BmYDkot/nX3gf6lToWHESul
 fURLLytlxv7EsJz+8G6rOgixx+/cpc/ImQoNKmYxJ9REP2/i/09OF+0hK4mylwjN/zeSbATbbpx
 HpRGp5YMLHjHBVF+w8IJOk1Qmb5U4U9nTdJz2Qpp78TTwhs1xhKohxyAl/4vKTcVye7sG1C7QWA
 Y2o8Pf52HYp2pF1kUXpQg/+/JNKhK73PM8QNIe+if8bFbG61WWKj9zvO+7nEs7fZ1LwKFE19pKE
 i0k64Mk0hAum4oqI1dm3OD
X-Google-Smtp-Source: AGHT+IGCOk09Y1bF6VCwyCJVD5lhweSiuMthrQWNBbh0hXmMZdBsr/UaOlxqs/Sw6ZGmYk/Nwn+aJw==
X-Received: by 2002:a05:6000:188e:b0:3b8:d3ae:26e with SMTP id
 ffacd0b85a97d-3b900b83cefmr3821351f8f.53.1754690833011; 
 Fri, 08 Aug 2025 15:07:13 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac036sm31496080f8f.15.2025.08.08.15.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 15:07:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Sat,  9 Aug 2025 00:07:10 +0200
Message-ID: <20250808220710.4062162-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754690833; x=1755295633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+ZZqcaAOJA0CEx1zuhFQZYHHl4rLQonyC0fYMHjkMBg=;
 b=VQjd9Y/h244b1N7YLSEcCLI6Tu8QVHLm0A07g4aV++1lhoLFu88sAH3A35X+2ZmaFq
 ursjx6h45MA1VOahA6zRz+UyIaEst98JGrD9CEhkK70P2/X6Z/c0NtonQafkfnvAHZI3
 rEIaOXSAeYZDOo7kIab0oHUArp1OSMm3L35LM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VQjd9Y/h
Subject: [Buildroot] [PATCH] linux: add missing hash for linux 6.1.147
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

When building a toolchain with kernel headers 6.1.x, the build fail
due to missing hash for linux-6.1.147.tar.xz

The hash was removed by mistake when bumping kernel 6.{6, 12, 15}.x
series.

Fixes: 51b27bad915c95499877c8bf9a16a221c904bf82

Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.hash b/linux/linux.hash
index dd6febc25c..f5e2d663d1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -3,6 +3,7 @@ sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-
 sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
 sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
 sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
+sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
 sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
