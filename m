Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C971061B0B
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA6540CD4;
	Mon, 30 Mar 2026 15:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sBSgSDbIYAJ; Mon, 30 Mar 2026 15:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D50540CB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774883176;
	bh=UwUeehaBVvQtYZejQ4VX9h8WhEZG8XL9A2FApGFOC30=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OPM4mqTeIXjSfVznbAzx7N1Z3cZ0KPPxb1zEwhEXr0Wlhx3SIO625aNsaR4D83ODN
	 1SDv/3L2yZDhkoRI1DangtNj6BCGygzDUN+pg66rDndEwYfDY+sAjtof6mTT6nRAn9
	 m7PxqwAdNjJBCdCIgMNFeWh+3Ttn29Aoh5Mrvx2OribT+S7wk/ubVZuKAST/OfmCNP
	 TGKFWTb2vevAjoK0xpLPcO/1elaOhtQflrqxrmGHVncZmzfLGqvtFAAtUUINzic+d9
	 gq/2ZocjGbsqRyGMw6wzO7YRyGRz7vostcNDEQSu2MSODLcaUxKa23mza3i3jbKVI8
	 BSlCsL2/cf2UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D50540CB2;
	Mon, 30 Mar 2026 15:06:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD691D3
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 15:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CFB940C9C
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 15:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8pha8NI_zvN for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 15:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D04F240C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D04F240C8D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D04F240C8D
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 15:06:12 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so717052f8f.2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 08:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774883170; x=1775487970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JuU1kvVjwVAnhQaDAc+OnPNMvyFgY3cTdGfcfYXTp3s=;
 b=ZN+xuky8IyvWgqoaAaSpwSVjDOMfJN0fF9a5KTbX8++X7yM7j0rLCfpsWYCSExfFXO
 v9lVpqsoBCOb8qei4iMGVtcBIeM5c4bqCnYiT3dltJHtK8UsQPfrqRjZafNzSintLosZ
 ka9H0AjHFmFMuU+rHFx0Bgxa02J5HrSrqG5GVGtT1OnxIbMBvvuGKOyAPVaB6Tft8XMy
 j64qdjBpa3XurkIKGFZV1e8l5JSSnleVbdEuJhwWeSprkuxDZHq3aCeyKr0B97SzaDrx
 cALYFszBEAlZ03ESKo0UyJvPtE+6l10YQzc0dlbSXjr9ELF/kiU9WiTQbaRdNiZKDU+6
 iRFw==
X-Gm-Message-State: AOJu0Yy8w1kQvROxNfclAwjm1z26MH0K6hLtqh+bAmKXtVW2ax+LPegI
 TjCqo5fAJFb9fKqZbCmBBoZNu0eqwF+H5KtLzBi23yCIoBUSrfXwUMdWTNiXEyMpjQegimHHeLu
 J+hsHmgY=
X-Gm-Gg: ATEYQzws91hRVfKIRKUA7uPkWHQVTsFVuUz6W31snhTkdmpTbHnIRc015p1aA1yM/XC
 GSGRy6blch75F6o+GWPfuCLtGAHHWqQNN30pPv6XrOWnrPkEOmuqTU7If9vtd5LNGCTGO5+1X1L
 aOcHxPCqf2WbWVBP71rqAPxte10O28XnqBtloQXfntlJQVbUT9C+x4OzFtP7Xo6qi9xkoovOOiP
 WBnHHeyI1Vi+iwaT3lAOwW4iaFbxeJTHny+mFOJHzpmunOyNnSQpr+1j973sRBLBidOCptU3kxp
 LtAAy1l/UewSAtiV50rogOExQhUOQd8662R6mww1ACz8VVYKeW7mAlN3xT7JwTyxdV/NqYAlANt
 ac8GNnisVWMLboANGBWEaXrYAjTnGRdz698YVkYkj47YkFUiV6onT9XgoslTU3o08LIj8Dny05u
 uAF1vsg2HE4p36XqxJto3UsYxF3e/0tG5YT4ojEDe3CZKvvs8Mkio4CCzhpcQyGQxzpSoM9n9uY
 FGN
X-Received: by 2002:a05:600c:6612:b0:486:f8e9:add5 with SMTP id
 5b1f17b1804b1-48727f631f4mr217531515e9.19.1774883170098; 
 Mon, 30 Mar 2026 08:06:10 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48730688694sm175716085e9.11.2026.03.30.08.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 08:06:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Mon, 30 Mar 2026 17:06:05 +0200
Message-ID: <20260330150605.300571-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330150605.300571-1-titouan.christophe@mind.be>
References: <20260330150605.300571-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774883170; x=1775487970; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuU1kvVjwVAnhQaDAc+OnPNMvyFgY3cTdGfcfYXTp3s=;
 b=GVUWUTFSorY9VD9wuzfh5uKsj4C5eE9a8+Q6VEkSDI1BUDcsAO9GXB3ICgae2BW5Nn
 OTXnNeHH12T9zeYCD4dSySwjENGJS3ksCkne3OUPBgWERlD+lx2Tup9GpiGRvMrfALkh
 vNz/iw2+P/2atzCugdgsFtgQGQ/AvOvIMnLTIKF4eBBeUOvynNbzvu0DQcUTH/nVpwNw
 SLux93ZOPwYd76VFpEUAkuyUgmR7fR3dD854jLfgOyt2SjCUcPlGlr8/n3vhONeZir0R
 V5vYPGAdN23WhZKUasWnp/jqqBunP2k7nlw+YzPpr+FRiKRYc+rR+2ylWh+EeYbLr9O7
 6dvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GVUWUTFS
Subject: [Buildroot] [PATCH 2/2] package/cpp-httplib: bump to v0.40.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:

- https://github.com/yhirose/cpp-httplib/releases/tag/v0.38.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.39.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.40.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 076b30cfa1..eb2b77bcd8 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  909766cd7697153c9e588b0f96defe1868b7bb11d94b8d4f0c83bb4875bc9066  cpp-httplib-0.37.2.tar.gz
+sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 56e8c27fc4..5cc60565c6 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.37.2
+CPP_HTTPLIB_VERSION = 0.40.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
