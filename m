Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4905EC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75668812CA;
	Fri, 18 Sep 2026 22:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv7Do63dj1MK; Fri, 18 Sep 2026 22:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 85890812C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789769392;
	b=Le9dFSazyajeghzkZG8tp09juv7pqjDRWfG/Gth6F1nvAf2/uNUnlt4PiN2zPJMSEe3h
	 FjbFG4aoVw6UrR5O59UM5PNMVYtaK6tWtTKjzZ2m2P7xU7dm2iclodor5iXY2IzQIPmGC
	 /QNyWp0mFBesUZunzxtLrKqc3q0pBsRbLSrROHOPZQ52WxleeiwTfeVlnLgZDMqaodkPz
	 KG5fbxH6SGG0eqcj9pO7pGhxUcN8EwtnZ8ho3+nddjSxeOm81TBInjEF50BB7l9Mc4M56
	 QETo3BoPbLYgwxraJqrby3idUa1j/xqc0bGy7sWsthdpLB/6NA7f9VpiPul2JDVVJ+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789769392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nRChNDW/bb2YQMlPJ+JedCfdtmf5D+f6fQXeIDO0TYQ=;
	b=s6+CnlGBrpp8cbadX0AElEGIg9ADmAHu1I1LVrQ7wWxCfmJ64x7gV/xUSFW+kI1FotK4
	 Mhmrqc/xUkRgVCivOLl5GX7meTlLGseayRcyESB41t3b1ayKQ59mLYb8q8NClt7c8edrv
	 UAuu4NOcV2aiIBjZiIQO0OAR37JieX6LJW3kZJ+Zo2jjBLnffxsQYo29xx9mufi7EzBgP
	 lU8s2XgaHuHR574ynRsoPeVVs99PMLNaQW2oU4QpkHwzOjxo3H/jM8pdh1QQskRlgxjA+
	 jEqx8f4oGD8rGtU8bED8CSQ+akzdw+xD/Aubb872xTyPajMTuHb+AkOLw6xRy458icQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789769392;
	bh=nRChNDW/bb2YQMlPJ+JedCfdtmf5D+f6fQXeIDO0TYQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NuIaQ3m24kcnLJPu1oB1qBDC0O3MNKgiMkMS7eoxCchkXqeR+U2XCJd1eVyK+z4+t
	 ih3h0ZW/E7RJ1acEJW82zvmSgvEb6AwZXHl/e0GqWrtSZFaRBKUKxwzxG+4DHuEtZh
	 OnGWiMkOleHowY53wY1tHujWKaLcDRyRmeA2S+UjL2Q/nZdmJGZpUYxJNAWPqiQKkH
	 QWF2e07WySHZCo12bplawvawBEPI8lYZpcBXShsrRYxfDdCPaVYKOcK/a5kVZn0Jl1
	 XDfg97N75zc2xAE439Ysou0zMPLI5xC92bGlV6R5jV3tAST5VWhYuGHTu+ZQ9iZI6z
	 93tP49FBf18VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85890812C5;
	Fri, 18 Sep 2026 22:09:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A806E13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99ADC400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxDPEypbWjyi for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 22:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3B40A40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789769390;
 b=B3TQw8uny+qxQHjoYsT2v8eeW/z8WNgX6XHCmBbXCGuASsUdFIusFTmGXpVAkAeAiKAG
 Vncz1j2UphyX7KR76swwBdVTNwPx6UEh8NCHV9ZEYaokCux4ZzfS197Q3uZ+hwgfdOgE6
 1Yqq9la73uZg9CfbGuiP925DZa7GNbU/hPSi75yrgdYyd5ZgAMaaW5vYDs8tYk3lh7dwf
 03L/0CH1w+sR67z7Rt+/tHTmT7FnagCWESDhDhmVv64xoMb7EIiqmltmIE0qNia3rA4ds
 Iw+qxWaOh7iEWcstBaq+/uOBYkLQSJnORhDztGcaDDatLAW2f8Iqp0d+dvFc5p9eL8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789769390;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3354MyWrJXQN8lHxadiC3dI2sO2pjCVY/8DPUOlZbCY=;
 b=aXN8Qirn8ahC7Dh3NQEZmzJb8AostysstV8aH94LhOtFS/rVhXaD8DGTlcaJm/I7jzEk
 OTu6jzJ+v2E1lam4cMMOqJC80QxH/s2xyULDCfbBudSXcirdWFamDFRU5nSEC+AxvSWkh
 +rEa+pBhfjcUhdl+LxqgYb5Mhqey87Krx19f9ep2J5sH3O0ayCX6bdk1jp1qOG7nhsJoC
 9geUiF+FSxt+wR9FFPKuJzKjQ3K+zfrppEvtWKDLj3Sb/O50STObe3bp9xSKZ/GhGXAxd
 hQouplpWQiVAZvTSuFU6jpvNPi7bJWsOfMIxAfHkTJeYoM4LSnioqp8sm6g0oF6DiwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=M5wR58T7; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B40A40022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:09:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 088611A09A1;
 Fri, 18 Sep 2026 22:09:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C31CC60649;
 Fri, 18 Sep 2026 22:09:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E153A1032907F; 
 Sat, 19 Sep 2026 00:09:40 +0200 (CEST)
Date: Sat, 19 Sep 2026 00:09:39 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq22XrnHaroLUP72@windsurf>
References: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
 <20260810165106.3930140-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810165106.3930140-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libmpeg2: fix build with GCC 15
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

On Mon, Aug 10, 2026 at 10:21:05PM +0530, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which no longer supports K&R-style empty
> parameter list declarations used in libmpeg2. To avoid carrying intrusive
> patches that rewrite legacy K&R-style declarations, pass -std=gnu89
> to CFLAGS to restore the older compiler behavior.
> 
> Fixes: http://autobuild.buildroot.net/results/53d/53daf0b4bd8b476252ca219e53a966405ece7e51
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Thanks a lot, but I'm not able to reproduce the build issue in the
first place. The following defconfig uses gcc15 to build libmpeg2, and
it builds just fine:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2026.08-1.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_GCC_15=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_10=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_OPENMP=y
BR2_PACKAGE_LIBMPEG2=y

So... are you sure the problem is simply gcc 15.x? Or are there other
conditions/reasons?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
