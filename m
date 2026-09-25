Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD436C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A499460DAD;
	Fri, 25 Sep 2026 14:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMxtjHyJR0IZ; Fri, 25 Sep 2026 14:44:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B69D060D95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347496;
	b=TBIkUb5yUWh3uwZcGJqucYr1ImYiWjWwjtV3sVKAk6j/wO2/4rFV8UmeTl5FgB1ApCId
	 Yc6rBkimcldmSEyb6O0j4xsMzSYRIwm+L5a8uNniV7XfUbF7Zkng8Oy7W5fNNkHN5JZxd
	 96Nms8bSYTHUFPrOn7fQtmK0JYEz/AFj9ub0afPIUsRALa64A5Tfd09Gv12uYiHyk3bcD
	 JOUVJgWmXHrS6gGoerN2PRgupT7KuxEQauV88M0ODdkEG/8IwGFuSb6uUHwwVkieH7MEu
	 bMcMJP2ivR17mhOoYhRThGW7HwM38TAkhT0U3x3tJiC/lC868/7byHF+YzrM7HzzY/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CZJUvkUJW3Tj9GjXkthAjUBsuEHGf1y++QU6ih2rN+Q=;
	b=iDA8L9/i+8eRfjZ575U157xakgeafo8qybO6qq79Y182pn6c8Ra4wxy3PfDBcoLStqSZ
	 kCrbC/4Sfes3X3Ql24A7HPPPluYcGsj9xjdNnpl1aECZLVcrMOfBv1fykWU+sEKozKZVf
	 XzH8rc7V50rdqqaozAr1Tvo6c2ndyO/vqk/x8koALQ6k3c2P5UXBbNrX6zocbEkhvWXAL
	 krUYaOLfyHqSzRvS88b7rRWrouRNYsYwsdeI8AXIQjScFmeXkhcKHBOI8MxG2Z57bvppO
	 VoLO9sqAwPeOJwXFWBdxTeE17Ck47B+JgFgCYeNb6CbVWwLtR479B/On7qVS8K/B0uw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347496;
	bh=CZJUvkUJW3Tj9GjXkthAjUBsuEHGf1y++QU6ih2rN+Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KT1H6KK4VVsZFsgG0nCLDwV/vaLgF1TOvd/fs05RX7bZstMLxBuM7Fp7odDFnVMgE
	 3nhE1KrdxYXpMZs5DEuh3GrwIt40dP1wEG2GqhDiwBMojJDXoNES3mQtW5BFL02aqV
	 14a4zVw8TKcBb8BXIRnTEN5fR/cO6ZsM7hkBKeAtW1KGpHExhB4c1M++DCDjVIaDPE
	 8zNdRuGsnynNc8yQf4nfXpmi/og913pw5CWNquRqhwRKx1LKiKw/G7HGFVsr4VbmRK
	 bEe/DpYIp+4ghrDrAIYdfbbO9raofB9EkVKulJtg2z6b2jk6spa8U9FcWtcoZSUqkR
	 gxXKdhVFfgAUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69D060D95;
	Fri, 25 Sep 2026 14:44:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D9A334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A8F9407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZ8rq0e7owsW for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4B34440790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347490;
 b=GsTmqWHNJIOHMw+eVIZXuyFq5scjm8FNGmX/14ZMHerN4xOYQDqC7S7BGFiOXqx5OOF9
 4N+fm8Ps1/XBLdnFy3Y357IPsRKeDAW5k/8t4XKOQNBUsOvsoyNzg9YlVnhFRdtFJhPlf
 wNf4VkZB1NbMr3uqOVdld2WsrD3Z+DxXKqBS+kNfKJ5vP56E26T99SPvfmYo6bJE5LJlU
 ZWZtfquVs+jxn1ZOFBCBiZasd2u0L7hmlx+Bzx/I6wpp28bILPN2v3dok3jj0b4Um5lEf
 tP26uxvMXGSDQHawHOQ956DbGwdY78Wye4ArBMvFCjh28RPFqM4V4RAbuPE9YOilZxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347490;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=iNPgaLUBqA+s2i+pKWPZm3M9iUcA2P+Vl0Ub1UUvcNU=;
 b=Mm0TJg+9LjKzSP63e4t1cDFEHYjCj33home8L4eF2OWw9rNZ8kK751KaknZd+Hr2zZ5H
 N3Gj/b3gkhhc0ZMpKyUDtbzPpTpJFzs6W9F1qOxuYWGtWSMsiKsn8h53RALn9hPqGmsFV
 6+Slb0DYEiadz0wmTCBq6EVuVgg7MSU7HO1rSKvoK+GiUduqFjc0HZV6fuier4dITeYbW
 oHs75SHyzZSt6GVvE5qkmg/9X6TJl5Wq1+Vn5GPLvySRjdkjVgpjliigczYg3bLe1grt6
 a19IHj575nhP+VDy99qcu+Xcq5Nn3Fe8aX1XgwJDNtU0CHPx8V6kJ4jmiAPvblRptpw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cWFWgW5T; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B34440790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:50 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so7625705e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347488; x=1790952288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iNPgaLUBqA+s2i+pKWPZm3M9iUcA2P+Vl0Ub1UUvcNU=;
 b=MiD5Y2Gl+qis6EaRs+fQa1qrATOB27Qus9vU0oMcal2rZP4YuDqSG1+NTRJbP9zsN9
 4M6LjuzU0oAkEcfOzRpyd9wipS13j3WOnHBWagI+2f4CUQNda0JFTPrgo20g7gsMyRsC
 Z0/b3lUCTKJehYl0hnCFXleR1MhTQZCvWxqJt8RN/tDArmT5SKuGtv4HnZleCPMl0nuv
 m8xNuLOP6dIrTm7huosqk/9r0S69e+W2PKGrMFBwYoP6uXtGJtTqt6tMA5ptOAz0aZrp
 1cjugkuilZZSOi5EwhUYmQGjHerlzwBpWFUnLk75kZIriStF93vCZ3S2vnU3IPehdaGx
 QZsQ==
