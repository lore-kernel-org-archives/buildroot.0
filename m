Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BDEC3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559D040B47;
	Tue,  9 Jul 2024 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uN1QN_77loe3; Tue,  9 Jul 2024 09:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 296F0409F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 296F0409F7;
	Tue,  9 Jul 2024 09:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C11E1BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35EDA60AFD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id re1dOjvUoad6 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F15F160B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F15F160B29
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F15F160B29
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:42:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CA8C1BF208;
 Tue,  9 Jul 2024 09:42:56 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:42:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240709114255.2e74071e@windsurf>
In-Reply-To: <20240704184456.2970034-1-dario.binacchi@amarulasolutions.com>
References: <20240704184456.2970034-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720518176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QkTKTwwwLh8zVFZ6VGM0XgXc0/9AxX5kKhysvqGdG8=;
 b=NHFB3/P5X2pN9n+l0G4uoIMPPy76xuN0RHt7vuqXOj/nT+9RJ+uEBXW4Ula+KGnmmxXFeb
 iRYzZRfWG/CM9bvU4CuPENSuFZkfvwJxzKyzwXwgmsY0C7FdlUUiJvjYE4ev+EyKMxG2N4
 nza0m0FoW8qYUe7V3Yb0eqN0qZsv0X3NCNRtJSPg9jM99M6STmc5bZIV+o/7ocOhStzUCV
 lvze2Lp4+55gmbbyVthBtPJL0zs7FrTqH5uVoA+2QP24bzetAn+YeE0zC/RxEzqr6GirTA
 zbvwq5D+OdtO2XTJ+HxUy+53IgSMtb9oZ+Eiym/AOYT7sKRHFPjm+0wTKcky3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NHFB3/P5
Subject: Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: update the
 patches to be applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Jul 2024 20:44:56 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, nvidia-driver fails to build with output:
> 
>     Applying 0001-use-LDFLAGS.patch using patch:
>     patching file kernel/nvidia/nvidia.Kbuild
>     Hunk #1 FAILED at 87.
>     1 out of 1 hunk FAILED -- saving rejects to file kernel/nvidia/nvidia.Kbuild.rej
>     patching file kernel/nvidia-modeset/nvidia-modeset.Kbuild
>     Hunk #1 FAILED at 70.
>     1 out of 1 hunk FAILED -- saving rejects to file kernel/nvidia-modeset/nvidia-modeset.Kbuild.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/nvidia-driver/0001-use-LDFLAGS.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

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
