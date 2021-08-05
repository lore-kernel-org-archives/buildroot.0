Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8597EC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279F4610FF
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 279F4610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DED91404B4;
	Thu,  5 Aug 2021 16:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRC8cz8m0sQk; Thu,  5 Aug 2021 16:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F02404CD;
	Thu,  5 Aug 2021 16:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADAA91C1135
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 977C460A36
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tg41BsJZNwW4 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:50:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D1AE608F2
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:50:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id go31so10664200ejc.6
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uk7AdE6cv6HdcUkw0t83Z7rk2NBS3EJPRG29Fvztl0s=;
 b=MLKOn+OFsCR+YrW7gJFUZMMkWRZCGLahGkGUTgvsr5uZ7HJJpvJR6dktAKOU1VgTzr
 eteOGdKTtMs1i7eNPQFMmB0sEO11qsrw+yBaMLtx08twmu05QqKDIZ59AAOj/LBgwcBh
 Z8K2od9yZ2FVRir6DvybbBuma1HW+OfBjU08vJQmWiY56FQZjaExf201fMRKC7Vpc7Or
 1CPQVkwReh9ZLvZpyH7s67WysimDHKg+N7Dq8xHDAejuDAxmbQ3nB2GhjxwD4/+qdDGF
 6OXCyW4IVnSIWQPiqSPgNo/FvfKPG+PYR5LwpnPLeQxqCMUN4Kn6DjVFcrWshyFgxTE9
 g7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uk7AdE6cv6HdcUkw0t83Z7rk2NBS3EJPRG29Fvztl0s=;
 b=lVn6xJSmO0oFm/KhCdyK/dGRhc1xGrfaOWS6V3GZRD0kio9FcDQEL0Tk9klaJ1tK6i
 sZjkZoP+eb/qPPwIyw9IJy7YctWf250ungEJVjMVxlp4HDZ1NP9hZr2gmSujPuLuvb/2
 aBUeSKXqsJsMru0y9gb4L5dAS9T1D7HktMfaklJgYCUoi3kaXT4/SpM1LpZWRP9Frax+
 fUo60Lw5whchxQ68YNcNW2CPlnStDRGEVjd4pUHvWo79WLhcboQq2Xbn32/lwm70P/D+
 QU1bSWvOnqtLUntpNWty4LWwydtJa/Hvps+Rf4D+K8WhVT1RSiZoyT30fLUj1K9JgViY
 R1WQ==
X-Gm-Message-State: AOAM530GtCZ5x1jCpoT4LToxGKy4nQPh4K22fYD53JDEBgdOpMrfq3ru
 UWlcaATQN7tXq3Kcxj+i0H9YpMT2GyqdHDT4BOE=
X-Google-Smtp-Source: ABdhPJzTKD21L71GRQXxd9N0S0Z5MMZBwf2Y4h2CRehQt5YL+mGq1y4XYtxWAGTBNTTCdlqpWrJ2hg==
X-Received: by 2002:a17:906:6ad4:: with SMTP id
 q20mr2681896ejs.433.1628182237374; 
 Thu, 05 Aug 2021 09:50:37 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id jj11sm1913989ejc.61.2021.08.05.09.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:50:36 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210804100736.931756-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <45e174b0-8fe1-fc7c-83ce-58db5bba5a1e@mind.be>
Date: Thu, 5 Aug 2021 18:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804100736.931756-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: needs at least a
 crypto backend
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 12:07, Fabrice Fontaine wrote:
> Since its addition in commit fbff7d7289cc95db991184f890f4ca1fcf8a101e,
> usbguard needs a crypto backend otherwise the build will fail on:
> 
> checking for sodium... no
> checking for libcrypto... no
> checking for powerpc-buildroot-linux-uclibc-libgcrypt-config... no
> checking for libgcrypt-config... no
> checking for LIBGCRYPT - version >= 1.5.0... no
> configure: error: The selected crypto backend library is not available.
> 
> So select sodium as the default crypto backend as this is the default
> choice in configure.ac.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fb9865e2c65ea1dd9a657e1181a6c8c49481fda7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/usbguard/Config.in   |  1 +
>  package/usbguard/usbguard.mk | 14 +++++---------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
> index 58ee5c4b25..41f19dc1a0 100644
> --- a/package/usbguard/Config.in
> +++ b/package/usbguard/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_USBGUARD
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_PROTOBUF
>  	select BR2_PACKAGE_LIBQB
> +	select BR2_PACKAGE_LIBSODIUM if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  The USBGuard software framework
>  
> diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
> index 1518f92fc5..a0d1c8446f 100644
> --- a/package/usbguard/usbguard.mk
> +++ b/package/usbguard/usbguard.mk
> @@ -18,23 +18,19 @@ USBGUARD_CONF_OPTS = \
>  
>  USBGUARD_DEPENDENCIES += libqb protobuf
>  
> -ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
> +USBGUARD_CONF_OPTS += --with-crypto-library=sodium
> +USBGUARD_DEPENDENCIES += libsodium
> +else ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  USBGUARD_CONF_OPTS += --with-crypto-library=openssl
>  USBGUARD_DEPENDENCIES += libopenssl
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  USBGUARD_CONF_ENV += \
>  	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>  USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
>  USBGUARD_DEPENDENCIES += libgcrypt
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
> -USBGUARD_CONF_OPTS += --with-crypto-library=sodium
> -USBGUARD_DEPENDENCIES += libsodium
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  USBGUARD_CONF_OPTS += --enable-systemd
>  USBGUARD_DEPENDENCIES += systemd
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
