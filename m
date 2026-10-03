Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C597CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EBA60E10;
	Sat,  3 Oct 2026 16:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7buSfz2mR4M5; Sat,  3 Oct 2026 16:35:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 581C1606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045330;
	b=a/7rPmrepOY6FtOaHfPP3hKRVBNt5p8F8B98aFFnc64hhmD4E3fSVvd+bHIt8zLJyGdA
	 st1nhyc93WsbUCegP2ZeuLu2ACOI6PSrjnEEZF4eWyJbfGPWW5VFFXd1FIygTf5wQPVfs
	 HASAVOtjohGNx0HDFaY4mA9X8DdmZBb7Y1WTZZ6q0b7b/4sviXMLVjZSRQBV6SsEap7RZ
	 w6FzLwFcteGjgBZ8d1NuZtEQN0lYxTE58fv4gY29fQuPEQjfttcCwg95qd4Tez0rYFrQv
	 ZmPRsZFEn7PC9yde4kDcekXHFNByaqLrYfK3y5RVteyQtPuySuo2CyUgMbvvSIXyAGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045330;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hkiet+7xsDfb3n2Ul1zq/ydcQ42H9N2DEjxIpV5R1qs=;
	b=PmtGBlnVhk1k+mhVrboWZupDjKyVrgDwrm4QMFcJhxCiCLaWTfC40aCdph7Jih0k5pTH
	 bScelRbu2NHugrwRYgcV3+FbT/YnJhjohJvkhG8QvWlZbUuR0mjPn3FyaUvjpWeGCzGzJ
	 OqT7bKykwrNSdjc7vgFFtNoFT+GE3BCoD+Wyi9Q2Z7A7XtP2m8IDpE6YfzrFPJknWmpQR
	 dRYqF7otimUfmkynYq855TzKmdzrD2K8JwCJVTiTYyEozGniEK+6NJsPg6U60889qKieb
	 tKQKjGz+wB5ej9Il9/+5XYkO5gqHsVzjIq72xftubrlTtmm+g5/L5ImRxfoY+eyvuZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045330;
	bh=Hkiet+7xsDfb3n2Ul1zq/ydcQ42H9N2DEjxIpV5R1qs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jzzw4rKfQpOdsmnuuCgTSeV1p5QG3scXMyXzrkugpVJ8inp7q3J8rXH4MOFWiEuBF
	 e3MmGSmitM/AUxutk4sulvKVKn+uPst8X51+P68r844U5EaaPj8ozwczHF2ErG+tta
	 NebuTUSaB6Nyr8MjtifROWqj7ZwyTBdcyZYC1ZtVI4PzCI0RkvJBR/nK8ZJLmtY1Wj
	 q5UWJQ27NM3gY4E4eTIGhZMoYaR3fxLApCDD8Q4H0yrxJpb48sbR1y0l8l5PBpXlv9
	 6qxoZpi05tAO3hxue+25bDBO1Ps5yaF3TEmax2+M8/D+pxHVBWcXexy8oAdYbovXhJ
	 bb5DVpeX7pM5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581C1606C4;
	Sat,  3 Oct 2026 16:35:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5262E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A1781370
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Sdotdq6wMnt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:35:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3BDD781366
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045327;
 b=ocylauZ52qdOkZY7rx4fx0V3WBkidbJjX6tLat0JUUW+VORSPME2byHbRdcTPoYaXwAG
 Mm3IUJkIEnCIwGZRqlZasngA9Wh59x6j3B4A0RPdEsQnB2tNLl9kPmwLPMeVjknpZq0/l
 IxJZK/t1IvINYFs2iWX5D1gM0lnZTfY6JKOqqmKPC+G5/KNU3iYWwqQ214LwUIYIKpUKm
 4IKl/RXFdgDohTxPBFnaedixZ0AqxFoLYDdeuHU3ky058JeRW4RcUJmfCa9cJvc8yCiOu
 q/nJYOPLgE3Bt/dQDV+yvXEAsKMf8Fn89a8yyPSu3o76BTWz1qs3i3WSBu6pZ57wlGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045327;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=EJjq19JQEAjEHBSz8fv+HUkpH2KZv8nQDsYubBVvmTM=;
 b=Hx23a+WGDuhNUtH4KFh+5RlXQpHBu0wegw8hySPDFUw3wlesoIuWCMxbmxdAEOaP78oV
 yt//SVblQnaMEoSAUCeuOqfn5z8p61F0L5xa8kNZ18suoUW3jb/cXnVO0NO54q5WFCHpM
 CfkwibSAdNnfqXlH9N7WtL5pZfQcv5JHE0pp8YcG1Jkhsp/zDOJck62s+C+mGOnEtP44W
 hT5J5nzjWAD/P7ZLoSG87HpabSXs2JALnJWjUl4Ec9HVUo1WFrOYLAgB9VxgMltqXAwAz
 3MB5XDXLVga2/y9gjihhgWy6K+iQK7JFs0dqUQCOOwfDmhq2chf3i82nff+cMqNKhRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=waSNon9O; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BDD781366
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:35:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4D6141A1108;
 Sat,  3 Oct 2026 16:35:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FF2F604FF;
 Sat,  3 Oct 2026 16:35:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDB7D10328318; 
 Sat,  3 Oct 2026 18:35:21 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:35:21 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Scott Fan <fancp2007@gmail.com>
Message-ID: <asEuxKrYDIXGRZx8@windsurf>
References: <20260904134128.4656-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260904134128.4656-1-tianyuanhao3@163.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: add 50-chrony.list for
 systemd-timedated
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

On Fri, Sep 04, 2026 at 06:41:28AM -0700, TIAN Yuanhao wrote:
> systemd-timedated discovers NTP services from ntp-units.d/*.list.
> Buildroot's chrony package never installs one: on a systemd image
> without timesyncd, 'timedatectl status' reports
> 
>     NTP service: n/a
> 
> and 'timedatectl set-ntp on' fails with
> 
>     Failed to set ntp: NTP not supported
> 
> even though chronyd is running.
> 
> Install 50-chrony.list, following the convention set by Debian,
> Fedora and Arch, so timedatectl can manage chrony.
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

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
