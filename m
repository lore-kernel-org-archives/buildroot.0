Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27ABD3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6207F606FF;
	Mon, 11 Nov 2024 20:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKZsAAsr-nse; Mon, 11 Nov 2024 20:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FAEF60702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FAEF60702;
	Mon, 11 Nov 2024 20:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72478DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 602A740155
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTaEc6OPDCrY for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04D2A40150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D2A40150
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04D2A40150
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:51:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B49A060003;
 Mon, 11 Nov 2024 20:51:32 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:51:32 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241111215132.25f62193@windsurf>
In-Reply-To: <20241110180011.442932-1-ju.o@free.fr>
References: <20241110180011.442932-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731358292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHlUGzyn5ba0N7Y2flB0UQxtrduNKlN+G0XZfUy/OCA=;
 b=HLvH7kwsMo1Tcou+3PoJTEPc5sRlG3Z/w03PFQQGG9uNUHDGoHYMnn7vls+BJQimSWoa4U
 5xNGb70Ehap5ap8yPXFrNXIQglGfD++M7nL+iUDH48/7gZtG5y80w/9Z6Bh2YNuh7Q8G5V
 AfXgoDZFtwW9jsvICRJNGBqlMBNx9kNwplpu1s03+KiYg867BKnNOe4HGfgRa0RJCHnesf
 wMbMir2O/PrmOv4LgagRz5Q1GHciifqzOkUCKT/lefQWoiixT98uCR0pzez/Tmoi4wxkqE
 xZ1zifZ3XjMth4DKse42dCRGjjtIoXN5Lnt9yFIvbSw8C6Ny4pXEn05KDVjTZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HLvH7kws
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: bump version to 0.14.0
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

On Sun, 10 Nov 2024 19:00:11 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1].
> 
> This commit also updates the _SITE to the URL published on the
> homepage [2]. The main motivation is to use HTTPS.
> 
> This commit also adds a comment in the hash file about the pgp
> signature verification.
> 
> [1] https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.14.0/ChangeLog.md
> [2] https://www.spice-space.org/usbredir.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1535441761
> ---
>  package/usbredir/usbredir.hash | 8 ++++++--
>  package/usbredir/usbredir.mk   | 4 ++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

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
