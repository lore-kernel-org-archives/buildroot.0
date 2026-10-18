Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113B5CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB97E80DC8;
	Sun, 18 Oct 2026 20:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptheYFpboJM5; Sun, 18 Oct 2026 20:52:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ECE2880F59
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356744;
	b=cVCiY4GuDWVkHUOtBuERGsYbC//cuFMzcYHL+VTx/pZfWrVVT/OyGqWarDgyxnGMak3Y
	 3nyel1hTJ1ENvfL6iSBd9BKCWZnE/VhMW2KBNk5IVMIul7qx2mcjKRHDuoEwIpcY5GFAV
	 Ih1onvbx6wEwz8tqthCr2mWqEeanx+O4s50vN66S5z7V3g0BLPrKxasz4ODd2O7a4Q1RS
	 Y5uA0y+x/tyWVu3EzMaWkZNCu0s6uz96rM+8Jhjq6TmRtAf+gsCinJFM9+ULWhBf9TLsv
	 Ju9oCxJJP3w+A8RFCHgUkDh8KBX+sP/oVvToSJVNUBkzZsXdsy513ZTbcX7mTXyLxoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=WYnojMHly450e6FnPk7Zb4tVVH4t35QeZj4K6mdjngQ=;
	b=m/rV5EjfhzaR3oa8GxyhJldYxHG3IJ8GTnXBx4DHGrUOisFFRKrbGfYJpjkwC1w72g3f
	 sfsGhe/BDrJyV3JHoEnmxKS2Jdvxi5A5co/ud/2+gbU7z6/2PtBGXBGfqs2BhKxFe/ntE
	 yKEqhNfjMkVKYwN+9ZjChkA4h36qm8b/LX8L+m9e7TiCJIi0qSK5c2SzLXlBeLhnNeVxP
	 MPeLcbLFnrI7YjjwpmrOYuHNlNlNLaO9MvNQjsgTL7JNFe2d5I2jeFz2yaKYlpT0kk14c
	 YjAEhnlFtYKuS7UzAs5E/6EZqdTEuqgSaH83aATjllFfFeB/7KHHdEvozoXczgNGRZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356744;
	bh=WYnojMHly450e6FnPk7Zb4tVVH4t35QeZj4K6mdjngQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QaSJSrJWVSB/3REK05oyDMnjLtQeR3dcu3T35cXf3iwqSOVvJG0hNeNTz8x1BJJ6o
	 XOmcRFNNX8XiCuJj+m6DDEwAH3TKVQhXXlnx9NdSLTUqlpcpeOBZhATU1p6KpaohTe
	 N8mS5qxDprAjmCJuQABlBqy0g0NTWGXDlKUuGYeG7YqoIV/gWFctfDBPEGP+3DH8ri
	 bxWcsT5NyzXJmWu1EbFYjudnXWcH9RCuk8C60Q2aH8g1AYoGfHcBhoGioMHhoCDw7x
	 wE1z7LSxj/Fxh0KFC+i4ZuH1O4+v/S5pDq+SR9hu7D8hapwCYWeftrv/LF/aSsjP8o
	 nYJxJrFDzfv9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE2880F59;
	Sun, 18 Oct 2026 20:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59D811AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D7260722
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tGtTjNys_Ao for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:52:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3CD36072F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356741;
 b=QwmWZZbfl4IFbGHzcK13na3y93HONf17gZL1RjsKrEYfBAe12Z3Edg7KdrKDl4TyuRgS
 MwrN0OrxKxZ2WpdDIHe+B03BXmSNEInb53qdL3h7OW0jX5S2q+v4uwKrILH6YvAd4Ed8z
 3X9BBBxO4Nk3OFKwJzYeVm4u9sWVSmn33j7OxjSmWc7CLh4Cx4CvKZ6S1xwEn67s4xYW/
 t6Iz6B9XVMdWCCwuj3Rp1xD9bCYX0k4xwh3S59ZTEIKQcGpKhnpwHRMLqDSuTfgvLbZhx
 eyEx9Zc0uKD+fJvAew8pkaUIz7YC6D3WqogQ+BJtEuh+pluO4q08wHphIVMzPQOqS8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356741;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Y6c7uHuZTAS/bAUzDdF9IlhAa3nYailMMrJVF7oelYI=;
 b=opM9uGzehZRyG3odt2H7emMCYiX9IFGbTiI222jraxykWwDF6ol9qgmcEZWb44XP14Ar
 yMkybKhzRJoJITTFhQCuRh//R5jqLqjj2z08W1+p4iWtTqjlhc3//8K5Y2i3ikPgUTmbm
 9vJWuT2tP/fOhcKHJIwurCCoTS/k5xlkpwoIEQetMN0hpZg/IykTwPacOSBaUqRHl9Rlg
 z5DQ09PNTp730MnB4kLXGKXx4xOzZ8bV/OFnIlcSJETyi8KdWOExSfElJdECzwg3G57CO
 CMh6oXOm1E//yg4ZyD4Qkre3YyK9WvTCbDBaD/2EnFevF++iID/TK76XQLVAp2shRkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=HEyfnOKc; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3CD36072F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:52:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1woNvM0s7e-00cjz1; Sun, 18
 Oct 2026 22:52:18 +0200
Message-ID: <0f02fd51-84af-47c1-8ebb-6d2d9edcebd2@gmx.de>
Date: Sun, 18 Oct 2026 22:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261018182507.536698-2-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261018182507.536698-2-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:4PS2We6y/NUkoLEeNYZNI+A7J9zN31jV6wj3JEaPGXg/XfOTfiF
 nm3B0IlP+u3MbcYIB+gwYhDGFVtLIRvvAZ9LIF/kJyuM3N6I9y0HquvlJvHG9gSCMXjfCHF
 nq0jRucmKo0LjRzmM5b7AFcd/UWDVFBhOG7rSLkv60MfXgH5WILxOYRUkX8xmc3lj3ut5Pk
 yAbvFJQlGNNbKmV7zvuGQ==
UI-OutboundReport: notjunk:1;M01:P0:mA0u8TKd+So=;ZcpmvmjUYmsuAy8mx59OaOa0DBM
 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
Subject: Re: [Buildroot] [PATCH] package/python-certifi: bump to version
 2026.10.18
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 18.10.26 um 20:24 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you!

> ---
>   package/python-certifi/python-certifi.hash | 4 ++--
>   package/python-certifi/python-certifi.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index a0c24e66f3..c6e0206ea8 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
> -sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
> +md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
> +sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
>   # Locally computed sha256 checksums
>   sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 17c6925ae7..5430596350 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CERTIFI_VERSION = 2026.7.22
> +PYTHON_CERTIFI_VERSION = 2026.10.18
>   PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
>   PYTHON_CERTIFI_SETUP_TYPE = setuptools
>   PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>   PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
