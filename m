Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD26C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B69582A87;
	Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDeH6GAfP3gM; Fri,  3 Jul 2026 14:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A8D182A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089177;
	bh=bY+pY/v780RIyC7sOpDVorWOQOKLTJppMSZT1GYjjOw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lwiBxBALJ6iXHrRUnSgn+BWFoMx8T4ha6MEprq4uTpD8lq91V9UkVAnjWjKfVZYfY
	 JKcGXLvSggZZhCf9aD8jgl8jF6+O+oZBZbxquv/yC7UqMdwa3AxaZQZIUupPZSYSFS
	 wCRiqBxwxiRMM/KB1T4d9cTz79wrY1uc9tY/mSZHiYRa9oVLFIRLjNfkGIh8FWUgOO
	 ytx4U8yGUzfHRpWKltww4G02QudBJHEaeW+lIt5/sZQf3inywmKtE6eTh+wEDCQuxI
	 qTSFFipTs45h8t4CBpcm1sNYPSl+G5MVVdee7SDKqNy//z+UCqT7mxkuBwnsro6vJ+
	 JeYfD612v4PcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8D182A26;
	Fri,  3 Jul 2026 14:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 911CE363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82E9A60EDE
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiPpMTJY3BJ7 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F55A60EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F55A60EDB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F55A60EDB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so6495515e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089172; x=1783693972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+0FqxYcvFOThBp2HXLVpx/hOWitkbD985juqHdlIIHU=;
 b=PxNeivEr5mQfyihrSYSo6MzSszc4BWN6dPc9h7dc5gHBMfqBGPArox4f3bVljKkhMq
 q4YwoqSWFyLV7XhlDgG9CKkdvExcGD+0mgGtHQAIwC4t5zXnEAK3Avsdovl3xYXFv5sm
 ++c63Xtd54Gc1LMlUVZNJwponUMKh0t3BGDE7WJ8OZLJdTCHGivJRpMZihUh8u7PRKmB
 hN5HADJRWqbY2DyJmLTkYLkho/ohOvlTX92bTXZ5wECveVK4VZKhW/Zk7jH/wjmDIW70
 dvnBNVNbAqPBT1CWOthBCXDnk3Vyg9zLSlpHK/YaZGm1ZQJhV2PWowNxfGxwBjtr7Upm
 11SQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Tm+3k3vfpjstY6dJ28GSIkI1tzWvoyAqvSFJvNaJHMBRxEXPEmuqASkVYACA030i0xlgQJY+mL8c=@buildroot.org
X-Gm-Message-State: AOJu0YzSx4yGHTjwt7feB5GgHeUA5Tr95Jq0DxwLw+XoCvLAWBgm+n2w
 7NcdT1257S0mtHtywcxWXVholpmm7xX+6LUZJr3cjj6W73LuoXVZGZbWUmME2ZAsm4I=
X-Gm-Gg: AfdE7cljT4bzEc2bzyb0nnshOZ3kr9wg20UsMQITduk3trWWitrA6s7fDOvzyFTeNBp
 tdUW3zIUHxzsQCl6W/skSz1uSNx3EtBlqbbhw+ulA6pqmoV8kuPylpRMO1oZgzSiUE+JxEuOyRB
 JodTK41JzlDAytXlYpdc73j5in9dG0ZSytmnEOXrWaPi8kyBPaCj5CKIxZrpLaQL6YsyBcJktGp
 punummDdCQPJrwy6l9N+rty4KUyQJFTJcCiURHGYSdB2f71whJuIWn3zX6//8avgP3UujzvFZIT
 vvvc749ahDZoDgS9TtBS/XGHSa1G7TIG/U6WeqF+NhEjoISxZ05Y/2R3PSnMVd4aEHA8xrk2Vs4
 L6lQeQaWsyWJSybiBA2GRjsyw6m67iTtMObxsZimjjL+Jw++L2FiPaIRqbQXNhpTodBlvPZf7HM
 lygfji
X-Received: by 2002:a05:600c:1906:b0:48f:d5b8:5b07 with SMTP id
 5b1f17b1804b1-493d0f30e15mr1157565e9.20.1783089172317; 
 Fri, 03 Jul 2026 07:32:52 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94cb64sm19784229f8f.23.2026.07.03.07.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:51 -0700 (PDT)
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:51 +0200
Message-ID: <20260703143251.275141-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260607-b4-virglrenderer-v1-3-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-3-15cd736c623c@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089172; x=1783693972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+0FqxYcvFOThBp2HXLVpx/hOWitkbD985juqHdlIIHU=;
 b=cZfJVTNhUkQsCMRThfcQlvGZ+YfHcex8JG0DJaRGF7MIvlb9XFfFrfVR8rKUbunOSg
 4OuZrYrFWrR7xJNbkijeGpNeFYGnBz3+5/5KnN5PN1TBMn4WSNrwxTG3kzCQ3K9Sb90/
 JSfZOgb4dcC7qe7JALGXC1y/Fb83VRlfXJ7yPn/rvw5Ln9Qsau3qAawmPRTlUtoDU5hw
 32ku+1NLL7uoNelJlegK/WD2uLRrcfN43EQa1PmnrCIx+tScO4Q6JS/LmfBUW2duVUWU
 uAs6pRssBtq8bVogSqvuitZ5ZGvJkjbxKvWWGa9H47dmuGam+SNq8Rodi93u6RG1cXVX
 GVWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cZfJVTNh
Subject: Re: [Buildroot] [PATCH 3/7] package/libepoxy: remove gl/egl
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Libepoxy is a library for handling OpenGL function pointer management.
> 
> It has backends for egl/glx, which may at one point have been mandatory
> to enable, but the library now builds with none of the above enabled
> features, as seen below.
> 
>   libepoxy 1.5.10
> 
>     User defined options
>       Cross files            : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
>       b_pie                  : false
>       b_staticpic            : true
>       buildtype              : release
>       build.cmake_prefix_path: /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
>       default_library        : shared
>       docs                   : false
>       egl                    : no
>       glx                    : no
>       libdir                 : lib
>       build.pkg_config_path  : /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
>       prefix                 : /usr
>       strip                  : false
>       tests                  : false
>       x11                    : false
> 
> Removing these dependencies allows for some applications that require it
> as a build dependency, but otherwise can run headless or without GL, to
> build and function, using other graphics APIs or display pipelines.
> 
> Weston, for example, can still use Vulkan and DRM when linked to
> libepoxy without GL/EGL/X11 support.
> 
> Acked-by: Arnout Vanecappelle <arnout@rnout.be>
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/libepoxy/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
> index 9da190b895..4b23497d46 100644
> --- a/package/libepoxy/Config.in
> +++ b/package/libepoxy/Config.in
> @@ -1,12 +1,12 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "libepoxy"
> -	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>  	help
>  	  Epoxy is a library for handling OpenGL function pointer
>  	  management for you.
>  
> -	  https://github.com/anholt/libepoxy
> +	  It can be built without EGL or GLX support for packages
> +	  that use libepoxy as a mandatory dependency but do not need
> +	  OpenGL entry points at runtime.
>  
> -comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
> -	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
> +	  https://github.com/anholt/libepoxy
> 
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
