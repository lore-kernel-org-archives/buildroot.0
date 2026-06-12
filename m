Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0016CCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDDFF411AD;
	Fri, 12 Jun 2026 11:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owII0Xsuxj48; Fri, 12 Jun 2026 11:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC705412FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264306;
	bh=TX5K1YQEANbL8+7dyy7oY4e6TAfRci3RS7z/2rV4i18=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QFrgFsjII1Fjo4eJdQuXLYBO8aIm/ttpZugyKxLrXStDVNV5w7+Y3tU827rPXCaHV
	 +wMBFXJSukFJpNgkUgdPs98c4FCbagwOu/spcq+pzOds5RHj5QmcYsskKozXFrIDig
	 BVHIJLgWTzkYf7YwlYCm0CW/Q+o2LQvFz3a9r8OEUxhXpBwNDk78BjSRKCVEEoIzRM
	 IRvQw23rKh4pTRyc+gxh7rd2zHIqQSCsM7diFtRuy3It3muFWekFUqdeh73H9S9UTM
	 aWIvwSKgiylZEUn4fXUcZD8u7M1I76JRe+X4qmtRcZHlUG3YyHXx8F/2IkMgad0PXx
	 3TKKoWuDEKnPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC705412FE;
	Fri, 12 Jun 2026 11:38:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D101D237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF6C2612AC
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nefGecwbcCzj for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97C6961334
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C6961334
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97C6961334
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so5917175e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264291; x=1781869091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MK85WzQKThTPmUuNLAGiw+OqWwqyW80u673GeIYcRiE=;
 b=sC29Stsuc22bwFkw6b69ceRy6vmMDuF0XsfPgAlA1RG2pa6hgXeTHWQWoCXyJ/SE8B
 eXm7nxcXDIKMz0ZhEn3tgr/QtpQgDYxZH6xw2f+PzN5joUX6JnTkwq3h6E0TVZBiQ1VB
 LlZ2T9HfWtCoKwena6qmiAZsQGNZCZBDcnXXGaYI+xxJ+j5Rqz1lP9xjdzMqZQKsLUQp
 O2e3fCPh9YmUtn1j9ZWMJdx7pYlnEdvIvomUxFngH0m++hkJGufTjGGS8SIF+6Xt5Ilq
 H70YptGl+nl8OZ8krlKgFcrbUrA0OqjJi1NsezHKGO7Ar9VkFg5lfqKXShGPI6vcCMOa
 gZWw==
X-Gm-Message-State: AOJu0YwjmIsw4ezC3JMcUqNWfcwH92Y4tgpTtM68ahiysSafBuFZyETW
 tOomXhAk3OEnCwiRPYOZmlc41DDHsrO3DiZmNUwlkga9a8dRa9LQPd5jOjMtvbgBKD4=
X-Gm-Gg: Acq92OEvman67TbFAylRfGCHPyJL1bVatZ8RSwB00o6mX1cGbtWKdrqzKL1tbJo7/eI
 v9JY6GXccjmDMpk/KVpwtVmMjKqgJ7b4ac7G7OaNQjXvzsi2cpZqCuniYVzS4vgJ4NtRN2kmqFb
 TSPm1M98Lsw5bKux3NpgKDT92gtR3U8HtqeoVi4CAU38UPz1ZdG/WSzyspbBX18CXYdFA3GEozr
 iXsGIISKuLFq6gRxZQI98kYs675BxGXejJRBRps3a47a04055XL6tAkmK1sy7f7T6lVN5GokV6s
 4XGpaDdSfZA090aLYYnc5RaLGF90MsEVK1M5qTDt32FAuOcd+6SedDWu4SWDSjiDhTfUZDZ4FTT
 pP0boxUESSxiC6vwT2f3sc5xni+nj4dFV+Iup6WWEkCi3nu3K+qSndLsq+oODd7Rg6+cidN4kAB
 8DwvZrJb66cdalIFE=
X-Received: by 2002:a05:600c:8485:b0:490:e913:656e with SMTP id
 5b1f17b1804b1-490ec49f3c4mr33789965e9.10.1781264290675; 
 Fri, 12 Jun 2026 04:38:10 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea843d6fsm62427895e9.14.2026.06.12.04.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:10 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:09 +0200
Message-ID: <20260612113809.253107-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602124047.287780-1-thomas.perale@mind.be>
References: <20260602124047.287780-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264291; x=1781869091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MK85WzQKThTPmUuNLAGiw+OqWwqyW80u673GeIYcRiE=;
 b=awsT5eZ24WOfWQ9oCj1aCfS/z8uLTJg8D9HBMtsO6EXMhIYJIlLY9+YkBWbY2Exxpq
 pvpGv66TgPW52Wxh2J5rfy2cgJcevxHud3Tdrjj8XFNU8MQgtFVo5DsrTmZ2ZAWcGQNN
 ujvP7papK9dF8mjiO6FPF8SyRNyxLRo6hI06J9SHaV+SpKSuoRz/wNfTtnS6Luwtif5v
 R4qiooPvN1VrYdYP3NucoNLq3MVBySkbpI098VYHNWkM3rcBTkBXKYIIkatfqblMUtAV
 2g443mlS0Wwvu1B8tuxO0lLoaqbF7uTVgjwwmNAxXXUeAD8sotNOnCDTcCzACClpgehT
 4c9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=awsT5eZ2
Subject: Re: [Buildroot] [PATCH] package/sane-backends: update CPE
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
> The CPE 'sane-backends_project:sane-backends' only has a single CVE
> assigned in 2017 while 'sane-project:sane_backends' has 9 since 2017
> [1].
> 
> See the package CVE history at [2].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-46047
> [2] https://security-tracker.debian.org/tracker/source-package/sane-backends
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/sane-backends/sane-backends.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
> index fe89e7747d..de1375550c 100644
> --- a/package/sane-backends/sane-backends.mk
> +++ b/package/sane-backends/sane-backends.mk
> @@ -10,7 +10,8 @@ SANE_BACKENDS_SITE = \
>  SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
>  SANE_BACKENDS_LICENSE = GPL-2.0+
>  SANE_BACKENDS_LICENSE_FILES = COPYING
> -SANE_BACKENDS_CPE_ID_VALID = YES
> +SANE_BACKENDS_CPE_ID_VENDOR = sane-project
> +SANE_BACKENDS_CPE_ID_PRODUCT = sane_backends
>  SANE_BACKENDS_INSTALL_STAGING = YES
>  
>  SANE_BACKENDS_CONF_OPTS = \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
