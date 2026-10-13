Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D076CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EDBD6078E;
	Tue, 13 Oct 2026 09:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3eM07yy6s3P; Tue, 13 Oct 2026 09:55:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2DD286075F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791885323;
	b=OVRoS6MdqVUgQn1QpVdDSBiLholc4lIn0mragNVC+SaqtMQvkr2tapD2ytL7FJn4LLrw
	 6u1ilhR0QkJw18vr+DONRZ7n6p33pxdQYIPksDMDmlnjLW9SEQonVAVLYABu3WAALdFLr
	 NQ7U7Quu5ixTP160cD41S+kZaXHi2z3HPXruHbSFjNgWj4moe8eVS3/bU1tfAngkXoXn+
	 vNvsjFhw2YwBFT2TXA0SGcajCXEhleAMe7rIGAq9LWxfoYf1XBZFvgsoVlf6Jeyr6cigl
	 w+ly+yBYZy8W3sXd5TQ+J6P7g4nW8jM5z8Je/7JBylheQTJnUGagAPcuWhH3OcTz1zA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791885323;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xLR7ssaPWw7r9pGQZEx9aTLQg2KtRBw17PeaWqE6XYQ=;
	b=BvRmMvEShupSWi5aRpzbC9m48uB4T2LNGiBjtWONvJKsOzjRRiu777Nn+t13oIpsPb2A
	 3cOUSUUsh2CmmTbpXicyLOMkiU0xL2yULpMMkvLdAWtxvoW+aezVS1DuA219OYG6vzVdg
	 bGZsbr+chXweZB7XwO5nEFmvozYLrZmC+3D+P0FXsMyKXF8mDninCTorhk072yG0Sdccb
	 BYxXpg2ydOcNwgVhGQL7D324LmzdS50PPhuMAJGSuewEy08rzi+xwOOIUeo7cZe6ZgS1Z
	 lh70ASqEMtKl3r6qHZbv9BbbXuJxKz5CRIvtpVSHq2/Lct0Y1reOZuX0zVaNuQ52NMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791885323;
	bh=xLR7ssaPWw7r9pGQZEx9aTLQg2KtRBw17PeaWqE6XYQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W5VMuasYhbzHf2GAxM7VNrnQlKHxV6a+fazxqmJNbWxyuVG/YhUi5zSbxA+NjxHvJ
	 9uDe7+OYwMhOK/8DbY2ec3UbSV8AReSHcemItpbN9972vL5znfQrEWyzdcf1ZkV2R1
	 3/v2slhL8UgWdOq55eZOf0gYpd8rWpSa8M57wcgVIMpgYLwyuhYpxe5m+kJTQdFDZO
	 xrBJLSe3KjE+J9ow5sEwnDDc4dvZlDPEgSLAjm6DPZZTwlTfgfgYzlGPNK/NJMYDSS
	 NWtkcsuZESJm0c3aFwYvJkJO9joe3ZgfTDAHhWpAZE1jWYiCxmxDMDDlkgSxF32iVZ
	 u6TK90Y99KSoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD286075F;
	Tue, 13 Oct 2026 09:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11850362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB3EA401EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUazdt8k_5i7 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A5FB94005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791885320;
 b=S798Vox3OZ05+PGib0Q1g159w1ZuJ9FS1cjX3Y1BE4a40Dnf9E0qhffVmPVpuoFO4P7L
 VEnmc57WrOmcKFb/4TX+OMnJM9BUpzZ1hvYixaQcK59YLEnUAy7zO88pgOu3zs+A79kAP
 RkzD451M57Ze+/Gq4S9xfNXFqEsaQ1/MKJtDhxbZq7PD4dh5pnMPicYpf9jVOoVm4Undw
 a5xzZtfdbQ2o/WUqSjAQvYurgD91RpAaOfLXPyzseBMJ5TpeHmYflzW+zvnrsYfx47Bpr
 uKV1zXXue0DJaFRS7hVoM3qs/w94vtcDA8Z+xnZmdyh6AcVi92THtXrZOmOYEjmezSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791885320;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qjvmNcJIQHr6qmsB0Q3+/GXlwmfuHvwhgC01BynWSLI=;
 b=hXgutWPgdzjU9Ll2ztTMcjZ8++c43j/OQ/ZtiVa41xaZ9ewOJsoRuzQXeYszR/DZ0Em/
 lktFaOiozq/k0qjlMZDWiLjk9OJFPTSjdtzAhc9sAMUc6XCVOfeutKF16CVKaFt7tQDX4
 uttf7HPpAo7c0cKTRDMKRsoz1xdwMlCSmxSfpCyGVZz6MxXQReZmlal2IEJDVGqkVZiKo
 bYyEt0cuPfAXd788vaUBw1ngOojkN17NSIN0/0tD65Nbf8uiN5W2hBZQjEgpqySBIBR2c
 j5z8B48YGFv2+namr9IAiwMXhUbNFz4MgEmpBTHaeR/6Q8Usegf22isYsN6AXumgeGQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DMOyY1Dw; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5FB94005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0DCE44E411F3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D680860362;
 Tue, 13 Oct 2026 09:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C49C11D70B22; 
 Tue, 13 Oct 2026 11:55:16 +0200 (CEST)
Date: Tue, 13 Oct 2026 11:55:16 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, bernd@kuhls.net, 
 Jianhui Zhao <zhaojh329@gmail.com>
Message-ID: <as3__xEfE5ftpPhV@windsurf>
References: <20261013083745.1590149-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013083745.1590149-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libuhttpd: bump to version 3.14.3
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

On Tue, Oct 13, 2026 at 10:37:45AM +0200, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This release updates the bundled ssl library, which adds support for
> Mbed TLS 4.x and OpenSSL 4.0, and fixes HTTPS connections that should be
> closed being kept open.
> 
> Drop the patch, as it is included in this release.
> 
> Release notes: https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.3
> 
> Use the sha256 hash provided by upstream.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
