Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F16C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225636138F;
	Thu, 16 Feb 2023 18:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225636138F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwnDSct_ORD4; Thu, 16 Feb 2023 18:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AEC6120B;
	Thu, 16 Feb 2023 18:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70AEC6120B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8161BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22F0E4197A
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F0E4197A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ug7X-oLrOlBV for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:31:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C78EB41978
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C78EB41978
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:31:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m10so2746158wrn.4
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 10:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/+dzYPEfELM0gZ3XsHu+TVrFdZacWCDKR+tCWoyVoU=;
 b=D97cStQ/iUeTHNc92mLI4UnrD0wGKYrA2AbrinRpwU3YUKaJuaRha0tZCRYP46cmuR
 fWN70cWO8Rlt9MJn9xWgwh+1LSAd6DGiwbGDi+WQb9Fj7IwSR8LlFcFuzE1YLEs65mae
 WvUl0PpAVZWUjzeHUnnavZr0d4yb0huarZK/rpd+TOi+5O1uq5iMpqp/JjU71T2lf4CG
 VuYSC+/dNddTNDOKP197Z9SKLWZAik+fVZ9CZf7ubH94rRWopMQvBgRC1UyRe2Q7bbIH
 o+Ctf52Zus8Y6A6ezNPNUtjRTyf1/ISvecXkKPcw7cFkE75d82NH9xdiD3VhDJEEqBxy
 c3BA==
X-Gm-Message-State: AO0yUKVl4+aXG4nPD+V/omXGWdk6epEmc4IVKsMxf0OhrEuhNAKR761r
 zSIK2G6+ZJZn9ZnPOYcPmWk=
X-Google-Smtp-Source: AK7set98XbUf9hPx+tOlaWSXBBssybCAtPorOiajLH2ZJQaNrfGTNHxKaBsnEiElEW9P+NyEvvn7KQ==
X-Received: by 2002:adf:cf10:0:b0:2c3:dd9e:8ccc with SMTP id
 o16-20020adfcf10000000b002c3dd9e8cccmr6116363wrj.64.1676572285804; 
 Thu, 16 Feb 2023 10:31:25 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b002c569acab1esm2082524wrp.73.2023.02.16.10.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 10:31:25 -0800 (PST)
Message-ID: <5d06d30a-064e-b8a5-b9b5-3ff0a5941ab3@gmail.com>
Date: Thu, 16 Feb 2023 19:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
 <20230215212209.269cd96d@windsurf>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20230215212209.269cd96d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X/+dzYPEfELM0gZ3XsHu+TVrFdZacWCDKR+tCWoyVoU=;
 b=QpQjhp5ctTGexkhW4/R6K/2N0pZWDIUIOaFariO+dSZ0Zr5bPGSc7x0XmQDuXx8FEm
 OoLzLcaW1Vn5eqLcqB6GD2+dW4wWUPmnc1cRr1h9N82FueSzGNIfTPc2igb0UvUYuNOR
 azPovs29/lAhtWhCzCADmC90oAZA4JdW8Xiw5DLBU4HJ7NmMIV+KwC2gEWImbtlt9mGR
 9bvceTcbtOBZqD/bSBlYnkhGZI/YKlBDzc4pqD02D+XQL2ytNKUAH0jCCwJc468ZddDz
 mgyoW056PQZNrcqqUNr5KXQ96APGgNLPpJ0WttIiX7Ukvx2mALbFl9ME8gevLjLM7F4c
 m4Cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QpQjhp5c
Subject: Re: [Buildroot] [PATCH v1 1/1] package/x11r7/xwayland: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 15.02.23 21:22, Thomas Petazzoni wrote:
[SNIP]
> 
> This should probably be split into 3 patches: one adding the xwayland
> package, one tweaking the existing weston package, and one tweaking the
> wlroots package.
> 
> 

Okay, I will split the commit into 3 patches.

[SNIP]
> 
> So does that means that the current BR2_PACKAGE_WESTON_XWAYLAND option
> is broken?
> 

Yes, it is broken. To use the XWayland support, you need the XWayland 
binary, which is not build yet by buildroot.


> I am rather confused by how XWayland works. Isn't XWayland a normal
> Wayland client? Why does Weston or wlroots, as Wayland compositors,
> need to have some support/knowledge for XWayland?

Yes, as far as I know, it is a Wayland client. It acts as an XServer, 
which X11 application connects to, and then it forward (lets say) to the 
Wayland compositor. The Wayland compositor executes the XWayland server. 
The compositor needs the xwayland as build dependency, because in the 
.pc file it is written, where the xwayland binary is located and which 
features are enabled.

https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/xwayland/meson.build#L65

[SNIP]
> 
> Since you're selecting BR2_PACKAGE_XWAYLAND, you need to replicate:
> 
> 	depends on BR2_USE_MMU # fork()
> 	depends on !BR2_STATIC_LIBS # wayland
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> 
> and add the corresponding Config.in comment.
> 

Good point, I forgot that.

[SNIP]
> 
> So this is also a bug in the current package?
> 
> What is WLROOTS_X11 controlling then? Running wlroots as a X11 client?

The X11 backend has nothing to do with the XWayland support. X11 backend 
means that the compositor can run on an XServer. The XWayland support 
means that X11 application can run on the Wayland compositor.

[SNIP]

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
