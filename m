Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6C3C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A7F982098;
	Mon,  6 May 2024 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbHXYSefumKf; Mon,  6 May 2024 19:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463D58209D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463D58209D;
	Mon,  6 May 2024 19:28:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86DB51BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 745F1608BE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSp0tJm_VI95 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68465608B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68465608B8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68465608B8
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:28:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EC1140003;
 Mon,  6 May 2024 19:28:11 +0000 (UTC)
Date: Mon, 6 May 2024 21:28:11 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506212811.548239ea@windsurf>
In-Reply-To: <20240505141759.872371-1-fontaine.fabrice@gmail.com>
References: <20240505141759.872371-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715023691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NY4iDw9ebrjg4TiD70vGYDjcMKNEZ/z+N6qXUlCsJw8=;
 b=dR7jSKViLt1sxsa8cQkJgDGAfLI4lD8SYRGw1MYN0oAzqpWdnzAHTEUES32mKcrR0Vm/44
 damEnRLCoGyQCpQBrYxDVnhC4OTDbFcLqRmtlNWkc0+8HNvuXq15+h7nI+W07kspOLQQDJ
 MGzyMa0s3w0z7gydTnHvKNbTiCCt8LoSnu2wJELXoyQZ7MCnWl6jUnIdpipNc1wyW+G4j9
 cwXR3ZYwpF/y5t2i5GZ4EErHuyhsDJZTVoyis/qpxSPk9D7wiayJ8lIglY59D+brityHwy
 AJhVN2pnLofDAy1y5kGvXkcneGu8U4wb5i/Ulfo1Kfvwjn3LF6dpkr0pBuQWBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dR7jSKVi
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: fix NLS build
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 May 2024 16:17:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> NLS is an optional dependency since the addition of the package in
> commit f78c5cb5cae93a9e63dad4361d78e1787759382f:
> 
> /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ../lib/.libs/libshadow.a(libshadow_la-alloc.o): in function `xcalloc':
> alloc.c:(.text+0x7c): undefined reference to `libintl_gettext'
> 
> Fixes: f78c5cb5cae93a9e63dad4361d78e1787759382f
>  - http://autobuild.buildroot.org/results/9f604d09745ffa1f4db3bdcfe0326c236effac0c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/shadow/shadow.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
