Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D91EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC0F61289;
	Thu, 20 Jul 2023 21:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC0F61289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZHKoaChNO-b; Thu, 20 Jul 2023 21:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A6A611F7;
	Thu, 20 Jul 2023 21:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A6A611F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CF5C1BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06417611F7
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06417611F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKuj0_oj4_-N for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:33:43 +0000 (UTC)
X-Greylist: delayed 661 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Jul 2023 21:33:43 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62511611F1
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62511611F1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:33:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A27EBC72B7
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:21:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 271E51BF205;
 Thu, 20 Jul 2023 21:21:49 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:21:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720232148.277f7bac@windsurf>
In-Reply-To: <20230720175319.151079-1-bernd@kuhls.net>
References: <20230720175319.151079-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689888110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOIu0yE5lUrDmi48SjlzTiI5SR3iskccm+u04/X69iw=;
 b=BDCfxajmKF/vWc2p9TYOmknrq8VnlH6HputTkpylRAaP2SOTV22sMBp55KgfKPS6qnFWZA
 yKwZ2EPxohT5O9KjolpeV+05Rlqrtm7Vqyj6OWmCF9sNJNh6sL48bUJ5yrCudQXE9iDmeP
 doDVVcxPZJNA0uEmnqbPKTnguQWpkh6+xkvc92lbXlYjfkyYbPFHtd4S3zKpUW/R5ybtCr
 HC/C+mOyEu218OWgNfQwOVqeW4WLIufAL9xUyVrG3O8Q8oF9qV97bpVvic/inJConktc+4
 UJzajFx4pGXmldFYvpGAGFGvaY5/7trkIlvTHy4tl78jou3/+pFwX4m6PbE0dA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BDCfxajm
Subject: Re: [Buildroot] [PATCH 1/2] package/openssl: statically-linked
 openssl does not provide threads
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jul 2023 19:53:18 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Add blind option to mark availability of threads, needed for tor.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/openssl/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Meh, I don't like this very much :-/ But I admit I don't (at this time)
have a much better proposal. Reverting the problematic change from
OpenSSL? But wait, according to the issue you're pointing
(https://github.com/openssl/openssl/issues/14574), it's an OpenSSL
1.1.x issue that won't be fixed because OpenSSL 1.1.x is in maintenance
mode only. But now we're using OpenSSL 3.x so surely this issue needs
to be fixed? If that's the case, a revert of the change seems in order
for now?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
