Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A48C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679CA61B09;
	Sun, 24 Jul 2022 10:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 679CA61B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmDzs2jKKgR4; Sun, 24 Jul 2022 10:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E127061ABD;
	Sun, 24 Jul 2022 10:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E127061ABD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8D81BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0887E83F39
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0887E83F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8OK1v3kM-TR for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:30:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1562883F38
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1562883F38
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:30:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g2so4064642wru.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WGof4MwhQKPEX3NsUosMhUKVG/MyscAbshl01PT3axU=;
 b=knlOurOOJrczSzhli4OJZx0MDhsL1/oSpC3ubvPKp4egbxztuEygJ4wX9Ok2TJgBIs
 39JipvVhpvOzUzvV3Ahk6aKomh1Y/6Z3X8+TJ+Imdk6ZEoLywdjg4haBX1KBDzJf8FuX
 YtagvmMGKvoLLByFf5ZHS6tn8XMA/DRuFXIGB1GPeKRX3dJ0SWWsjXXhvTqUQLbBsa52
 RXFJ0bBKQR2utrsfIBNhLhaocfoyz9TK3nID42snSYDHdBj6ykIwmYFCE5nLD//xl42b
 lxtCy94ouDjQfxqccrvyG9yRqVp0DHJCvU7BmUXZfZB8OWHR0ektDEL+O6COIMXBQjxE
 +JoQ==
X-Gm-Message-State: AJIora8L+1pXpkPbAMgtw/9OO/Pcjx4jbf3XuSNxqM4iBOJtZz4GIX0l
 ExAhG8ef4n4k1J0wTryw0KhhLtyb6tvVsA==
X-Google-Smtp-Source: AGRyM1vDcbE0nvzk6xEbvnKX8i7y94YMyuhR6ADYIJTsL+n1DhD7ZxvLx0ilj++rKQW/zIYvHTQG0Q==
X-Received: by 2002:a05:6000:90c:b0:21e:1565:8179 with SMTP id
 bz12-20020a056000090c00b0021e15658179mr4854400wrb.717.1658658605997; 
 Sun, 24 Jul 2022 03:30:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b003a31f1edfa7sm14958812wmc.41.2022.07.24.03.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:30:05 -0700 (PDT)
Message-ID: <2572907b-9b8c-49d6-3ff5-0612b5b904aa@mind.be>
Date: Sun, 24 Jul 2022 12:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220723212608.488037-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723212608.488037-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WGof4MwhQKPEX3NsUosMhUKVG/MyscAbshl01PT3axU=;
 b=WOwy0MqVtHxksHf29RVAj3/DPtfIQyJik+GF2BVPTuFemmfJCIcvq/6ExH/mY1+y9e
 UzRZTx3glyVR3FQc1jrhDdjQXVAgdx9IdSMh6PpQ9QOZTlMa7NZzrk7WgI6wQWFz95gg
 vp/564iXKuRIoZ+MF+8qiLZiMBOWz0AsQT6Qu18IKu0UzRv3ZD0y2rYY/2Xk08CbSLhh
 LALQdOi8e2LJ7b88f0aFLSuD1km9pdewvWKmvyIP3VcEn3Vs3Eha3BdvIPqD0Gp/LBFr
 2ZSNWq4XFDhFKBxEDLrJWFtRi01Y8bgIeYiiUS4eotxgANwp4XBeRsffo58kNykKvxmo
 QsLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WOwy0MqV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: add CPE
 variables
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 23:26, Fabrice Fontaine wrote:
> cpe:2.3:a:ruamel.yaml_project:ruamel.yaml is a valid CPE identifier for
> this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aruamel.yaml_project%3Aruamel.yaml
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-ruamel-yaml/python-ruamel-yaml.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
> index 95d20de4a6..a6fed3bc2c 100644
> --- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
> +++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
> @@ -10,5 +10,7 @@ PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832
>   PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
>   PYTHON_RUAMEL_YAML_LICENSE = MIT
>   PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
> +PYTHON_RUAMEL_YAML_CPE_ID_VENDOR = ruamel.yaml_project
> +PYTHON_RUAMEL_YAML_CPE_ID_PRODUCT = ruamel.yaml
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
