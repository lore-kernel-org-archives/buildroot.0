Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8447CCDB466
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 510C84EC98;
	Sat, 20 Jun 2026 09:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMpUVVS_tmDc; Sat, 20 Jun 2026 09:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2084EC94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781947716;
	bh=IEqFVcFLVjr5OiJxW6nd2fA2MUBVYRLBReVgRkCrcrA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cvCGGcj13DY0V7B7Wgz5mtAfKBaSsFF/9S0RAohzj7aya3/rsg2avH+AOnYyGCOjz
	 y6D3EP4zX2egKO7Rf85lx+fnBCP/JthxxuVtNBDWpZvhX/uQvQpfQzJlGGsSPrYTHa
	 8ds3OemWrfjBkwevVPUp41iOCKJtZOr0L9UIjc8MdaRk0tlxi+iB2sHooiv5N05fE/
	 IfZri3C88QhDIZCF/TFJuXcMwHv3QZ1hH+vvYQLUPVmQt1VvgZ8AaPRpA9cCz49D2J
	 AiB3j3pJ6VxzRRMZ1ppCUg4OF5Sj36bK3AuPFVs3siS9TyzZGWyjI0GgV4bQ1kCUi6
	 UYP4kCR4f42sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2084EC94;
	Sat, 20 Jun 2026 09:28:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFCAD06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83E54401EF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFsbQcb5u0Pd for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E26140154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E26140154
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E26140154
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:28:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49230a567a9so13662215e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781947711; x=1782552511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n++7ahT2vZ6GwUCFgsRxnzLxAUcTxDRt6H3izIhyja0=;
 b=YXucy34Dh7Q5L2DQLLZmrNODeRAwCVqSeVlDLiuGc3LMjvfFYfCnfXbl53h7d350sl
 mkVvH6ibtFhq89ZcjFDPvaByHFMpqKiipV1tOjeU6MVjbil4+rYJwoKHHj3oUhd5p9E+
 6R4UkcKYlwos6UI2/X2byMQXiG5c5JmXS8wOanW7FF4xzXXVYQEXPql7164F+v7zC6t9
 QFmVChN4OWsaTmeDWXXxL/gnib3krEdO4q9LNLt4CzahuOLFAOCcyEYOG/aHOOHSyca2
 aWiLWnE74Abyhrdfrp4DRKW4MVjpLw3CyzPB6Xbw/5zmT3aZ9ORtMD0h4Xj7YcO0Oksa
 C46A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bHQcwXytsXHBG7jVGEvy+DUpr38O1xI5k5l9uHd2mQA0uDpPjSysrYcLP3oqiDJqZrGTiqaZSmj0=@buildroot.org
X-Gm-Message-State: AOJu0YwN2zGaoSbeR3iNJqetjaEWDmDh0Kya4OVnHm0FmqVdjgGMSksK
 630F2Ok93bXfNCR4ifsPfwNhL0DuO8MSYfUGB1pn2F6n7som3tZhOFMkYGCvDCTPcGqw6pTLCUE
 F6zvV
X-Gm-Gg: AfdE7ck1rk0WZEIrE01MZYrx8rbaKe/ZQZZkWR8rUQGO+OcQaW5HitOCxeZmT3zdDTp
 uwMRS6exP0AJ/SE/wro+JkVPFjadYlT6q20Pgdz5p/0nJPiaikz1OXakvDbFWeGUUGtfCcqE+g3
 hK01rRV7nn+4Bq7gr4JHPXhrk+jRKAAttDTQ/nwpDC2xEM9mS6esZ16f4VgRjUy7zK2e72p8QPP
 y9EZEQU3zWQfT/wbal1NyXrMjSIjdIWdd0mykrg5Rp41MbBnaGh+8cYWMqP/cWw0sCdeTbXgEcU
 ztOhLCuENBdnlCxTMp4pR04uIeraxgY32WE0+zi+QMIQNNmWxOwbuPrEmpt4bB4Niyht2wxqU86
 f2MktESwKoNCWMb9SmCo5ISrVxq/YPk1B2/DkvTxMGU0twfdmerEIYzGfPazUsD43CqmcLOY53y
 TXEX/r
