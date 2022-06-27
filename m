Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21DAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 14:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E48281959;
	Mon, 27 Jun 2022 14:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E48281959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gyNLziBzJxlb; Mon, 27 Jun 2022 14:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163AE818C0;
	Mon, 27 Jun 2022 14:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 163AE818C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFEDB1BF2C2
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 14:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B88EE8186A
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 14:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B88EE8186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuYFrU3vs-gh for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 14:48:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AAE3817D3
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AAE3817D3
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 14:48:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id sb34so19629778ejc.11
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 07:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XIdiTx8JL4BZQH00+qsODu223RWDUBPET3m+MNzRIHo=;
 b=ikg2kPorbo6nMJmpe11aeDoV/zMtAKe3uXXRtHADJ3lB0wHBpxjEN6pxYTCmynp7y9
 x+68pJqYcXTKX54PuFDZbUvq/jqkKVByQJWOYj9FSP1DE86CcYTHeIf5hRzPOQfVNeyf
 fqkRsWjxs1u4DH45flfaOsP0RlRiX29w6GirOYxJzz8mSmxFtmAG1whTScxYxrPgiwCk
 NMpQBV+6vwtvezDGPVQqsg2rQjCHWdPsCoozHznrHWuL7oiFLbpeYttZ+InANj+nhANP
 E7nskC84iYhI98pxP+KoheWlfqXfW63i/4fdsLQsAAm3753jwtgJ83IESdCm0PeqEPv+
 9pZw==
X-Gm-Message-State: AJIora/n+CcuKVO4oG25i/3Cq5ti8vEaOqhXIGtyoGPWB2Z7YZkuMBbd
 nQkXEU8L/PhXecrZL3VZSF4=
X-Google-Smtp-Source: AGRyM1tYW0J3gxmr+HNPNvpnh/+4pKJgYStBH/1Xk302t+5inVKDxOrPNBbEUFJtUxO7cMnAte6YhA==
X-Received: by 2002:a17:907:7e82:b0:726:4211:60e7 with SMTP id
 qb2-20020a1709077e8200b00726421160e7mr12877913ejc.665.1656341312654; 
 Mon, 27 Jun 2022 07:48:32 -0700 (PDT)
Received: from ?IPV6:2a02:8070:41a4:2c00:b6c6:fe17:60a3:53ae?
 ([2a02:8070:41a4:2c00:b6c6:fe17:60a3:53ae])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a1709067b8300b0070efa110afcsm5065076ejo.83.2022.06.27.07.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 07:48:32 -0700 (PDT)
Message-ID: <2128cc33-8540-d034-761a-d3cf824608c1@googlemail.com>
Date: Mon, 27 Jun 2022 16:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>
References: <20220626134142.9304-1-raphael.pavlidis@gmail.com>
 <PH1P110MB1603A57FB018D70B7354613F9FB99@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603A57FB018D70B7354613F9FB99@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XIdiTx8JL4BZQH00+qsODu223RWDUBPET3m+MNzRIHo=;
 b=f1bELs3V/TXyJl6WXUkUJobYsOVoKV8EqRjjKddiRm7Ywx4m3vZaUz0srU83/uvfM5
 OQmrNRWrq8UtgsG6iW6gvZPWrHfvuqGbldrNs4npmbO6G88PGLNEO45h93JhLhGblmYr
 lPrR3gdBlhveWHca/lzmYpnFZ9F5kx3qGahTfMFkP+g/qYody9FBCdduRxpB9rt+rIO1
 MsNghsXRKlRa5hwPBReubs3ynk02+TbySUFRstBdmvquvGodXT0zkNo1zmTxw18KQ9gK
 u791xoQ61C+fbGPJqPjrakZ6MYFryW9T2iBo3D+Ibt4wRRsKsfpo7DgXQDde+E+OZuXy
 PWSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f1bELs3V
Subject: Re: [Buildroot] [External] - [PATCH v1 1/1] package/nvidia-driver:
 bump verstion to 515.48.07
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,
thanks for the info. I did not know that the newest Nvidia driver does 
not support legacy GPUs. Alternatively, I could create a new package 
with the name nvidia-driver-latest.

What do you mean by: "replicates the C implementation in Python that 
works for the BR package(s)"

