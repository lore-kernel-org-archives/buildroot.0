Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6BC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E1946061E;
	Thu, 25 Jul 2024 15:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgdN9bRGpfeI; Thu, 25 Jul 2024 15:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975DC60745
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 975DC60745;
	Thu, 25 Jul 2024 15:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04CEB1BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7DE160745
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYXpFB_reFZP for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:59:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BDD3D6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD3D6061E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDD3D6061E
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:59:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2667160005;
 Thu, 25 Jul 2024 15:59:22 +0000 (UTC)
Date: Thu, 25 Jul 2024 17:59:21 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240725175921.6794b9ea@windsurf>
In-Reply-To: <20240725175348.551ed37e@windsurf>
References: <20240725132641.333219-1-dario.binacchi@amarulasolutions.com>
 <20240725175348.551ed37e@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721923162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNporn3NfPnjmrge/Kri2BOY6x56Jj7U7EKA6l2FE/4=;
 b=cNyyuyHUY2Z6dJBYKacI9Sx50GyNWhXtzSE+BvgtzW5Nw4XjgjtbuMJ0aLjj1Lue2k8FK9
 QmKYmiMcgZBeOysaG25iT3xVj5xpUb53n3tmDa4IsjEV6257z6gViSbNtxTj2FygDqt9ZT
 XILqUbPRA5YDLBu0M93Jy3/ch72tnyQFFIqYsdf5M9X+uKUyGaM1/vd8iJGsZ+S1212nPP
 JlKVgPqsG7M7RMmXEg1UNW5RY/6YSDrDPI7LAHUNV0I3OgftY6vC3FsNe2l9oYuBSp0dE2
 6Hu12LKalIzP0ebRlSrUIMh3yone5KTNOo37ntuf7Q7ZFJd22Zwo+9ntkc8e7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cNyyuyHU
Subject: Re: [Buildroot] [PATCH 1/1] package/s6-dns: fix uclibc build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Thu, 25 Jul 2024 17:53:48 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> In any case, it should be the package source code/build system's
> responsibility to pass those flags properly. Passing them in Buildroot
> is really a work-around.
> 
> I believe the C files using st_mtim should #define one of those feature
> macros before including any of the header files.

Also, to add to the complexity, s6-dns relies on skalibs, which has its
own stat.h header file which does this:

#ifndef SKALIBS_STAT_H
#define SKALIBS_STAT_H

 /*
    This header must always be paired with skalibs/bsdsnowflake.h
    (which must always come first).
    If you #include <sys/stat.h> before bsdsnowflake, the
    workaround will not work.
 */

#include <skalibs/sysdeps.h>

#include <sys/stat.h>

#if !defined(SKALIBS_HASSTATIM) && defined(SKALIBS_HASSTATIMESPEC)

#define st_atim st_atimespec
#define st_mtim st_mtimespec
#define st_ctim st_ctimespec

#endif

#endif

I guess the easiest is probably to report the bug to upstream s6-dns
developers and see what they say.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
