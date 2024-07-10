Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AA8C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BFA4155C;
	Wed, 10 Jul 2024 21:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veyNsKI471Z6; Wed, 10 Jul 2024 21:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF7E415B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF7E415B4;
	Wed, 10 Jul 2024 21:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 917411BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F1BE40126
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hULsF6jwyqB for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22160400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22160400FE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22160400FE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:55:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B9E860002;
 Wed, 10 Jul 2024 21:55:16 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:55:15 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240710235515.4040648c@windsurf>
In-Reply-To: <20240710213406.541480-1-ju.o@free.fr>
References: <20240710213406.541480-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720648516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1xj+FDDznhnXY+93UZ4CyXWQNR5Zxim5UQ2kVyWGQg=;
 b=LjcCITjndfmo8f7spaX7OE03j9h3fnfcOB1PUvKwQX6iiHPEcBbZ3oh+PUyf7mes61p45i
 Wv8lL5WEwGIlrUTh1ScNwe6MWGw9g8eIAbAeKbOV5pPx5b3WarWJG74TPAz9hkTde1IWHt
 atF+nbtsgrVFsFjWAoeIgIiJQxAE4fWWll3IufQIZobvC1EIbgMAHmVHRGSIEbcxWsuuKQ
 uQ8TghQVA0sArqeVGfMphpd2oXUJ1yvLOtMP9EadQVjzZqbkBwiJ2StyyQ1HDhFh6IBpet
 vvKqB/+REl2hysz8l8OFOaEdalC9ukbJ1E7e6sHqxB7F5UJ+pxoZHfcuv4LafA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LjcCITjn
Subject: Re: [Buildroot] [PATCH 1/1] package/tk: bump to version 8.6.14
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jul 2024 23:34:06 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://sourceforge.net/projects/tcl/files/Tcl/8.6.14/tcltk-release-notes-8.6.14.txt
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/tk/tk.hash | 2 +-
>  package/tk/tk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
