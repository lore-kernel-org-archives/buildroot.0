Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE681CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC76460625;
	Mon, 28 Sep 2026 21:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQBUOUHas5FZ; Mon, 28 Sep 2026 21:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E05560607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630447;
	b=Py9/P3w+l786/hGGTKCryTFbiNGMqvWpsnqTAqKrnPCOAZ9VltCy1+nj/mOUsfKn+uWC
	 Jx2uGVRGuiB/1Rk2xIUPObPiMEmpcQTCedoEpCUPmhzJOLvgUgrq5EX7GR4+h5r5OwMbT
	 fqVGgAbDw0aoUopHloMiJgOEc5jFmJleMaP203Z7Bsf947XRvHeZfAyqe0eC9RzwalyCV
	 fHp/Ly5I5dDxKfzPSlGsv2kMhrx/369cYK+j4M1emT9YW/nKRJDDu7q48LA1mDVxtoBZT
	 Y5DsMSf3QuweyL1kzlILDli/ZZuXQbmdv0bQ4NdUKKJZDhRuq5mz7UnJ2LMro0+amRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630447;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JmhLyoGiQjsULNlQHcWLhmzOcCOnqNEHYTZnCf/bL6I=;
	b=NdBC9wZNitKbusWkQo+ckL3DAYh4+5yaTXlSewOucPc7K2TkN5XxYoWxTjUo4jSHlQyz
	 pn6rG5joDm75rtLEm3eLdwcM2wG4UQuWtC9vA4b269piPP/1mBz5G1hcMKVQxDF6jc9su
	 rbgbs7EepsSsJtoD56my1QN6eL8JeIy+W+n7OM5unPyPAUet5HGusQ4zHGYNZOkUgrGfR
	 shpHcy4o3zZY77nLxFJsLhJnJMdyBW7utqiclHiS9bB3HEVP1kQGEbN+m4k2mqP4UuM8e
	 KX/UXCPFb6q9C7dSpNNDh0SOi3PL6IrzaAYUpHgv7BOG/kMTPw2ifZHuQrGh9Qx//Jg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630447;
	bh=JmhLyoGiQjsULNlQHcWLhmzOcCOnqNEHYTZnCf/bL6I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IvGgKekmT+SLhUZA0fOOyoqKa6DLGL5Fl6oDVVOrZ1/PjflW8++jk0BuGPqOkLxYi
	 IIOmQMXvNKHdA4MoBN69Dq1wrm7HZj8UHM5aSKUZJgI1nf8UjVWXHrcpg3P9k+XWlz
	 q1mE/8hlw9gAyhFGj775nZ7DzBt/AAAEuzWdJ5/Ob4aFahC4a6BLEUK/cQY2SKpZGE
	 dAP0yYToWjIOmYzyOxwOAEVyn8WwaSbnkHNuyBNBURug4A6A3wsWKzW1/OfgSaz7ut
	 LWwBr7qo7NeEM+DxEAgivxucIGwcWSk9EqARFNNzSM5BPlZocuLZTKw/1H8Pj+9ys/
	 q9FU2iUoNpfOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E05560607;
	Mon, 28 Sep 2026 21:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74BC53D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B5F80A8C
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJa-IKNYdFsp for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C99480A87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630444;
 b=CE78xGaKrPsPQSEZbWXjD4TZ3yf6PvTN2jOlKJEa/8zCbJ370ym/K5cag9DYUY6D48Gm
 nlK20/4XWhRHthRYjgLypuu+KL/4ETzOB26E0+SeR9AFS8VsDduc02jLuaP+X8AaWK+iK
 Tta75W2Xb3op3DcOYTHc7r1bCwH48xnwAD19/wPr6AOYRuwjndgy3hwGvK9bm3A6dZOeG
 Gz4J8ey0+bMh/jRq0w/vJHIn0WRtq1GPbCZ08zGRpi+I6cVsi2vMFap38Z14+34CgRAso
 heJ2scAkVCOxtOEkZFx2QnDd1k02fhMzonGxR1EpGnaGuOc5KNFUotj2YPbc5yPbvNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630444;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=nZ1xQ1fVQIoCoAcLjyAGOR5Ghweq/5nigtvDz2jtxQg=;
 b=QdLFge7xx+P7T8pepzHJtackvsGW7h/Lja5A2Ami55ProCOMRFM3oEgDFxf8YmtfWDJG
 vF01iTslrtfDtHoRfSPILF8wo1S4gmGknd7deycDJL9gRI1WgnbQXBCQAEx335rjwcPRd
 6HSIV6+h6e3N83pscGNFh/Bd7JdWMwnGZqH6nBzy4tqCgOxNTVRc83+z2eAECFW0/aU3Z
 07KfnC3FnvGNCmf4YsGZDTew/Q6hJPIPODSizIsIul5Em+YNEftBTq24SmNPN1118djo0
 jVB0l84DEaGia9lepTpSiN9Ivg3zJv+I0uT/rVNR1Dj9NDBmAfizQjCVbwD0VzJH2Mw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ky2C1G8j; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C99480A87
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:20:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 67ECB4E410A4;
 Mon, 28 Sep 2026 21:20:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DD81601BD;
 Mon, 28 Sep 2026 21:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3CD4E10329734; 
 Mon, 28 Sep 2026 23:20:33 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:20:33 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <arraG-7T2qlKxF-h@windsurf>
References: <20260928182454.2165278-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928182454.2165278-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: fix build failure
 if kernel uses localversion
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

On Mon, Sep 28, 2026 at 08:24:54PM +0200, Fiona Klute via buildroot wrote:
> Bubblewrap expects the value of the assume_kernel option, if set, to
> be exactly three numbers separated by dots, nothing else [1]. If that
> requirement is not met configuring the build fails.
> 
> Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
> version bump to 0.12.0). However, the expansion of
> LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
> CONFIG_LOCALVERSION is set, or localversion* files are present (like
> in CIP kernels). So filter the version string to ignore any suffixes.
> 
> [1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104
> 
> Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8
> Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

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
