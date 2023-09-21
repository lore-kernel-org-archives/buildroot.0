Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC3E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A57C83C97;
	Thu, 21 Sep 2023 18:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A57C83C97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-nMhQxABH6E; Thu, 21 Sep 2023 18:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C15C83C9C;
	Thu, 21 Sep 2023 18:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C15C83C9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25F1D1BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F39E76136F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39E76136F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9i_kt-TYaYD3 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:58:29 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7ACF6136A
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7ACF6136A
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50335f6b48dso2336190e87.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322707; x=1695927507;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qkEzOEta6B3kBIcpvGIvTsNitygfG/2lJLJatM8pkUo=;
 b=Nfze6RUVJfLBVCMozJ+pmCVc209iYIVImnHe8ATf3iqjc1MJPpASjbF7Cpf8/EHr7H
 AmX7wtRMWjbjKUvRQuSbTCgWgyvWZ+l8a/swgokgWqeKj84YJSmlKm9rcIFrIcMTNAB1
 di7d5Z7uKMRxejLZ3BOpM+pADcOKmUoWJkVRmZg3o1bNSAQk7mGQGAFXHHnpJO20D/A4
 LUm7XXEtizC4Tk7moSn6fFkrCqnPRP6E+woh3Cp3sDNoD3YICC2S4xJC/dWXG1R+1tFE
 P6xhOzSjInaGq0trY07xeAwUI6mWQhzHOksinOj8jxUvlSdf3tLJqx3P6/7pqwFTp3FO
 04MA==
X-Gm-Message-State: AOJu0YzZFe3jmOdIo9hyPZqkrthDpg5fr78rTqEF3sbF4Shxm4fm9gNH
 lp9Q14JOEml11r5lIqoI6rJH5A==
X-Google-Smtp-Source: AGHT+IEsq2pkJBLtwnsuFYeUz5NlbvUGmIyNi/aV2G9UWbLq39sYW2TLtJ311piGSJS3xE/ysFUmhQ==
X-Received: by 2002:a19:690f:0:b0:500:9ab8:b790 with SMTP id
 e15-20020a19690f000000b005009ab8b790mr4226823lfc.60.1695322706611; 
 Thu, 21 Sep 2023 11:58:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056402516700b0052f3471ccf6sm1206629ede.6.2023.09.21.11.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:58:25 -0700 (PDT)
Message-ID: <983c8224-7628-6b66-6f32-a29d398e17f8@mind.be>
Date: Thu, 21 Sep 2023 20:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
 <20230918081559.1025134-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230918081559.1025134-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695322707; x=1695927507; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qkEzOEta6B3kBIcpvGIvTsNitygfG/2lJLJatM8pkUo=;
 b=BvEbwDBgXCavp06cqBLFKDNTPZvzrWmg0JpYzZXze6QSHWBtZMY9BtiG7unr7kYYAz
 3pkEak6jbb68Ui3UfxZzSeVOdf4lppKIdnWcAIWxqKR16yc6KE3bK2FFDa6J5MXj5I8u
 18AC8f0g3aewUJVDYvda2b9utO+AJD289P/dzXxk5u0SxBg2TpixwtbtSR04R/62l3Wv
 jOs/o+mZ6iTgZmZrxJklWIj0itD8Gwnm9RA3ph1ZvE3yqingd8x/NYportIpiZ5sXw/J
 2gj5LF6hzc8B3sR5LxnWj6PALxIi7eBSe8QoBlFowqBAKR44pm/Fv45CdR7aHQxf7pde
 B/pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BvEbwDBg
Subject: Re: [Buildroot] [PATCH v2] package/apache: add option
 BR2_PACKAGE_APACHE_UTILS_ONLY
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Giulio

On 18/09/2023 10:15, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> With option BR2_PACKAGE_APACHE_UTILS_ONLY only htdigest and htpasswd are
> built and installed. This is useful for Mongoose credential handling.
> 
> Cc: Jim Reinhart <jimr@tekvox.com>
> Cc: James Autry <jautry@tekvox.com>
> Cc: Matthew Maron <matthewm@tekvox.com>
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> ---
> V1->V2:
> * Hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is enabled
> ---
>   package/Config.in        |  2 +-
>   package/apache/Config.in |  7 +++++++
>   package/apache/apache.mk | 23 +++++++++++++++++++++--
>   3 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..6f4898e15a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2278,7 +2278,7 @@ menu "Networking applications"
>   	source "package/alfred/Config.in"
>   	source "package/aoetools/Config.in"
>   	source "package/apache/Config.in"
> -if BR2_PACKAGE_APACHE
> +if BR2_PACKAGE_APACHE && !BR2_PACKAGE_APACHE_UTILS_ONLY
>   menu "External Apache modules"
>   	source "package/modsecurity2/Config.in"
>   endmenu
> diff --git a/package/apache/Config.in b/package/apache/Config.in
> index 270296bce4..aad35fb5da 100644
> --- a/package/apache/Config.in
> +++ b/package/apache/Config.in
> @@ -17,6 +17,12 @@ config BR2_PACKAGE_APACHE
>   
>   if BR2_PACKAGE_APACHE
>   
> +config BR2_PACKAGE_APACHE_UTILS_ONLY

  "Negative" options (i.e. options that _disable_ part of a package) often turn 
out to be a pain later. So it's better to call it "BR2_PACKAGE_APACHE_DAEMON" 
and default it to y.

> +	bool "apache-utils-only"
> +	help
> +	  Provide only Apache utils like htdigest and htpasswd.
> +
> +if !BR2_PACKAGE_APACHE_UTILS_ONLY
>   choice
>   	prompt "Multi-Processing Module (MPM)"
>   	default BR2_PACKAGE_APACHE_MPM_WORKER
> @@ -40,6 +46,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
>   	  Implements a hybrid multi-threaded multi-process web server
>   
>   endchoice
> +endif
>   
>   endif
>   
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 320a6ad20e..49edab838a 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
>   APACHE_CPE_ID_VENDOR = apache
>   APACHE_CPE_ID_PRODUCT = http_server
>   APACHE_SELINUX_MODULES = apache
> -# Needed for mod_php
> -APACHE_INSTALL_STAGING = YES
>   # We have a patch touching configure.in and Makefile.in,
>   # so we need to autoreconf:
>   APACHE_AUTORECONF = YES
> @@ -31,6 +29,26 @@ else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)
>   APACHE_MPM = worker
>   endif
>   
> +ifeq ($(BR2_PACKAGE_APACHE_UTILS_ONLY),y)
> +APACHE_CONF_OPTS = \
> +	--with-apr=$(STAGING_DIR)/usr \
> +	--with-apr-util=$(STAGING_DIR)/usr \
> +	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \

  Can we move the common options out of the condition, and use += inside the 
condition?

> +	--with-static-htdigest \
> +	--with-static-htpasswd

  This sounds like they're linked statically? Is there a reason to do that 
(other than that you have to install the shared lib to target, of course)?

  Regards,
  Arnout

> +
> +define APACHE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
> +endef
> +
> +define APACHE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
> +	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
> +endef
> +else
> +# Needed for mod_php
> +APACHE_INSTALL_STAGING = YES
> +
>   APACHE_CONF_OPTS = \
>   	--sysconfdir=/etc/apache2 \
>   	--with-apr=$(STAGING_DIR)/usr \
> @@ -121,5 +139,6 @@ define APACHE_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -D -m 644 package/apache/apache.service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
>   endef
> +endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
