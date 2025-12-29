Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BD1E92734
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513B3606EF;
	Mon, 29 Dec 2025 17:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN3vFyZv_RYx; Mon, 29 Dec 2025 17:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7960260A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767028127;
	bh=7qYOnKY5CnYcpU5Dx6fOCJP5LicMzGax1EgLeO72avo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PKzBQol2FyE6Opr/IO7JRFe2JDJ6l2DgIaVxbjQrzylarECvya0aN/bdxZgDiwK83
	 3IinXa67v034Sz7Xg8CAJkLu2wkyrlh186FY9OXmiL9An5mfCL5IJTAgO9ap3WAACr
	 slQS+W+9QbBPyrYjXis+r+O05SqXz+d8hTLGkxW85NeJSp4D31FMoM+30hf4t+pW3W
	 /+THKLIBSEMnIy5Il4woERp5hAsgilDLQJWmtFsaP724jI9fjrq1884j609IuPErzh
	 CW/4Ho7+1dMRk0G4GFPLQXgRxoVjMoWXI5nyjlfjwfD0IYbI27KR/N4Wp1LH0gtgfY
	 6HMHu1FxM1ryA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7960260A68;
	Mon, 29 Dec 2025 17:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06364B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC82C404A7
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9OXulgb6Hlq for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 124B540454
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 124B540454
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 124B540454
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:08:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 921484E41E51;
 Mon, 29 Dec 2025 17:08:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 683EB60725;
 Mon, 29 Dec 2025 17:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AE91113B062A; Mon, 29 Dec 2025 18:08:40 +0100 (CET)
Date: Mon, 29 Dec 2025 18:08:39 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Christian
 Stewart <christian@aperture.us>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Message-ID: <20251229180839.07da40f2@windsurf>
In-Reply-To: <20250926100609.4158676-2-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
 <20250926100609.4158676-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767028121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yxYTTvLbjm2cnRqNCEtsJd5OJQvaUSSfnI1qBhGx/yE=;
 b=Z0kZdX1Lf+YOkAEMU//5lG1sQDqlRWSxkLlxA9B31TvkcJOqOVTaXEx1wqcyJa9rk6Oc2u
 lN0v1S5qv7hHHCVDyvokSfPt+Lrza5xmDkP9CWfbWxzaQe5l5rxZmf/azHDM2RtDb/tbEf
 AINy/CzyYnoXcnoy0bC6iJNkYmrx/pQzcvxWVEgn7MXKte7jWc4PfZnAhg5znbUFRniR7A
 i3EkH9gy7Z/9Hafg2gO7oDRC+g0rLGVoRbfDteO0y+s1qOUF9QBr5/5wHcuo6/Xwu/BNMK
 14WanOQtYWSAqZt001si9TMXR4Qg/3whxDivcAcC/1afdL38hB2xsOl7ag/2+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Z0kZdX1L
Subject: Re: [Buildroot] [PATCH 2/6] package/libcamera-apps: fix
 LIBCAMERA_APPS_VERSION
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

On Fri, 26 Sep 2025 12:06:05 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> -LIBCAMERA_APPS_VERSION = v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
> -LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,$(LIBCAMERA_APPS_VERSION))
> +LIBCAMERA_APPS_VERSION = 1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
> +LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,v$(LIBCAMERA_APPS_VERSION))

While for embiggen-disk your patch was definitely useful, here I don't
see the point, because
1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a still doesn't match
anything relevant on release-monitoring.org.

I'm not sure how to address this.

Option 1 is:

LIBCAMERA_APPS_VERSION = 1.7.0
LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,v$(LIBCAMERA_APPS_VERSION)-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a)

That's easy, but it means that during the build, the version display
will be just 1.7.0, and the build directory will be named
libcamera-apps-1.7.0, so we're kind of lying to  the user here.

The other option is to have a different variable for release-monitoring
lookups, that defaults to <pkg>_VERSION but can be overridden.

Like:

LIBCAMERA_APPS_RM_VERSION = 1.7.0
LIBCAMERA_APPS_VERSION = $(LIBCAMERA_APPS_RM_VERSION)-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a

Note that aside from that, we also have the case of packages fetched
through Git, for which we cannot currently separate the version from
the "download version", and therefore we do have these vX.Y.Z.

So I think some broader thinking/effort is needed here to solve this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
