Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C7DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:15:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C50D604E9
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C50D604E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D13BB608A8;
	Mon, 25 Oct 2021 20:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqlRGk5Pjard; Mon, 25 Oct 2021 20:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19CFE608A9;
	Mon, 25 Oct 2021 20:15:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 625A91BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B241400F0
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQZShetTeG0f for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 452F94014B
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:15:25 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u13so4170943edy.10
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mMOSdAp6Jc4sYjZprDXl0M52hEz4t6avyJFfhpPRt2M=;
 b=GfV9V1Ef3BjIWCSabYXqF6VxhG8O4I0i5yTDu72mbvdWNDsvxJU8seKiuRR6GREgKH
 y9R5UuH01+hgF+cyFi88gg9lsqFbmr77Cbyl9kqnSzgn3xuabV5C9KFp1AZTZETmebsc
 isk5y/ffGPd5l2G4+5qvVbIqsPJnxLHfhEBEJa8Ee0WuKJNXZ2/X6sDfoZCF/HpnF7nN
 Ysm4Kq5NSK1jQjphuAO0VDHR9/rzDiHOeKRxpwaiLKgLA+J3hFkjl3/fuLSPrxVT20H2
 oDNnEHLaDgrtVs87SOHxT8vq5nGGpCVVQCzYcuY2DrHb//8+ErfT4X4uT0tIFYaDLB1Q
 Sv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mMOSdAp6Jc4sYjZprDXl0M52hEz4t6avyJFfhpPRt2M=;
 b=jmcm7zlTVG2tJ+2PmPXwrJEibHwVeVOso1H8pCoozAEZs0JDeujSn52TFVmslZheSR
 PMSfHc6JO44yg8OWkDqslvlL3PyjFVGD8Vfnix+KmODfB5Rqh4GYNOts0KJiswySPXHd
 V4zd5X6a9Szj6kp0JlNX0i2SXv8IRYqdC+f2yngeQXlJYkSna3z6SvyEHwVgpoZsDOky
 PG1E9w76tZhJDB8u6gJbImia0fzSQovLjLCUo+vjFxAdD+MRP2SI3k8ns7gxdcDrxvVT
 6guwOtSENsLn8EL/O/GpwZYUCQDo84I6w/ffBOqyJqHYFEOG/VE6TX3zCIZDaHS06Lun
 EQRg==
X-Gm-Message-State: AOAM532V1O/8+ogO5YC6A7e7+4EComFJnjitTVpvtxJDWrNDEcupukBg
 47l6v07zH61QYzjWhr2uk9Qm1A==
X-Google-Smtp-Source: ABdhPJx3DJlUxwKKMIn6NdqO2b1PzpcXWVG+lulL+/dbFY6KxWdjBWbauPemvZdkTkvq+n/sIqivrQ==
X-Received: by 2002:a50:e041:: with SMTP id g1mr29095589edl.4.1635192923410;
 Mon, 25 Oct 2021 13:15:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g21sm3073174ejt.87.2021.10.25.13.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:15:23 -0700 (PDT)
Message-ID: <fe288cd2-5a6a-74a2-fc86-be2b480d1e11@mind.be>
Date: Mon, 25 Oct 2021 22:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/4] package/python-cryptography: add host variant
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2021 07:56, Fabrice Fontaine wrote:
> Since commit 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f,
> python-cryptography depends on python3. So python3-cryptography became
> redundant at that point. As python3-cryptography is a host-only package,
> while python-cryptography is a python-only package, add a host variant
> to python-cryptography to be able to drop python3-cryptography.
> 
> While at it, drop host-python3-pip and host-python3-six as these
> dependencies are not needed. Indeed, pip was never a dependency of
> cryptography and six is not a dependency with python3 and will be
> dropped in version 3.4 and
> https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/python-cryptography/python-cryptography.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 98c65e1528..1d903b03e9 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -14,5 +14,8 @@ PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
>   PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
>   PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
>   PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
> +HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
>   
>   $(eval $(python-package))
> +$(eval $(host-python-package))

  You forgot to update ca-certificates to use host-python-cryptography instead 
of python-cryptography. Could have been a separate patch, but I just did it as 
part of this one.

  Series applied to master, thanks.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
