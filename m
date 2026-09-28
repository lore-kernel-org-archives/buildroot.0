Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CAC9832F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA06180DC8;
	Mon, 28 Sep 2026 08:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NL01xbD8QA1v; Mon, 28 Sep 2026 08:51:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A503380DC0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790585486;
	b=QT3ljRKgHJ3wGwNLbMdKV27XLLhzg4Ci1rznUFEb/1tYjcAHnkxYNNY+RvBIFsOX7Rca
	 3qWcS2iFaoEzVDQkLM32k6tuqS02b45zPLkoE+D2zj+PTYPzv0SrDLNdAset6hW03TQhX
	 nCd+0CLpsD3P/grn2N3NfUOfkG6xpapu6qrknvQYuSPphwn/eHPLdG2xfUX40gqbcbv5p
	 2VgPDuuxE9eBLMzmQE7dYNzZp6EhnYugeyqQBcag21kS7ez+weJk1BWcOR/b9ivwGuslr
	 XqFMsT/xOk9vvvKo86nMIFPXO5M+I3rQiJ7uushmqIhPBW5d3lnlf+l4Avin7dT+y4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790585486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YCitL4Mwu0wPNJeskCBJYSkEDwwebXQrwq0rnPPF4dA=;
	b=ih6BTOGSR4L549nXO5vWDB08mmHG5jTqeDpd4c5Hztz6QKqwpmyqQSts1297NBdaqNLI
	 7GIf6YmZwMzSPrkoGMMwkTvuAlAfpKqz52JJVK1di1umj28ikDzObceZt4dMdQQMVhNQs
	 UtkV1jiZRftlTkMZ6eRiIhjeAqNBWbSs0LHsx9xTHXtEuElQetqIkn5+cMVopIV7kEOh3
	 hCFUxeXAlzqaace0KV1P/p2OG4eQPEDlOwRY4Kd1vKhGmDD4ZtY0oGHKUSekzslQdtpA2
	 qou06Uo+kpgl/hOpeQmsCLi53tPppzKUUMH+LaJC6ZwAEL2eN1Bsm0Etd9el1emH+Jw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790585486;
	bh=YCitL4Mwu0wPNJeskCBJYSkEDwwebXQrwq0rnPPF4dA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CwLp5KL+oMVg/uEGK188w33tDaXkfDWplmPU+AI6KiuJMDBihtjjvmnT/qd5XVT7H
	 0gNc2tfwFCO9vyzEKXlx2gyOEg9N9z7BleUUSSxLZX+3xVEBiyHK6sqwJuoC8K3Z7u
	 NvCS5QATDnW7OwWrkT3zYOXDbAfqEjonHAB9PFNhNSkZ17agddYjRvERb8zbyV7IkG
	 mKxLJCd63Xml29fAk+ITYQAO3kmKj+A731RkmteGGMNVaPeYq7ajNeMbpfXqcYMXXC
	 7fEjMxwsNpNcLA4Yf//Gb/nnywerkH4AKbAn9GIo3Ezf3aYdQPVG0rra4fG8AZqLGI
	 4XgqY8OO3KeCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A503380DC0;
	Mon, 28 Sep 2026 08:51:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D92B335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F56440102
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlwcKXxpQE6v for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:51:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9DDD9400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790585483;
 b=rGkaCKlMZXZOv7aeMzxwU5qrFHcVtkt4P3rodLZx9lqTavAZYR4xfsr24QKIup1bYdlJ
 OYsoaL3HgSsYxtrRZGNkGwsTeptD3zwyjxANxvJo2GbMZIR56bJKjLsZ0XndnsWWvBm2U
 fxKxFCTewON1KITQj2BzM4ElJPDu0pMC0dlcNWSv/wNf494wO/dpmTnJkUPXguVeCf0nK
 VhkfWPOp69zow+dda6Yj4q4sIC9EOFBvk5jG9SmCFotdB1TQpwNtZ3LKDMwXfytJgjsXU
 EPtscjS29CxDFy5Osn97nhsBx2LUK8zJdRlSpqxND9R0ZEWbtecLbODWu8PY5ClS5gA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790585483;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HecrdX/HPPEYCa97cxapmU7ziOjWclv4obOTdKv/mpw=;
 b=ICh/3r6bMt2Uqe9gwMOlKlriOPpRCdd4Xk4SKmR/JEVYECQ9hGbFJ4u20UrFkmgl2txD
 tNxMRDZI3rfZ9QOO4qNCp9bj7LIxTAUvUoOrJAD1lkY9zqYTxv4mOoT0KmH7wcIL285SI
 znhra8+485ieWT+DHXMLsbHhsnS91vFhPeyzWDuE4jDSJy6JbgFEhZu/7xJi3VZwcqHwV
 wwtw2uT6x8U1lU5FQH3Db3QJYGnvFJYr9O8MWjBGWrhyeiytxUVKhazTeLwsay/16L9Vt
 J0WCzLDVj7wYsBkT8ZQFYuxwiLC85jd1ZUL7uH72cMqsu+0JWJfxGuc1eA2nwYxDXJQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JfCdYIoX; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DDD9400AF
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:51:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CFBF01A0D72;
 Mon, 28 Sep 2026 08:51:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A1A82601BD;
 Mon, 28 Sep 2026 08:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 375B9102F1EA8; 
 Mon, 28 Sep 2026 10:51:20 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:51:19 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Adam Ford <aford173@gmail.com>
Message-ID: <aroqYveaULyifpvQ@windsurf>
References: <20260927204842.1113860-1-j@j-ernberg.se>
 <20260927204842.1113860-3-j@j-ernberg.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927204842.1113860-3-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/x11r7/xwayland: glx depend on
 mesa3d{, -headers}
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, Sep 27, 2026 at 10:48:42PM +0200, John Ernberg wrote:
> The glx feature of xwayland checks for dri.pc, which is only provided
> by mesa3d{,-headers}.
> 
> Establish the dependency chain properly, otherwise xorg-server cannot be
> built when using per-package directories, and will fail to build randomly
> in the default build when a provider of LIBGL has been enabled.
> 
> Graphics stacks will use either mesa3d or mesa3d-headers (nvidia), since
> those packages are in conflict with eachother adding them both as
> conditional deps is fine, we can't accidentally depend on both.
> 
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> Reported-by: Adam Ford <aford173@gmail.com>
> Link: https://lore.kernel.org/buildroot/20260803140815.617446-1-aford173@gmail.com/
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
> 
> Adam, since this is basically your solution and I just cleaned it up,
> let me know if you want a Co-developed-by tag or something to that extent.
> 
>  package/x11r7/xwayland/xwayland.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 02a21b96c1..e6ac104e0a 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -39,7 +39,10 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>  XWAYLAND_CONF_OPTS += -Dglx=true
> -XWAYLAND_DEPENDENCIES += libgl
> +XWAYLAND_DEPENDENCIES += \
> +	libgl \
> +	$(if $(BR2_PACKAGE_MESA3D),mesa3d) \
> +	$(if $(BR2_PACKAGE_MESA3D_HEADERS),mesa3d-headers)

For the same reason as for PATCH 1/2, this cannot be correct, as you
have no guarantee that mesa3d is your OpenGL provider.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
