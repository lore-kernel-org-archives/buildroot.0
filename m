Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D37C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E34480D5F;
	Thu,  7 Aug 2025 18:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxEHYkgdnFvB; Thu,  7 Aug 2025 18:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86E8380D74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E8380D74;
	Thu,  7 Aug 2025 18:24:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1BAC4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F9640525
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGWGNmsjbkHB for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8265240417
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8265240417
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8265240417
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so12161485e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591036; x=1755195836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VnI84dL2bG3bsv9Y7kg+7apE/7ONcKwbxzAjAeGqcM=;
 b=ilEG7GmzkH2gcI9qCrYGHedfkKrfefxo2WBebOZxbjxojn9lU0db7+JmnNRI5cImH+
 F5IUHyn5R/ySEBSaHtzH6VKRUvnsjiXjcseTp9CWiBvH5Nt1+FvSDFkm05mUgBGoHaI+
 YhHVf1CFmT9xEi7LW1S2KW5IosT6K9h9kwlg7+OiudamZVj+r5LCB169ppnvvUyBNj4n
 e92f6P2MWvg1exvi7Oc6Zl6UYiYxh/dLQMMyJrXnx2K3sri7Bve+ymroBn1/eGLeAuPI
 TeE+rhVowGN9rLg4UpV8TH/Y1BF/z0Hds9+D/MNJjUFC6APBk4saCefWFZqoi8H4GqQB
 ZPnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZXviF+BIsP2xsW34z613Y4QW4owldOzg8DMhrMdemrxm0UXIiE+8BNxUPvq1dvSOHn31b2ucmE60=@buildroot.org
X-Gm-Message-State: AOJu0YxXIBBPFk3izYfY8N8Ees5gsMhmX42q8jyflHZtuPJunwZKghrC
 PuN36Kj4g6tPCZe4P2PHYP6JPa+6AXbWCPU7Gn/kDihesOSgaikSIq0VPX5WQVUP1MU=
X-Gm-Gg: ASbGncsW4cNAE0cSYL1TuZlTbsWoV7Z1uRqypFWSQXEIBBPpRJfeHBHdaWjtwl0hr/B
 vfulHlVOT0nDQ24Zm86zTOlqOETyRN3bFA/CKz1HkidhhrLMaAx1PZui3ZxuXziXeAkNjdvf2wm
 9hyo4nhMQjICCNuONMeAXWotW7NhHeTrHmKRbk+vi3/pzfFJhO+ZxnvT47eGiXcGqrrdoELc6po
 80ZpMXjAWTggCJU8mR4ZxecqLW7AgkBsCPKhTYt9s8blpAfG0y23nSO/l1ZsvVUkNQaet8cEE2P
 v/kgY5Er8UCIxhELZN5A3KY8twDUnh3ipaM8Gr7gqpF1K5rps8vTa0Gxa3/v4AGNQKWNU/aj6Wv
 /nKZxLj/ErwpMbg==
X-Google-Smtp-Source: AGHT+IH5cWH0d+4HgMVFOpla+/49q3k2JZmN6DLCXbOcPsvOzjpxGeRD6O20iImY/wxzWV9Q3HP4yg==
X-Received: by 2002:a05:600c:45d0:b0:458:bf9c:274f with SMTP id
 5b1f17b1804b1-459e7478234mr67996615e9.29.1754591035672; 
 Thu, 07 Aug 2025 11:23:55 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de0d4cf1sm164767045e9.13.2025.08.07.11.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:55 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:55 +0200
Message-ID: <20250807182355.723810-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701193705.761121-2-giulio.benetti@benettiengineering.com>
References: <20250701193705.761121-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591036; x=1755195836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VnI84dL2bG3bsv9Y7kg+7apE/7ONcKwbxzAjAeGqcM=;
 b=D4f/SkrgR6c+xn5zYLs7aTrAC/3jhYBGVZksGPX1S1bUYp6fm1klKey0CmAXjjB8E8
 mMlaxfd8Ym3UyyC48dji3KdQu+tmH2VQlFIouoOmJCtqSlt7CkoER6Q+w4nkcpNT+Cyv
 ftj9GZ/9cxP427CNaSuvqVHlODUhfgaqrpXM1iqla289VgqaQLZqNQTRpHATEFSMVGqh
 DBkdCuckFbKSwilDMXQbyrJi5vT3iI1JrBM2I7sWm9Nu26AXmv+2xFMrmSnsrbgNgcu/
 J5Y8jr5LxFQds1O3ZgJyWAQ03EsVykuktYFYK0bwiHldLwb2dq1t6avAy/g5GPsRH7k5
 EBrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D4f/Skrg
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: fix build failure with
 Linux 6.15
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

In reply of:
> Benetti Engineering just took over Larry Finger(lwfinger)'s repository
> rtl8723bu since Larry unfortunately passed away[0](RIP) and there are
> pending PRs that will never be checked as stated here[1]. So basically move
> github user to benetti-engineering-sas and update version with latest that
> fixes build failure with Linux version 6.15. And of course let's update
> package's URL due to the moving.
> 
> [0]: https://lwn.net/Articles/979419/
> [1]: https://github.com/lwfinger/rtl8723bu/issues/206
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/rtl8723bu/Config.in      | 2 +-
>  package/rtl8723bu/rtl8723bu.hash | 2 +-
>  package/rtl8723bu/rtl8723bu.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
> index 7c624fc4d4..70d597d23e 100644
> --- a/package/rtl8723bu/Config.in
> +++ b/package/rtl8723bu/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723BU
>  	help
>  	  rtl8723bu wifi driver
>  
> -	  https://github.com/lwfinger/rtl8723bu
> +	  https://github.com/benetti-engineering-sas/rtl8723bu
>  
>  comment "rtl8723bu needs a Linux kernel to be built"
>  	depends on !BR2_s390x
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index 236b9a6726..c0216dd1eb 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  357c78d6f86794d96530155f9ba102e56421efb6fa43eb33daa0fb57354e8215  rtl8723bu-af3a408d6399655b0db23c2c8720436ca725ca47.tar.gz
> +sha256  e50ce66539a5216b91460b8278606874040f3c21ce8afbe1f5e84595dafa6868  rtl8723bu-523cb38e4c62bb181d6b95024884e938835cf8cf.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index 0ce8b1afad..05447ecef9 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
> -RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
> +RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
> +RTL8723BU_SITE = $(call github,benetti-engineering-sas,rtl8723bu,$(RTL8723BU_VERSION))
>  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
>  RTL8723BU_MODULE_MAKE_OPTS = \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
