Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315C3C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C2F60A9C;
	Mon,  8 Jul 2024 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68ibSEtbzSwd; Mon,  8 Jul 2024 20:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7199F60AC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7199F60AC6;
	Mon,  8 Jul 2024 20:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE7C1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27BDC608FD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hoKXIdUeoyQ for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C81560826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C81560826
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C81560826
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4501F1BF203;
 Mon,  8 Jul 2024 20:22:15 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:25 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222125.26f51e58@windsurf>
In-Reply-To: <20240707055007.3839165-1-dario.binacchi@amarulasolutions.com>
References: <20240707055007.3839165-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTHH5gyWJuxDzrMI/gJ1emlqSIAVhmZrPt/PbjZJqXY=;
 b=b5U4+8ybyAZaN6SxxlQOWO9JR/9HADn7D79OEEcSoFhChNij9c7XfBcqXg80RHQ3HfeIou
 tjYpkbjdiU4id4zDjWdvWQ2lFh5slBiS4UqvWwmT+6JgqlJQeFDWk1KqkGONj/9NYqz0Om
 zAjwvuVuFoW9ZEFtQ7beJwtc881CIpCrHsDkdFQUcyzFpY5Wib6AKkijx05qG0N7cC1bB3
 D+gt/8vEIrv43HDm8Ilegb3CgiVSRFpoE+mbWtEOW4ZRzN4fF6yG3A5gu+83aLvwCjRXd6
 Osf5YYrPnnuggoJ9/p2j7TSpggbfoiIl7UtTQehxfJLzDm8ULcC8CNfs5pwpVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b5U4+8yb
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: update the patches to be
 applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 07:50:05 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, monit fails to build with output:
> 
>     Applying 0001-no-force-static.patch using patch:
>     patching file Makefile.am
>     Hunk #1 FAILED at 85.
>     1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej
> 
>     Applying 0002-configure.ac-fixes-missing-config-macro-dir.patch using patch:
>     patching file configure.ac
>     Hunk #1 FAILED at 8.
>     1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patches on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/monit/0001-no-force-static.patch                  | 8 +++++---
>  ...0002-configure.ac-fixes-missing-config-macro-dir.patch | 6 ++++--
>  2 files changed, 9 insertions(+), 5 deletions(-)

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
