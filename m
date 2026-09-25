Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD4C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF01360DBF;
	Fri, 25 Sep 2026 14:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98Md7NWhy4dm; Fri, 25 Sep 2026 14:45:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D46C760DAD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347542;
	b=lzwXOrVopkCoxNu2rz5HDQKx4FWYHZdFrYMHon1cZjPoM/3noLUzwfKqFppiWZ3q9cNW
	 rHrmjNXFheE0c9LOb8IWOWgfxGYjoUMqXs89ZBEp+YKX6nJewlU1zMoV63GQw8FpGAYxw
	 xkXPDN11mFilAFyttFUDkIR5kgR8HMdsM2YMJXSCYvcYBbsHUp5LQHzaeGsGvr38NSLTS
	 SLiKGIKTRNhIFyhJAL+Y7xVtrqddcbLeNWEmMBRRJmswG4f/HQHLeRWYqE0MamvXqilXb
	 aYsaebk8I/tephyGexTrFuIimWyXvBzOQp18Pk6w1npvSTEvvFqv6iN8mZSyAtJ/dug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cW2+I6RI8pLBhz39JH3Ef0i+lk0d6MPenlCjlaUk5M4=;
	b=ed3eeiWPm86M4kIUdOQD8Mo0COOquKDnqqR1FvPibsrKl23FTTpmJ8RUAOFjGtCw4HiD
	 OeL5rT3tHqhtLoxgrI7mjw5L36xRVGqi8iOu9A9TpTz5k4WqJ7izWxG6ElbNswxhusk4d
	 gPOvNHENspp35oDKndzr2yFuk5Rfq6ZGbg6CB6MsC3A9qt8HwxAJkuGKNaDH57F+BwnND
	 d7ehwAlYPxszO3LOGRTinhikz/0JXZymoQP86UvGHpU3a9mpsWfFH14JMkmvteZWmGMuh
	 63ZTn7j59KldcbAU1FwRjNrMsQM+dorXlNZLpnk9TLBxFaJLnJhjXgNCoUMkTrMPNOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347541;
	bh=cW2+I6RI8pLBhz39JH3Ef0i+lk0d6MPenlCjlaUk5M4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YF8UA2mxep2HDBx8qQA4GznedesPY/BVjMJN1SF9nK+/4WNWhH8/Bi8i11Kfris6p
	 fxDnDVpcyQNw5wWDOGncUz4a/YGF7KKSEOQbwq/wHUPeH7PDpjQVo/wbQP2OffWSXK
	 nedm3+bzRuNXH/2+dJ/IyX4q1FlXaKgXbBCF+A1mluChCDIJ2o9a09Ak0PfaUTs97U
	 31KW7quIKoesbw3XUqwmnX5UTmtvym7pd78Dr5lLRkS9GM8Tyb6g2t+5Ah+vuDxvO6
	 769P1JMhwY8suy1pzavk2X0yRV+4nuLn+TlKzjBB4TtwFaYFaydJtOzHSH30HAqNm1
	 hUSBZBObdcpQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46C760DAD;
	Fri, 25 Sep 2026 14:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 899EF334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BE1A40BD8
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD9LkSwqRpva for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 96F2D40790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347539;
 b=elUzbmXU0mzbC6zwTAk22pwRQsD1NZOecUsAa4SgJzXRO9C2IKKosXXI0H8WtXQMGx0a
 OgQnBFCKpZfd/7aVZwIYQvInhxn3qEhlq7KwjNwcuASVfyKbHIkybCP0igPsvWD2pcOQW
 hSfyk15oZ7/LdWrm62UEYHByksVKAB/3rSOAE9cnrHcJSA9ZIUMwoVyq0osxsPIklChht
 hdMyWyIyzY98wHpKoj/oBy22eUp4E0l6wtooePqyFSPq2sY8Zf6xBaeAPHuFMEsgargMT
 XPARF89YoXPD4m2ZD6eDHRgqYUbSE4f87eLrUrs139ujHKk1iEIjbXegwfYTfOLJZlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347539;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=TGm53ZWmChw1Ed9lNikuK7ohl+ouYamC+qWF8PqGnDc=;
 b=PJJOXuMZ59dlJJxujP1qT613aGtYZe+c8fu0iXDbv9GsRnl/s/1BbPO1txY/qgf/MD4g
 V/eg7wmn450I9MIWNZtSequw1I9bCJ/tNmeIqpcZkCS8uxciJIFf7/6HpHLKiBWIb7OQd
 Q+JAVeaZp0i6gVYOEKLZ8Ef3TI8rngI0blhePQzGEQAf5GVrIeVtisFake20CJeiFr5ti
 g3kItQ2mq/FnlwZlqQfbMtTcZkEv/n0akwl4kQso8nX4DoSmVqA9NvEosdRziTe/gVoI+
 rY8buX5HxDFt3ruPKdCDmmpwTBkn608elzsHAgEV1B8zZZ26QOXzW0/LLFygoKkBXVQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aCeVQjRa; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96F2D40790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:38 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so6729645e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347537; x=1790952337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TGm53ZWmChw1Ed9lNikuK7ohl+ouYamC+qWF8PqGnDc=;
 b=CVTqAI1MrLQUDv73FVctw0+ZUYs6xI3FmUUDh/p9RdiraQfA/O5MBPGG1DfijShybS
 tc6s6ujq87WFjhXmUJSPpK6czgHuIH5Ma/b8LZ7ojBjftrBHvMtyuGxB1v2mMU28/u4x
 WgNrtZiWaSF1925fO3zH7Fn/VqwHOz1L0W3fh+N0HVYPIWMzRCa0uig/Gpa2pwF5Fv+o
 WqEpfT4EWzXK+Fys+GIcpUC6bmdeMT+UIjltGblMe+K17Ny5y+Xhhg8Lizhm53bEiBjm
 r19nIUjeWAhR04lnsuNGRNPlNlXGnyepkmzclFNJXX2EJu3qtJa0Szv0o7+ow2HboCcs
 xdUg==
