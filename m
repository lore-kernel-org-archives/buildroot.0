Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9086FC2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521898131E;
	Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqSAtDt7P6dX; Fri,  7 Aug 2026 12:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542A781316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107322;
	bh=iuJQU3l3I0Q8IQMaUzrUPlrwhcQrAcYTNm785ew5Ta0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1ndh4egWklSmfVIqejnBaHb4EYxwfEwUfr0ZHWFhSEsw7NTCzdwqpCAwYas8vHde
	 aOLQLl/8xB0k1RcaoTlrnp/c0vDHG3Vc7EAsKeUVB3Qzga5+SysF5gt322xD956ds3
	 IsDg3sBAcaY+m5bhC/Sv/w/L0da/5Yilycntv+lcSpsrQTNOkIOwSpVPZgHiTERY+H
	 tjnLIdYT9JwdmpvHJcRi4wWvxRu8H5HnuwuQNXyjlitBKZLnpBUIFJEQZPEVemsUKn
	 X1lL/A59NHJ9JLRsEyMNIWOWtXB2UGYP75N2BFqLO/wUmNa17O0iNaael6dCVnvrla
	 n0qTacdh1wCOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 542A781316;
	Fri,  7 Aug 2026 12:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D86D8D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAA614040A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVQNth88omdy for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACFCF400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFCF400FE
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACFCF400FE
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c160875e029so39291566b.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107316; x=1786712116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eeBqnciPps0e2OsnDo/0lJiPEobeBKhGvA0dc+YrHVg=;
 b=L2qSot/i0QdqIuEZbb0gOwbaITXRwiIThal26Riu2HMe4jssl6lfcvvMGWNz0TFBvj
 m7gPD7y2V7ruDb0hJK4WsKhU3pndJEWKqIlMMOPFHCIXiqiU/Fv6PDJ52JmoYRQ7GXOC
 fchohtEACx+GSRrSKQ0PFO/TwWUshBRnO2acZuhilUPQv7RHiV9RNdi5bMW05nN3tvba
 v9lngIi1FMgqdgodBMfVs3XwB7wmoaxHMDktSO1HJfe0jMW85dxP7MyTUVCOlQFdQpIQ
 rcLndxuRSWB51dEBdVlx+boKI9WJSQhoIfEILVrnAusfxMO4rC+t68mTlxNo5TGGwjMw
 X5Ng==
X-Gm-Message-State: AOJu0Yxmtwmz2LjiTn44Ta7F5RaJxmOX/HfnxVXIu4UzKY/h/Y97F+SP
 aF9yjOiypVG/1reu7R84YrWBH+oZPxiGrc4hQZZt7NQA0WF0uYk6OOZoSKSdHlGdmMKXqd6r8pl
 pLJIHY5I=
X-Gm-Gg: AR+sD12ypVmEOZU774/EoTFMMiWwUMes+JBfKkQfW41EJBAljiqrTyWqXBSLPT7whoe
 ZlPgZdespazPz4suFF3WW2eMcfHj709Vjd3aSp9638TL8J6YaPlIidfUNPgStIEoy2FxRln5vuS
 JYeytS+lgp+Vlz9nFT91L1JavJ0PR1r3sJg3P1fzw/jey+tL3zOMueD+x5sDzNbcfwSEOB9japH
 Ab0X2TU+i8NI9GWGhPxoKjRpTPnAOphGHDD0ROCFXa1Se+9eU0xR0qlx4o1T46DqKG8EHmcXrLA
 nv4E2Zd9FhGeJjgN48IZPjk82Lc9UyDc50wH0IoFdHs05iuqmEDTSkUrZ9HQYmrNQKAARjRoIAE
 hAl8WA2O9gxbswfxNQ1PA1qpUCA6nDCB8+CM6ppGCmfPgjXnuhtIwdmsd8aW2KoH9F5gIBbsneb
 jOmu2y+SmfGyqHEA5IbFoCZFRJWFyOfgVT2cj+RCLT9xAsdvXXrPxNl/5vzmDUeWZs3sKfq+v8V
 doFNOKfvJRh+sNuQNkVY5uSHbirVRFaqGQv7/JF3LgutyQco35Z6BZ6DR4kvfHP8II9Vig9GMPj
 c6xxR8k8OQwSi6PF/yAR4AytXSrhPxH/O2/ImyGJZEXOaWxJ1o9Box35X5gTIRe+DgGLuS5Ckdz
 Q
X-Received: by 2002:a17:907:944b:b0:c1f:e0fd:1140 with SMTP id
 a640c23a62f3a-c20397ff9famr630267266b.0.1786107315549; 
 Fri, 07 Aug 2026 05:55:15 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:03 +0200
Message-ID: <20260807125510.1285300-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107316; x=1786712116;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eeBqnciPps0e2OsnDo/0lJiPEobeBKhGvA0dc+YrHVg=;
 b=OrZnT4bIK//XZ0fdufvLvZVOtc6oVkS9QI+qgzCeUg5ZMyD4X3fpDkLBCZ9WDeo9TX
 FbhNlt+Xi/M2ezaAXFjyCDGTqBR0tyDy4mc3C5hjCCSczgaXFxAE+dQ2Hn2kEmtJKMKx
 YZ1SCmCgTgaGlPORMnskSED1bB5QiqrPOFxNY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OrZnT4bI
Subject: [Buildroot] [PATCH 04/11] package/mender-update-modules: add banner
 module
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/Config.in              | 12 ++++++++++++
 .../mender-update-modules/mender-update-modules.mk   |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 88e0805976..6ba6f82615 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -16,6 +16,18 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES
 
 if BR2_PACKAGE_MENDER_UPDATE_MODULES
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER
+	bool "banner"
+	help
+	  The Banner Update Module manages the system's message of
+	  the day (MOTD) displayed when users log in via SSH or
+	  console. It uses metadata-driven updates to change the
+	  banner text without requiring any file payload, supports
+	  rollback functionality, and operates without requiring
+	  system reboots.
+
+	  https://github.com/aduskett/mender-update-modules/tree/master/banner
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
 	bool "DFU"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index d18b5111ae..1db47cbd15 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -12,6 +12,10 @@ MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
 
 MENDER_UPDATE_MODULES_MODULES = script
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER),y)
+MENDER_UPDATE_MODULES_MODULES += banner
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
 MENDER_UPDATE_MODULES_MODULES += dfu
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
