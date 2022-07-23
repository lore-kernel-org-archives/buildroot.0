Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AFFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 093F24169A;
	Sat, 23 Jul 2022 20:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093F24169A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9yAp54eBa-g; Sat, 23 Jul 2022 20:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C204019C;
	Sat, 23 Jul 2022 20:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C204019C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE961BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4383D4248E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4383D4248E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlvK4MeL7eZL for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:36:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA3784248C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA3784248C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:36:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bu1so10777106wrb.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b+CEe1kgWVXqQP5f1SXJ91yqFTTJtmpB6y91K2amUyM=;
 b=yZrjjwzi06zmoa6yx11NZ4FZnw99Dj6smWbTGpcSsHiqnoWJ4efVAFibcjvj0eglfR
 DF93rZj7Gk0bGVPlZFDveB+YQ7W3DUlnQXRszts7Y3cCguzcBv5JWwRFnSxRJvgVReNp
 67I/huHnL9F4TwivlgUD1cRLdM3Dw9cLlVhpY9S/j1JgpXTb/j9yz0LllnMmvXSTiWDD
 ukN4HlHoFa4UmlAYA0H2O8/U9+1Z645R9VBbIcjmA700SP8KKjlmYy0waToeDe4MF+R+
 C7tXLd47UqxCDdILL4LESR4Eord7VrkbGESacpP6jOoNLBCidwLYsj60zqqhGxjND7CT
 JhHQ==
X-Gm-Message-State: AJIora+tMvmWc/8o6gsuKPAxcyjmFiT+0TARw94wV/kk3P+t+1IvfRUK
 GCEwmUZ3dgll4abwAG4TA7YGxg==
X-Google-Smtp-Source: AGRyM1vPG4y3k7PSOqRPUlR92Fwd/OWO4HfmerkvpCtRvpdUFs839liqu8LLyt9vDGBmIe5uDTv4zg==
X-Received: by 2002:a05:6000:1110:b0:21e:6b81:de10 with SMTP id
 z16-20020a056000111000b0021e6b81de10mr3475283wrw.67.1658608604698; 
 Sat, 23 Jul 2022 13:36:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b0021e4f595590sm8001984wrm.28.2022.07.23.13.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 13:36:44 -0700 (PDT)
Message-ID: <106aa433-199d-d42d-7f62-fb4a5d6f9379@mind.be>
Date: Sat, 23 Jul 2022 22:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220512205714.2739391-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512205714.2739391-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b+CEe1kgWVXqQP5f1SXJ91yqFTTJtmpB6y91K2amUyM=;
 b=erSV77cjGtUUYgvT+O6LCOMdNMrJRSDTkrxcKn6XRU3qIunxjk+wxq6fNTNwPzdInA
 ocWRXbju/Ekf81HETuidKSoadosOksDAUtrP3rlPGv1cwcioouptiPle+W0fvWTQwMV7
 diT7XTdMdh84pUmssiGDNrNI/Tiq+TylHjJK9gQeGKXxwV3tOxp7CgGRv9DR9fcO24vr
 h2Q+n7b+UMBj8WehRO+YZ6AKeXO0gD0s2SOQUuCON2JUxX4TCNJfsLloJsVpYUxZVrp1
 OKTF1ZELdNjnqHfwtea442jp5wYf3bHFhfyjHIAgmvQsMP6JVrkHhG4u8j+DP2qf8E8b
 NwVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=erSV77cj
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: bump version to 2.8.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 22:57, Bernd Kuhls wrote:
> Removed dependency to host-perl, not needed anymore after
> https://github.com/networkupstools/nut/commit/3f7d05093ba589e1b05b9a6a88c03637472b5847
> 
> Removed autoreconf, the tarball provided by upstream contains a
> configure script.
> 
> This configure script however adds /usr/local/include to some tests
> which fail for us, instead of patching configure.ac and going through
> the autoreconf nightmare again we patch the configure script directly.
> 
> Added configure option --without-doc
> 
> Added more autoreconf variables to fix cross-compile issues.
> 
> Changed "--with-drivers=all" to "--with-drivers=auto" because some new
> drivers need packages not provided by buildroot, for example:
> configure: error: Powerman client libraries not found, required for
>   Powerman PDU client driver
> 
> Added optional dependency to freeipmi.
> 
> Added optional dependency to libusb, for details see
> https://github.com/networkupstools/nut/issues/300
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

[snip]
> +# prevent usage of unsafe paths
> +define NUT_FIX_CONFIGURE
> +	$(SED) 's/CFLAGS=\"-isystem \/usr\/local\/include/_UNUSED_CFLAGS=\"-isystem \/usr\/local\/include/' $(@D)/configure
> +	$(SED) 's/CXXFLAGS=\"-isystem \/usr\/local\/include/_UNUSED_CXXFLAGS=\"-isystem \/usr\/local\/include/' $(@D)/configure

  I got rid of the backslashes by using % as separator instead of /


  Regards,
  Arnout

>   endef
> -NUT_PRE_CONFIGURE_HOOKS += NUT_PREGEN
> -
> -# Race condition in tools generation
> -NUT_MAKE = $(MAKE1)
> +NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
>   
>   # Put the PID files in a read-write place (/var/run is a tmpfs)
>   # since the default location (/var/state/ups) maybe readonly.
>   NUT_CONF_OPTS = \
>   	--with-altpidpath=/var/run/upsd \
> -	--with-dev
> +	--with-dev \
> +	--without-doc
>   
> -NUT_CONF_ENV = ax_cv__printf_string_null=yes
> -
> -# For uClibc-based toolchains, nut forgets to link with -lm
> -ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -NUT_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lm"
> -endif
> +NUT_CONF_ENV = \
> +	ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
> +	ax_cv_check_cxxflags__Werror__Wno_unknown_warning_option=no \
> +	ac_cv_func_strcasecmp=yes \
> +	ac_cv_func_strdup=yes \
> +	ac_cv_func_strncasecmp=yes \
> +	ax_cv__printf_string_null=yes
>   
>   ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
> -NUT_CONF_OPTS += --with-drivers=all
> +NUT_CONF_OPTS += --with-drivers=auto
>   else
>   NUT_CONF_OPTS += --with-drivers=$(BR2_PACKAGE_NUT_DRIVERS)
>   endif
> @@ -53,6 +47,13 @@ else
>   NUT_CONF_OPTS += --without-avahi
>   endif
>   
> +ifeq ($(BR2_PACKAGE_FREEIPMI),y)
> +NUT_CONF_OPTS += --with-freeipmi
> +NUT_DEPENDENCIES += freeipmi
> +else
> +NUT_CONF_OPTS += --without-freeipmi
> +endif
> +
>   # gd with support for png is required for the CGI
>   ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
>   NUT_DEPENDENCIES += gd libpng
> @@ -72,7 +73,10 @@ else
>   NUT_CONF_OPTS += --without-libltdl
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +NUT_DEPENDENCIES += libusb
> +NUT_CONF_OPTS += --with-usb
> +else ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
>   NUT_DEPENDENCIES += libusb-compat
>   NUT_CONF_OPTS += --with-usb
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
