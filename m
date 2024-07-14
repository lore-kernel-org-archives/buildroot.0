Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D012C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1773D605B0;
	Sun, 14 Jul 2024 15:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8JtdxdNUcSb; Sun, 14 Jul 2024 15:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 276E4605D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 276E4605D2;
	Sun, 14 Jul 2024 15:40:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 020F01BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0398810F4
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvEFSudTY-04 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9A95810EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A95810EE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9A95810EE
 for <buildroot@busybox.net>; Sun, 14 Jul 2024 15:40:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C14A1C0002;
 Sun, 14 Jul 2024 15:40:35 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:40:25 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240714174025.0da2f135@windsurf>
In-Reply-To: <20240713183033.129648-1-francois.perrad@gadz.org>
References: <20240713183033.129648-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720971638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjAvMUmgG0JOSX4GlmizcSqzD5cLNZ03HHIEhX4bEKU=;
 b=Hw38lBC3A1xlOgo7PKgkY5cxIrmKKXZZyeBhakjLV7sF9oEr7iUtFydwCpOLqH6LawaAt2
 pu8FhvwJQX/u8dOxYyKis3PiK51BbLB0Nf3hpnDGpQ9YzJqzZtjdoAPT46G1M4Vwy4Tc81
 26QM6Fzke+pjKe3+vc1xcy4cJ6Wdlrpoe92OF+3FzoBgFdutQopPg6mNeRSnzDbXST0hAC
 ieG08Ou86/PhNsfQLrYp4TBkQ4j58DwIMjNQAoUMDT1dDdz/C74utQEuQ53noGbDhB4EAh
 eLTK7nB98ksxWg4sq72GNqTObZBD2heFipHffqS+kwguQQECJUFrLv/6wvQV7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hw38lBC3
Subject: Re: [Buildroot] [PATCH] package/moarvm: bump to version 2024.06
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 20:30:32 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/moarvm/moarvm.hash | 2 +-
>  package/moarvm/moarvm.mk   | 2 +-
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
