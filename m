Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDACC32774
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD62A8140B;
	Tue, 23 Aug 2022 20:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD62A8140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqDQvJrny48k; Tue, 23 Aug 2022 20:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88C7881402;
	Tue, 23 Aug 2022 20:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C7881402
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA35C1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91CC560BD2
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91CC560BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMgxq1IP2HQB for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:35:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DD560BB8
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28DD560BB8
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:35:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id w19so29726715ejc.7
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 13:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=pypLEFwx+oCnm2KZxrywMqgjipLkRwSMGWk3hjAy/P4=;
 b=bLoOPNu1lVm9X3RlrNkbJblc2ugh5YclVf3OE2dj52A77MyHF3WPp8cq6KJoHyg+hy
 zQY8RQjeAI+K8AbdCbq2l7R205X6gt1PImCMz61gvajiwArcQbu6i/RFqHVppK+udTw3
 Q656LC5INlt6z8QA0zkZCKEnr22knwBYGNjaHHdH16PueYS7e02LqF1X8rZVV66T0oI1
 YKh16IegncdfJPGcynyA2ToJLqxkPTsBvxo885FwZb1Hk38Mpqc38fQy0majWxGMhjK2
 I1/lOSgB9VXKwX1YjnvkKsBYl9j9LT7ajuf+2oSk2F2mp3Mvk0bVwXf1itnuA5OZ6VCj
 3iyg==
X-Gm-Message-State: ACgBeo3hQQY2nBT0+j+RjQShBl2pDvheL81r9PSUJlXW6AxgwnGTx0s7
 BYIijJQ7D/sOF/gaf4RzV2AwQA==
X-Google-Smtp-Source: AA6agR4TM4NtHUfPQKYz7ll4/ZSXiAe7ZXPdLtGdiKeOedKR/hCHd9PSz6mcJunlp524l9dXZ0Q7sw==
X-Received: by 2002:a17:906:8a5b:b0:73d:7975:567e with SMTP id
 gx27-20020a1709068a5b00b0073d7975567emr834603ejc.378.1661286915206; 
 Tue, 23 Aug 2022 13:35:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a170906444200b0073da4b623e8sm272965ejp.152.2022.08.23.13.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 13:35:14 -0700 (PDT)
Message-ID: <01672f92-571d-93a7-ae11-401bf7f5470f@mind.be>
Date: Tue, 23 Aug 2022 22:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220327173137.2575467-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220327173137.2575467-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=pypLEFwx+oCnm2KZxrywMqgjipLkRwSMGWk3hjAy/P4=;
 b=cHo3ije/PYGKGn5ohajYUljTHDD5dBffjOsz41VSVIXIFWlKXdfzggRTOGWsSxWBEG
 VDPc31M62sUpbaR1oXqepR6XI3cWwJi22/KUoF/FpG27yXcBaFeUGttELcfB1ysBa0S1
 DSbZXgGlAL9butcfPBxB/rVc4tGAzdFAkG6tTAhkc/24dpRn0Ko0MQWGLzjqHbEwAw3A
 /iw4iOZQiWRYuuqeNaCo6DSn/sk2pwqRtqQHKB1J4dR/Weya1YKfyP1VOY9WhFN0zoYw
 7fdVyz2fmhg89W5qBcAh5Ilvelcoq5ztNM1AiRyVGmVKysMjfVvB0QwETxclztjb9HRk
 Lwhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cHo3ije/
Subject: Re: [Buildroot] [PATCH v3 1/1] package/network-manager: migrate
 autotools build system to meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 19:31, James Hilliard wrote:
