Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350C9C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA4C605E8;
	Thu, 17 Sep 2026 07:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnNhEzSGg-_V; Thu, 17 Sep 2026 07:44:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 079E360604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631086;
	b=tUgi2d2a++rWviLBhFpPdhw+tvvTwkgTpN53ZwMxwGba3ubJLJNvbwT32AbNS4rz6v/V
	 IhYoPNOSbvo+dg1OFDY3oZVr2QRlQYuK9JdylCqnp8TH9xVpRRNnufoeWEs6UTRUs9LH6
	 2jXFG+rpL++SxE4hJhz4+fBQakgfbOzceOz4FfT+uMjQkxEoh+4yvgD2B3t2vFBo61mmQ
	 DGg8H3+W/AUSE6G63Gl7/stPyUGEB80hbPf9jORepYNs0jJaJa8kt7QF1hpu1NLW3fjh/
	 SgvOlEkoLW6TXrRoKI8XKEIT8m4JVh3+lbJ0P2yPQZDmPB/xcKJasiBGX4QQ8uupOCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1gvdwsJExy+AD/xV0Dru1Gy4ERAprF3a3+2y1dVGHgg=;
	b=Ys4EkqG4Ww+vh8Vv/U4XqD3N/Kjw0SEJwdO4zOUR7ho9WWl5wDGg97FfEVhFRmRZF9qT
	 9tKwvWYwdcj70SN4G5XVrlZgISYsU2QqbCguR1ec7arvUKGNOY1f/cwZnM509iHjK72O+
	 4wTtkz6lXFPzhuhckoa+OCaCbHKfcbxCyt+ZM8JKtu+qWWFiTKq0Jmx9U89yLVi0udPkn
	 pvaMuxgd9YlWnvovZEurVwi8w/NedAPYXpeuHRkLbibkRiCKefPQkaAEcZ7SF+wopVqUo
	 pGcICcr8lXM4lSHhdeEU+/LnJE8S6v6tdWkizhyN+pVmwA6aYKitanuqGU65rxQZgZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631086;
	bh=1gvdwsJExy+AD/xV0Dru1Gy4ERAprF3a3+2y1dVGHgg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OW4JwnD2KLFj6crptgHAuQkEnuCrEJGCfXv+m91rmZ4YbxskZvWsXf01OH3fbZvLw
	 IT+RQs8zknKjlvm02sT1dKc2KJ+rggK+x4XwKzWnNIE0qPdZYHOR0FHJJ+2F19hRlV
	 IOjoVEyrJfVVMK1cN2P8waBLyrwSkpTn6aD34XZOWYK5ILXQsaZ0ZpdaRwCaEn2y9f
	 y2RWP22C0mXRNgxKSJ0jc9gqRyTi9F/mxaUrAkuiue4ZVWGrqCtqLdCQ+RMNkNwtc0
	 lPHjdBvI1hGvbf3LghxvkqRDr/UJ0D6lzRJZu/H/3y5afGjkWsrUdiMHJQ4OFR52HH
	 QGzbCQXeUQ/sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079E360604;
	Thu, 17 Sep 2026 07:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA6324D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A5D400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAzXf92OsGtJ for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:44:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 434DA400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631083;
 b=DHf2ahCpqIUs3IucpZ6mPHWx8wBtbeawmqDmno4EbiRsmAdTc0yxag9AAHw9D9CiEC68
 AIPpTF8avwBYWjMTMux2jdnUfibZL9z+tHT5mLXm9iB7z2TZtBpyT+eCBrZxqQA38nPMD
 yHPzZYU+2eAsiUUGl+bYzJcE9Xsj6rYm22xDkLw9nqusgA/NH7SW6JzcZP4/HLQkb4zIm
 hZSuoCe0n3vnZv7gxlLHbLwuJW0/y+/4DoUgW8YQIQavJSx+9D360Zt9AMn2Z9CWiadz2
 dFFlmy7xxmp6rChVMgZUGCsQuDilA9eYAPYHWeqNh5wPoHhC8NzcJPwOwHAnBe1oS6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631083;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iUYzIdXH6CbLbfMOIwOmX4+5burccQTb/0Z9ZSo5JDw=;
 b=gceU0FYg0cYfklKrO2XirlblVLR3dY6Iph1GyOSbUchMvrQ/+Xzt9+2wjVV+CTKmOwKv
 AnNk4wqFPFeA7HselDDSLf6WJ6D/QCK6GMDsi/3Y5PLaa8nsU/xG62qLu/Ay5WuBSDj4Q
 DSaOD2Taokf8BHsKqxwRGUWkEoWJ1p5jELbp6NYDZYY2BjUOiQICG6sV9puRuVohDceSH
 M6bp45KHgiSdshunlQqDw8IuPpE3SceeNAGDqZcsE6KvkWXXN9CZPoqhDLutKE+1PzzQX
 jthJzV/dQZtNKE4BmXuzuSkpVITedXlWD87EkabFRlTFPPJZqfFEu+yRcz64+wR7hIA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xApqBpLC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 434DA400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 930F9C5CD6C;
 Thu, 17 Sep 2026 07:45:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D5F95FAA3;
 Thu, 17 Sep 2026 07:44:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 71FD711C7B05C; 
 Thu, 17 Sep 2026 09:44:38 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:44:38 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <aquaR_Y91tlsUAUn@windsurf>
References: <20260914103020.3485030-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914103020.3485030-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 4.7
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

On Mon, Sep 14, 2026 at 12:30:20PM +0200, Joachim Wiberg wrote:
> Multiple changes upstream, for the full list of changes, see the release
> notes: https://github.com/troglobit/mrouted/releases/tag/4.7
> 
> Package changes:
> 
> - Drop local backported patch, merged in 4.7
> - Fix invalid daemon path in S41mrouted

Is this invalid because of the bump, or was it already wrong for mrouted 4.6 ?

> - Drop executable flag from S41mrouted
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

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
