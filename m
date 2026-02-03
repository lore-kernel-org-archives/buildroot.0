Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5640CE87841
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18B6440D39;
	Tue,  3 Feb 2026 15:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSvb4yMsgBqh; Tue,  3 Feb 2026 15:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D080A40C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133009;
	bh=0oV8Ao893aMy6lpFtUFow7fOwwks9+NOfkGFpD/r3Gk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ifbteGuPjoTx6OLpk6pWkwSaXRQLjNJG6oxref1lggfiYJbdZCP8H9SYCFNwxTtXB
	 EYDVxj/v41GFBNNHrUpD8xDHbgOlqqPY8rCwglwFiw8DHcObQGA6iBonx8NsJxiltX
	 WJWW0na8n0gFoZm1k6vUuX6hvjphL/EYvx4nquJtm0ol9ICL9tzTSvfWlgWB16TKGK
	 iatTMIlNBzjv2B9Ta5pWaPsSCJvwB9p92SHi8vzkDeh2pjbsLuk8P9SkkPanduewQX
	 NwnNW0zyZ3zxt41OFJZSJNSx7NUYu2dj2WNLeQp9yWz+bMabRTyp8egVY5WcnzAGJB
	 1MclvmXLcE8sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D080A40C91;
	Tue,  3 Feb 2026 15:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4224313D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 313A060870
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AX3EMALX1eBZ for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 105D16086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105D16086F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 105D16086F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so44654465e9.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133005; x=1770737805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zS+fg+p9NmMLgExRUh97yRO5t9NkY535ZY3o7S6dUoM=;
 b=ZkQy6wAi57s+zfv0zFG+O1bIwM1WsDty0de8e4lT4Z0EJ75Wp27iTK8o0rTBLd7QUq
 pD/rNvZCQkbszwYnU4NN18t7a9mZMW3Sy7JqwJRdtZVmkj/HHN7DuSsC119TnFN/ujwU
 iQNKs+BPcnhoe6lnw0KBC1Q5UaTA59FPPI0cSONOYrZxmr3uDdFZmp29gfUe1I5Kl7XH
 Juxxof8jIlrhwoXezPzeNmpu6deuoNy2BuuStFWLT4Y0BAj1bnBzPdvyr6ezuwO3wPlf
 uCnMJeQNjZJJ9/xar1MWG4ryg6hK1uy2ua6Dv+hHaWWj2NvznJIWpaLGSuB/QOc7mDU7
 mnGg==
X-Gm-Message-State: AOJu0YzBMF/pdE7UNuoaENTQTP8Wdw8nclWJxhFZahctn4BEBobz3Y0j
 CuZWqcAKhqaEI/rkm5ZUk659RcDgR4nuLraYLb6EnrhUGDVyq4MA0mJDDRpDYjyX
X-Gm-Gg: AZuq6aLyc9gbGevXf8TGHN255vtm291KuZph/4jSEMYZdK7Lzmu1LPCF/U9E7fkqWAa
 oyWOdwNi4pRRbUR7Em0edMelq16XsMpuqDnbo1r+WKFgf7YTQs6nXhNgshVxWXXZCvHGNNiRD5P
 qJ6a9Q7XYEwCmvA5b/YudjcfIFQ7jHdTqWgvBeF0OcaGWIGGW5zL/Dj5eM3OY+hBdPdwsad1OMr
 kSS3iu+DgPq+bSbTpdGL56TGaecTT+LNZUy8s1ewlf91uft0DI5ofa3iXeaA9G9/OsZyl90PXK0
 peIJyyjCN9jVj4NRerFk+TYgNvZRFNkeNWFtjJ94DWxfVx1ylvNjPvKKzfYpLy20hNLAPmUR8mh
 lJUpJFUfuTsj3L4raOo4VCKSg0tTjjALAXnEaHGBKUOOar9GFBWIHojqFSL6BLKBciRWeMrhQWw
 L26GmdKWy4nma8fV3PkgMm7HjsM5miEyQaQKCFrQ==
