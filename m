Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE27EC88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 15:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B247F606F4;
	Mon, 14 Sep 2026 15:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0m6bsos5DEh; Mon, 14 Sep 2026 15:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 517266065F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789399147;
	b=p8igmaYvtxqhBpff2RjS3TTgXN081If3ORmkBKVdOyCZpPXo5mZg73SLCaBnQG5tXf1R
	 9GlGRzAoxBfZxr9dqaueJFkaoqK641CtjrslQUSMsDiQQ76H++mhZc/SSHFw4NbKyqFRo
	 QoNzMKxyO5P28XnkvmkF5wUqCvvf/hPB+wC4anUmlmd1QC+hpbY+gndO/uq9hhht3g7ga
	 qguxcD/RFcjbtBWAFYG25pXInX/TiVB87MAgZJj5SjVoETH/MuKgZ7jN0iy2SeS0TcK6E
	 hFmgxPDnCBC7yuww/QnY6kVYFD2z5/2h6+xOIOAeSraPnSpfUVNyw+xHbXWdDi7l9OA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789399147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g/7eIJAGsfvP0sS3hkjCKZ3Ihsra3P/2eZL3QVWq+Xk=;
	b=XUF+IjX0DJIpuJm95XUHtpmVg7/JpcDz5tPR1cPOkQCGFwYa/TvYvkmiFrVXwSkIK2qQ
	 mo1wiZJri+GPrbuFo8mJlI1NiIk7jNOxcdePN0Gww9+vrOBmruF830HY3/2SEY+oQhH4K
	 VKV36s/4j7USOI/0YEwN2WR7/RbClgd91y+aGhJXOp5G55dB0Sg6oTZSF46/arx7wvhMk
	 MOtYFClC1kXNLTEAw08tUDAcuSv7ohpFNLaLCGm7XMS33dyQTJniDsoxVk4CWAnGOaFGN
	 gULrgvoBx4uCF5XlxJJkAeQDGrDX8R3R8s1HAWJemI9C97o/VBGiFzUiPI+tBCWU+iw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789399147;
	bh=g/7eIJAGsfvP0sS3hkjCKZ3Ihsra3P/2eZL3QVWq+Xk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZIm2POcyi+QK2oJ6guS5C6bba4x11I6I28cvmuLlMbZyzkUGPXHbpazHSU9d/3Iph
	 fLQn+FpwUKJm42efDKHTnZaK2UFgaO39+PBteLOlhjrNXzX9XtLWnLEfhGnVSWlu8g
	 Kb7b3aJywMga8jpMNypufadEHUQn3/UbsNBhzPN8ahWBZOGX0GAjaQLq5c7ryD1y6/
	 MRSoA+kk3MfJ+1avzG2MYt7JYiFYxrlpWaoVc1tx8Wfs770mvEPYDr8Wuryaa7tbHm
	 EDSQsqNx0x4ABBrpssWcguGqL8WCAm4410wPHt5ob3eS1vpTS8tQEu4zMY9+PhvU6e
	 ODt7i7iRrfN5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 517266065F;
	Mon, 14 Sep 2026 15:19:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6C22E5
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F79380CA9
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbkG_lR6EGjg for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 15:19:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E115D80CA8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789399145;
 b=QWTmkzMZotXSSpqf5g7Vi8oMw3Hml0bfoBq2gigRxx9Btj7mpH/rw81ajcTh2G0+0HQP
 Fh4Lx8TXNIMvtznaULdL7gzxzsAHDY6JFqjzrPR0oaIk35+XHMP1UgoaSSLZUdaCMS1hj
 KpTGMYC/So8IlWzqeIZ3PKBmZtVyiFqyi9bqeu8eh8BRxvplVPwrdJnr9roWxhVXKugQv
 5C+v6duaJ+nQTDIY7sySALwAHDjzotvu70sOHpdKon9VN3Ep+QQcJhl2V8im+JrHBPNkH
 haAUnh+rgBP8j8lpfWu5SRevTab2HvwsWYew758ZZ01XM8F1QQNefuJumtGsQBT+5rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789399145;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=AMsCqTuiC25PGRGVZ3+dAAZQz3Gbtg8jzk4N2HXy8jk=;
 b=Vff5roxBiNHCbR8bObEv5Br2+RSWIgiIM8oLlia/0if0+VIGxNDsuTyZhEJ1cWNmU4Xd
 gE3rIgVsPLUHSZLiUPgLvj3f1SYC8F1DQLCnZ6uVrXT2yJoEVJnj1/LoYO8Ap4m/UNWzh
 AzPB+AX6eo9oBnMSLiBTW61yo2KS/ptKLxovCW6R175/HQnVIDnOCM3Zs2u7t4Tn83sFS
 Ev2DgYTQz8fT3dqOXrSAlcsYejsOQxj6rVKlaEGBcly/Oj/Ddpm5ahi5lqhqdgAnmlGn3
 Rq4SrnvKdE5kdKL2ojFQndPq9Rv9genI251FaHV77ebV0yhgMdvOMjb6feiswdVEkpA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Rx1Y57fM; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E115D80CA8
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:19:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 531794E405C4;
 Mon, 14 Sep 2026 15:19:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FB8F60323;
 Mon, 14 Sep 2026 15:19:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 712B111C7AFD9; 
 Mon, 14 Sep 2026 17:18:57 +0200 (CEST)
Date: Mon, 14 Sep 2026 17:18:57 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Francois Perrad <francois.perrad@gadz.org>, 
 Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <aqgQENzlOj3q-Mcn@windsurf>
References: <20260914142449.618072-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914142449.618072-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: fix kernel headers
 dependency due to seccomp select
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

Hello Michael,

There is an extra space at the beginning of the commit title.

On Mon, Sep 14, 2026 at 04:24:48PM +0200, Michael Nosthoff wrote:
> In commit
> 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
> version 2.5.3"), the kernel headers dependency of seccomp was bumped
> from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
> reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.
> 
> This commit fixes this inconsistency.
> 
> Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> 
> This is a 1:1 copy of ef92929504e842a1798128988eeb4d959a1a8931 which was
> done for webkitgtk (even though it only had "webkit" in the title)

Argh, sorry.

> but forgot that there is also wpewebkit.

It was not forgotten, I was also coming to wpewebkit, just didn't had
the time to get to that (I fixed many other dependency issues).

I believe I identified another dependency issue affecting both
webkitgtk and wpewebkit, I'll have a look and send patches if needed.

But otherwise:

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
