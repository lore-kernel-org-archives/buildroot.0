Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86E2C25B75
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E67141596;
	Tue, 14 May 2024 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dk2D5bds58eC; Tue, 14 May 2024 17:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2356D415A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2356D415A3;
	Tue, 14 May 2024 17:27:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A20BF1BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D91C405C3
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBkcNPTU0Wfd for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 17:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5003B4154F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5003B4154F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5003B4154F
 for <buildroot@buildroot.org>; Tue, 14 May 2024 17:27:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 74FD719F5C2;
 Tue, 14 May 2024 19:26:54 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35354])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 May 2024 19:26:54 +0200
MIME-Version: 1.0
Date: Tue, 14 May 2024 19:26:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20240514154250.1453970-1-james.hilliard1@gmail.com>
References: <20240514154250.1453970-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <4e9d5bc99a30a885dddb8aba6145f56d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715707617;
 bh=9UU8Xx6Zs2WN230GTdkuOsU3BrUlrQXts7J1P9X0w7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YvM0JKVLUSzw0HreJT7VwFBDMkIBRJNRruCm0Q1Cn4uZVM23AO+pl7lUH7CeUaHBr
 mnCd8Kfr0COzoOriLPEPcqgCcSBJVb5ndlPyQC2QfWb7p/kNr7sBc7Ue4UMFrDZ0rB
 hBfI1XbiCA+WFofX0+T5OIO/WG3Wxlk647pHoi2eButvGXqR4amn/xayp5RN2kEzFD
 ki1xx4Y4ZWeSPHyzK1AiiQIBVc2gdwpsMwHaTgplPawDCHIjlvQckkjRzMh557Grko
 Api2ZlPu2Oq9xXZll+/QRYTgzZnE7GJM0YrKm4ZVDkWWZsZcZhyc9k9aJwCyBGjXLd
 1SPFahw+wHzJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YvM0JKVL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: skip
 dependency check
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Thanks for the patch!

I successfully tested it on branch master at commit 9764258 with 
command:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_python_ml_dtypes

On 14/05/2024 17:42, James Hilliard wrote:
> This package pins overly strict numpy dependency versions apparently
> for compatibility reasons that don't appear relevant to buildroot.
> 
> This package also appears to pin an overly strict setuptools version
> for unclear reasons.
> 
> See:
> https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/pyproject.toml#L51-L55
> 
> To fix this lets just set the --skip-dependency-check build option and
> ignore the build dependency version mismatches since they don't appear
> to cause any build issues.
> 
> This error was introduced when we migrated setuptools to pep517 in
> 8937db8dd595e0988751e5dbb568e870b07b39cc.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Julien Olivain <ju.o@free.fr>

> ---
>  package/python-ml-dtypes/python-ml-dtypes.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk 
> b/package/python-ml-dtypes/python-ml-dtypes.mk
> index 676137ecf1..8097265078 100644
> --- a/package/python-ml-dtypes/python-ml-dtypes.mk
> +++ b/package/python-ml-dtypes/python-ml-dtypes.mk
> @@ -10,6 +10,7 @@ PYTHON_ML_DTYPES_SITE = 
> https://files.pythonhosted.org/packages/39/7d/8d85fcba86
>  PYTHON_ML_DTYPES_LICENSE = Apache-2.0
>  PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
>  PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
> +PYTHON_ML_DTYPES_BUILD_OPTS = --skip-dependency-check
> 
>  PYTHON_ML_DTYPES_DEPENDENCIES = \
>  	host-python-numpy \
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