X-Gm-Message-State: AFuF++mICv5iZU3cN7AKC0lFushlnB+T5OlvWnMcDPX7eFzmp6Ebuy9i
 h1m0m/DqFNXwrPjZLLKJAZMVpczmo0rsEhZvLTMev/T+7pI7metHesmro3ka/seJVSQM7jsERvf
 8/hfhF6fPMg==
X-Gm-Gg: AYBFou0ha9FDfuL/2eApKVVGKcRhdSEGfjvpEEjmUkWfnYZ0kNY28IGd0ko+5ZANof8
 NASFRGJlcgJ+9Nrw/i6GZMJU/RtaBFv51im6UrY/nmXL6s5qXaiMp/rMm1l8p8CYTz1Nq6vP+aZ
 TLsj7V0wpKnC4tXVysJH3S2V9/RMFnaoqfkUdvf6WebTqIcUwuIGOt++7jMZpbOoVczWYQhNHC0
 IuUCOH0m8fmtnljDnW6oVdgmuHwfQltm8PDTBFeNCyZN9MkE88L72usKP7cP2SJlZEIV9gPwhMQ
 DkRoSA3CIHqLRcUM/mqBIH84YRpcJx6tQGE5XJylAbqdKCmOS1eB5uFTReS/tmcel0KbL0IgvcV
 UzTWEPUArx4DiUfM44tslSVcSCj8tXXh0HqfIFaygh0wc+QOgnb4ZN5hhQytjoGbz/bEMLF17MC
 UTog/svFlxoaWdTIBkL7vnsg51El0e+WTs1aCmbohZwOL6mUDqkdAq32vTt3yPHmUf48KLGFq/n
 fiZAfTuwDUexGnc2PXa5pc6WFaoA6OBqPh8bIPymw==
X-Received: by 2002:a05:600c:630f:b0:49f:bd3c:bc1f with SMTP id
 5b1f17b1804b1-49fe66fd51dmr105902715e9.26.1790347536725; 
 Fri, 25 Sep 2026 07:45:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff21c38a4sm30346915e9.2.2026.09.25.07.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:32 +0200
Message-ID: <20260925144534.4097984-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915213830.2025823-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libgtk3: add missing
 !BR2_STATIC_LIBS dependency
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
> libgtk3 selects at-spi2-core, so it should inherit its
> !BR2_STATIC_LIBS, which this commit does.
> 
> This has been an issue since libgtk3 started using at-spi2-core
> instead of atk in commit 2c3ca7bea1de76163aeef432412eb14551ed0581.
> 
> Fixes: 2c3ca7bea1de76163aeef432412eb14551ed0581 ("package/atk: remove package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libgtk3/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index 52ee50db49..f7618832f1 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -1,10 +1,11 @@
> -comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
>  
>  comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
>  	depends on BR2_USE_MMU
> @@ -23,6 +24,7 @@ config BR2_PACKAGE_LIBGTK3
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>  	depends on BR2_PACKAGE_HAS_LIBEGL || \
>  		BR2_PACKAGE_HAS_LIBGL
> +	depends on !BR2_STATIC_LIBS # at-spi2-core
>  	select BR2_PACKAGE_AT_SPI2_CORE
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
