Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A65C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5886F61AD7;
	Sat, 23 Jul 2022 19:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5886F61AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgqRzTeXYcNM; Sat, 23 Jul 2022 19:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4F160FFC;
	Sat, 23 Jul 2022 19:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4F160FFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D71CC1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E1560FFC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E1560FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGB_oW2gT_zd for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:21:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB4160FB4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEB4160FB4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:21:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n185so4532487wmn.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6IqUh5jkFc7+T5zJOds5eN+6H/Ve40Ci53gE0S0O7jw=;
 b=kIwaWoN1dRllqF01PBS7fPCRA1bHqMRRslkBOJJGWX5UuLETd1vs3VGj3RzUShQtef
 3tvwo/JruRz4DuU2W6sEL03j8g9WJtFx498uy1LCOD9Z2aFSxIRIn9HEErZWVOg2dp54
 OJh8bcVEi0uwBCwzZBPLp18d3+fOKVxoDtBS+1E8+GfvzdrSxhYk2LCKR9wDngen4YhQ
 av5pN/ypX/+hZrcB27gyd9f5swQ/mp2ikj8P9o21thfTC3mX+es7LF5GA6ZJq0TLSQoa
 SnzJuT1Zwv971+74UwZHEZpdWNwHXXJeKgLy5CFG18mf8cmLUAWzysimAhSHVRRaT7yL
 U54A==
X-Gm-Message-State: AJIora+A9h2l5cddo3kl0ngm6gTgIpFUvy5qzJd5Q5fwPKJ70ce9QB5v
 hmomaR8969yS4OhHVyIFILGkoQ==
X-Google-Smtp-Source: AGRyM1vsLACzHuVDSJPqH7oNykW5XtrSE48yTLbVOymo1Lhc/s8lreTKKdQQInZBkOMu7tvKEWW81Q==
X-Received: by 2002:a7b:c85a:0:b0:3a3:1884:6391 with SMTP id
 c26-20020a7bc85a000000b003a318846391mr3666951wml.196.1658604070780; 
 Sat, 23 Jul 2022 12:21:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b0021e571a99d5sm7009233wrv.17.2022.07.23.12.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:21:10 -0700 (PDT)
Message-ID: <119b655d-4756-28f1-a841-ee829f20695e@mind.be>
Date: Sat, 23 Jul 2022 21:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6IqUh5jkFc7+T5zJOds5eN+6H/Ve40Ci53gE0S0O7jw=;
 b=L+iHzY24cy+s3hkvzh/WiVf19L2xfQIkcbRrcOEaw25pBKbPQF9SgUFgoB8xnELw+/
 D1ukiml2++55v8lxMyB266oxDmDkpeEgr9fmL972Y54lP0bfM+DfZfmKum5N+BkLIahw
 gkyPecl1B9scAQ3NqpeqRWHjHkQcL45toU82554ymE4Yw5numgDOpuvAvAg9lnDP7Lld
 k9Gn+TimB62G/O7qarZBzO0ZOy71bb1mJeU1UCsL1coP36fURL5S187F9x6QOr50Y0UG
 sEySmay7UxiGAeHkCy6ecfeg9QIaRLmcie+WbAHRcJYM8Rihb1jUtmIBKpZrQ9Zm2Bi1
 ZCzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L+iHzY24
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 xephyr build with kdrive
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 23:08, Fabrice Fontaine wrote:
> Fix the following xephyr build failure with kdrive raised since commit
> eedbd6f97d51a0049ec512de26541465403ab06f:
> 
> checking for XEPHYR... no
> configure: error: Package requirements (xau xdmcp xcb xcb-shape xcb-render xcb-renderutil xcb-aux xcb-image xcb-icccm xcb-shm >= 1.9.3 xcb-keysyms xcb-randr xcb-xkb xcb-xv) were not met:
> 
> Package 'xcb-renderutil', required by 'virtual:world', not found
> Package 'xcb-aux', required by 'virtual:world', not found
> Package 'xcb-image', required by 'virtual:world', not found
> Package 'xcb-icccm', required by 'virtual:world', not found
> Package 'xcb-keysyms', required by 'virtual:world', not found
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/baba218c879b67bfbadc9c25d34313abc76397bc
>   - http://autobuild.buildroot.org/results/9471b77db9aefa2fd0e5be61ea84709183511623
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xserver_xorg-server/Config.in              | 4 ++++
>   package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 +++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 4fb03051dd..daf4d81702 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -85,6 +85,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
>   
>   config BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR
>   	bool "Xephyr server"
> +	select BR2_PACKAGE_XCB_UTIL_IMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
> +	select BR2_PACKAGE_XCB_UTIL_KEYSYMS if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
> +	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
> +	select BR2_PACKAGE_XCB_UTIL_WM if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
>   	help
>   	  Xephyr nested X server; successor to Xnest.
>   
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 0f1779dcab..fa5d2a802d 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -84,6 +84,13 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
>   	--disable-glx \
>   	--disable-dri
>   
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR),y)
> +XSERVER_XORG_SERVER_DEPENDENCIES += \
> +	xcb-util-image \
> +	xcb-util-keysyms \
> +	xcb-util-renderutil \
> +	xcb-util-wm
> +endif
>   else # modular
>   XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
