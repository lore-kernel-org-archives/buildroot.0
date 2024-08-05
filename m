Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9D3C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BA8780B25;
	Mon,  5 Aug 2024 20:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWhrxuMsRaXd; Mon,  5 Aug 2024 20:42:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D48E81172
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D48E81172;
	Mon,  5 Aug 2024 20:42:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF2961BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE4F60730
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDEKLwbGOyoL for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0711360621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0711360621
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0711360621
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:42:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37E1CFF805;
 Mon,  5 Aug 2024 20:42:36 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:42:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240805224235.2d36f208@windsurf>
In-Reply-To: <20240805190734.3410938-1-bernd@kuhls.net>
References: <20240805190734.3410938-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILP2tVGdDH0gqdZ8b9qqBvBVFHJ+VaYV/41cMf39+28=;
 b=Ygcd3x6QEWr/LEuESmmE9ZoRA1D+2PxZi15nmTMnRRe09Zd0gMUt2VuJAOXV0ndIlPaROx
 Cg7wc03m8y6Pm5CzBjilYUdlVTCMJmxEdZX27gMNFH3mXgOxlEDzguxmesTgiR41SvJ1W/
 EYdZ+RY50JB0GHPGjIhjDh7GVXY6EYpfD/yfbSxMGJbcvjRnR93Q5pWGLIRCkRu2q0Fi+u
 LrrcmPo1T/hH9rPJb3o2jSAFsoodDxaVY8bXrf8bgqUMvw/JeDn/B+W3IoMZwGv+LOs8gB
 tEJWeOsU1v1Vpy7dD+yodUbgh2bzwxaLIY7QImnGkz5MaJzx0aVIX+90xCxZEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ygcd3x6Q
Subject: Re: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
 1.10.12
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

On Mon,  5 Aug 2024 21:07:34 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> -# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.11.-release.tar.xz.sha256
> -sha256  7f9603a691220d9f47da42f3b19290b629b69dceb2eee56448f0a7cefcf9d1a1  freeswitch-1.10.11.-release.tar.xz
> +# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.12.-release.tar.xz.sha256
> +sha256  e324e4ae063e692c42b93031157329bae339ea007e611d3535333deaed85aa47 freeswitch-1.10.12.-release.tar.xz

                                                                           ^^^

There was a minor glitch here, with only one space while two are needed.

To help avoid those issues, you can put https://paste.ack.tf/b0be84 as
.git/hooks/post-commit in your Buildroot Git repository, it's super
handy (courtesy of Yann E. Morin).

Applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
