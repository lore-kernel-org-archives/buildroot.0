Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A94C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC49A61029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC49A61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A10DA400F2;
	Thu, 23 Sep 2021 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iNcuHEiY-dL; Thu, 23 Sep 2021 21:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A27A4049B;
	Thu, 23 Sep 2021 21:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C598B1BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE0398407B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hf4NuTMgf9lR for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8323182F4F
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:05:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c22so27518345edn.12
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x9IPhEUdBFriW4whpZRabCFGV/pmAmKEF+dWseRqDe0=;
 b=cST8uqio5g/OvnsBjV+8yBzGfnD8Re/zlTHjm0FmCnNUp7br9IQb/QxDP4sDoyKKSA
 0hhyq5rzIR/HA3M8Mi5MRPzqJ2twarWPSatCiLeJxKHXD/pHNm4yD2Ima3F4ardeL2Yh
 Vo8caFRN4eYzO2OIGcKvF43iNBjqlFavxS5e9zk3lKxUlMQuEVngQ70QmPhBngH2fhC2
 fOirhRmG5IgSKISixIRA1J8pN3kxZItRB+cgZ7ILkp1cLJy9yjcfuzicFMspQsVWM/e0
 /yeSFDO2h2HlJAkX9E0uKUx6X/WviEYD1MjT0nC3tahZcuJk42lE4xv5P4yjUVCoTwwF
 PrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x9IPhEUdBFriW4whpZRabCFGV/pmAmKEF+dWseRqDe0=;
 b=z+bP6uRB8FXGfTccRa/fdDYbltjDcKcR/JJzdZMd5cUL7qphTi40j1VgYyajn3lUaA
 4uUrCE5xYcOVYOBa7kZHMMGcIKCdgEsXfujwF5qBuXITGNDdhg66ctieqX+/PDqZd+y2
 CqC/0+6IhymgXwu1hJufwjNwXfbwBaw4WvJ6Sda3vufR27nT4uj5V30KoWQMwkFL6laH
 UwMhb+TeX9CegeNhczAMDgZZL79E/DA3GEDXXK8la+AutAGP8RFPHdbj8FgXm6eBCLIU
 If82L94VyQ78UjKfRDYVgBQbFVMaFFce5V2N3S64kP2JAJ+mJTyLkqghe+d3yq6+hx0g
 y4mg==
X-Gm-Message-State: AOAM533zoLiU0zJOoz/86USm8ZOrMpT1OMBbovO+07u7V6nyUfuxlf+a
 9JLeyChuN6xTLFjxBj5He43TNg==
X-Google-Smtp-Source: ABdhPJx3ntvb0/1uC5EEfgKTfm4lO2fzw3YXke+bAl9bvFwBka2cKIEcJESt+btllfvX6Mp4IgH1TQ==
X-Received: by 2002:a17:906:dbf0:: with SMTP id
 yd16mr7367500ejb.445.1632431101714; 
 Thu, 23 Sep 2021 14:05:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id la1sm3772391ejc.48.2021.09.23.14.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:05:01 -0700 (PDT)
Message-ID: <6bd0654a-8d40-48a0-0ac4-14975ffbcebb@mind.be>
Date: Thu, 23 Sep 2021 23:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210919142149.3298025-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919142149.3298025-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: bump to version 0.11.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 16:21, Fabrice Fontaine wrote:
> - Switch to meson-package
> - Update indentation in hash file (two spaces)

  I've added some blurb about why tools are disabled.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.11.0/ChangeLog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   .../0001-meson-add-tests-option.patch         | 46 +++++++++++++++++++
>   package/usbredir/usbredir.hash                | 10 ++--
>   package/usbredir/usbredir.mk                  | 10 ++--
>   3 files changed, 59 insertions(+), 7 deletions(-)
>   create mode 100644 package/usbredir/0001-meson-add-tests-option.patch
> 
> diff --git a/package/usbredir/0001-meson-add-tests-option.patch b/package/usbredir/0001-meson-add-tests-option.patch
> new file mode 100644
> index 0000000000..b2df1587b1
> --- /dev/null
> +++ b/package/usbredir/0001-meson-add-tests-option.patch
> @@ -0,0 +1,46 @@
> +From 8490a7ac101d4ee0a78c44b252d3b7a6c2508c74 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 21 Aug 2021 11:55:48 +0200
> +Subject: [PATCH] meson: add tests option
> +
> +Add tests option to allow the user to disable them
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.freedesktop.org/spice/usbredir/-/commit/8490a7ac101d4ee0a78c44b252d3b7a6c2508c74]
> +---
> + meson.build       | 4 +++-
> + meson_options.txt | 5 +++++
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 6e773a7..a6d21b8 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -106,7 +106,9 @@ if host_machine.system() != 'windows'
> +         subdir('fuzzing')
> +     endif
> + endif
> +-subdir('tests')
> ++if get_option('tests').enabled()
> ++    subdir('tests')
> ++endif
> + subdir('data')
> +
> + summary(summary_info, bool_yn: true)
> +diff --git a/meson_options.txt b/meson_options.txt
> +index b35732b..63e8c85 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -21,3 +21,8 @@ option('tools',
> +     type : 'feature',
> +     value : 'enabled',
> +     description : 'Build usbredir\'s tools such as usbredirect')
> ++
> ++option('tests',
> ++    type : 'feature',
> ++    value : 'enabled',
> ++    description : 'Build usbredir\'s tests such as filter')
> +--
> +GitLab
> +
> diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
> index 485315d28c..e11d4aa720 100644
> --- a/package/usbredir/usbredir.hash
> +++ b/package/usbredir/usbredir.hash
> @@ -1,4 +1,6 @@
> -# locally computed hash
> -sha256 87bc9c5a81c982517a1bec70dc8d22e15ae197847643d58f20c0ced3c38c5e00  usbredir-0.8.0.tar.bz2
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
> +# https://spice-space.org/download/usbredir/usbredir-0.11.0.tar.xz.sha256sum
> +sha256  72dd5f3aa90dfbc0510b5149bb5b1654c8f21fdc405dfce7b5dc163dcff19cba  usbredir-0.11.0.tar.xz
> +
> +# Hash for license files
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> index 8848670ea9..25c4bb382e 100644
> --- a/package/usbredir/usbredir.mk
> +++ b/package/usbredir/usbredir.mk
> @@ -4,13 +4,17 @@
>   #
>   ################################################################################
>   
> -USBREDIR_VERSION = 0.8.0
> -USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
> +USBREDIR_VERSION = 0.11.0
> +USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
>   USBREDIR_SITE = http://spice-space.org/download/usbredir
>   USBREDIR_LICENSE = LGPL-2.1+ (libraries)
>   USBREDIR_LICENSE_FILES = COPYING.LIB
>   USBREDIR_INSTALL_STAGING = YES
>   USBREDIR_DEPENDENCIES = host-pkgconf libusb
> +USBREDIR_CONF_OPTS = \
> +	-Dgit_werror=disabled \
> +	-Dtests=disabled \
> +	-Dtools=disabled
>   
>   ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
>   
> @@ -26,4 +30,4 @@ USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
>   
>   endif # BR2_PACKAGE_USBREDIR_SERVER
>   
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
