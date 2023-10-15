Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D04BCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8E5C81D5F;
	Sun, 15 Oct 2023 20:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8E5C81D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxc-_B3sqxiy; Sun, 15 Oct 2023 20:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7FFE81DE4;
	Sun, 15 Oct 2023 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FFE81DE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07B821BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C92424179F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92424179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foHBGLSC1dTn for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:24:07 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21E374179D
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E374179D
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-406609df1a6so37510575e9.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697401445; x=1698006245;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXoHeB9YnFXuBQEuxNSprVrgoO7mTey4TGdoncA0N4Y=;
 b=J7jJuzBhtuArWsN/SwaZJhAw/ywZwfJCuo2sK0/O+UwMS9dpZExZQHfVELQxLcTYmu
 l9XzcPSE6L4GVQQ5HcVPEyEWwLcaI+oRALNlKoEkUmPGDVanLf8WG3B44hF/cZRCUxNp
 9MeqO7q/47du7jeRBhtZKZT9BjWaMEGig+hBXhaGb6lwXACQdIUXEaI358rZKp+hbjCo
 J+6Co/KtChAat4LG10jDuaDgQzQDfJaxsYOaaTvd+ZLfIlNYoedWWRHO/UdgVOBH4v/Q
 R9pkdDREYgMWDbFXIjyqiAfLXRY0SwI3NLuu1c47+7kwbQ7z3bQdpo5vgMPU5LA2MJeQ
 JiEw==
X-Gm-Message-State: AOJu0YwaI8+Sg+WV+bO+dMsajpAdZ/fyRRI6y1NNswLICzNvLgShWBEr
 ZFHk7oW+C+SabgZpNvAcblQ8H+JttCE+w+Pz0sA=
X-Google-Smtp-Source: AGHT+IHbcfFoCq+GTvwzWA5bJRkYMPZ2q8mLJ/KIqehfZK935zSMUENNxhOvaS6NkplRq/z83jm4lA==
X-Received: by 2002:a05:600c:1d9c:b0:406:8494:f684 with SMTP id
 p28-20020a05600c1d9c00b004068494f684mr26889607wms.23.1697401445080; 
 Sun, 15 Oct 2023 13:24:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c430300b004076f522058sm5359090wme.0.2023.10.15.13.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:24:04 -0700 (PDT)
Message-ID: <32fce31e-418f-6781-dd4c-693013215171@mind.be>
Date: Sun, 15 Oct 2023 22:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231015051544.429666-1-james.hilliard1@gmail.com>
In-Reply-To: <20231015051544.429666-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697401445; x=1698006245; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vXoHeB9YnFXuBQEuxNSprVrgoO7mTey4TGdoncA0N4Y=;
 b=DcO68yP77o6hpkQqNoVHzYywj5zbW7bm4wmZjZtPNlbLd/L+YUv9tW7y1pxZE1XjMk
 kphIUuSYJI30L4/akbaXJAR0UhX+qdcG3Z5CiB/lq4yrMMlpWr5bkl3my5fiaYWs/NRc
 /Ew9chn1N+X9S6uanji3DsjOmhkgkKxhTTH3N5g84biXvrOHB5V0WciKugd/ETk5345W
 o52+R7u2FBcH/HtU1/T9LfsbWiD3CytRz6nqkQ/2s2IyFrZtsJnO8148e5U+GQdZLzcc
 9U4Lx/2WBRL84dD0gHXHDHsD3+l4Tpu8yQ5wUHe4cZlEJ+sGnZK1bbLkaE17Ry56hmVr
 BRJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DcO68yP7
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.44.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 07:15, James Hilliard wrote:
> Drop patches which are now upstream.
> 
> CONTRIBUTING.md hash changed due to text updates:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/987488a7ac4a193ea6160ab65a4bb215481cafb7

  That explanation wasn't really sufficient, though I admit it's difficult to do 
better :-) I changed it to:

     CONTRIBUTING.md hash changed due to text various text updates, most of
     them outside of the section about licensing. The only change in that
     section is:


  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   ...option-to-set-the-mobile-broadband-p.patch | 60 -------------------