X-Received: by 2002:a05:600c:3e1b:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-4830e99175fmr346645e9.31.1770133004786; 
 Tue, 03 Feb 2026 07:36:44 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:44 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:14 -0800
Message-ID: <20260203153617.80012-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133005; x=1770737805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zS+fg+p9NmMLgExRUh97yRO5t9NkY535ZY3o7S6dUoM=;
 b=bgIty49l8Kz/WqQt2kqgVnGD98Rzr7uRIQ98PMZ0lRuR3R8NRKrzJRJop7nKQk6vwF
 dK7l05s+gT9mwfG269ojMbPWR4AFyPAcPdkb/x0D65Jq3vxBRN/fLTTAtnwqGClW2ugV
 7XUCqTBiTEg3hBKtgiZfi8Z68ONoSKWfEY5ysuDa9A1Kmf7g5gZSvp4O4lE9+cAqSPyp
 q5w1sTrq27z5Mvc+Y8S0AvkDx59HM25Hl07hbWvXyUL5/Gwvn4baDQlD3f9tZcYgTQ/H
 0XBPlHhWYKExBXRUSnVyNZdfihQO8FtOGIpXTnFa3nwaPHhmtWkJUauFJiJNEiKuTLuh
 BVmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bgIty49l
Subject: [Buildroot] [PATCH 07/10] package/freescale-imx/firmware-imx:
 support i.MX95's LPDDR4x FW
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DDR FW for the i.MX95 SoC requires a different handling as opposed
to other SoCs. For now, only introduce support for LPDDR4x.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 package/freescale-imx/firmware-imx/Config.in  | 13 ++++++-
 .../firmware-imx/firmware-imx.mk              | 39 +++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0acc235e0a..43c74e8bbe 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -57,12 +57,18 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX95
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
-if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
+if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
+	BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 || \
+	BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX95
 
 choice
 	bool "DDR training binaries"
@@ -72,6 +78,11 @@ choice
 	  kind of memory that is available on the target board (DDR4,
 	  LPDDR4, etc...).
 
+config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4X
+	bool "lpddr4x"
+	help
+	  Use LPDDR4x binaries.
+
 config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
 	bool "lpddr4"
 	help
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index f8c9df1cce..9682633ac3 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -46,6 +46,45 @@ ifneq ($(FIRMWARE_IMX_DDR_VERSION),)
 FIRMWARE_IMX_DDR_VERSION_SUFFIX = _$(FIRMWARE_IMX_DDR_VERSION)
 endif
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX95),y)
+FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+
+define FIRMWARE_IMX_GENERATE_DDR_HDR
+	wc -c $(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1)).bin | \
+	awk '{printf "%.8x", $$1}' | \
+	sed -e 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/' | \
+	xxd -r -p >  $(BINARIES_DIR)/$(strip $(3)).bin
+
+	wc -c $(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2)).bin | \
+	awk '{printf "%.8x", $$1}' | \
+	sed -e 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/' | \
+	xxd -r -p >>  $(BINARIES_DIR)/$(strip $(3)).bin
+endef
+
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
+	$(call FIRMWARE_IMX_GENERATE_DDR_HDR, \
+		lpddr4x_imem_v202409,
+		lpddr4x_dmem_v202409,
+		fw-header)
+
+	$(call FIRMWARE_IMX_GENERATE_DDR_HDR, \
+		lpddr4x_imem_qb_v202409,
+		lpddr4x_dmem_qb_v202409,
+		fw-header-qb)
+
+	cat $(BINARIES_DIR)/fw-header.bin \
+	$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4x_imem_v202409.bin \
+	$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4x_dmem_v202409.bin \
+	$(BINARIES_DIR)/fw-header-qb.bin \
+	$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4x_imem_qb_v202409.bin \
+	$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4x_dmem_qb_v202409.bin > $(BINARIES_DIR)/ddr_fw.bin
+
+	rm -f $(BINARIES_DIR)/fw-header.bin
+	rm -f $(BINARIES_DIR)/fw-header-qb.bin
+endef
+
+endif
+
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