X-Gm-Message-State: AFuF++kG+fmKhYXgXEaYAAdTFW2UoqbkrchpjaOp4RJ9rd9jJZWLfMEa
 hyCrpJvTzzlLfz4dmFFiw8VLrGDMk5iZnHlUvHnqU4IEbXasNDfvicixmMTxozC/LnEtsWFAYVR
 IbliYvXivwg==
X-Gm-Gg: AYBFou0kMGY6LqvwtWd6LxiUv1mXzjU7PVRkLhWuBkCSBDfA70SERvnb+4IYejahDFF
 aXw3DBzcoKKN0Lftda7PgVX0ddHFMw2lhCzgSjWau4lPljIWGXUBpa0ozGuxRBvPL0MMTu8wK5f
 Om6qWCI4UjA6QTmdxEC/Fw98crmvrACJ64KK43JiPodTxAdW6BIGWNCmGVtAzGGGuv6tDRL5Ztj
 jXEUXKMhNg4qR5VQ1GAp+en0JWQG280JpbJj6XZov7cjivy1jQEtIn8WHS76LU8xuNf+COj1ISn
 v5zoKqkLw1OqCFSqmxYTjd17u47hHugOb9xBT02p7/R/VvfFqb7/btNPNBrqd3GivBcbCEXc3FR
 /BROIMWMNbQFLesT3hXRujkX2SysjofFhmv6rCsTIuAyouCMPfqdZOWlZ6PBHMZaXz13y+3Q9yB
 XIXY3+RVbOEkz9bcdHUZAMhdtbM4kC9p/xLKdxX/z5G6/4W+vMWafnn4aDwMiGF4zPYBsrcjnSX
 Vz7IGMc89Dg05gLMnQSveaKEo5tOWCUAuw6jEXsbw==
X-Received: by 2002:a05:600c:19c6:b0:49f:ce72:e930 with SMTP id
 5b1f17b1804b1-49fe66ff2a5mr111785315e9.34.1790347488151; 
 Fri, 25 Sep 2026 07:44:48 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fedec53c4sm93215645e9.4.2026.09.25.07.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:47 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:45 +0200
Message-ID: <20260925144447.4096737-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914190646.3827872-1-peter@korsgaard.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/x11r7/xlib_libXfont2: security bump
 to version 2.0.9
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerabilities:
> 
> - CVE-2026-59679: Font Server Client encoding Out-Of-Bounds Read/Write
> - CVE-2026-44950: Font Server Client Cumulative Glyph Data Heap Buffer
>   Overflow
> 
> For more details, see the advisory:
> https://lists.x.org/archives/xorg-announce/2026-August/003734.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> index 86e972a0e8..d5813b3e24 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
> -sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
> -sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-August/003735.html
> +sha256  f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2  libXfont2-2.0.9.tar.xz
> +sha512  ccd6d6abf6aa814a940d137813dba638f8259c3672abf00808d82df033c1026ae29d40c9068da4f112637338ad0d0fc15818a4afa9369a626c8f17e466b4fa72  libXfont2-2.0.9.tar.xz
>  # Locally calculated
>  sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> index a881a4c55b..e8db0004f8 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XLIB_LIBXFONT2_VERSION = 2.0.8
> +XLIB_LIBXFONT2_VERSION = 2.0.9
>  XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
>  XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
>  XLIB_LIBXFONT2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
