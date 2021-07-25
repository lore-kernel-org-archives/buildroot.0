Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA904C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F99A6069E
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F99A6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB57605A1;
	Sun, 25 Jul 2021 16:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42rZLdhA0tFQ; Sun, 25 Jul 2021 16:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3218260612;
	Sun, 25 Jul 2021 16:01:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD7A1BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D2E401C8
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMgSrdSpChkv for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 16:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2350240184
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 16:01:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id jg2so7369711ejc.0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UnYKLSp4aKhorIrKqo3rd6EKl7j1EAHMUX7NaD54H9Q=;
 b=Y3NiLHj61h3lnQRDPg6cIXW+b+0q+7E4ViQRGklrY4HW3fCBMYElPSCHIc7dHtDBsF
 TRh7KMOtMY+u6uDi45TCPwhW9t44+8rQG+r2n+RQbi9OOpBP2Bn0wnoaIVjUwIBnDEa8
 7VbrfRCH5cAytt1lS9TcJyevtDD4YlPSUqNLIsHzIvHs23gxpWvl8LaadYa2yhiwhrsG
 2XZ4Ua2ENCNbzCLJMNWkGfoNNiu8bQ0Qm+qPfghiFZC0RHU8zVoot78WJsSGpgMKMb7B
 c4gJl+Sdbgvq8GtHk/eAoc9Zb51zP9zEIrcDvjvJYw1ekYO/tSblNHA02KYPEthnWqJD
 d6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UnYKLSp4aKhorIrKqo3rd6EKl7j1EAHMUX7NaD54H9Q=;
 b=Mx2jv8n1QPvqUVC2a9VsjAouJaxAp15GKi9idlW4UPSc6xVC7TSBTsoVhkbaRL62qZ
 YDS2U4leu3VQtMSJlBTtG3iMS/dQxrqnGOQr64DjYqDp6PuLNCLstcNYKP1emyKoU5Ai
 ExddfyaJx9TuWt3xYg817P1QXXHYkSfSoTJhLrVr3w6IOaJ+iXjlRpBSr9m9Svmw1Pss
 N0w59NGgC+hVKhfBdM2uNISEcd/TpOxVMdosihqTJL4lP5bnE1kbhloy2VFdIDkj1a2Y
 G7NP+lv2Yu2fe7g4LzcGm+9xtN4TvrwiUh5o8+YfOKL/e4PRJ4Er5XMjXWYCu7Xa1m5Q
 PKVA==
X-Gm-Message-State: AOAM532n3+WKgHxfFh1Wxv+m/ddvx5b9G5CLPH0z698/QabbFsMM4yQy
 Httob3GWOD5uFMxl0L66MpqJXSCitiLAHqjr
X-Google-Smtp-Source: ABdhPJztfNC85KjF0XA/szp/YWH2/Pnx6iDreziI9eq+SuSjwfJjQ+MjIFXJv1l+E/TAdreaYdiXeA==
X-Received: by 2002:a17:906:dbd9:: with SMTP id
 yc25mr13529992ejb.367.1627228873112; 
 Sun, 25 Jul 2021 09:01:13 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cb4sm13480021ejb.72.2021.07.25.09.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 09:01:12 -0700 (PDT)
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20200220201149.7426-1-vfazio@xes-inc.com>
 <20200220201149.7426-2-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a576ed2d-1f26-5d05-89c1-994133a854f1@mind.be>
Date: Sun, 25 Jul 2021 18:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20200220201149.7426-2-vfazio@xes-inc.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 2/2] package/nvidia-driver: bump version
 to 390.132
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Zach Vargas <zvargas@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 20/02/2020 21:11, Vincent Fazio wrote:
> From: Zach Vargas <zvargas@xes-inc.com>
> 
> Support Linux kernel 5.4.
> 
> Change the 64-bit download to exclude 32-bit compatibility libs.
> 
> Signed-off-by: Zach Vargas <zvargas@xes-inc.com>
> [vfazio: 64-bit package change]
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

 Applied to master, thanks.

 There was a later patch by Jakub that also bumps it to more recent versions for
x86_64, but there were some problems with that patch, so I used this one instead.

 Regards,
 Arnout

> ---
> Depends on http://patchwork.ozlabs.org/patch/1181847/
> 
>  package/nvidia-driver/nvidia-driver.hash | 4 ++--
>  package/nvidia-driver/nvidia-driver.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
> index 79ac052610..7f2248d0f9 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256 6f4af70ee3d03ed31c497a5d555164c56057b53ecedfc0d2c8de4b0b90728805  NVIDIA-Linux-x86-390.67.run
> -sha256 6df2ca1a7420b6751bcaf257d321b14f4e5f7ca54d77a43514912a3792ece65a  NVIDIA-Linux-x86_64-390.67.run
> +sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
> +sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
>  sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index 0ac8d2a5fb..75041ecb46 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -NVIDIA_DRIVER_VERSION = 390.67
> +NVIDIA_DRIVER_VERSION = 390.132
>  NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
>  NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> -NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
> +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
>  NVIDIA_DRIVER_LICENSE = NVIDIA Software License
>  NVIDIA_DRIVER_LICENSE_FILES = LICENSE
>  NVIDIA_DRIVER_REDISTRIBUTE = NO
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
