Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A879C4332F
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195896135E
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 195896135E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC5A817BD;
	Tue,  9 Nov 2021 22:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pa6Nc3L-Gvq; Tue,  9 Nov 2021 22:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1A68177A;
	Tue,  9 Nov 2021 22:18:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB80A1BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BAB9400E3
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcy7njO8CD0D for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:17:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8F47400C8
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:17:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ee33so2359683edb.8
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1yDxJulZYYsxjXyyuj+yNz/BgkT9DeseRwwSUItaCsY=;
 b=Tyzj0TTuwSAAo3sdWVud4Jwr6EuZ7X4mThxVCZfSblLLHm60cPxPTpAh9SeGBm1foO
 ceZvK+JQv9YchTNiNvcVQl9bv05JAocadxU1my+z0SGssOkkXP+gbF/s2F/SrIAjO+HY
 nzCGcYFbGDKikfx3Vjb3dsXRuSl/2jHiPTr501T9F89NNSoWjyxXNVnGXziGnbih5+ee
 7iDcq3oEuj5CwDnUPc6ssTBRYuXYTZOCej3lh//8/zmXy8APr/YRCNz7ScOUaoY/vtSD
 Fhj2y46bcpnl7mkP8Bx2GLUsuCsxzjcsLZxyOTTBKdcm5ngWjRz+4e1td2RQttHNMHbE
 0N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1yDxJulZYYsxjXyyuj+yNz/BgkT9DeseRwwSUItaCsY=;
 b=oSyy0YejwArapoyd/+6g4u/mhu0snnNaG2nZSvDr4FehxXbIiogQOjTzbpbOjglI1H
 jCnPueyMWdJt0jcUsxc2H7lASyAe0p0If5c36FRg3HZkWNDYmpPBGGkiC5Y/B9ZK/eaY
 SHoAvh7LiFBgXiMw0gXRi2XaRCr+t57N9++/RxukJo79fJlAgWtX0My5Zn4OxovGfZvn
 4WrowPk+iCScgdx+2QQcU7u2nbfyOz4BmvYlGLuJWdGcwNJf7WYGo62msZfM6Dslx4+c
 q1hjzguS8DCZRvLi+sUpejZM0+JbLrMZQ+3UT9mT5bBgmM/JjF81m1fwoJ5olRng7vzf
 bahg==
X-Gm-Message-State: AOAM532uomcopbsYjoBO/wALTpQhLm1wAMrmGHk7lEsaiEkxwNoeJdF9
 EsHkjd2Dk45TigPO4m3JvUdsIvvj+MN6gA==
X-Google-Smtp-Source: ABdhPJz6YapbjHuy+m7FJnrx31a/AEhk0htfwYKv/buEOakuUMnT5VKB1ZtXRcGiRui4SkynNLoUgg==
X-Received: by 2002:a17:906:e28b:: with SMTP id
 gg11mr14421655ejb.23.1636496270760; 
 Tue, 09 Nov 2021 14:17:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id oz13sm10340710ejc.65.2021.11.09.14.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:17:50 -0800 (PST)
Message-ID: <a9205a30-cb39-6873-aa11-51c1c64588f5@mind.be>
Date: Tue, 9 Nov 2021 23:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211028155938.1116414-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211028155938.1116414-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 xdg SELinux module
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



On 28/10/2021 17:59, Fabrice Fontaine wrote:
> xdg SELinux module is needed to avoid the following build failure raised
> since commit 5220d3c5c62df35e994b4b7c6caecc8d16e72b78:
> 
>   Compiling targeted policy.30
>   env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
>   policy/modules/services/xserver.te:116:ERROR 'attribute xdg_cache_type is not declared' at token ';' on line 632811:
> 	typeattribute user_fonts_cache_t xdg_cache_type;
>   checkpolicy:  error(s) encountered while parsing configuration
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a1222d4ba0abf104dfc4a3dfc3c787e843fb6124
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 2d276f90d5..57dcbbf46d 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -9,7 +9,7 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
>   XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>   XSERVER_XORG_SERVER_LICENSE = MIT
>   XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
> -XSERVER_XORG_SERVER_SELINUX_MODULES = xserver
> +XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
>   XSERVER_XORG_SERVER_INSTALL_STAGING = YES
>   # xfont_font-util is needed only for autoreconf
>   XSERVER_XORG_SERVER_AUTORECONF = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
