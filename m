Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08637CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9715441499;
	Sun, 15 Oct 2023 18:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9715441499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wesdGzvp4VZ4; Sun, 15 Oct 2023 18:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4296B402BC;
	Sun, 15 Oct 2023 18:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4296B402BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 197E11BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F170341497
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F170341497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwPp5pRbPuR3 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:48:36 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CB36402BC
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CB36402BC
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-406402933edso38997335e9.2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697395714; x=1698000514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zUiFCUG27wTR3uOjxhMNIcAr6CqcSDlNWVlQGXOf6MQ=;
 b=U8Hj8+8Lulc4ycTrxmnVGRHcxtGb+AcPmQM3gXHvEXG1h81URGXyNj7B8bDl1VMCIP
 Dj6jMMqqt4w/c0pn0XjZ73gMDDhggwHl5oynjSWn6PzqHwCaHp4iUZfXiubySnS65P0m
 ng9WcFxKqmr5r/i6+mBX6g2fCRanuRGlqKHWWqFBmvwK8g/jzdRoTRKza7DPpbhdyYbM
 dm2+QRLj8jG2tuKVgAnGpaT5HXrk6K0rafDBFhTSIoCe7TVDtnUW1oakFzjt+eScrZqE
 mt1g2zKzdTCgCpEtj2LKqobXg+D87FkecVmCyhLjK02zZNjIW2uXAWVwPe8BEpgywrLf
 +UZw==
X-Gm-Message-State: AOJu0Yxa5yJ92rOVxAe3dVQi1Xz/3QT/awK2mcDlMUZfb7+wBt7MT2lb
 3ZNyOwzP1HhvT5jiq8RMqBGXFw==
X-Google-Smtp-Source: AGHT+IF2n7SmgnN7ntzwWFAAmXpOIWNtuYurLjfFcvL9NxbilpcK0dSUkMvLU40FNNC/jCc3cMkWRw==
X-Received: by 2002:a05:6000:703:b0:32d:804c:15d1 with SMTP id
 bs3-20020a056000070300b0032d804c15d1mr12764930wrb.47.1697395713836; 
 Sun, 15 Oct 2023 11:48:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a056402121100b0052ff9bae873sm14315779edw.5.2023.10.15.11.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 11:48:33 -0700 (PDT)
Message-ID: <9497df91-af07-8291-b28b-f5a8b40148e1@mind.be>
Date: Sun, 15 Oct 2023 20:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20221018151624.882453-1-angelo@amarulasolutions.com>
In-Reply-To: <20221018151624.882453-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697395714; x=1698000514; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zUiFCUG27wTR3uOjxhMNIcAr6CqcSDlNWVlQGXOf6MQ=;
 b=b313/vIpsPkg1Rlax0+DujxE8f/OQ4PoDUIEtiZOstzNYgLh4QnlSoqxRUplFgyXzd
 2occ1ox4dLEmvG3UFRpcci6qPhPwv4RM63d1Sqdrc9EwosSCb6EcSqiUNchALDv56VUr
 Lw5tcQudZbKc+IL4Sjkdb4oc4futchkNBSvXKTA+qkyPhudxAJDUjtXn3L2OIMjzgSVD
 OvPm6pTVBkbsWIZlA1Mp0/Lg2j4WCRupBKkdMB2DSfOMHXrGDNOZFksnlFDx2BWaAYJ2
 zvTJa9Pf2l3IjRFDuvvD7hBkctGCEjollyw3ogxgW1Hnza/TcwHZZEAkMJH/1vNvr6uD
 Qo9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b313/vIp
Subject: Re: [Buildroot] [PATCH v4] package/cutekeyboard: new package
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
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Angelo,

  I'm going through some old patches :-)

On 18/10/2022 17:16, Angelo Compagnucci wrote:
> CuteKeyboard is a Qt virtual keyboard plugin for embedded applications
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Acked-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

  Applied to master, thanks, with some changes, see below.


> ---
> v2:
> * bump to verison v1.0.1
> v3:
> * Adding me to developers file
> v4:
> * Fixing typo in Config.in
> 
>   package/Config.in                      |  1 +
>   package/cutekeyboard/Config.in         | 19 +++++++++++++++++++
>   package/cutekeyboard/cutekeyboard.hash |  3 +++
>   package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++

  DEVELOPERS entry missing. I put it under your name - with the gmail address, 
not the Amarula address. If it's not OK, please send a patch to fix it.

>   4 files changed, 41 insertions(+)
>   create mode 100644 package/cutekeyboard/Config.in
>   create mode 100644 package/cutekeyboard/cutekeyboard.hash
>   create mode 100644 package/cutekeyboard/cutekeyboard.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..f11210d313 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1522,6 +1522,7 @@ menu "Graphics"
>   	source "package/cairo/Config.in"
>   	source "package/cairomm/Config.in"
>   	source "package/chipmunk/Config.in"
> +	source "package/cutekeyboard/Config.in"
>   	source "package/exempi/Config.in"
>   	source "package/exiv2/Config.in"
>   	source "package/fltk/Config.in"
> diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
> new file mode 100644
> index 0000000000..59362f0648
> --- /dev/null
> +++ b/package/cutekeyboard/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_CUTEKEYBOARD
> +	bool "cutekeyboard"
> +	depends on BR2_PACKAGE_QT5DECLARATIVE
> +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
> +	depends on BR2_PACKAGE_QT5QUICKCONTROLS2

  This should have been select rather than depends. I did leave a depends on Qt5 
itself, of course.

> +	help
> +	  CuteKeyboard is a Qt virtual keyboard plugin for
> +	  embedded applications.

  Just for my information, what differentiates this from qt5virtualkeyboard?

> +
> +	  https://amarula.github.io/cutekeyboard/
> +
> +if BR2_PACKAGE_CUTEKEYBOARD
> +
> +config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES
> +	bool "cutekeyboard examples"
> +	help
> +	  Compile also application example
> +
> +endif
> diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
> new file mode 100644
> index 0000000000..3d3ec2f858
> --- /dev/null
> +++ b/package/cutekeyboard/cutekeyboard.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  8cbaddc5fbf479d5e20fc88228e9af5928fa5e588052ee496c2f2efbe2afc510  cutekeyboard-afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7.tar.gz
> +sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
> diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
> new file mode 100644
> index 0000000000..3e4c08f44e
> --- /dev/null
> +++ b/package/cutekeyboard/cutekeyboard.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# qt5virtualkeyboard

  cutekeyboard :-)

  Regards,
  Arnout
> +#
> +################################################################################
> +
> +CUTEKEYBOARD_VERSION = afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7
> +CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
> +CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
> +CUTEKEYBOARD_INSTALL_STAGING = YES
> +CUTEKEYBOARD_LICENSE = MIT
> +CUTEKEYBOARD_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES),y)
> +CUTEKEYBOARD_CONF_OPTS += CONFIG+=BUILD_EXAMPLES

  This installs something called "example" in /usr/bin. Not the most distinctive 
name... I left it like that though.

  Regards,
  Arnout

> +endif
> +
> +$(eval $(qmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
