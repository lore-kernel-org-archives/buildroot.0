Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66D8C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 08:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6629F4177A;
	Tue,  7 Nov 2023 08:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6629F4177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZg9tKX1RLX1; Tue,  7 Nov 2023 08:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52FE741778;
	Tue,  7 Nov 2023 08:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FE741778
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D80431BF2FD
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB21141778
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 08:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB21141778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gX427aa_jtpZ for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 08:06:29 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FE79408C5
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 08:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FE79408C5
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-9e28724ac88so29688966b.2
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 00:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699344387; x=1699949187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4VsPn5NOis2AMDHsxng5cETwGWhqMTWhas38K3ki+8=;
 b=jQ8UDNGHQPErqZ6VsU/XQ93CQFPJCqjcbNb2Xoa2zMVX3Up5lbWvcWc4opSChhVUTg
 fa85IEVOpwNqesXw+UXfBCDBKFyCycwE58TkKoZmyFng8aSdJrbLm7fk39Ixsne1znzc
 qcv6S0nBuqFhE3ygmtrrzeg2ZeTsTUpTYkWYlz6GL1WP+JgcweeyPhbJnGtMg38kWto5
 xft6QdYuhdFZ9Rt9hbVknPu40VxjSp4uTV5oAJykb/k4RcEAv34EA7NykU/TFbTVajqe
 TH70Sj3GnNpz3/Ys6nLp3TWt9J81KTWsul73BD/ZQSFhzcJbG0Tm06VCd5LXG4S0P/k1
 KtTg==
X-Gm-Message-State: AOJu0YzQRp/m3eBhUA71218/meq470Uv8YwGX5ZRzJcf8Mc0YtbTziXZ
 jKE1uQRESaXVndsjMlhs9D4Egme7TubahORTYV7l7d1w
X-Google-Smtp-Source: AGHT+IFIhxZFNaO9FZFaaARYFC+bbXbwnxDB874aAimilYDbcDDeM0aETOYP46AaidJDxG4S6aO6pg==
X-Received: by 2002:a17:906:da8a:b0:9ae:46c7:90fe with SMTP id
 xh10-20020a170906da8a00b009ae46c790femr17198770ejb.72.1699344386979; 
 Tue, 07 Nov 2023 00:06:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a1709063a8600b00988e953a586sm736301ejd.61.2023.11.07.00.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 00:06:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 09:06:13 +0100
Message-ID: <20231107080613.1845006-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699344387; x=1699949187;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V4VsPn5NOis2AMDHsxng5cETwGWhqMTWhas38K3ki+8=;
 b=O9pNz2HgKSEX7zCvA2HdEpB5oQXY4Z5EUAdqYPRGNw0b9ZlJQckY3pozEsKfqFlEus
 7PYonwZkW5k8mckyCEBVN2EeqfCDahQoyZah3l9pFH0llBxraKN2/sWmk9FvfxF1hjNs
 pbmTaXtNFRioUkWdWx0vszCDd4g3gyi1tARMo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O9pNz2Hg
Subject: [Buildroot] [PATCH v2 1/1] package/uuu: bump to version 1.5.139
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.139

The changes to README.md are not related to license modifications.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
 - drop host-zlib from the dependencies.

package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 574cb48a3c28..2d7a8dc7602a 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  085d7f6308ee6b77dfb131fac40704575525adf6da45cdc446c00a0b29e4c21a  uuu_source-uuu_1.5.125.tar.gz
+sha256  16eea2446160976e20d2f20257cecf7490979431f17971af374e81bba8d5fa98  uuu_source-uuu_1.5.139.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  52a715c7443f269ddeba360abd70694879e120213926553a000e9be9373ea731  README.md
+sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 5f3271066f81..218001cde4e5 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.125
+UUU_VERSION = 1.5.139
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
