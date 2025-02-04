Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69582C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305B84062C;
	Tue,  4 Feb 2025 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj5fQdA6uW2m; Tue,  4 Feb 2025 15:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6A8405FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6A8405FD;
	Tue,  4 Feb 2025 15:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6021A6
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3419B80F84
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZbdrCRChFTL for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1687D81EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1687D81EC6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1687D81EC6
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:02:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3863703258fso4173786f8f.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 07:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738681361; x=1739286161;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xeHYF+GhhgU8j380WOcVIP/XxePaNdrZp2ys0YpKUB4=;
 b=gY1Okv61w2f5PshXyPP4yJSHmSO+zUZi920f8fnUCHgQ+8iN/C4zWA6RxBj1LfPqgs
 FTGjiMsvXp2O64+GPSKoYs8AiN3qytZjdvhWbn15LyvqLMc/PQlwT4gEDN10zwgJ3DzJ
 A1iksphsLDBd/KU1EAXVDwybd//2FuJvSONzN/BDamMMrpFkHnOC2H2vxzwH4cwVasJo
 WOJufsKXxlREasLn8ltV4a+znTNaKJZ4kWqAjpiTuLaXNRLGN+G3Jgsu2GyeVdBp4vMs
 xiSoKyVvi3CGiYZHJTvGctd4uawnAMB0B17aPfiCZhEQuOzvqqvhNQsMy4dR3X9cLXNW
 FgyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAIcdRVmuiA0lFCj5lDqwCk5saPDPmQsADocLhbJLNIs2at9+CGFtMEWCb/namM4YJyZJnOvFzeTI=@buildroot.org
X-Gm-Message-State: AOJu0YyzikBmOV5/E0CJCqzf5h9FQoa0z+N64BYP7jYXX/wnfOR97puB
 57ULQsWCD9X0IU1RqCQfNJf1Fv1eVJItbsFwfg+ISoPK2E9C7iEQN38PImxIJ+JCFlOD18h826O
 s
X-Gm-Gg: ASbGncuYSEgk4sUWr/7evNHfR42Or2atExY+fOwSzWjmB8qnf4BrrF2s6zwum1mfZW/
 wWOOpl3NcRbpq7mfJ1BFXFrbUAqHoDgD55a6oVAULRXt4GMugxh7YIznjjbLkWJ3rquLkqZa08Y
 Rtw2DI8wUwDJphNHJOJH0q6457hOsOSXunwyhL+F3kHqQW/Y3b08LK18hlgovn6lwVyN4h3zNmt
 WGp9oM9vr0RkkNupg4yFuiEu7zjgQxpOQlx06KH6o/uZANJViv2EWWPZKkt1IXgFQVAuif0GtAw
 ZkliihlltoaiKCqddVu4OXYj/qnvuUuF6G7foQIViWDBPTA=
X-Google-Smtp-Source: AGHT+IEjY22nf+HJm5dG/LTOIsIo4H/4z+4niPxH26Ef5JkLIH1ukO6dyTiSntOrt+aq22qIkeKgNg==
X-Received: by 2002:a5d:6d03:0:b0:38a:88bc:aea6 with SMTP id
 ffacd0b85a97d-38da5379d16mr2669290f8f.6.1738681359268; 
 Tue, 04 Feb 2025 07:02:39 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc265c0sm227841675e9.10.2025.02.04.07.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:02:38 -0800 (PST)
Message-ID: <03e348d4-e879-4daf-9d4c-5b4ea84bb08e@mind.be>
Date: Tue, 4 Feb 2025 16:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20241224161510.410850-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241224161510.410850-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738681361; x=1739286161; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xeHYF+GhhgU8j380WOcVIP/XxePaNdrZp2ys0YpKUB4=;
 b=A6cdvjHWjiIomC1Va3UHb1pHg+V3+2YSPhIAGmxZXtwWTRue8qRsPrCY5HQaVwrW9i
 l19AN9Jn6c65e4NeJcJTxv+MkzC7XG4vOmoVk9Or4tby4DnatTjCbmyKy4Lvk6O//Tys
 j6xaCEsJTpHRdN8S+hAE7C2nCQolqcq9gkD6nxYc1rYeg4FNJDi3T9rhceb8EO/iOwcj
 62jDpks+PvaKAmb/z9zmt5zN+LOOX2VbM75zcHV281erpbVT8ia1zwoNe1F+Z7wOVzU1
 cpvoCncKoWEmhxXUCCbAjJl3Q6Ie6gX17LMPuq5T1EIPBxclIsp9zM1LEzTal6pR91ae
 uS/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A6cdvjHW
