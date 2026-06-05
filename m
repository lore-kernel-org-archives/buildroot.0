Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9878DCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7027980B52;
	Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVWT4Iifuht9; Fri,  5 Jun 2026 12:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E50280F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663864;
	bh=JYRm3jRcdQC0FOpGA5Amg6xIACNO4pVkN3uLxK/1yTw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sSMm4aVrYYv83hZP6YO+7rR9E6Xtdx1Y+AzSCmIc9GiJ6B142TrEYWCQwv8Ozo/En
	 3Zx9NlctV2S9Vjxr6JBZ9CfrB1liCeeGw07KFxv+pcpiujO8QgX0NysP2i2B2DY4nS
	 /xVOAdxDXIMN+iLwH2innkG55T0CSeYJ2HBnJVOUOKRcF0lN/ctnTg5slIuLWFMqZW
	 FZ+ruS1Z67YeafS+h/JvAekNl1EfTHQVFUBCQ9je1XKxGSFIlC/sDT//lh3P4xbsmm
	 vvwmJ6UG04yEvGzcLPPmdWyuIF2u6Mh5SgU0fA1fNUyfsW9j380jrh7YeTBkJ8HYxF
	 AvQn11p9yKQNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E50280F1B;
	Fri,  5 Jun 2026 12:51:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91797F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83A0E4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYJjX1JyFOwd for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 771264037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 771264037E
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 771264037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-45fd45e596cso958201f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663857; x=1781268657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4iYGcBN4coDVJVnrqI6hSOw4MadCBbNOz3l9wdFXF/0=;
 b=V4KAx1oi1EqBuytb5xpIvX9/LKtwYuwirndunXZeILT6P0BC4bJI8WC5cyhIlWD4rd
 RYXD4Y2XST/FIv6PS3+tq6WWJQxNSmnAeZ+mz6M9+Kt2AmVKz28nFdLu72VvKoRPKU5A
 esMIsggTkaEkSJ2olb5pvERqPm9Nfo3vJ450dcyTc4JpDo4i1gQqA8kXl6UTKaQ76PJ3
 pTmcx5SuIi9RYcIVBoAeI4R+Dmsm1ljPkNvP89yVFTBiQ4N8xXU89zCeV/tqv57J3KG0
 lv6/ez+MGBvIL+k3Qr4TJcm41ayGdbsLppNB13RU4PWT2af+g2KQFyjZzwZ67EG2FdEs
 ObTA==
X-Gm-Message-State: AOJu0YzEKGANLN5t8piAyZwMWd2B0ckxv/7Vvjav4VfV5RrdQCogMgiz
 GewcSfj2op45lcnVfDqJ2BIoL1g0rr7MpWTk9bhP/LlC55JvGDL3DfVjblp7xnNSe1o9rWRYFbT
 hC/oA
X-Gm-Gg: Acq92OG+kCfS1EKjel8L0DNeGlqIQOvwEMaQWcEntDRsuFUeyI2MOUBWNH5zwwygnE/
 6Cx5rVkdyIA3cA7JfLdiQcNxs8c5h2/F2wp4D5WnDSGAf7Yl2CwapS/pcd+PuEKxZrj/5oX0kuH
 lxgf15L0KGveNmordqAzUUOV2F1X6MXeoPJWD526r2ldxAWj2aPmEDqtnrLMYlv0Z/kyqyhsSHe
 p2dRaTNTD8ag6H1a2UvMF/a9gOTjJI+qwH1YvHM95Lm7nkPC/myzdWpWy+5EPwBd6L6EIP0KN+0
 SXSkFQUtB141AvQ5D4AyekolNMLoORTXsetGF8Ko2sKdJMTLVXfKCtqFZDpr9gGLuxjgmn+3k0V
 ESD8NLrqdzGowL60G4P2PayXE2RQSHRpQvqC6uLT64163jXQUn7bc3y5bW4tXaTzxf6zycLPiLU
 nFUHlNuVAbanwXEiBXZNtfEP4jLztOFkUFxVkQ
X-Received: by 2002:a05:600c:35c9:b0:490:b8c0:d471 with SMTP id
 5b1f17b1804b1-490c261317amr53389205e9.23.1780663857549; 
 Fri, 05 Jun 2026 05:50:57 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39e024sm200945855e9.4.2026.06.05.05.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:57 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:56 +0200
Message-ID: <20260605125056.274846-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-4-thomas.perale@mind.be>
References: <20260529094514.178266-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663857; x=1781268657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4iYGcBN4coDVJVnrqI6hSOw4MadCBbNOz3l9wdFXF/0=;
 b=iEtIoT9OvdCDT4maMKAhjF9J3ibyUbzMhbL8uFnJDDIVdFBxWqKWO3fd2DUvDcrUOO
 Gmmir+VUzQ3aUwoHbhMajJGqqugI55cBtipuDTwLp4aiOZQW2RQ1Nyx2kHmfFXn3A6DT
 lUJznCmDTaGCm2QK3DY58+YuUGpUf0Geads7TTc5WIPtQKdfogzWwsDeZm07GLSkBsU5
 gLh/qm3jkIP2a7v0rjCfPOLhaGSUyuRgasAcaFo3UiSOSZXs/+3mDW4OZXSyqXmIBeHx
 a14u2vgkMZbr0+2ptImDZk8R/YcT9ylrsECego7pckelydJLUYmg8hr5yLnOWuwlIaRO
 jICg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iEtIoT9O
Subject: Re: [Buildroot] [PATCH] package/cups-filter: update CPE vendor
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
> The CPE "cpe:2.3:a:openprinting:cups-filters:*:*:*:*:*:*:*:*" is valid
> for this pacakge.
> 
> See the GHSA [1] and the associated CVE [2].
> 
> [1] https://github.com/OpenPrinting/cups-filters/security/advisories/GHSA-893j-2wr2-wrh9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-64503
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/cups-filters/cups-filters.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index dcfb2e9500..f2b85aa9d5 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -8,7 +8,7 @@ CUPS_FILTERS_VERSION = 1.28.17
>  CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
>  CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
>  CUPS_FILTERS_LICENSE_FILES = COPYING
> -CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
> +CUPS_FILTERS_CPE_ID_VENDOR = openprinting
>  
>  # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
>  CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
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
