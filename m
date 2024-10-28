Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C8BD5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9E4606AE;
	Mon, 28 Oct 2024 21:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rS1jD79HbW02; Mon, 28 Oct 2024 21:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEF5606C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FEF5606C4;
	Mon, 28 Oct 2024 21:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E14B112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C562605AC
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KCpZUbl9nFR for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5045A606C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5045A606C4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5045A606C4
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:11:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D510FF804;
 Mon, 28 Oct 2024 21:11:31 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:11:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241028221130.5421800d@windsurf>
In-Reply-To: <20241027222559.1295078-1-bernd@kuhls.net>
References: <20241027222559.1295078-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730149891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MA5CgjPcitSAXqjjshUOBculFNAxqT7Xg3/JoCETgtA=;
 b=MLNKIIpQurD2LAy4OLBjgyjlC/2zGxHuVy27tiqJLQc5/CEFHT3eS3MzL13K/7/dFPyfQs
 acON/xpcnU1pa5mLLDoxxMgL1lobLSdKNV4l19Fwvr5KqjWfh3VAgt98UzHE0Aaa7EEKD1
 1GyNuYNH3fp7clAbgEITI9ejFdO8Eb2N4rv11V1QY551BZ8/FiOzmAyl0ZGLTgPTKNXBoC
 Fpn1InHFLnQDat7aMxZVaCmTXGV2IbmkVaBSOEm1F28O0uRFF9MecnLo48ufxLue30zNQw
 nXjT1tQlplMrDfZaQiVHzZa4REXVzj0Og9ITXO+BI/LrE/QP5/tqD71dIX/gBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MLNKIIpQ
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.6.0
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

On Sun, 27 Oct 2024 23:25:59 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated patch 0001 due to upstream PR
> https://github.com/mesonbuild/meson/pull/13368
> 
> Release notes:
> https://mesonbuild.com/Release-notes-for-1-4-0.html
> https://mesonbuild.com/Release-notes-for-1-5-0.html
> https://mesonbuild.com/Release-notes-for-1-6-0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Let's break some builds ;)

OK, let's see how it blows up in the autobuilders, applied. Please
monitor the builders for failures related to this bump. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
