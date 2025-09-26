Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A90CAC5BC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E2184315;
	Fri, 26 Sep 2025 10:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyYdBC2Rro94; Fri, 26 Sep 2025 10:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AAD84AF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1AAD84AF1;
	Fri, 26 Sep 2025 10:06:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 112BD12D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA1AF40056
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO078rqsBofU for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 159C6400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 159C6400A4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 159C6400A4
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46de78b595dso9939975e9.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881176; x=1759485976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNRuGi58GNoIMqBpurVBcTcDmpmy8Eg/LXKBrCtJMRw=;
 b=ArIYlqZ2XSI19WJfa4AWHUbnLU0SB3mK9h2q88rZoBJ/7ghDADAhcefaM+3b2Qc20z
 LRaW+8dZmoMInVcLJlDNVbbqgK1XRbrLBjPPpKDmWh85lT/v0vXAlaFbu1dv6cu7s5oQ
 Sc9hkOrX0VSO7p/uhmDVOd0frb3C7SzF9gK2xX1MoMWmk6/TGNsZNvO83qCHHAlf6oUH
 VDljafPsrl9QzgXUQVb0NRmpiO/bXu1wdnSM8fQgTJ2VXWaYPHHO+gExJ/CZjtnJ+kEn
 Xrc7F/yLpyTiHW7ndnrOcSv/r+3KkLoYckCLyMpU4J5ht2OQm/VgwRQ4JsAKh9GZ6I77
 5ngA==
X-Gm-Message-State: AOJu0Ywb54eIlA/31kJZ5yzKzLYLVDnPv7w27E6L4Etdnlehcf7NCSp2
 ZChE5jAkpzaQaRSZizVth3i7EIHKDYIrevpUm7tpL5OOKnrDy3oN1Lbb51QDknH/CK8RDKUQGXi
 b9pO9+vc=
X-Gm-Gg: ASbGncvfC5iK3h9bIaQDsL6aUWLNfdKhjrgzy4u4p0v7g4XPqbX5Ty4BBWG9pPziz/M
 H/ospH0nyNkxVldeHsE6f4iIpdXGBf+pbrqnH26uvi2IbqiWkDunMljis1KDaxi0l8SAwGT4aFz
 RAt44m+99UD4fn28k1RVhmHd3k2cPgJdctWm7JpS3S0g/OeCcEO3m2xrAUB+cPYdanUsdkNCBN0
 NsNJuip9l0cydd6mxrrPMqoFcgVz9z9OvI5qgo3gqx/mjqHJNQMQ245U4MyEbB7MgFF94n3MU40
 ugGNwzn0yk9+1C87xfQ2wtH4PhJBZ7un+aHytmcfP2ax2EsQPoeaxXhx5mV4RYag0XTvSD4kKwj
 ghHPrUXpSwUuha8KpvsMxHSuffVRdbZxlQnv3OffXTNodiKv3FSRiYLzJ4OJWywA=
X-Google-Smtp-Source: AGHT+IHb0HSEYgsTqoZxdw6SW0z3Tr2OKmlQe/wo10HMh/UvwUhgyRWPg2srNIkEEA1Kv/rYOfZEdQ==
X-Received: by 2002:a05:600c:19d0:b0:46e:2cfe:971c with SMTP id
 5b1f17b1804b1-46e3292291cmr58237035e9.0.1758881175775; 
 Fri, 26 Sep 2025 03:06:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm112622825e9.21.2025.09.26.03.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:06:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Christian Stewart <christian@aperture.us>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 12:06:07 +0200
Message-ID: <20250926100609.4158676-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758881176; x=1759485976;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNRuGi58GNoIMqBpurVBcTcDmpmy8Eg/LXKBrCtJMRw=;
 b=lbUfebnImwiyKQDC7dnkcxxGjmhdbWOqjGouYm96Q3HtykAYgn/sA+ZAVv06AhCXFG
 RiZPq2p8rjDJpsYK+fRi8E9msZqGIpucGVWJYsUN2bGLXc/G5v/EZ4/UIqF9Uvwk+LqW
 EvUQONRiOy45Rn5cxO3O6hOmG539e22Op3Lg8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lbUfebnI
Subject: [Buildroot] [PATCH 4/6] package/libesmtp: fix LIBESMTP_VERSION
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

Make LIBESMTP_VERSION compliant with release-monitoring.org.

Fixes: 84077c777658d834ba8bb67582707f24d73cb914
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libesmtp/libesmtp.hash | 2 +-
 package/libesmtp/libesmtp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
index e13616d8f843..2a08a8d8bff7 100644
--- a/package/libesmtp/libesmtp.hash
+++ b/package/libesmtp/libesmtp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  144aece0077db6a2bd655d3d9558c714c9defd30a2d52c6e85ed54457d712daf  libesmtp-v1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f.tar.gz
+sha256  144aece0077db6a2bd655d3d9558c714c9defd30a2d52c6e85ed54457d712daf  libesmtp-1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING.GPL
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 5e0b65ce9195..33893a3ccb34 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBESMTP_VERSION = v1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
-LIBESMTP_SITE = $(call github,libesmtp,libESMTP,$(LIBESMTP_VERSION))
+LIBESMTP_VERSION = 1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
+LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
