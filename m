Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC74FA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB13760686;
	Thu,  1 Jan 2026 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znEuwUYECs2t; Thu,  1 Jan 2026 21:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA37606F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304527;
	bh=HCDWP8vIVi817WiaI3/mjX0vOerSUAaJJzlEr2881ts=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fxh15i1ZNk03ljbMYpn3q42S8nzguCOS6aET72uSvII0Hew+aAOim3m9mWS0YU2ra
	 EyEs2C5kVOIEjOWhWMlk2I23s/8dR/UVffeE06H57LJmlsWUnWglf/s5Mq+Il/UXFW
	 3V5EDqvDjwjkRzyYXBnf3NNj6a+l9Wdgn+D+kiZNjR4hnKSOjSCjd5kDcD3R8YYz7H
	 QIJHtHWqfGhXA1lcA2IP0eMtiCoIYCWL/ZQQC32oy64+9Nor0GI0Jp/EE0jDSKOwip
	 zgvucJbkyeRaqtsmnFeinpHDkMTNQ5l97DquCICdfidmqaBsgVWAUSFNkmJYtwVkUj
	 Q+hFf1QxLESag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AA37606F7;
	Thu,  1 Jan 2026 21:55:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A7B19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6473C606F7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqRLFgLcDdrK for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55BB360686
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BB360686
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55BB360686
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:55:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 15395C1C39F;
 Thu,  1 Jan 2026 21:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC1B860749;
 Thu,  1 Jan 2026 21:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8AFE9113B0713; Thu,  1 Jan 2026 22:55:19 +0100 (CET)
Date: Thu, 1 Jan 2026 22:55:18 +0100
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Thomas Claveirole
 <thomas.claveirole@green-communications.fr>, Simon Dawson
 <spdawson@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20260101225518.501f73ff@windsurf>
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767304521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pFejlFGoN16UMcn7tCakOe5gJDtmQi+xJqGbRKmykuo=;
 b=ASyocfx6EaNGGsqQ8QMwEY9tx/8g2JeRfjOML09h5pRCgrZ2v7bgRb0+vbOhUV9YjBz425
 h6d4HrD5PMqrWzI3OkbQLtYFeEN/zo9Omwo8x28eG+ehBl9kYeZJL3myNG7vNcqDMBq2s/
 mQapYj/VY65sBjw57xtng7ahQqd2yROLKCHohH9cUX02QO8EAVkb16fsZp2hcg9Hm8LKqr
 CadFTBLpYWlVWt6vf/9Tv0Tnpx3yGLHEWBVXP23HmiOXWeCbtUE7/txpcbAUZ7P58pDtjO
 7m93t3SQpmftPYDtnhglATzI4JNIhC3apEEE2V8n9rlGQsqW3DKIZealGEDQ1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ASyocfx6
Subject: Re: [Buildroot] [PATCH 01/15] docs/migrating.adoc: document static
 JS library
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

On Fri, 29 Aug 2025 12:33:26 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> This patch adds information on how to provides static JS libraries in
> Buildroot with the release of the 2025.08.x version.
> 
> Because the way JavaScript project development is working the chances that your
> project is using the same version of the buildroot package, and you provide
> this library from `/var/www` to your users is actually really low ...
> 
> If you want to bundle JavaScript libraries in your project you should probably
> either use a cdn, handle the package version and location of your choice in
> your external or overlay, or just bundle it in your assets from a NPM workflow
> to benefit from some minifications from your bundler.
> 
> Historically many of those JavaScript libraries were added in the 2010 eras
> where it could make sense for them to be part of Buildroot.
> 
> Most of them are also way outdated/not maintained.
> 
> For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  docs/manual/migrating.adoc | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks, whole series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
