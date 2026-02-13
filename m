Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B9EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7014C613D6;
	Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvtwhWcwX0y4; Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901CD613E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011451;
	bh=difoThkE5o4M53TfrWwWLmD/dGIzD5TX0bI6mhxMljQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=afSrFV+UmCnqCZra/Ye9VaOybJe2rtxAYQMYNpE352T1+aKaSK3t+sw4uUqHFJysZ
	 PqWi0ckfZ/sNjRAjmGoy2aJMpMHYBuPVH2OEWd7Co0jWwNswYWPg6HiAU4/Z/9u3sm
	 9GLgCpT8ClNgGzmL9C9yrwEgi7SfjwgFGO/z58/kFIALdSS61RukSiLW1SG5aACIjL
	 eB+tde5N53GftrJl5IDicj0pog4oryyhJPXHItZ5SF+CcceU4dFxYr7efPRUmiRkhk
	 jjssrWr9SBug9eL6JJAz1ySrCy4MQxK93JWXS5I47mqcoe2WUdn18QpsdvMbvomQNK
	 OnVXm5renfVNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901CD613E0;
	Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 160CA69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BE314035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeThwvX_aofh for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 662794026C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662794026C
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 662794026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so1049365f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011417; x=1771616217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I6yrRCrbD/+JCey6b21S9mxeqRKUbhsjBsf10aeOPog=;
 b=CuV1479iDtyoKLU4/nvUVFb9JcS/T20o6YPn8p/3iGDIF4Ry1z0CkeI8u9NM3NgwkA
 Sz1GA7tP9lo3yy3N+vBH3CQ35qNJDvdvOUvCbFf4xbcF7Q2tBCanQ102Ieh4788ZBJg/
 wYZwMrtvssfiyl9qigVbXlMc/+kdtZbbsFkK8tzv9xyI4O/WxucJoM/yMadDRrowfK0f
 3NTKCFjyKf+uuvbI1Ck7Y767LxQR9r1GhRmZE3fSi3R4KFjXlBpM2aZgyGLDmy7wwsWQ
 Gjb/QG0tWHgoctak8oY3asO1sF678lXAfR82u1/qobHer6E6O4elLQOiF4xtoWqSBMuR
 UE4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL1VzBIKD7b+6g+Aaj8QYITHzgLK3PxVrv9HKMu5Z3yuAHC462PBWI85M41VgwkiiUiIbKuq2pf6U=@buildroot.org
X-Gm-Message-State: AOJu0YyMytrHRh8Pgz9p8opX6c2WEnZtwVVp86leGgt5OB/aGEUH+171
 SxevUThpo90hqRQMaOwSVcF0qqFYQHnwJqejO98o1w0HCz2znYsyaXhdYvtJDI75h4McU0Ma3hw
 xUWeW
X-Gm-Gg: AZuq6aIn5EtH8zujCeCAnNDKuHnXzcUag4ElfCnlqvKi0iNk/W0daawkchvyibDk6Vk
 9nkMIrC3TySE90ljAiYbb4J3DKLucwjmiI60U8qOHxy21D1TuZMwuH0cCr5r7khOzQMWHj8H+zB
 wft/Xru2hT215vSCUT5NooeR3EUaPMVN5YehoE0yg+AF+fh4LjAWLCl0TsO1P78RBEavFqMbq+s
 Lj/HEmgv3yy2D5SSjj7VyFgkdZFNsl5Mo6dZb6RvOCzSvLohr9AshS70f1bM0/wHv7cDyELMRkS
 YWxNVmVG43KQHVpflkIA9Ose/oVXmmJBCpMzkVx/VlyuDoeQszP9iujcp7kUrYxDQ7H2ghipzb2
 RFisQLbnAR+1RqQX+cCW/8DpbANkfOLG8th71PjOke7ncSMaVHW6H+hZA8DG5cGISDhYiUzWfnq
 3kqLC16a17S0h3Qec=
X-Received: by 2002:a05:6000:4283:b0:435:a135:7772 with SMTP id
 ffacd0b85a97d-4379db358abmr1056526f8f.4.1771011417305; 
 Fri, 13 Feb 2026 11:36:57 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm7983993f8f.30.2026.02.13.11.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:57 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:56 +0100
Message-ID: <20260213193656.38666-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205195259.2348677-1-bernd@kuhls.net>
References: <20260205195259.2348677-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011417; x=1771616217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6yrRCrbD/+JCey6b21S9mxeqRKUbhsjBsf10aeOPog=;
 b=b5z1nzQm2jYEAx1pC++04UJt4zYzHirbeunXD5EwNEtM/s6rjTUZ6PMeaPetcYsbhI
 VDBQjmsi6muc8vLJsMgvzDZejPe67szZSqGd8oywJIBP3s2YizOKWVhs2puLF79jW/82
 llzlf7aQLcn08I71UdTRrjfPEtWz+E5okU2m/sHDsuK6qEOHgvCNAX10ZTWEJO4vKidF
 gN8TYmxhygGmiwkoAG5Z7FroejOyw1scn13awV940utw3d0i8RAYu5UTJgj3BWmlYClH
 abpxCZDi7aiZfEukDpnF7JnMPxCDn+dhqh712mbRU/9Xnl2AxCilIj38NFeJM8m7ENpf
 RVng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b5z1nzQm
Subject: Re: [Buildroot] [PATCH 1/2] package/sane-airscan: needs C++
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
> When the sane-airscan package was introduced in
> f78280bf262ceb1c1abbdade9de77fcc4add74ae the dependency to c++ was not
> added to the package.
> 
> The source directory fuzzer/ contains c++ files:
> https://github.com/alexpevzner/sane-airscan/tree/master/fuzzer
> 
> meson.build requires c++:
> https://github.com/alexpevzner/sane-airscan/blob/0.99.33/meson.build#L1
> 
> Fixes:
> https://autobuild.buildroot.net/results/830/830374dcce8f29ad336cf8060bda552119c8377a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/sane-airscan/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
> index b7cf224741..2324a3f661 100644
> --- a/package/sane-airscan/Config.in
> +++ b/package/sane-airscan/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SANE_AIRSCAN
>  	bool "sane-airscan"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
>  	depends on BR2_USE_WCHAR # avahi, gnutls
> @@ -23,7 +24,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
>  
>  	  https://github.com/alexpevzner/sane-airscan
>  
> -comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads"
> +comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
