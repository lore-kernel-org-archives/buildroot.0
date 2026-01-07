Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D060D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0243D409EA;
	Wed,  7 Jan 2026 17:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-rj4fmOYffg; Wed,  7 Jan 2026 17:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1542640DC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808222;
	bh=tG06//BkCSR9HYcGYmUcOYw3+yoG8YhNngNwpWbSIrE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g8HK8Yqx+JSOl49fu1P/xarbl7MeOS4MJY7mTxVOjw7ZqLYtJ/+6ypSQaV6xtH+fM
	 yBI1ObvKN8163nswO5ykwRVCA18j+/hCvjnu1YdcTK4r4dUfRC304qvX9rqELDY+BO
	 /d4bpBNMf2QrKFhYkBtmUSOeb9HRO30eb+lfg8HHQDF37SFz6phWKJeBT45kHvT73e
	 n1Dq4pPdaP0qWKoKQEK/CmFgc/NozhsPe2GJdLfAuVePxaEmfL5rz0+Dxx5Qas/kM9
	 HS7XO4nUVdvtXpe9Z6tuEdjNCz8YBO860UovM9PNPYK/u07Nq1Bvgn36lMHl95a19v
	 bJTule0LG7m3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1542640DC9;
	Wed,  7 Jan 2026 17:50:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A2419ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A7CE82358
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4edr6B6uIooJ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3463282350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3463282350
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3463282350
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 27418B97A596; Wed,  7 Jan 2026 18:50:17 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:15 +0100
Message-ID: <20260107175015.226145-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-12-bernd@kuhls.net>
References: <20251221223441.185169-12-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808217; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=KpmAFA5ViD3qMdWdonIT6qFZ5d0lkWCZ9aIYuU9Z4io=;
 b=WNxK3vdQmpVhHM+Ksm73ms+57SMJ/F01MF0s/XV4e1tDZeOnFWK3pvxNTCZ7EvfEoNKLCc
 u3tkZBJsff24gaZ8MoFSE0DwEIr7tyELUhPXcRgJ5u9RR93VPZ/Ddc1A+WvDbPXx3c/mco
 wOIlPG7ca7N1dhSk1WFDlqzKDnuntlBSSZR220FdSba6C9LImNFFLpGRVk8Nv6Mqcb4z20
 8unI1Jumpw83Hvhl1iWVqf+mBHyEAP7d9NuOKzGv3FgAnDvLd1URUYzz3f+ernwnzIIwTk
 Nr9z6w1Y5TodJyBiloA7Zn3GEjvHt/DBSwufLVPTfPoSg4cyKFPRaMsXygDNDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WNxK3vdQ
Subject: Re: [Buildroot] [PATCH v2 12/23]
 package/python-json-schema-validator: update tarball URL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .../python-json-schema-validator.mk                             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
> index c0a335cbd7..017d5a3ec5 100644
> --- a/package/python-json-schema-validator/python-json-schema-validator.mk
> +++ b/package/python-json-schema-validator/python-json-schema-validator.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.4.1
>  PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
> -PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
> +PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://files.pythonhosted.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
>  PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
>  PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
>  PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = host-python-versiontools
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
