Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625F3CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A2A60DE3;
	Sat,  3 Oct 2026 16:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4h1qlZDh6Do; Sat,  3 Oct 2026 16:34:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 31FB1606C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045251;
	b=LsGO1BtEEHLp9sLjGbQ7wnE766XFZjRw9mhXo42mgL9hJz8fpfHaD0Wm6Urpu/R1V/Ug
	 u3fwIcDn+ce4zwXD+amxbXmKxLF7/zG6mAKX9XUPG8knd/BthCeB0AUFwrMUcJsNHHdTy
	 4grlw3E5gzB5wMuG6nMV3ZS6mHxbDGIXGVSC6Yqlng2iWaXYs0jMEIu7ezI4JgzbrZ9H9
	 +m90WYMVH8idOnS6xaC4VBaleL9rpNViwJwYq9iZIKDL2ee69uWUiH4nZmsMnbbsl8Cx8
	 W3oHEu3WBccTveTkMR6ChnjsfNSgmR0foTpTKucBevuEr5/pOSdpZ84WgeEGLxCgoig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PWiUPGae6utIr3ojl/onnG+Gedx9ThWd+cUCTEOLbDo=;
	b=KwyevQQYnXlMV0C7QXs78XuavT90sHRRJODqOPZdfj+FA5CQ9c/p3l0tgxpCzm8U45gA
	 4c3LaQuYr3orb+giDzi3UZdGNsfVxXcrqNq+ZnIEgMgIXv5AVZjzd+T9T2RckZrx1ci9g
	 lG+GOmWFQJ7QZtW+HdvrE8nIjk3ckVhRgMiOgTG4tJG8Sn7XT+ClVMXhcVn4XNLdo788h
	 q8vWgxkzA+rS//9D2rznu9MqW6394udpViTnS30mJGD5IDxKcviBF7SMbzrFGuQQfWzBk
	 OYoCVRuPYEeukVPdzWx93UYHMhzKMDkCzuMN2cXKGb1Kw6USshweB910/BZmmNRv+FQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045251;
	bh=PWiUPGae6utIr3ojl/onnG+Gedx9ThWd+cUCTEOLbDo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HUDxdks8PHzSy5TvIJIgFud009CXWLZh2S82YXyF4TB0oH/qX3yEi1WJAvggBux4J
	 GhEZi7307BfF9ZToTh1wbu2LKU6b8RWC8DpzsMEZNtBBdKmFgyWA6uxf0wWjrQhUL8
	 DkMJjiWU+bFonPz/xzVsUEME2ME+e5gbOuk3O1F/VyXJvCCp2wtAzsXEEzFXVQxxYT
	 X2z9kjP7ZSNcl18pPWBksRmsiFluXvBSafMg5/XJJNwXy5w1BOqlS+flhOsIRwr97Z
	 8BnYVs+zjK3FI1ypkFcOcQEeQC/yHgP6nOu7ysWleC+CS7C65T3SwYzP2+pGdT4YWu
	 AEU659xBfd7bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FB1606C9;
	Sat,  3 Oct 2026 16:34:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E19A52E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C800681316
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajX3f_D1iKJ7 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEED1812FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045249;
 b=TTpWJVPpuvF/TEPa9sMKO3pbL+9jXVGbCiXSc3ofqbi38CUfgxjvjEScAmFnFlJEsirZ
 FJjkPI+KJt5BKQTOqPPbaDMkg5ZgcaRv/M1afAsfYQjXzW8Xd47vqTYLaveZyVnKVX59f
 aI9gKpQl1/K7aaGKzaQmvIUpunSEuhDaIJ+xWkWmgJVhX3JYUFC+Vs6OiO/B7bKZe7sBS
 l56TOykczqznJ0aVNt7ti9RLkR4h58V7m0vTKBbuGkQ5bSU17+PB0yrb563lB+Ja244+E
 TxgZyu2BRyH0hLtSMwRnalPd62FmvtYR+OKvA/RfxSq58Mh1aMrRwzwdE+RIEJD3zSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045249;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=q/mtYIB6OhporxCUl4LB/HiOBa361farRx3duX942oI=;
 b=F6kKgPVMaiR7/T3q+XjvOJIwzAeor7mj6i139g5gqj2XBVjT6hQGBB434Epu80UPDorW
 JlCM+A98lWgBZsH43bBWujRq+2xpLaaWqffYItWmgqP+Y7MpDn5gtcdqkk3JPquNSO1I3
 DCq/i26JIZJAoFxUdluH+aJBvw9KXWOHf/iBWd8eI2GW/AWK2pYxoVdofTZtwazrBf2Hc
 DuuNn/fAZB2Xr75aPoysl35cfUhPXuwo+dGFNBhUW7equo4o5ob7nNH0kWo6RngyAZUN2
 EPLJTsOHvUqf+dKXVmFA0UDqcIVPa1NC7pGQjSk3dFyD6ErqGPrHorhmjMlhFLIos0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uiBmoi5M; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEED1812FE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:34:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C366C1A1108;
 Sat,  3 Oct 2026 16:34:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FFC8604FF;
 Sat,  3 Oct 2026 16:34:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B23F51032827F; 
 Sat,  3 Oct 2026 18:34:05 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:34:05 +0200
To: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Cc: buildroot@buildroot.org
Message-ID: <asEuRjLlq-Q4OvT8@windsurf>
References: <20260907213335.3492307-1-julien.boibessot@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907213335.3492307-1-julien.boibessot@armadeus.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodbus: bump version to 3.2.0
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

On Mon, Sep 07, 2026 at 11:33:35PM +0200, Julien BOIBESSOT wrote:

> diff --git a/package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch b/package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch
> new file mode 100644
> index 0000000000..21b4ecebbd
> --- /dev/null
> +++ b/package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch
> @@ -0,0 +1,40 @@
> +From 5f6af9e0e3d6adebc103a1f5a45a5b0d9c5a7e11 Mon Sep 17 00:00:00 2001
> +From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> +Date: Mon, 07 Sep 2026 18:54:00 +0200
> +Subject: [PATCH] src/modbus-rtu: include <asm/ioctls.h> for termios2 support
> +
> +Since v3.2.0, libmodbus uses the Linux termios2 interface (TCGETS2,
> +TCSETS2) to support custom baud rates. The configure check detects
> +"struct termios2" via <asm/termbits.h>, but the TCGETS2/TCSETS2 ioctl
> +constants are defined in <asm/ioctls.h>, which is not included by musl
> +libc through <sys/ioctl.h>.
> +
> +This breaks the build on musl-based systems:
> +
> +  modbus-rtu.c: error: 'TCGETS2' undeclared (first use in this function)
> +  modbus-rtu.c: error: 'TCSETS2' undeclared (first use in this function)
> +
> +Include <asm/ioctls.h> alongside <sys/ioctl.h> when HAVE_STRUCT_TERMIOS2
> +is defined to expose the TC*2 ioctl constants on all Linux libc.
> +
> +Upstream: not yet

Thanks a lot, but we need patches to be submitted before they can be
accepted in Buildroot.

I'm not 100% sure including <asm/ioctls.h> is the right solution, but
I honestly don't know. These TC* ioctl() are a bit of a mess :/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
