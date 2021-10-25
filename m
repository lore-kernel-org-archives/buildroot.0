Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14549C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B508D610A5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B508D610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 825B480F0A;
	Mon, 25 Oct 2021 19:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAfn4_gqekBi; Mon, 25 Oct 2021 19:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE16580DFC;
	Mon, 25 Oct 2021 19:21:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E99CC1BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A9C60774
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8ChsJZggeo3 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AA7460765
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:21:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z20so3795049edc.13
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Yy7N2tQ+nelxCMIoMgfWLkmvCmjS5cMwMCjknxs58Hs=;
 b=cmH8Xpca0s3nluYO43EU1Bn8s2zFIexPxMQ/AhwfiypZ4tUICYhAmulhc0xlCCk3CW
 CtPX7GpF68svLGDPyTgI9Ehb/WxMzKn6OXIcBzreG1T/HrtjyUY2IVvuVbQgSzzoardH
 V9SJh4EZM/yix1znM2gFKzhPJQg2hDC3WUpBOlm7PnvbikGmw2mC6Qg1j52BCjYlivgg
 eWrPWzG7iKYfdWUMzejBjAn1zk92yROPf2Krhy64WWO3roVw2o0wcNNODW0InEAb9v0m
 jVrT1v2d4ZeI7LoT1DWS4kWpehwsGPI6fL4uJSFPoQ9QucscDn5JpRWA1UtcO7HU0W1X
 86zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Yy7N2tQ+nelxCMIoMgfWLkmvCmjS5cMwMCjknxs58Hs=;
 b=48gZ634HB82Ixywqq7aSDoMS/l9PnXVPV6EY82xXuflKi7dEp3h90ttZeB1c4t/smC
 /vRVZdoBJhKQBevt003IM1CkZr8VWzohvR+0HaZuLCYyvq4zVIuvFvPJ2dlRDXcjEstV
 x4VlTXdfLRCMmqv13IBnTaBx6puL7YdUtbFCTOCzObtOCbqbiN7T+Lyom3WJeOXpcR5J
 Ti029dAalaaiWgGanRo8LGuQXb02K+sfE1rPSAPpSCZw/E/HCMJ7wNYhM2GD9Iz4jAt7
 PvQqjJktR8emsG47VipzlEPlespT6aFwyNsmw2yDKypQXP0ZyMwDCklwRQpms6iTpPGs
 mfYw==
X-Gm-Message-State: AOAM531zak1Jno+3gA9X/6JRcQRm9D+q747RyuIFacsm/Rq0EmiOG5eW
 9gs54HVkh86K7iG/XLVXQ2rVJQ==
X-Google-Smtp-Source: ABdhPJz3YpLEmqorFE7p8uTiViTy8u5TaefDbDwEvZkxMdQTL++z81dMn78MAgluB3Uv9gqQj4F8rQ==
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr19761956edc.93.1635189686276; 
 Mon, 25 Oct 2021 12:21:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t19sm7873831ejb.115.2021.10.25.12.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:21:25 -0700 (PDT)
Message-ID: <6e3f4b51-188e-e198-9274-39bee449888c@mind.be>
Date: Mon, 25 Oct 2021 21:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-4-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014225849.832479-4-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 03/11] package/python-txtorcon: bump to
 version 21.1.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2021 00:58, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-txtorcon/python-txtorcon.hash | 4 ++--
>   package/python-txtorcon/python-txtorcon.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
> index 803933f1e6..af542c7f2e 100644
> --- a/package/python-txtorcon/python-txtorcon.hash
> +++ b/package/python-txtorcon/python-txtorcon.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/txtorcon/json
> -md5	fb323f9874298a8145dbe8d43c387932  txtorcon-19.1.0.tar.gz
> -sha256	25d8e52c3eac45bb90ff958ca7cdd7674fb3284e3a50826a58ab7b9578b15ea5  txtorcon-19.1.0.tar.gz
> +md5  dbb53821a3ce3e921e09c5de4f722fdb  txtorcon-21.1.0.tar.gz
> +sha256  aebf0b9ec6c69a029f6b61fd534e785692e28fdcd2fd003ce3cc132b9393b7d6  txtorcon-21.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
> diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
> index 4df400c3e7..b8414d96d0 100644
> --- a/package/python-txtorcon/python-txtorcon.mk
> +++ b/package/python-txtorcon/python-txtorcon.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TXTORCON_VERSION = 19.1.0
> +PYTHON_TXTORCON_VERSION = 21.1.0
>   PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
> -PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/8c/26/d5b2fba4ffbcb23957ff2cee4d7d0a2d667372b9eb04807058bd561c8e8f
> +PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/eb/43/2426009377cef519c53bdc8969590cb100e9fd745846859963c881c6d176
>   PYTHON_TXTORCON_SETUP_TYPE = setuptools
>   PYTHON_TXTORCON_LICENSE = MIT
>   PYTHON_TXTORCON_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
