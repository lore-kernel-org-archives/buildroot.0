Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A8E83061
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0770C80CB6;
	Tue,  3 Feb 2026 08:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CUcmbFE6UE7; Tue,  3 Feb 2026 08:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2760F80CCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106788;
	bh=S8xTkgRRqFxQQB03ybgwcGVHMEjVcsotQktiHbEDckw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i/k/vk+uzEzx5S0Fv4UtevFlVES6c4iNmx+UMbyaqakLWiTPLorXKpZ5T2YYTHISo
	 ellAqMpYnwJuQpyWDF1xmV21CqN6Len4wDz8l142S4zDI3Qg9+h3b4Bp04LGpOQmnk
	 M46AvQw6DEv2f+byZ5JA0ohX5E3TYfkkUJBJjRbMR/C2CWDIw8nn9E3h0fOPtFzg3N
	 ahlLOzeDpWSFoI6V/Yaq4bfUr+M1ns6EO6DWqP1NeGfGcDGB8A3a9oAHGGRX7MFFeK
	 M0LGakxlN5nOEKXTcEktuqddMOurX6OI8lMChdbYaPPwH3ASpfWEqvtBDSxx1+vQqm
	 C6OkfiI/0ppxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2760F80CCD;
	Tue,  3 Feb 2026 08:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 559BFF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F1BD40B44
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5RG3GunqcA7 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5915440B39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5915440B39
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5915440B39
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:19:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 009774E423DE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:19:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBA1060767;
 Tue,  3 Feb 2026 08:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D3AE4119A8888; Tue,  3 Feb 2026 09:19:42 +0100 (CET)
Date: Tue, 3 Feb 2026 09:19:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYGvTdLF4TN6q3Bg@windsurf>
References: <20260102234005.324849-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102234005.324849-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770106783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=zhKN+YQvV7UgSPTM+OsB+AwqRp+Ih9ebrntbzdfv7MA=;
 b=hS3Jmm7zQqJiypaa8Zc/CAUiJOSCcvr/ZA83uDSoTm6MoY7twGa5I7/ry8iBxFFN/awaUp
 MVpjd+dwkA6PEl0QfkvvTuTJGnwEilPG0tgVCEs+5N7eo0Rhu16t0XFl6PetWEi7k6zGhU
 OTZOb8LLAAWYkoH3DmJgdlZjpRPYLszUHYjKTcgg2ZCBuFSdTzo9UOgW500rr2OYnJhBDr
 IQIx6ufkGlYcZ1LPOVJefN/+gEYk6tPpJji/qRHLVFqupZmOBSR18zZvbMEcaFyuwb5E1z
 a7IKQ7UeX8UwojAMMU1kBh8ndXyvu7A6yfzDs5tSrKahsCb+0n1+ueNFylVlQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hS3Jmm7z
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: depends on
 little endian
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

Thanks for the patch!

On Sat, Jan 03, 2026 at 12:40:05AM +0100, Bernd Kuhls wrote:
> Buildroot commit f9a91bf60e35617157b950eea05fc6f6144d650c bumped igt-gpu-
> tools to 2.3 including upstream commit
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b542242f5b116e3b554b4068ef5dfa4451075b2b

This wasn't the commit introducing the problematic change, so I've
fixed that up with the correct commit, and applied.

However, I've also filed an issue an upstream, because it looks quite
intentional that this change adding Panthor tests prevents the whole
project from building on big endian architectures:

  https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