On 27.06.22 14:36, Vincent Fazio wrote:
> Raphael
> 
>> -----Original Message-----
>> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Raphael
>> Pavlidis via buildroot
>> Sent: Sunday, June 26, 2022 8:42 AM
>> To: buildroot@buildroot.org
>> Cc: Yann E . MORIN <yann.morin.1998@free.fr>; Raphael Pavlidis
>> <raphael.pavlidis@gmail.com>
>> Subject: [External] - [Buildroot] [PATCH v1 1/1] package/nvidia-driver: bump
>> verstion to 515.48.07
>>
>> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
>> ---
>>   package/nvidia-driver/nvidia-driver.hash |  6 +++---
>>   package/nvidia-driver/nvidia-driver.mk   | 24 +++++++-----------------
>>   2 files changed, 10 insertions(+), 20 deletions(-)
>>
>> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-
>> driver/nvidia-driver.hash
>> index 7f2248d0f9..06cf292c58 100644
>> --- a/package/nvidia-driver/nvidia-driver.hash
>> +++ b/package/nvidia-driver/nvidia-driver.hash
>> @@ -1,4 +1,4 @@
>>   # Locally computed
>> -sha256
>> 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275
>> NVIDIA-Linux-x86-390.132.run
>> -sha256
>> b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d
>> NVIDIA-Linux-x86_64-390.132-no-compat32.run
>> -sha256
>> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
>> LICENSE
>> +sha256
>> e28764cc5b13c32e76370513daeafc05c289b77ee0511552450f1a00e31ae1e3
>> NVIDIA-Linux-x86_64-515.48.07.run
>> +sha256
>> 9ec1515cb214261ae4081a6fc9489800b5fef41c6a8d669e84e4ab1de7f3dc14
>> NVIDIA-Linux-x86_64-515.48.07-no-compat32.run
>> +sha256
>> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
>> LICENSE
>> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-
>> driver/nvidia-driver.mk
>> index 54c2aa46d8..d12fa543bd 100644
>> --- a/package/nvidia-driver/nvidia-driver.mk
>> +++ b/package/nvidia-driver/nvidia-driver.mk
>> @@ -4,7 +4,7 @@
>>   #
>>
>> ##########################################################
>> ######################
>>
>> -NVIDIA_DRIVER_VERSION = 390.132
>> +NVIDIA_DRIVER_VERSION = 515.48.07
> 
> I don't think the discussion has been had on the ML, but I know we've discussed in the IRC channel that there may be a need to duplicate the nvidia-driver package and differentiate between the latest production branch and the legacy branch.
> 
> It's my understanding the new production branch does not support older GPUs which have been historically used in embedded systems [1]
> 
>>   NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
>>   NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
>> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
>>   NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
>> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
>> @@ -42,7 +42,7 @@ NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
>>   # So we only install the legacy library for now.
>>   NVIDIA_DRIVER_LIBS_GL = \
>>          libGLX.so.0 \
>> -       libGL.so.$(NVIDIA_DRIVER_VERSION) \
>> +       libGL.so.1.7.0 \
>>          libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
>>
>>   NVIDIA_DRIVER_LIBS_EGL = \
>> @@ -57,11 +57,13 @@ NVIDIA_DRIVER_LIBS_GLES = \
>>          libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
>>
>>   NVIDIA_DRIVER_LIBS_MISC = \
>> +       libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
>> +       libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
>> -       libnvidia-egl-wayland.so.1.0.2 \
>> +       libnvidia-egl-wayland.so.1.1.9 \
>>          libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
>> -       tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
>> +       libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
>>          libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
>>          libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
>>
>> @@ -71,30 +73,19 @@ NVIDIA_DRIVER_LIBS += \
>>          $(NVIDIA_DRIVER_LIBS_GLES) \
>>          $(NVIDIA_DRIVER_LIBS_MISC)
>>
>> -# Install the gl.pc file
>> -define NVIDIA_DRIVER_INSTALL_GL_DEV
>> -       $(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
>> -       $(SED) 's:__GENERATED_BY__:Buildroot:'
>> $(STAGING_DIR)/usr/lib/libGL.la
>> -       $(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
>> -       $(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
>> -       $(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc
>> $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
>> -       $(INSTALL) -D -m 0644 package/nvidia-driver/egl.pc
>> $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
>> -endef
>> -
>>   # Those libraries are 'private' libraries requiring an agreement with
>>   # NVidia to develop code for those libs. There seems to be no restriction
>>   # on using those libraries (e.g. if the user has such an agreement, or
>>   # wants to run a third-party program developed under such an agreement).
>>   ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>>   NVIDIA_DRIVER_LIBS += \
>> -       libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
>>   endif
>>
>>   # We refer to the destination path; the origin file has no directory
>> component
>>   NVIDIA_DRIVER_LIBS += \
>>          nvidia_drv.so:xorg/modules/drivers/ \
>> -       libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
>> +
>> libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensio
>> ns/
>>
>>   # libglx needs a symlink according to the driver README. It has no SONAME
>>   define NVIDIA_DRIVER_SYMLINK_LIBGLX
>> @@ -109,7 +100,6 @@ NVIDIA_DRIVER_LIBS += \
>>          libcuda.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
>> -       libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
>>          libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
>>   ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
>> --
>> 2.35.1
> 
> The installer framework for both drivers are similar and I have a branch languishing somewhere that abstracts this and replicates the C implementation in Python that works for the BR package(s). I need to find the time to update it and submit it.
> 
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> CAUTION: This email originated from outside of the organization. Do not click
>> links or open attachments unless you recognize the sender and know the
>> content is safe.
> 
> 1: https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
