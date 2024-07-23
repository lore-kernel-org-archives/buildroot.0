Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C786FC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91BF680AC4;
	Tue, 23 Jul 2024 12:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8-xfFVjxzI0; Tue, 23 Jul 2024 12:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944E980B51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944E980B51;
	Tue, 23 Jul 2024 12:27:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4282C1BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F246404D9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHDCimwWLuug for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA6AE404D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6AE404D5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA6AE404D5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:27:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D98401C0006;
 Tue, 23 Jul 2024 12:27:41 +0000 (UTC)
Date: Tue, 23 Jul 2024 14:27:41 +0200
To: Simon Ruepp via buildroot <buildroot@buildroot.org>
Message-ID: <20240723142741.39e0dad9@windsurf>
In-Reply-To: <20240723103238.704924-1-ruepp.simon@mailbox.org>
References: <20240723103238.704924-1-ruepp.simon@mailbox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721737662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvWe+WSQq08XNzTue/Ixo+YuNqJKSC/cn0Fukcf/Rl4=;
 b=Uw/vH7dldNsZBcs2gqK4MPF8iolQUj2s2AYH0KTDMjqQaAU60ujkzeuWWwsaP+IAaG0+3Q
 /70AgFUOyJWuU6rfDH5XivfFgT12CNlpcDTLW3XDjD6eEbF2CciRNJcbVzLqt/knfQbq9X
 LRULfueYBnTM7zxys2judcgSB/071JdQ3rR7eb8NCRPCy6zm5r3Nrd/CsYsTHZPQQmwWhX
 vYv/lhhYg6Q0FWfRhwe4/eJpXUkNvi0ef8b93xM0NSjxIjNNfpQBg+iy0UkQMNWDfunIqb
 L+6fq+9SGfwTergc1fwGiZem74e94pGIBnIyzJax7hxO/tan+4XDZrA5EUerTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uw/vH7dl
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt53d: fix compilation error
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>, Simon Ruepp <ruepp.simon@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Simon,

On Tue, 23 Jul 2024 12:32:40 +0200
Simon Ruepp via buildroot <buildroot@buildroot.org> wrote:

> Currently when building the qt3d package it errors out the following message:
> make[5]: *** No rule to make target '/home/sr20608/src/buildroot/output/build/qt53d-9bf4d03e2515f7c454647d54542330b6e90f8191/src/3rdparty/assimp/src/code/Common/Assimp.cpp', needed by '.obj/Assimp.o'.  Stop.
> 
> This is because the assimp source files are missing which where previously
> part of the qt3d package.
> Because of this, the new package qt53d-assimp is introduced to separately
> download these files which are then copied into the qt3d sources, similar
> on how its done with the qt5webengine and the qt5webengine-chromium.
> 
> Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>

Thanks a lot for the patch! However I think this would be better served
with QT53D_EXTRA_DOWNLOADS pointing to the assimp tarball, and some
post-extract hook of qt53d extracting the tarball in the right place.

You can for example have a look at how things are done in
package/perl/perl.mk, with <pkg>_EXTRA_DOWNLOADS being used to download
the perl-cross stuff.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