>   ...build-failure-with-Dmodem_manager-fa.patch | 38 ------------
>   package/network-manager/network-manager.hash  |  6 +-
>   package/network-manager/network-manager.mk    |  4 +-
>   4 files changed, 5 insertions(+), 103 deletions(-)
>   delete mode 100644 package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
>   delete mode 100644 package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> 
> diff --git a/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch b/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
> deleted file mode 100644
> index 4336472e45..0000000000
> --- a/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 03ba04d4784fa4fc7ec31455070fb5ecf25ade23 Mon Sep 17 00:00:00 2001
> -From: Heiko Thiery <heiko.thiery@gmail.com>
> -Date: Fri, 27 Jan 2023 22:38:42 +0100
> -Subject: [PATCH] build: meson: add option to set the
> - mobile-broadband-provider-info database
> -
> -When building network-manager in cross-compile environment meson is not able
> -to detect the right location of the mobile-broadband-provider-info
> -database by using the pkg-config module.
> -
> -By adding the option 'mobile_broadband_provider_info_database' to set the
> -correct path to the datafile this can be solved.
> -
> -Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> -
> -https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1519
> ----
> - meson.build       | 6 +++++-
> - meson_options.txt | 1 +
> - 2 files changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 0adc42f738..84ce52c736 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -584,7 +584,10 @@ enable_modem_manager = get_option('modem_manager')
> - if enable_modem_manager
> -   mm_glib_dep = dependency('mm-glib', version: '>= 0.7.991')
> -
> --  mobile_broadband_provider_info_database = dependency('mobile-broadband-provider-info').get_pkgconfig_variable('database')
> -+  mobile_broadband_provider_info_database = get_option('mobile_broadband_provider_info_database')
> -+  if mobile_broadband_provider_info_database == ''
> -+    mobile_broadband_provider_info_database = dependency('mobile-broadband-provider-info').get_pkgconfig_variable('database')
> -+  endif
> -   config_h.set_quoted('MOBILE_BROADBAND_PROVIDER_INFO_DATABASE', mobile_broadband_provider_info_database)
> - endif
> -
> -@@ -1054,6 +1057,7 @@ output += '  jansson: ' + jansson_msg + '\n'
> - output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
> - output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
> - output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
> -+output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> - output += '  ofono: ' + enable_ofono.to_string() + '\n'
> - output += '  concheck: ' + enable_concheck.to_string() + '\n'
> - output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 8b1d32e645..4e359f9e92 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -32,6 +32,7 @@ option('ppp', type: 'boolean', value: true, description: 'enable PPP/PPPoE suppo
> - option('pppd', type: 'string', value: '', description: 'path to pppd binary')
> - option('pppd_plugin_dir', type: 'string', value: '', description: 'path to the pppd plugins directory')
> - option('modem_manager', type: 'boolean', value: true, description: 'Enable new ModemManager1 interface support')
> -+option('mobile_broadband_provider_info_database', type: 'string', value: '', description: 'path to the mobile-broadband-provider-info database')
> - option('ofono', type: 'boolean', value: false, description: 'Enable oFono support (experimental)')
> - option('concheck', type: 'boolean', value: true, description: 'enable connectivity checking support')
> - option('teamdctl', type: 'boolean', value: false, description: 'enable Teamd control support')
> ---
> -2.20.1
> -
> diff --git a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> deleted file mode 100644
> index 648be027e0..0000000000
> --- a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 736a2c356c1c4871e8c4e70be622c65c87d3bca8 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 21 Feb 2023 13:03:00 +0100
> -Subject: [PATCH] meson.build: fix build failure with -Dmodem_manager=false
> -
> -Fix the following build failure with -Dmodem_manager=false raised since
> -https://gitlab.freedesktop.org/ffontaine/NetworkManager/-/commit/03ba04d4784fa4fc7ec31455070fb5ecf25ade23:
> -
> -../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1544]
> ----
> - meson.build | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 84ce52c736..b79240efc0 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1057,7 +1057,9 @@ output += '  jansson: ' + jansson_msg + '\n'
> - output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
> - output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
> - output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
> --output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> -+if enable_modem_manager
> -+  output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> -+endif
> - output += '  ofono: ' + enable_ofono.to_string() + '\n'
> - output += '  concheck: ' + enable_concheck.to_string() + '\n'
> - output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
> ---
> -2.39.0
> -
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index 895351a537..0196d68c55 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,6 +1,6 @@
> -# From https://download.gnome.org/sources/NetworkManager/1.42/NetworkManager-1.42.0.sha256sum
> -sha256  2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4  NetworkManager-1.42.0.tar.xz
> +# From https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.2.sha256sum
> +sha256  4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1  NetworkManager-1.44.2.tar.xz
>   # Locally computed
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> -sha256  cfb6c71f6df5898e1724be3debe9adac48c115b903915406c1e7dfd362b57892  CONTRIBUTING.md
> +sha256  e7cf3d92bda8e5365eaf4514d572146a19e93336f7a966493778d0d0c4476fae  CONTRIBUTING.md
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 9188af29eb..f6ef923d55 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -NETWORK_MANAGER_VERSION_MAJOR = 1.42
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
> +NETWORK_MANAGER_VERSION_MAJOR = 1.44
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
