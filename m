Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D415CD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A314404D9;
	Tue,  3 Sep 2024 21:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gE0UC_mmyLiE; Tue,  3 Sep 2024 21:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2B6404E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2B6404E2;
	Tue,  3 Sep 2024 21:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9421BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18BE780967
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcusL8gGSBHg for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2EBA808A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2EBA808A9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2EBA808A9
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:14:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1B0620002;
 Tue,  3 Sep 2024 21:14:53 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:14:53 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240903231453.2fc15914@windsurf>
In-Reply-To: <20240829131232.2132854-3-thomas@devoogdt.com>
References: <20240829131232.2132854-1-thomas@devoogdt.com>
 <20240829131232.2132854-3-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725398094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpzAdQz1LhOlpoz4aisRXo7yJtW9F3es6yrEgF7XngU=;
 b=nmzc02O0pHyfxbUm3HqExImj43EFl4dVcG1Oh04egeVDzuFU1D9nJDhk3Q352c0M/4cHfM
 MmAdx7G87cxrdjcWLIv5mvcR2f/lPAG4J+87pN+dqEj7lnxL0a2xXtvOC1qwYQfZCaJmyn
 c0OsJauTRoknkFWfOhyX6+ESKeWoDH754MxhjbHS7rLegxfNBp4WxkHPGTTVBHH1FPBbwr
 BfgGHuk20btrtbj98JgncnWSWD6B5CUeN8RJyE+sHhxjuVexxYAnYwIu33SxJb+py0pSmp
 JJ/re/sKEMO/G4beT2EBHNXzcowc9Xxs0mnn8mXZoMBpNgxIACK1qG4q1mpZsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nmzc02O0
Subject: Re: [Buildroot] [PATCH v1] package/libgtk4: fix cairo-pdf compile
 error
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 29 Aug 2024 15:12:30 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> ../gtk/print/gtkprintoperation.c:26:10: fatal error: cairo-pdf.h: No such file or directory
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/libgtk4/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> index af7f57b80e..2fcae311d7 100644
> --- a/package/libgtk4/Config.in
> +++ b/package/libgtk4/Config.in
> @@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK4
>  	# https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_ZLIB

We had a previous patch somewhat similar to this (but not exactly), and
I made this reply:

https://lore.kernel.org/buildroot/20240815000358.6887f1bf@windsurf/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
