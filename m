Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A751C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:14:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD3060EFE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BD3060EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC0480C62;
	Mon, 25 Oct 2021 19:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJh3jZGBSnSJ; Mon, 25 Oct 2021 19:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A0580C00;
	Mon, 25 Oct 2021 19:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4A61BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8882B80B69
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TbwCzaiiIlb for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:14:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4375D80AA6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:14:10 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a26so3599151edy.11
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u8AdHALsc5pHl+Ln45qiNb76ITYyFO1KUNue8sEB20Q=;
 b=OwZuax26vqnH0ujmvvNI4MRXKiKdlIrHyf/8vQpdVLdtk8+aRzznYt9I+D+mWpxS7g
 WXVgP24TGdSBqzNs3IopiKKmSASOYKARe1mF3KZCKFhpoXcQAU9iDV/junFWm97aQZOK
 u0tGCUbqXpw7nMkiB3XlswVyDS0hsOpXmQ4hMiuCZQ434BbOPYQnOTsuVknXj1im7+kn
 5ZzC82zRc/+8/VG0dZoqjITP1c6GltqVfZcOCzRtk8dVu0+G+2Z40M5rxiEc22cHX7r9
 kPw9WdyhQeVrsVY1gG31ARxHJ31p051fUZeNxWN+cRCrj/j2rWHDDRKmGNT6FXoUTln5
 FLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u8AdHALsc5pHl+Ln45qiNb76ITYyFO1KUNue8sEB20Q=;
 b=kABNwYbZihoRMUtd11nT8xLkPe0vH750vw0XVxS4+gkR3z+nbY3pF5nPVOk1Ranzw3
 2o9GnPB0UGTmo/Jj+j0jPZKli1MPE0MlyyLNRa4sR1HFdQGTBtjz12L2gc7V+/pNgZqj
 o4kaa4R+PFZPV1lYqODIRZFFcooWAWzqEUDrwpjXbSG9ZVGOcvzq0c+qTs71kWCEOEuw
 cTFxpkk2Ey2i/KHGoskJASWtl78MsrO1Ys8nYH9m24FxVUSHXcqZEtco3KMET7FBi5gJ
 bnK/YMBz4dC0uwN2diXnFA+UgJg2CRXrw2FefX5EbE4SJ/JWbWhMB1m3ZLf4N1AXxV6U
 KbSA==
X-Gm-Message-State: AOAM533oP+0H7w8neZ3hJRZl8SmH+al+t7Hi+ENwL5EQKbhcOcSwofp7
 m5INOTTmoFj6G2nfRNdhRx3hvJEs5VXE3/ec
X-Google-Smtp-Source: ABdhPJyMLWz1tEkc1suVHfEpRck3pYcNNCMCAbr/jsK/dSBolHTeO3iWjGdqDw15by3tTkMGSS8wpQ==
X-Received: by 2002:a17:906:9b88:: with SMTP id
 dd8mr25442808ejc.467.1635189247293; 
 Mon, 25 Oct 2021 12:14:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q2sm8044992eje.118.2021.10.25.12.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:14:06 -0700 (PDT)
Message-ID: <ec530889-82eb-1277-0d69-3142abd16c8a@mind.be>
Date: Mon, 25 Oct 2021 21:14:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-5-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014225849.832479-5-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 04/11] package/python-watchdog: bump to
 version 2.1.6
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
> ---
>   package/python-watchdog/python-watchdog.hash | 11 +++++------
>   package/python-watchdog/python-watchdog.mk   |  4 ++--
>   2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
> index 701c7991a5..3b633f9156 100644
> --- a/package/python-watchdog/python-watchdog.hash
> +++ b/package/python-watchdog/python-watchdog.hash
> @@ -1,7 +1,6 @@
> -# md5, sha256 from https://pypi.python.org/pypi/watchdog/json
> -md5	7cdc103f607e72fc32c206301a72d1b2  watchdog-0.9.0.tar.gz
> -sha256	965f658d0732de3188211932aeb0bb457587f04f63ab4c1e33eab878e9de961d  watchdog-0.9.0.tar.gz
> -
> -# Hash for license files
> -sha256  14e636faf5889138a1bb7a8498ccbb0266aee31d2dc475201a10448e56ed3d96  COPYING
> +# md5, sha256 from https://pypi.org/pypi/watchdog/json
> +md5  6aac660b0f3358c63658806a0579b832  watchdog-2.1.6.tar.gz
> +sha256  a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7  watchdog-2.1.6.tar.gz
> +# Locally computed sha256 checksums
> +sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING

  In this case, it's "and contributors" that is added to the authors.

  Applied to master, thanks.

  However, I gave up applying the rest of the series for the time being.

  Regards,
  Arnout

>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
> index 44929a65ac..2dafef97e1 100644
> --- a/package/python-watchdog/python-watchdog.mk
> +++ b/package/python-watchdog/python-watchdog.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_WATCHDOG_VERSION = 0.9.0
> +PYTHON_WATCHDOG_VERSION = 2.1.6
>   PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
> -PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/bb/e3/5a55d48a29300160779f0a0d2776d17c1b762a2039b36de528b093b87d5b
> +PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e8/a8/fc4edd7d768361b00ea850e5310211d157df6b5a1db6148dd434e787d898
>   PYTHON_WATCHDOG_SETUP_TYPE = setuptools
>   PYTHON_WATCHDOG_LICENSE = Apache-2.0
>   PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