> We need to add dbus as a build dependency since the meson build system
> uses dbus pkg-config to determine install locations.
> 
> The meson build also requires mobile-broadband-info in order to get
> the database pkg-config variable.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
> Changes v2 -> v3:
>    - rebase on version 1.36.4 update
> Changes v1 -> v2:
>    - add comments on new dependencies
> ---
>   package/network-manager/Config.in          |   1 +
>   package/network-manager/network-manager.mk | 106 ++++++++++-----------
>   2 files changed, 51 insertions(+), 56 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index a48cb37b15..da1a7d79b3 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -40,6 +40,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
>   config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
>   	bool "modem-manager support"
>   	select BR2_PACKAGE_MODEM_MANAGER
> +	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
>   	help
>   	  This option enables support for ModemManager
>   
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 3479bb3794..19f2eb3b59 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
> -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
>   	libgcrypt wireless_tools util-linux host-intltool libndp
>   NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>   NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
> @@ -17,136 +17,130 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
>   NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
>   NETWORK_MANAGER_SELINUX_MODULES = networkmanager
>   
> -NETWORK_MANAGER_CONF_ENV = \
> -	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> -	ac_cv_file__etc_fedora_release=no \
> -	ac_cv_file__etc_mandriva_release=no \
> -	ac_cv_file__etc_debian_version=no \
> -	ac_cv_file__etc_redhat_release=no \
> -	ac_cv_file__etc_SuSE_release=no
> -
>   NETWORK_MANAGER_CONF_OPTS = \
> -	--disable-introspection \
> -	--disable-tests \
> -	--disable-qt \
> -	--disable-more-warnings \
> -	--with-crypto=gnutls \
> -	--with-iptables=/usr/sbin/iptables \
> -	--disable-ifupdown \
> -	--without-nm-cloud-setup
> +	-Dintrospection=false \
> +	-Ddocs=false \
> +	-Dtests=no \
> +	-Dqt=false \
> +	-Dcrypto=gnutls \
> +	-Diptables=/usr/sbin/iptables \
> +	-Difupdown=false \
> +	-Dnm_cloud_setup=false \
> +	-Dsession_tracking_consolekit=false
>   
>   ifeq ($(BR2_PACKAGE_AUDIT),y)
>   NETWORK_MANAGER_DEPENDENCIES += audit
> -NETWORK_MANAGER_CONF_OPTS += --with-libaudit
> +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-libaudit
> +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
>   endif
>   
>   ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
> -NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
> +NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
>   endif
>   
>   ifeq ($(BR2_PACKAGE_DHCPCD),y)
> -NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
> +NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
>   endif
>   
>   ifeq ($(BR2_PACKAGE_IWD),y)
>   NETWORK_MANAGER_DEPENDENCIES += iwd
> -NETWORK_MANAGER_CONF_OPTS += --with-iwd
> +NETWORK_MANAGER_CONF_OPTS += -Diwd=true
>   ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
> -NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
> +NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=wpa_supplicant
>   else
> -NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
> +NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=iwd
>   endif
>   else
>   NETWORK_MANAGER_CONF_OPTS += \
> -	--without-iwd \
> -	--with-config-wifi-backend-default=wpa_supplicant
> +	-Diwd=false \
> +	-Dconfig_wifi_backend_default=wpa_supplicant
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBCURL),y)
>   NETWORK_MANAGER_DEPENDENCIES += libcurl
> -NETWORK_MANAGER_CONF_OPTS += --enable-concheck
> +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --disable-concheck
> +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBPSL),y)
>   NETWORK_MANAGER_DEPENDENCIES += libpsl
> -NETWORK_MANAGER_CONF_OPTS += --with-libpsl
> +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-libpsl
> +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>   NETWORK_MANAGER_DEPENDENCIES += libselinux
> -NETWORK_MANAGER_CONF_OPTS += --with-selinux
> +NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-selinux
> +NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
> -NETWORK_MANAGER_DEPENDENCIES += modem-manager
> -NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
> +NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
> +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
> +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
> -NETWORK_MANAGER_CONF_OPTS += --enable-ovs
> +NETWORK_MANAGER_CONF_OPTS += -Dovs=true
>   NETWORK_MANAGER_DEPENDENCIES += jansson
>   else
> -NETWORK_MANAGER_CONF_OPTS += --disable-ovs
> +NETWORK_MANAGER_CONF_OPTS += -Dovs=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
>   NETWORK_MANAGER_DEPENDENCIES += pppd
> -NETWORK_MANAGER_CONF_OPTS += --enable-ppp
> +NETWORK_MANAGER_CONF_OPTS += -Dppp=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --disable-ppp
> +NETWORK_MANAGER_CONF_OPTS += -Dppp=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
>   NETWORK_MANAGER_DEPENDENCIES += newt
> -NETWORK_MANAGER_CONF_OPTS += --with-nmtui
> +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-nmtui
> +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OFONO),y)
>   NETWORK_MANAGER_DEPENDENCIES += ofono
> -NETWORK_MANAGER_CONF_OPTS += --with-ofono
> +NETWORK_MANAGER_CONF_OPTS += -Dofono=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-ofono
> +NETWORK_MANAGER_CONF_OPTS += -Dofono=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>   NETWORK_MANAGER_DEPENDENCIES += systemd
>   NETWORK_MANAGER_CONF_OPTS += \
> -	--with-systemd-journal \
> -	--with-config-logging-backend-default=journal \
> -	--with-session-tracking=systemd \
> -	--with-suspend-resume=systemd
> +	-Dsystemd_journal=true \
> +	-Dconfig_logging_backend_default=journal \
> +	-Dsession_tracking=systemd \
> +	-Dsuspend_resume=systemd
>   else
>   NETWORK_MANAGER_CONF_OPTS += \
> -	--without-systemd-journal \
> -	--with-config-logging-backend-default=syslog \
> -	--without-session-tracking \
> -	--with-suspend-resume=upower
> +	-Dsystemd_journal=false \
> +	-Dconfig_logging_backend_default=syslog \
> +	-Dsession_tracking=no \
> +	-Dsuspend_resume=upower \
> +	-Dsystemdsystemunitdir=no
>   endif
>   
>   ifeq ($(BR2_PACKAGE_POLKIT),y)
>   NETWORK_MANAGER_DEPENDENCIES += polkit
> -NETWORK_MANAGER_CONF_OPTS += --enable-polkit
> +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --disable-polkit
> +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_READLINE),y)
>   NETWORK_MANAGER_DEPENDENCIES += readline
> -NETWORK_MANAGER_CONF_OPTS += --with-nmcli
> +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-nmcli
> +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
>   endif
>   
>   define NETWORK_MANAGER_INSTALL_INIT_SYSV
> @@ -159,4 +153,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
>   
>   endef
>   
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
