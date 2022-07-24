Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6502DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1B114163C;
	Sun, 24 Jul 2022 09:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1B114163C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXecYJwtAZMh; Sun, 24 Jul 2022 09:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC8754031E;
	Sun, 24 Jul 2022 09:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8754031E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABB51BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33676409A7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33676409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edLVyTenf3f4 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:18:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5574098C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F5574098C
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:18:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v13so4221379wru.12
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KegFrXhSiAlLEzTxFuQjCOd33BU/4EbxjKqoj93OjxU=;
 b=vOM8jZFzy2i2qeBPXfTbcpdUrSzDgcavoe6o1MqXPdDaQQMKwlivCE1yQ60iw1HHJ7
 6rkxHsvg6gUcd1pJTNNOAg+ciwztFqS3Vx028XwVIgoOBdCk25EFsug42BbfS/XOX8fk
 W/ZOr9dPMapDt0vrnkKaJd9qvwR1vNGliqDdVqZRCEYFRBL/gzO7Xgzgw66HNHL1/9Zb
 99SVeQhOANKu4nVn/rM79NXIPtzNVfa9yv/N2dksylowSLQwfmExsCR0B75xrdIDmQnG
 Z8kPw+PV/qpGwdR8/MiXpixTlsh5psymzkXYSHYLAwjhyJephQNBGFw4SP5JT3zqVoE1
 lKdQ==
X-Gm-Message-State: AJIora+8IQorF1AYjO7cx/FDCXxdCrB4AMGMq0ZHjccCfCFxIC19w38f
 /j7HvU3DhCOmUhHNSCvze6mJrA==
X-Google-Smtp-Source: AGRyM1syRoPuDyIwnJIyJrnscuSYVe4j7lmvMsiU3xOPRhwNUbyLUj0QEz5Kj6SjQhVCc7FhIcgzuQ==
X-Received: by 2002:a5d:588d:0:b0:21d:a5cf:c6f with SMTP id
 n13-20020a5d588d000000b0021da5cf0c6fmr5021039wrf.716.1658654297677; 
 Sun, 24 Jul 2022 02:18:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c001200b003a31169a7f4sm13884232wmc.12.2022.07.24.02.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:18:17 -0700 (PDT)
Message-ID: <a3c3a760-1c0e-44e8-24e8-ace063cd8dd1@mind.be>
Date: Sun, 24 Jul 2022 11:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220723201014.218864-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723201014.218864-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KegFrXhSiAlLEzTxFuQjCOd33BU/4EbxjKqoj93OjxU=;
 b=WFlDzeoB0SOCJ70IVBkURWruHJnKgrwuVBsbyaadGE+p2CYIRo3SdwPPTK3C0JO1+K
 tQJMmJ+eRu7aiQWTZ5kCePxIdVyMhIt4B9netScyZOM0bYbOL/qWP9QSaMDFKhlpOXmA
 N+Yb7zEJoOfF41GEhzMuwcu4mWQU1hMZq28OpYa8tH+lYeZ5rJl1t9PE/v5dRl1NuUMN
 BH1HibdqaRNTfPMrI68ZHL78xZCL+1F3x8xqXRMu3VYIOdJ24xqwUUsiqjcaoPLvT5dO
 Vp/sLVdlYmAOm6nIr9f9fizHBjqSL8SSogx4ZIDknR54QW2jRO/Dn0IPYsWeGzKCSCRk
 rcyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WFlDzeoB
Subject: Re: [Buildroot] [PATCH 1/1] package/jquery-validation: security
 bump to version 1.19.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 22:10, Fabrice Fontaine wrote:
> - Fix CVE-2021-43306: An exponential ReDoS (Regular Expression Denial
>    of Service) can be triggered in the jquery-validation npm package,
>    when an attacker is able to supply arbitrary input to the url2 method
> - Fix CVE-2022-31147: The jQuery Validation Plugin (jquery-validation)
>    provides drop-in validation for forms. Versions of jquery-validation
>    prior to 1.19.5 are vulnerable to regular expression denial of service
>    (ReDoS) when an attacker is able to supply arbitrary input to the url2
>    method. This is due to an incomplete fix for CVE-2021-43306. Users
>    should upgrade to version 1.19.5 to receive a patch.
> - Use LICENSE.md instead of README.md which is available since version
>    1.14.0 and
>    https://github.com/jquery-validation/jquery-validation/commit/96b7036eb45375eb4861082d8ca442d94a9c666c
> 
> https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.4
> https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/jquery-validation/jquery-validation.hash | 4 ++--
>   package/jquery-validation/jquery-validation.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
> index 4dbe07e218..31ecd62bcb 100644
> --- a/package/jquery-validation/jquery-validation.hash
> +++ b/package/jquery-validation/jquery-validation.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  01ad2ef0a7f9cd413aeb51081651293916da47d20e5c0a59ec62587e58b03564  jquery-validation-1.19.3.zip
> -sha256  3e5a99460077c16bf75f6821a30cdac9baa339119ebf63b2a6c49f4f50421ca4  README.md
> +sha256  52381e080f266f8bca1a17acd6a4a68be4c2606a8b16f8a12e597cc69f2c0584  jquery-validation-1.19.5.zip
> +sha256  f398878cab338b869638bdac1aeae76bf3ac11b2b89da6e0b68bc1a645733440  LICENSE.md
> diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
> index 920ed1cece..1ed37ee73b 100644
> --- a/package/jquery-validation/jquery-validation.mk
> +++ b/package/jquery-validation/jquery-validation.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -JQUERY_VALIDATION_VERSION = 1.19.3
> +JQUERY_VALIDATION_VERSION = 1.19.5
>   JQUERY_VALIDATION_SITE = https://github.com/jquery-validation/jquery-validation/releases/download/$(JQUERY_VALIDATION_VERSION)
>   JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
>   JQUERY_VALIDATION_LICENSE = MIT
> -JQUERY_VALIDATION_LICENSE_FILES = README.md
> +JQUERY_VALIDATION_LICENSE_FILES = LICENSE.md
>   JQUERY_VALIDATION_CPE_ID_VENDOR = jqueryvalidation
>   JQUERY_VALIDATION_CPE_ID_PRODUCT = jquery_validation
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
