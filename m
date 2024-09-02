Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF78FCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E054031E;
	Mon,  2 Sep 2024 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbeMShccYLsZ; Mon,  2 Sep 2024 21:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE2194025A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE2194025A;
	Mon,  2 Sep 2024 21:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAF3B1BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 21:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A66DA80E60
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 21:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9354K1tSfGz for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 21:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADC1780E56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC1780E56
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADC1780E56
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 21:01:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so38572855e9.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725310860; x=1725915660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ThWht5zYD4n4PqkTIkHqQfXj5TzyBO6zFtxdnmTzdbE=;
 b=oGP/41akuu09rwokB+odlzvpUMb1r74AUZ6izbrV+r9xjXJOUxqJFjg7XzNR+I0Cq7
 FLI0KUoCBn39aBxXoW8lVcSCXE1SaAzXAZHeSRE+IPlpJ2uRZpeAh5UlfC7UPokVq9ZR
 NpNBzttiFPJRgIj+pHEdb+wtRSZgqBrMKIt0at+IePblif6pLGw1SInadI/qs7wJ7RBl
 YoqInIy4E+O/dcifib+eDMpOm0EZ9sIX+QpPDR+oqtJ65hdCwJbEBvTW1PIb3CVTu0sX
 kD6doU22W/5UicEKM+7+kD9fBymjwe0LWFBVSfC+1WTUKACT0NQgLv0gfGCgrxHjatD6
 HMEg==
X-Gm-Message-State: AOJu0YxqMtrvVgd6ZKgixeM64a1OkysZNF6lcA9ApcTGTYP/GbFkjPU7
 d91TmE59gE+TT16E3cYUNWQqve3AxoRvnuxXg4q8GO3nBoJSNfQ6Q/r3UBBmmyniszHgR5/3+lG
 xtfY=
X-Google-Smtp-Source: AGHT+IFC231mJAEE3TA74DzsQPj/IgNS8KZJGr45VMsYKxhXibsAY8GNl9DOPxHIybqRVN2q6lW5XQ==
X-Received: by 2002:adf:b350:0:b0:368:3751:de3 with SMTP id
 ffacd0b85a97d-374bf16c0d7mr4918710f8f.31.1725310860187; 
 Mon, 02 Sep 2024 14:01:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4c83fsm12426246f8f.22.2024.09.02.14.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 14:00:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 23:00:55 +0200
Message-ID: <20240902210055.239859-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725310860; x=1725915660;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ThWht5zYD4n4PqkTIkHqQfXj5TzyBO6zFtxdnmTzdbE=;
 b=BOJKvhXKzUdzO3TTu3xjQFFvRa5Ht4VIPVcYQds9WZ0i9sw0nPnreLFziOdJh/BOm5
 G1slgC3RWoMET26bR4XNEHkToK9YLJvJMz4dQafs5TckX3xW8Kl2jzHFGgcKtjaIQ2at
 uSHXpwYeBco8xUuGJvCVPqmcRvlfGg5Wi0y0g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BOJKvhXK
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: only accept local PEN
 registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The https://www.iana.org/assignments/enterprise-numbers.txt is not a
versioned URL, and that file is regularly updated, so it is not
acceptable to change its hash each time.

Following Yann's suggestions [1], only local files are now accepted,
removing the need to download the PEN registry and consequently verify
the hash's correctness.

Fixes:
- http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20240824103634.1955431-1-dario.binacchi@amarulasolutions.com/
Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ipmitool/Config.in   | 12 ++++++------
 package/ipmitool/ipmitool.mk | 13 +++++--------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 9516ff8596d3..fefa8c34fd7f 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -9,14 +9,14 @@ config BR2_PACKAGE_IPMITOOL
 
 if BR2_PACKAGE_IPMITOOL
 
-config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
-	string "IANA PEN registry URL or path"
-	default "https://www.iana.org/assignments/enterprise-numbers.txt"
+config BR2_PACKAGE_IPMITOOL_PEN_REG_PATH
+	string "PEN registry path"
+	default ""
 	help
-	  Enter an URL or a file path to the PEN registry to use.
+	  Enter file path to the PEN registry to use.
 
-	  Note that the official registry is 4MiB+ and may change any
-	  time and is thus not guaranteed to be reproducible.
+	  The official registry (4MiB+) can be downloaded from:
+	  https://www.iana.org/assignments/enterprise-numbers.txt
 
 	  Leave empty to not use a registry; vendor IDs will be
 	  displayed instead of the corresponding names.
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 4f2151904d43..40bc8bb9dd13 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -49,20 +49,17 @@ endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
 endif
 
-IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
-ifneq ($(IPMITOOL_PEN_REG_URI),)
-ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
-IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
-BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
-IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
+IPMITOOL_PEN_REG = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_PATH))
+ifneq ($(IPMITOOL_PEN_REG),)
+ifneq ($(findstring ://,$(IPMITOOL_PEN_REG)),)
+$(error "URL paths are no supported")
 else
-IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
 endif #findstring
 define IPMITOOL_INSTALL_PEN_REG
 	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
 		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
 endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
-endif # IPMITOOL_PEN_REG_URI !empty
+endif # IPMITOOL_PEN_REG !empty
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
