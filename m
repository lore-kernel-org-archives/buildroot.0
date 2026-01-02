Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C9BFA3753
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D9D8125F;
	Fri,  2 Jan 2026 17:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYMsVAjpoTix; Fri,  2 Jan 2026 17:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA3981264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373466;
	bh=cLtZRIhqrzsel1gXETvE0M73hCKyGrrhAOn7zE3T17U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L4jhQcVEzn/YSohf/7g84NWa22is8swUlBGW92d3dP3GfoebgmWN+VCR8ofkbbxHU
	 VTjpV6/5CTHpv9ORG/4MbdXnZi6LMn4/YqS30Hs70lJ7Xgne1uxj/IXmnjFX15R76V
	 q/2usSkyuQCTs/WeKqcZ9u5p+0DtOvmQssns59bOXjz6vcM5ewlfKybnOaibCJofE8
	 JZhNpACobpJoQlDlezrjfq6wdr7f6+hy4qjau8ij+HW71ERE+Aw9A1F5xxrqLGBci0
	 +225oU9Tf69tdsuqgovSbLD6pJDVEMS1E9eRtvWzZOFYfCRF8KyQx9JP/N9Y2TJIS5
	 3/kTBw9lpMHmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA3981264;
	Fri,  2 Jan 2026 17:04:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1AFD351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3D9A403A5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTpF0uMq9F2K for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3169400F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3169400F4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3169400F4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:04:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 316C5C1C3B7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:03:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F2A9B606C7;
 Fri,  2 Jan 2026 17:04:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 757B0113B0718; Fri,  2 Jan 2026 18:04:17 +0100 (CET)
Date: Fri, 2 Jan 2026 18:04:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Message-ID: <20260102180416.5987ad9f@windsurf>
In-Reply-To: <20260102154342.1180158-1-bernd@kuhls.net>
References: <20260102154342.1180158-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767373460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=f6qECkXD6b/8zIzVDYwBmay5UuPP3+ebB8g2rZDApfs=;
 b=yV/124g60XBw1YNFjhkMCXt11aK6pQ/rCMSqwnh9imvckpbEpoVqvsF9+k16t/mYMfs7RU
 24GerCgMtTLUYhDL3qeoQIS//0KBA5yPTsdvMpRV0s3S+UBcBF9GOKY+9bmJhmJez/vbAJ
 kXJ5kWOmWC296PMZ34a4kDhhPcmJm5+tSGmGmd5s0j3hJSKNHih3D47j1yzfW/wQZTwQTE
 KCdZKLcgfxukZTx5kM18Fh7oRiFwOhnctaU8DA+y01oL0p5AAz0T7CxYtx8J3bshlnAgfJ
 +QuZX2fOnbMV6rsl9G6tguZK9MUJ8E+7UZBQ7jiiWY/k/5CPGWeQitGWqpIYPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yV/124g6
Subject: Re: [Buildroot] [PATCH v2 1/1] package/atf: fix non-threaded build
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

Hello Bernd,

On Fri,  2 Jan 2026 16:43:42 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit d6c3257e931ed256e3ebcd78938f6146bba8586f bumped the
> package from 0.21 to 0.23. Upstream release 0.22 includes commit
> https://github.com/freebsd/atf/commit/d7c7c53c0626ab59a62aa4efcf05323b3621baa9
> which uses CLOCK_MONOTONIC without including time.h.
> 
> Fixes:
> https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/
> 
> Two minimal defconfigs to reproduce the build error:
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ATF=y
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_GCC_VERSION_13_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ATF=y
> 
> All defconfigs of the build errors recorded by the buildroot autobuilders
> contain BR2_PTHREADS_NONE=y.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied!


> diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
> new file mode 100644
> index 0000000000..359172c0e6
> --- /dev/null
> +++ b/package/atf/0001-atf-check.cpp-include-time.h.patch
> @@ -0,0 +1,33 @@
> +From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 22 Nov 2025 23:47:41 +0100
> +Subject: [PATCH] atf-check.cpp: include time.h
> +
> +Fixes build error with gcc 14 as reported by the buildroot autobuilders:

Note that this is therefore incorrect, but since that's how the patch
has been merged upstream, I left it as-is.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
