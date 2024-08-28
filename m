Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D452C54FA7
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561CF40BB2;
	Wed, 28 Aug 2024 12:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8w4rgKZk1yc5; Wed, 28 Aug 2024 12:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9780D40B9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9780D40B9C;
	Wed, 28 Aug 2024 12:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C06411BF83A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC50F40621
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMFGKlZ6wOXe for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D9BE4061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9BE4061B
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D9BE4061B
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:31:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5beccb39961so1093682a12.3
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 05:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724848282; x=1725453082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/Zz8b7nslL3d7iXuxT7yLXDFxaOcDcpI2kv6gmH3eA=;
 b=dotUONSo8CzoSfu9Htau2+PemUF/h3KaDhCxfdNzYAL0Bebbn/vOgbHj2m+oMuv6Ct
 UnYhGGV9pHqCJoEJUQCOSp12a3GM2LduLJbqsc9b/2mAz3BMEBYW1tL85DNSabPgqIJu
 NuCbldJMYtNlDPjWzI3a2vQqNoJ0ko0h1eWMFaSzz6Hg3c2xmfsk5d09UWmwhZ/ChJRc
 10wsdl+eJTElKx+57bDh7ewaEUeDOyvrcakmkgJSHR+cZA0m5eRvw4+JTu48Khh8E8mD
 eDgAmB25LCc/Hz8bidRMWBIC2PzvM7/EmsmCSIIPREcWmwPIvMIdC9J1irvSPE1Nwmkn
 aJgA==
X-Gm-Message-State: AOJu0Yz5h+4+ympjY/L5q7m4+r5QmDk98SOlTYHPOTTN8Yl+GYI97xWY
 AMmw6PR7pnenisR6unxBYdw5w/QlqmZdVoOc9h+mVY2nPVpNH33CnLbiK/IoA3Inl7NowbHq4vF
 YVuh5Iw==
X-Google-Smtp-Source: AGHT+IHrBJOA+bQqbONruZ+uTh+D4SLOsOItIz/22xPSihN14rNXM+tkW/ExA1coi+B0JfNcHdGMsA==
X-Received: by 2002:a17:907:7f2a:b0:a83:a86a:549a with SMTP id
 a640c23a62f3a-a86a5185ae4mr721633766b.1.1724848281534; 
 Wed, 28 Aug 2024 05:31:21 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-f0d0-88f0-0971-2ba5.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:f0d0:88f0:971:2ba5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54a014csm244011066b.90.2024.08.28.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:31:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 14:31:16 +0200
Message-ID: <20240828123118.62315-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
References: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724848282; x=1725453082;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/Zz8b7nslL3d7iXuxT7yLXDFxaOcDcpI2kv6gmH3eA=;
 b=B37SGlMQkKp+std5YU5WlAYVncOhjbi0rcCXlX6ctE5Fue7mxH04RIxgUPrv/jYCj5
 g+W+aHKl0SgrXhbB1wohtDR4EUOCUqP5CxZgOIQgagDzujGWW8rem+7Ny1dwydOnjcFq
 HN5ZPQERSu6fjT2uyEMXnVZREbCjQ1faR6nqQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=B37SGlMQ
Subject: [Buildroot] [PATCH 2/4] package/flutter-sdk-bin: bump version to
 3.24.1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 4f3622e725..65f2df2453 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d52a5d12f17d8bcf868d1ccc01fe0f7ffb05b53d9628aa21b07a18f9d33621f2  flutter_linux_3.24.0-stable.tar.xz
+sha256  32daf9d5a8e430f57fb139921400c7ecf34e4e7e404818ac55658a5a0eaa28f0  flutter_linux_3.24.1-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 26415551bc..003ad8b4b0 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.24.0
+FLUTTER_SDK_BIN_VERSION = 3.24.1
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
