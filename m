Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C297CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A767960638;
	Sun, 18 Oct 2026 20:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJu8OdQRFGxX; Sun, 18 Oct 2026 20:35:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F4816060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792355703;
	b=OdTYedCa1hYa20nUeyYbx7j5uPqusmmzhsRfjIYAO+8K1yBiU52bZoAmnJbxx8BhJW1s
	 e9IxPpvIBf2j8AeOMZpbCtpPp3hSAhoUPpa0zGdUjlu1oacgDdxnG+5bPsuGO86C+qGov
	 2xG0rQPk361fTq9IMc92fY3SWZcoL8LOnVUiftDPRpDbykOA8Ob+L8SNqr2g/dXTG/2Y/
	 HKgXjz+NppRVfQJuXbfR3P+RChrOYFpo79VPSvGvV68wIaD4BWBfz/tfLnx4UmKQB7k2T
	 3nGKxApI61zWLdqKMn2Pt1rbt4lefphu/Jztihq77HwKFoma3b8l+F1ck1PvF7lM+fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792355703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=46znhZyQe7aBJ7FTHRYmdB6KemzclyRjCTUUEE4VPi0=;
	b=OfVi5QkBEJVmkUpQ3Ri6xhwCs2526fhybEUVa5IDWx1Y98zONQTcCb8/cHD46nOHOxm5
	 5GU5GloJKxOjbvUW+C/22DUwO38DTqw6qSot2Uc0OVw1vYPSVGFN1YQfOl8sS0Af3C9Ib
	 Um2rGT7A4bC6toxYOnrSEd4tx/EDm+iddbQC+y51YLPTHGp0bESJ8TRVLYZsFZ6vaAHxg
	 nisu3K4rtUr+Q1ADN8/ijm4Z9/TOVir6fdimJXLR3vdstqCCfGKN+ykNijRnkgJK/IVgq
	 iqrrFll6E9YU1UInpwTwFGXDl3kxrNGO8FSopYQUzFU2/CDomuZis+SfAE3EuTX0e5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792355703;
	bh=46znhZyQe7aBJ7FTHRYmdB6KemzclyRjCTUUEE4VPi0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZAsI5/346rbDTukzyYDri5P1emAR6eAsXgCCpPF0dU9xqClZdaHXR4IIY6cS4BkRG
	 zbbw4OTDTF6c3AhucMvhwC9C7NOrLcGGmQ/d18Tbgek3bbfuXsks2Vn39aCn/uu7cL
	 HQeC4aAon5aJwvit0MycRHsOy95xYPZCar57yTqJpaH8ZoRH3B/BQrlsFDoDBHl6dl
	 /yDaoFKiVcP93dxRsgZgepzYMTB1YhcZKMBx/hpF+GEH6CBmW+5q0GE4ENl4pLfiM4
	 Fq0AsAZxurOVnt368L0vCx4ydPbHnUPI9DdmMOTUwWCCzh1fB95eBPdcqPrBMJ/YJe
	 y/kH989/P403g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F4816060D;
	Sun, 18 Oct 2026 20:35:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 165112A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A4C80E3B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcEznHJz69F4 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:35:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 723F780DF7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792355700;
 b=AkaNhiRnXtPVOqtUFutF9KIGN9NP0KgKndmKj6pUTsl4wYdAO9MeBwPwoQFi5R4PjjWJ
 WLrDH1omr13VYE99m9rmui0DmCPxe8CPBq8E99sYZPy0s8PK7lciQHhhUynvE59Jx/vGJ
 LX/JsW8FK7c0b0hcR8WSOB1MhsJV1xVI5QRLa7HduvwMMVjqVswpgU4y/rdCgu7E8vqW0
 iqvlyF7hPPKZIUIf8dr/aD7360yTGHbEGGSZDjisU4cyZnmhBXPCkGG9/2MnheWQaNy1Z
 yqN7UaVoiYranKrUqPSENpz0rReSY7Kno5lKx79bkOY0n6b5amjRzSA8jZXXf0TC5XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792355700;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=IF6fVznQ8q2ogCpu2jf6CdPOOK9jDcqogYh8alsj7dE=;
 b=b5cULBSG1PWfLW1dHjwSosXlzCtp8u9MYL8NY75Smke+Nv28f9EPiIL9uvWjNNbYZJXR
 tAa5oatpQdE3QwdneskjFsbxbtYH57qaapspvmynmy1eipJe19/LiO4iwJn7L8oPTZDcc
 2M6lHBUrlg3/rxkmlLzmcJn/3xi345nntNpVcS52mdwtFQPGV0B0LLw/GlygWxHNEO+Em
 YUhIsq1H1A7vc4zy5MuPaGs8akm7ggoJWI+34Dr/J0WJQn17i9+IkoC+9aQAq1NhBJjFW
 jVz525y6OzNA5aG2fSsCEwHHOQrKUtSFVqmx2a8Kh3nMmY3eEuzo1z7kQ6ecBZKD83w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CN7Bzl8d; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 723F780DF7
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:34:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B9BD7C653FB;
 Sun, 18 Oct 2026 20:35:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2D4060582;
 Sun, 18 Oct 2026 20:34:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26BA51032868C; 
 Sun, 18 Oct 2026 22:34:52 +0200 (CEST)
Date: Sun, 18 Oct 2026 22:34:52 +0200
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, laurent.pinchart@ideasonboard.com, 
 sakari.ailus@iki.fi, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <atUtSDt32KJJSaaB@windsurf>
References: <20260930022304.541411-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260930022304.541411-1-paul.elder@ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/raw2rgbpnm: Add package for
 raw2rgbpnm
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

On Wed, Sep 30, 2026 at 11:23:03AM +0900, Paul Elder wrote:
> Add package for raw2rgbpnm. It is a tool for converting raw images to
> RGB PNM. While the original repo is at:
> https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git
> A mirror is hosted on freedesktop:
> https://gitlab.freedesktop.org/camera/raw2rgbpnm
> so use that instead, as it likely has more resources for maintenance and
> availability.
> 
> As the build is simple and has no dependencies nor releases, use the
> commit ID of the head of master branch at the moment.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

You had forgotten to add an entry to the DEVELOPERS file, so I've
added that and applied your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
