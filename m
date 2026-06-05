Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA309CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CDD409A7;
	Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8m_6C_wFCBq; Fri,  5 Jun 2026 12:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD20540988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663869;
	bh=OTaBbP/huNVTPIkBB9AZSiAfnO/QOoTwgZSipcJJWL4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BDUoL4s29sjnsEbKPlRKDauSjTIuPsEUdrO+GUfkncEhTqS3/FL4R57K2LLugz/Gl
	 YaNaGiMUKDmh/wh4v1baGsSiZR0yruYCdTaxmyZ3JFl6mWixoeoif9m40txLIXJ+rE
	 KggMDNovsYNGveYfGgWnVNAP4wvyuN156RrX8b72SPz3KSj7TtjcnHg6xzzk2SVuXY
	 x0qx0HKOO8jwp15EzDmtI2ac1CAhzhZkcIEPMnQDj5AGwD42CpKtD/urvNQXU/twIZ
	 uwTot9A+B7LsH8BiSm6NaFNdrwUNLFNFyUVZpMOrqTvphH5ycAU4EFLMQ/mt7DbVq+
	 KpXGDlWHuSMFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD20540988;
	Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3841AF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C7F761130
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lROlsaVnSGQG for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 110156123C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110156123C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 110156123C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso1350893f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663862; x=1781268662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qWzt3HZ9Mo5ZYM1exHxG63QDK5Rf6Ds+YRg/GamSHus=;
 b=YbzvSQnL6OahCKm3IGKUnQ7gz1GLQukEQyJBUpXachZSR5kvd9RzJY1Ialt3hBF3Kh
 10tJRDqRPQGN2IOvcbF/4kXzpqH70u0vdoww4KK20Ajv/oLGmOoCStgu3qMwRwhiBcms
 QUEJYZLMWPMJUuaUAGTbneIlp0U7EgqFIVcU9l8NOB9KhcngEGT0KIbZbo2qQRYkdh/f
 OaJMCTYlLoUWSmPp6Np+ze4CJBz0c1H8y9FyiiFB2hGt8K9UKk7RcfE3jAtmhgqLQcHw
 ZlTM5MZnvOSzkksZrLl3J66kN+2o8habCDkmitKMEaqeXVzJclLYsx2lmZxuLDyu6V+Y
 jPHQ==
X-Gm-Message-State: AOJu0YySK7dFUO64LNrEfKgxZLwRk/6I1usVTOKpeTiaBUhMW359sdxo
 5nLTCZ99lmAHexBIvluwVZPN2k4v+dvNlp7ffbcHW470QApo54x1IhPLFAcN/qHQAkDVNqVF8VP
 iB1rB
X-Gm-Gg: Acq92OEFWY3xW5zmJK5LcFO4aVrmNXrM4aZk4jfHQirvI5lYc4EO/YxKfY8nixpxp5g
 m5eRZmdnj1U1DK1fWEcMmgYtl/jHFLt1zoAXR4JGLCWUcg06+Vooo+1NmBIVy2E7/59+BXorV6B
 W9hujH2mTPQb/SjOLr/Nw1QWfTtJ8J2wJLL+DaS8F6YTIItFtrBwala97AeqbcNbSd0Da6TW0RB
 CiLQzDO3aJfxTs97PhnFiXHErf7UESh/7wu7zN3+IKRrMEWvDgorVOVP5TLSXJCGbjhkI6H/jte
 TkA9abJssZQzmdIkwGNuw5JnhEwB1HSzuiK0K6AjnTbvgsl6m2TsuAMEqifrftm3Gd4dSkzRCEt
 h3VeQXAKERdWa+pchf4IO76izKhq3sk+L1rtKg09zvUP68Gq8U7aHdy0G12/3Hw6IHUrVfhyuP9
 0STUHw+KVYcqrXSmA73XW27XLw/g==
X-Received: by 2002:a5d:6892:0:b0:44f:da54:da6c with SMTP id
 ffacd0b85a97d-4603064650cmr4427430f8f.26.1780663862006; 
 Fri, 05 Jun 2026 05:51:02 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcde3sm28173916f8f.1.2026.06.05.05.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:01 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:01 +0200
Message-ID: <20260605125101.275050-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-5-thomas.perale@mind.be>
References: <20260529094514.178266-5-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663862; x=1781268662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWzt3HZ9Mo5ZYM1exHxG63QDK5Rf6Ds+YRg/GamSHus=;
 b=FiXVIpZhNxLIvCCeQOx/GZwb3OkDcjd8PbBAn1/0yqGjowHUy/Wl59P2HjpLwPtIf/
 IoeQdXPcd2BE09Q4oUfQ6agbUT8xq9T/2JMcR9unYvhB5rWB7FFA9LQ63kFZHb7mbO0I
 ILdkVaVWWPiUAYFULo7+0EwTzUPfWhao2KsihbqJDeglkfVhDzvP7UcQkkTDxP2DJsqe
 KpsjjfNDRIw+maK3FP8n++OdSRZA6DEWH1Y9PKigMUSqMBzrjBXONm3cCS3SQDEym07g
 0Ty+xWyj+mGvWWZIU2ztez8br9JFv+2nVKbVm5xwNlKTZtCLHfnAdmCQhTJT80FeODw7
 mVgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FiXVIpZh
Subject: Re: [Buildroot] [PATCH] package/icu: update CPE vendor
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
> The CPE "cpe:2.3:a:unicode:international_components_for_unicode:*:*:*:*:*:*:*:*"
> is valid for this package.
> 
> Also remove the no longer needed "ICU_CPE_ID_VERSION" subst since [1].
> 
> The previous CPE hasn't been used since 2020. While the new one got two
> CVE assigned since 2020.
> 
> [1] 5bf0db998b package/icu: bump version to 78.1
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-5222
> [3] https://nvd.nist.gov/vuln/detail/CVE-2020-21913
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/icu/icu.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index 3030e0c71c..ee1ede6f2c 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -13,9 +13,8 @@ ICU_SITE = \
>  	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
>  ICU_LICENSE = ICU License
>  ICU_LICENSE_FILES = LICENSE
> -ICU_CPE_ID_VENDOR = icu-project
> +ICU_CPE_ID_VENDOR = unicode
>  ICU_CPE_ID_PRODUCT = international_components_for_unicode
> -ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
>  
>  ICU_DEPENDENCIES = host-icu
>  ICU_INSTALL_STAGING = YES
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
