Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AD8C5AD55
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 12:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 712C060707;
	Mon, 10 Aug 2026 12:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pi2ArAW2801B; Mon, 10 Aug 2026 12:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDBA606EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786365160;
	bh=aLONlUZUxJ0GP+IKGKR17t9bLlijypv3MHFkaliaRTA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ILizJrmzOAvk+inOuIwD9V1U+MrinqP5WT7kQADE688VohCNQ6qxhL+0ymOMihuxu
	 D1oWF8tLeGYwc3Sf5x2QtNB80ln8fqAwpm0GJXoPeFz6PCQFiH7q7XivSTbmpRU31U
	 lZVeBsrrqSLO3r9nvMH5wJAo7IiXseP7LE7kGzkAPeQ0lcCwTq72P2iU0Hy8T3y91d
	 12Kuw/R3JpXzw+15v2pG1RCBpJGoYU8qNk9TgHcMH90eNiQP3ZNfI28yTKt+dxD/gm
	 j4o9gMr0dozpSqGu12o6BYvUJN5+MrwxMGjckOGmKvLFPO57LOiiGxxUS4BB5+JhWf
	 INR4ZsaMwiE8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDBA606EB;
	Mon, 10 Aug 2026 12:32:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54A4A198
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B125405DE
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ARXOlBCcrOV for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 12:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 179F7405D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179F7405D7
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 179F7405D7
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:32:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CFE391A152A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:32:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A3D7E6033B;
 Mon, 10 Aug 2026 12:32:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6799B11C4A4E2; 
 Mon, 10 Aug 2026 14:32:30 +0200 (CEST)
Date: Mon, 10 Aug 2026 14:32:29 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <anmxxqb2-h3Fy_f-@windsurf>
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
 <20260806-host_tools-v1-2-19c63ecc3b10@bootlin.com>
 <anWV0uzil1jp4BNN@windsurf>
 <DKL5OZPSP69X.2WIL567PI8DXH@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DKL5OZPSP69X.2WIL567PI8DXH@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786365151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Xe1PNYfruMJODY+poFMEevJOQHH4tDCYOCjhnx8vr90=;
 b=T+CNL8XhRI1fHpvMG00UtYtjun1w8OErNCU72eV8aSDWbAxWYhnTFb/sKCylOLz9abE3fU
 iOWVa37/+/lXKZR85/ydZX7OVJM6dhMPAL99s4GYJtWgO9UTSmTS+6aEHPsEw1BoFxxh2M
 aq9BJNINTOHYIdzOGpPhR2CGv10GfD62msk1Gu5TEdt97cAE1TXIh/ES700k2EkqBGOv/L
 Y729FsQBq5heaOxEsnWyRwx2iZxmaMjEFHaemVZc63NxbQW08uFvc3/MJ7enXhpgIEDryf
 zOJ91dndHfP7cqeTAiNR5f1Y3KbSaPn5YZGtIgGSQGUlcJ7vmaT9WHYXQvUIcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=T+CNL8Xh
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, Aug 10, 2026 at 11:29:01AM +0200, Alexis Lothor=E9 wrote:

> Yes, this `npm install` downloads 3 dependencies for this sass tool.
> I understand that it is not ideal (having some download in the build
> step), but proposed it anyway, as it was a potential "known issue" in
> Arnout's proposal ([1]). But if this is finally a no-go, thinking a bit
> more about it, I see two main options:
> - find a way to vendor the dependencies (may be as simple as setting a
>   post download hook which performs the npm install ?)

This is what Arnout was proposing. However, a post download hook
doesn't work because it's too late: the tarball has already been
created, while we want the dependencies to be *part* of the tarball,
i.e we want the vendoring (collecting the dependencies) to happen
prior to the tarball being created and added to $(DL_DIR).

Instead, you should have a look at how it works for the cargo and
golang infrastructures.

We have this concept of <pkg>_DOWNLOAD_POST_PROCESS (which is NOT the
same as <pkg>_POST_DOWNLOAD_HOOKS!).

package/pkg-cargo.mk does:

$(2)_DOWNLOAD_POST_PROCESS =3D cargo

which causes support/download/cargo-post-process to be called in the
middle of the download step.

What it does is basically:

1. Unpack the tarball that was downloaded
2. Run "cargo vendor" to download the dependencies
3. Repack the tarball

support/download/go-post-process works in a similar manner, but runs
"go mod vendor" to download the dependencies.

If you can identify the right incantation to ask npm to download the
dependencies so that we can implement something like this, then it
would be great.

> - this sass package is a node wrapper around the official project
>   dart-sass ([2]). I did not take a look at all at how to build and run
>   it (I am pretty ignorant in Dart), but I can take a look. I am not
>   sure how capable Buildroot is about building Dart projects (I see some
>   flutter-sdk-bin package, I am not sure how re-usable it could be to
>   build some randome dart projects)

I have also no idea :-)

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
