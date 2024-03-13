Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A74DC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D5CC41517;
	Wed, 13 Mar 2024 09:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXFi1MYACszI; Wed, 13 Mar 2024 09:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4860240B91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4860240B91;
	Wed, 13 Mar 2024 09:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EB211BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 934218137E
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9aDoanXT3Ze for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE0E781380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0E781380
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE0E781380
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e95b68b3eso2931031f8f.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321268; x=1710926068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ik1z+vTK2GA1mQ0lFwvzB6pqq6t8WaqEgb8FHWsii7Y=;
 b=YWFzblHYaN3eUY62T5y5lPLtdjwiuJAtCuUomWILJQ2oa4ptDXYeE0xcnxOOPy9Fu9
 ZRkJuFWe3L9x8S5ZuNveIe8t2CgmwsqfEYk9LSVZEEAJqmYw+yvyNySZL9KWS0B+kuyR
 n9nreblAE9Q/TIj6CYmgqWVYNpycMl7yjCCzHYaPxKkggcdjMYXdOhGDmtRWY7opTDEu
 aZ8eh7yyrNR/xFEDNI9NH/K+cOX8WNJkk+U4A9PtlmHd3GoTVIlhudPCUCAxRNTXgDtO
 Iy7Z9tZ70yybzpCJ9ie2NVbYsDObwltva6ubbz56Gg1mpZBk0mGIiLCEJ6bnx/m0YrVa
 Lz8A==
X-Gm-Message-State: AOJu0YzttSdJPr/rHxLk/YjravlnfsuxKweYcBrh0JyA6KuxRsnfmuKa
 aaAg2nAi3e34TPIOEZOzIeW4aBleD6pi7De2dMr4sb2rUWag88HGd/TmO+l6CSw=
X-Google-Smtp-Source: AGHT+IFIJfp7vp062RaD0CN051L2TE+saKSaUuVhtCHEEyNkWSE6/oOsuOivnrBETOpx0QDK6o6Efg==
X-Received: by 2002:a05:600c:46cf:b0:412:fcb0:2e0 with SMTP id
 q15-20020a05600c46cf00b00412fcb002e0mr9325197wmo.34.1710321267928; 
 Wed, 13 Mar 2024 02:14:27 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:53 +0100
Message-Id: <20240313091412.20865-12-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321268; x=1710926068; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ik1z+vTK2GA1mQ0lFwvzB6pqq6t8WaqEgb8FHWsii7Y=;
 b=NIwp8QHgpAjBtCdT7cZhLa6DfZ5eczCpFtO9k1LilArUCEUqbnjXHrPlWgwPH0yR/c
 aWeZ+2sve0HlnETKT9rviwQJxUHnfTRg2Gl3NRfwJ7lNanjGVhmR5lTaYr647lnSSdlO
 s7hGzvWG+QfogfRQGAjFsCmxR2bMiBus1KsVk1jFfVS9fUurVZRMcmlQMdQ1tEBirndd
 uihaQRwmjN8Z75bs8JUWJPmfgPVaBfe28r+pcBSK+5NyoAE+RT7itGNWCcWXmP0CgJc5
 D6BEDr/aZDFM9lPfHXu1yn9q5jeI8mJVu/hvH/mdDCGHMBNFDsZWAjt+nZ/G7a4dRKmx
 rF3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NIwp8QHg
Subject: [Buildroot] [PATCH 12/31] package/i2c-tools: disable busybox ic2get, i2cset,
 i2cdump, i2cdetect & i2ctransfer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/i2c-tools/i2c-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 99388d953..e0030ea74 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -65,4 +65,12 @@ define I2C_TOOLS_INSTALL_STAGING_CMDS
 		DESTDIR="$(STAGING_DIR)" PREFIX=/usr -C $(@D) install
 endef
 
+define I2C_TOOLS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_I2CGET)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_I2CSET)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_I2CDUMP)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_I2CDETECT)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_I2CTRANSFER)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
