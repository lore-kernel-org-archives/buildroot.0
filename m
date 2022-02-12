Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFBEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF9F7400AB;
	Sat, 12 Feb 2022 20:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T36HFBMdACJ3; Sat, 12 Feb 2022 20:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D59E9400C6;
	Sat, 12 Feb 2022 20:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E21F21BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0385607FE
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdSPlzu_qXpI for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:36:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E71C9606BF
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:36:47 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id e7so25455195ejn.13
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HAKFuBxLoII+fzPieRYq5WZml98H11J06qaY9l/GQf0=;
 b=BChd5bvjDz89F0XEa0vVcwFVQBbh2yBmXxcKvMgjRcNMkDm0tm5NjN8a9Pl0ib7V/d
 BYmjpX0jE6QoAejRZVRIObf4dhMAuPe2fe+fVYURFWYTAW41YhpTJ6muIWK530KKrJyq
 mivuaye3cQ8y1DNpBNA2Gck+DFrElje7rGrK4BSWyBrECD+5TPQHl6UDyvbB0zt8swCx
 3D0SgUV/TUnBRZqKW4kn5QVF92+Zisb5RmKpDHhwZBbtOaE9iTstRXqttRnJlQLnqewa
 Lm3XhAhNnFfS4c2zvUcV0xgBWanpd91prDxNdL6Lp9KkyF9Al8R6J1QaFFU5x2wU4qE6
 Re+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HAKFuBxLoII+fzPieRYq5WZml98H11J06qaY9l/GQf0=;
 b=3Usvh0C0VFhgj8ZHxahuWG7JCmkO4emqn1n9dCFzmnS3bcCXvlNs7w1h17QI8RIxpA
 cNpcTclOK0ztfSmJXbox1hCPlGgoRDwms2X8jFljXJ/5FxmRr77q/2YYbmRJ2GCGXXXq
 HmscGDQfbGpBoEf0MVhFVauAOBZJnroUl4oIBnG/vqX+2wZs7lL/xCOd1QnsOgtYxluP
 LGcvUMfMf1U7JKXzPs6qoIqslp7XMAmBpLketmx/gmVbSs3jkxB3gVH8CdPakPcWXeAj
 l7MSyAxEYQ2ku2YQtBZCDWG32fabMr9nAisMgu7Qm9dv4+bf577+Xo0OmyEN+PSCvTiB
 SfqA==
X-Gm-Message-State: AOAM531igyf0RmI7p30nvwQ0hrOLXYxAbIiRDalmpwXgFc5F9Trfh1+R
 IIVKotb4T59TC7WNlSXLVYBbiQ==
X-Google-Smtp-Source: ABdhPJwRRPD5U7SENqMK5otsYz2dwvAR25+MXVv11qR12/mcoS4i/xsDP81OG3YbkTXUwNCT2vchUg==
X-Received: by 2002:a17:906:7945:: with SMTP id
 l5mr6070368ejo.104.1644698206174; 
 Sat, 12 Feb 2022 12:36:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u3sm9254650ejz.99.2022.02.12.12.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 12:36:45 -0800 (PST)
Message-ID: <a9239318-2ca0-a0c0-d415-ee547be6acef@mind.be>
Date: Sat, 12 Feb 2022 21:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220131223024.22386-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131223024.22386-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/qt5base: fix uclibc/musl compile
 with libexecinfo enabled
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
Cc: Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 23:30, Peter Seiderer wrote:
> - depend and link against libexecinfo if enabled to fix linking failure
>    in case execinfo.h is detected for qlogging:
> 
>    qt5base-5.15.2/src/corelib/global/qlogging.cpp:110 - __has_include(<execinfo.h>)
> 
> - libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC
> 
> - rename plain QT5BASE_CONFIGURE_ARCH_CONFIG to QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC
> 
> Fixes:
> 
>    - http://autobuild.buildroot.net/results/e7c685744b1f1bebb7fec9835bda534a72b7b7c2
> 
>    .../riscv64-buildroot-linux-musl/bin/ld: .../build/qt5base-5.15.2/src/corelib/global/qlogging.cpp:1398: undefined reference to `backtrace_symbols'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5base/qt5base.mk | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 4ef3759566..59c423c49c 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -234,6 +234,14 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
>   
>   QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
>   
> +# see qt5base-5.15.2/src/corelib/global/qlogging.cpp:110 - __has_include(<execinfo.h>)
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +QT5BASE_DEPENDENCIES += libexecinfo
> +define QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO
> +	printf '!host_build { \n LIBS += -lexecinfo\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
> +endef
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBINPUT),y)
>   QT5BASE_CONFIGURE_OPTS += -libinput
>   QT5BASE_DEPENDENCIES += libinput
> @@ -282,7 +290,7 @@ endif
>   QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   # Qt 5.8 needs atomics, which on various architectures are in -latomic
> -define QT5BASE_CONFIGURE_ARCH_CONFIG
> +define QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC
>   	printf '!host_build { \n LIBS += -latomic\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
>   endef
>   endif
> @@ -305,7 +313,8 @@ define QT5BASE_CONFIGURE_CMDS
>   		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>   	$(QT5BASE_CONFIGURE_CONFIG_FILE)
>   	touch $(QT5BASE_ARCH_CONFIG_FILE)
> -	$(QT5BASE_CONFIGURE_ARCH_CONFIG)
> +	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC)
> +	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO)
>   	$(QT5BASE_CONFIGURE_HOSTCC)
>   	(cd $(@D); \
>   		$(TARGET_MAKE_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