X-Received: by 2002:a05:600c:8716:b0:490:c032:ae92 with SMTP id
 5b1f17b1804b1-49240ea870emr104820975e9.33.1781947710940; 
 Sat, 20 Jun 2026 02:28:30 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923ff8a9e3sm140050705e9.14.2026.06.20.02.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:28:30 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Joris Lijssens <joris.lijssens@gmail.com>
Date: Sat, 20 Jun 2026 11:28:30 +0200
Message-ID: <20260620092830.24422-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620062539.28289-1-bernd@kuhls.net>
References: <20260620062539.28289-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781947711; x=1782552511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n++7ahT2vZ6GwUCFgsRxnzLxAUcTxDRt6H3izIhyja0=;
 b=DFS44qZ7Z6buCr4aU/TV/ReQ+wLSH5uCNv24/2MW5nJOsOnEWiknEnt6qV8pcLT+cM
 MqXtALg1ka+iNqvXRE4aEeOFE1QkVy6HQolH4G2mcgno9Upmq5z+ywJkcr/he/GcHI7K
 0w3luCgotPKI8I2LT6A70IARTZ37B1NItoUUNmBB1kp0HyungRKJ0mXv4FIMUnsU1DEt
 cMVH082bE1uIIHAMHXaRBnTm2RHkRADHPUAj0ch+eEbdvCCU9cqxyqhFVCkyHqHN9vpc
 25kkRL++iBghwuMdujsRATPwjoPTWAEDa0mj1JTOcj46boCCXiwQOQB/TOcy8jbiqwg5
 w3hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DFS44qZ7
Subject: Re: [Buildroot] [PATCH 1/1] package/emlog: annotate more
 misclassified CVEs
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

In reply of:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/21de893608162adf032f0fda309e91bab2d5654c
> 
>  package/emlog/emlog.mk | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
> index 7d63916ab2..ca29643c62 100644
> --- a/package/emlog/emlog.mk
> +++ b/package/emlog/emlog.mk
> @@ -9,9 +9,18 @@ EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
>  EMLOG_LICENSE = GPL-2.0
>  EMLOG_LICENSE_FILES = COPYING
>  
> -# CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker) as
> -# affecting emlog, while in fact it affects http://www.emlog.net.
> -EMLOG_IGNORE_CVES += CVE-2019-16868 CVE-2019-17073
> +# Add CVEs misclassified (by our CVE tracker) as affecting emlog,
> +# while in fact it affects http://www.emlog.net.
> +EMLOG_IGNORE_CVES += CVE-2019-16868 CVE-2019-17073 CVE-2021-44584 \
> +	CVE-2022-1526 CVE-2022-3968 CVE-2023-43291 CVE-2024-12841 \
> +	CVE-2024-12842 CVE-2024-12843 CVE-2024-12844 CVE-2024-12845 \
> +	CVE-2024-12846 CVE-2024-46540 CVE-2024-50655 CVE-2025-30372 \
> +	CVE-2025-47784 CVE-2025-47785 CVE-2025-47787 CVE-2025-53923 \
> +	CVE-2025-53924 CVE-2025-53925 CVE-2025-53926 CVE-2025-5886 \
> +	CVE-2025-61597 CVE-2025-61599 CVE-2025-61769 CVE-2025-61930 \
> +	CVE-2025-9296 CVE-2026-21433 CVE-2026-22799 CVE-2026-31954 \
> +	CVE-2026-34228 CVE-2026-34229 CVE-2026-34607 CVE-2026-34787 \
> +	CVE-2026-34788

Imo the previous 'misclassified' CVE should just be dropped. The package
metadata are correct in this case. This emlog package doesn't have any CPE and
most of security trackers will threat it as such.

It's just the behavior of 'pkg-stats' that will use `*:<pkg-name>` if no CPE is
assigned which should probably be changed.

By adding those CVEs to the `IGNORE_CVES` variable when you generate an SBOM
those will be linked to the emlog package as if they were related which I find
odd.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
