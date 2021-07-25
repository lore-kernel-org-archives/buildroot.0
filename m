Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD54C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:45:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D49760F43
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D49760F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3926606CB;
	Sun, 25 Jul 2021 15:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYos0VilM0A8; Sun, 25 Jul 2021 15:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321EE605C6;
	Sun, 25 Jul 2021 15:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1366D1BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02BB96069D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqaT2Tx9BlA1 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:45:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D781A605C5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:45:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id nb11so12209077ejc.4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3BPxu5R9Eb7bonka2FOJwh1RxLKuJHmY3VLBtUceD3Y=;
 b=CJyO95NDR8TeaZkb76IEesVXf5WH8SP3ujzwoYac6KJwQubXCuJk6/C2BWwReLJH8r
 oSWBFtRgZ1fxWNnkUi+dfoNtAHsF/exdjgyxtdAp7IjZ9mB6xZoA5vkZWbzLMeQYsBod
 oMAxSTYxiy6GN3NRUspX7KKDx5fN/wDPfd9VPneC24Q3w5p9DoGHg5Ff69nbFCrZF/c9
 oi45Aiq9PD5JprzW0KgN1pe05e61yMvV2oiuPLQ0k2UhtmKiFBTgru3Gr94ZVOqo3+aw
 +SdR/GPg/zjDlbCd/vBXaEa2gl66OMwk9PGEAG2vACzyc9rC3QvIdoncdc+yJmb/FIOO
 j/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3BPxu5R9Eb7bonka2FOJwh1RxLKuJHmY3VLBtUceD3Y=;
 b=A4YcEo8Aw1jQ1Yqb1MLGnPrhJ/ND7sfKKTeB6s0ttUtCp8wTFiQeLZngyonQ0B3Pdn
 mm2njLrHBM2apWhuqz2T2/26RGcNl1BevQyKKfbSrELAy68BCRlHxoA7OHSlb/yCruRg
 mXlpAO8ISjRHGrz6hcq4OdZLwpQe8j/Wr9xBVS5xgS34v7wVOyRpAoVALNmejKFQdbnN
 oO3vRR9VW2BaX/5uvTRdNu7zupytURnbn7T3zI7w2g/0fSOfIz31GHg+4iuNbakZfsf9
 s/KOo8lr3sfWhoAxWK/d2utMF4UUNFdZmbOEe23k3XklS1a/aPeH28lLjDeMHMKjVtmp
 4/ug==
X-Gm-Message-State: AOAM532f3v5WjUpiqINfCxR0pw2R9x7nQhINGGgMaGZFygL4AIuTZps6
 sIV726bM8rNKEpFbaY0hTpsBhw==
X-Google-Smtp-Source: ABdhPJzFpUTTDadjwNIZuTtLyH6LXbIS8ZKTkNuw8IlpPWNAna9FWh9p7+da7CSwhtWlkkKMLgmhRQ==
X-Received: by 2002:a17:906:1fd2:: with SMTP id
 e18mr13091287ejt.313.1627227915964; 
 Sun, 25 Jul 2021 08:45:15 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q8sm14181371edv.95.2021.07.25.08.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 08:45:15 -0700 (PDT)
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20200220201149.7426-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <608e7889-315b-214b-4275-bddd41cc607f@mind.be>
Date: Sun, 25 Jul 2021 17:45:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20200220201149.7426-1-vfazio@xes-inc.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/2] package/nvidia-driver: fixup
 libraries according to README
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Vincent,

On 20/02/2020 21:11, Vincent Fazio wrote:
> Create a symlink for libglx.so and drop libnvidia-wfb.so (aka libwfb.so)
> since all selectable xserver versions in Buildroot provide their own.
> 
> VDPAU libraries should be installed into /usr/lib/vdpau/
> 
> https://download.nvidia.com/XFree86/Linux-x86_64/390.67/README/installedcomponents.html
> 
> Also, allow specifying target subdirectory per library and respect it in
> the install loop.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

 I finally applied to master, with a few corrections.

[snip]
> +	$(foreach lib,$(NVIDIA_DRIVER_LIBS),
> +		$(call NVIDIA_DRIVER_INSTALL_LIB,$(shell echo $(lib) | awk -F":" '{print $$1}'), \

 We prefer doing this in make:

$(word 1,$(subst :, ,$(lib)))

> +			$(1)/usr/lib/$(shell echo $(lib) | awk -F":" '{print $$2}'))
>  	)
>  endef
>  
> @@ -181,18 +187,25 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
>  	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
>  endef
>  
> +define NVIDIA_DRIVER_SYMLINK_LIBGLX
> +	# libglx needs a symlink according to the driver README. It has no SONAME

 You shouldn't put comments inside a define, put them before it.

> +	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> +endef
> +
>  # For target, install libraries and X.org modules
>  define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
>  	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
> -	$(foreach m,$(NVIDIA_DRIVER_X_MODS), \
> -		$(INSTALL) -D -m 0644 $(@D)/$(notdir $(m)) \
> -			$(TARGET_DIR)/usr/lib/xorg/modules/$(m)
> -	)
>  	$(foreach p,$(NVIDIA_DRIVER_PROGS), \
>  		$(INSTALL) -D -m 0755 $(@D)/$(p) \
>  			$(TARGET_DIR)/usr/bin/$(p)
>  	)
> +	$(NVIDIA_DRIVER_SYMLINK_LIBGLX)
>  	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
>  endef
>  
> +# Due to a conflict with xserver_xorg-server, this needs to be performed when
> +# finalizing the target filesystem to make sure this version is used.

 This is fishy... Is it because xserver_xorg-server creates a symlink or library
with the same name? In that case, the usual way we solve it is that we add a
dependency between the two packages:

NVIDIA_DRIVER_DEPENDENCIES += xserver_xorg-server

That way, nvidia-driver will overwrite whatever xorg-server has done.


 However, since I don't completely understand the issue, I left it as is.


 Regards,
 Arnout

> +NVIDIA_DRIVER_TARGET_FINALIZE_HOOKS += NVIDIA_DRIVER_SYMLINK_LIBGLX
> +
>  $(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