Subject: Re: [Buildroot] [PATCH 1/2] package/mender-artifact: bump version
 to 4.0.0
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/12/2024 17:15, Adam Duskett wrote:
> License changes:
> New:
>    Apache 2.0:
>      vendor/github.com/Keyfactor/signserver-go-client-sdk/LICENSE
> 
>    BSD 3 Clause:
>      vendor/github.com/ulikunitz/xz/LICENSE
> 
> Modified:
>    BSD 3 Clause:
>      vendor/golang.org/x/sys/LICENSE:
>        Google Inc -> Google LLC
> 
>    MPL-2.0:
>      vendor/github.com/hashicorp/go-retryablehttp/LICENSE:
>        Added "Copyright (c) 2015 HashiCorp, Inc."
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/mender-artifact/mender-artifact.hash | 11 ++++++-----
>   package/mender-artifact/mender-artifact.mk   |  5 +++--
>   2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
> index e87d52fa72..c4209f44a0 100644
> --- a/package/mender-artifact/mender-artifact.hash
> +++ b/package/mender-artifact/mender-artifact.hash
> @@ -1,6 +1,6 @@
>   # Locally computed:
> -sha256  3fc2d45bedf28843f84c4b8fcc6a9592e1dc176fc91123d99a5172935d7c78a0  mender-artifact-3.11.2-go2.tar.gz
> -sha256  8c41e20f891ae04abd2d32367248eaf33e1bd2f1328789ab60b8b0d10cc414a1  LIC_FILES_CHKSUM.sha256
> +sha256  fc11754f12d9104fce5b62738739d07514b4bd975f5e87d411d4e381533a2c6d  mender-artifact-4.0.0-go2.tar.gz
> +sha256  d4f369175698aa60b6e0a99413663af3212dc4c539de42ee8a9cda15d4ace40f  LIC_FILES_CHKSUM.sha256
>   
>   # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
>   # following command:
> @@ -27,14 +27,14 @@ sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor
>   sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  vendor/github.com/go-jose/go-jose/v3/json/LICENSE
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/go-jose/go-jose/v3/LICENSE
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/google/s2a-go/LICENSE.md
> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/github.com/Keyfactor/signserver-go-client-sdk/LICENSE
>   #
>   # BSD 2 Clause licenses.
>   sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
>   #
>   # BSD 3 Clause licenses.
>   sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
> -sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
> -sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
> +sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/golang.org/x/sys/LICENSE
>   sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/github.com/klauspost/compress/LICENSE
>   sha256  75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/github.com/russross/blackfriday/v2/LICENSE.txt
>   sha256  17b5d209ba8f9684257ecfcff87df6ceda6194143a8fbd074f29727cff6f0c40  vendor/github.com/google/go-cmp/LICENSE
> @@ -51,6 +51,7 @@ sha256  b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3bac4722  vendor
>   sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
>   sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/time/LICENSE
>   sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/klauspost/compress/internal/snapref/LICENSE
> +sha256  701cbcc144a7c865b072f27547e66ddbf17ac44a3bd21f71149ace02518f107c  vendor/github.com/ulikunitz/xz/LICENSE
>   #
>   # ISC licenses.
>   sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
> @@ -77,7 +78,7 @@ sha256  bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor
>   sha256  bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor/github.com/hashicorp/hcl/LICENSE
>   sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-cleanhttp/LICENSE
>   sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-rootcerts/LICENSE
> -sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-retryablehttp/LICENSE
> +sha256  d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e8644af77d3  vendor/github.com/hashicorp/go-retryablehttp/LICENSE
>   sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  vendor/github.com/hashicorp/go-sockaddr/LICENSE
>   sha256  d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e8644af77d3  vendor/github.com/hashicorp/vault/api/LICENSE
>   sha256  a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff  vendor/github.com/hashicorp/go-multierror/LICENSE
> diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
> index 399c194c99..4c6fa272ec 100644
> --- a/package/mender-artifact/mender-artifact.mk
> +++ b/package/mender-artifact/mender-artifact.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HOST_MENDER_ARTIFACT_VERSION = 3.11.2
> +HOST_MENDER_ARTIFACT_VERSION = 4.0.0
>   HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
>   HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
>   HOST_MENDER_ARTIFACT_LICENSE_FILES = \
> @@ -28,10 +28,10 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
>   	vendor/github.com/go-jose/go-jose/v3/json/LICENSE \
>   	vendor/github.com/go-jose/go-jose/v3/LICENSE \
>   	vendor/github.com/google/s2a-go/LICENSE.md \
> +	vendor/github.com/Keyfactor/signserver-go-client-sdk/LICENSE \
>   	vendor/github.com/pkg/errors/LICENSE \
>   	vendor/github.com/pmezard/go-difflib/LICENSE \
>   	vendor/golang.org/x/sys/LICENSE \
> -	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
>   	vendor/github.com/klauspost/compress/LICENSE \
>   	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
>   	vendor/github.com/google/go-cmp/LICENSE \
> @@ -48,6 +48,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
>   	vendor/golang.org/x/crypto/LICENSE \
>   	vendor/golang.org/x/time/LICENSE \
>   	vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
> +	vendor/github.com/ulikunitz/xz/LICENSE \
>   	vendor/github.com/davecgh/go-spew/LICENSE \
>   	vendor/github.com/stretchr/testify/LICENSE \
>   	vendor/github.com/urfave/cli/LICENSE \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
