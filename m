Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D171C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE0F340373;
	Mon, 22 Jul 2024 12:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0yKE8kcxpe1; Mon, 22 Jul 2024 12:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3FBB40638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3FBB40638;
	Mon, 22 Jul 2024 12:14:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D22F1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09D07404D7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy5N8406z8jG for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A393F40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A393F40373
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A393F40373
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:14:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C63951BF203;
 Mon, 22 Jul 2024 12:14:43 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:14:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722141443.28d48442@windsurf>
In-Reply-To: <20240721173831.2350206-1-fontaine.fabrice@gmail.com>
References: <20240721173831.2350206-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLKmWf5i2gaj1LdrnPVOOyFlExJCz9KEmH79gv3CVAs=;
 b=GvGe+tfmyIsuTGwG3UA3suFea0vA+0+PufI2m+MVgWzSlx4fvZOa5XE6uT3qoZe1ZhtBDL
 NIYw4dnQ+PToo8Yl6oSTI0hMpX+YWNEeJrOyIFVSvsxIvyrw1fptxsgqJHomtNWJLF/D73
 7ZJrb42PcRZlZfm5Ig+AnWZXYJ2ZADysZDP/Sx8kPMqGYFIMkH6ApY5wBXk6ymqeT2dRQR
 s0GKclm2TjPa6gbIax77rHiGmBRTkcw7ctAVHOA4g7exNc2rpXiIKWvMPaXg0WVp+U9KUC
 pxcqcvpvMAFNsr1KYgbRDkAqg9aFe93/MeH7L9lOgcSe46T35fYsQvfnzZEueg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GvGe+tfm
Subject: Re: [Buildroot] [PATCH 1/1] package/picotool: fix libusb
 dependencies
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
Cc: Marcus Hoffmann <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 19:38:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libusb dependencies are wrong since the addition of the package in
> commit f7aac1c008f9c59f8c669bade17864b099221065:
>  - BR2_HOST_GCC_AT_LEAST_4_9 is used instead of
>    BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  - BR2_TOOLCHAIN_HAS_THREADS is missing
> 
> Fixes: f7aac1c008f9c59f8c669bade17864b099221065
>  - http://autobuild.buildroot.org/results/22689afc092e33b6e3c1c7ffea0d0e3b5bf76d99
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/picotool/Config.in | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Dammit, how could I have left this get through. Thanks for fixing
applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
