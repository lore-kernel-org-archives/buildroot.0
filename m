Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892ACC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB54C607DF;
	Mon, 15 Jul 2024 08:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qB6VghjdGQBi; Mon, 15 Jul 2024 08:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF4460820
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF4460820;
	Mon, 15 Jul 2024 08:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA7AD1BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B569F4025A
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS7Z0MlihtsC for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57A9840246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A9840246
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57A9840246
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:28:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE0BF1BF203;
 Mon, 15 Jul 2024 08:28:50 +0000 (UTC)
Date: Mon, 15 Jul 2024 10:28:48 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240715102848.7dc3d619@windsurf>
In-Reply-To: <20240630210938.1590435-1-yann.morin.1998@free.fr>
References: <20240630210938.1590435-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721032131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQMqAekM8mgQL0jRvwA9PcfsGmcBTcxa0aR95fyFUgk=;
 b=YkTK0Fw+1Fz308Bn9huoG2imy4qAV4CjhOSXaDtPPkRG+EYmNKe3V+1o6PYWBhql9tuHCW
 Iqrm6ok/5UbE9KmqxkB84qTlpjfb+qd17SUKvOJitdSdeocvvhGlFgtZ7TNmybM5hmYKo6
 TmaQg+CkBFiEUfA2eiCvFUW89sHkZvuzDb61+sgFRqTz7GTR+NwrKMvZBZRiNGqSQTSFe0
 ZJqvFKSe1q3gMUZ0lH+Be5A9DhgVCUKGuR889TOV4NSnq/Rj32Buqeqe/8jLFsIulfAIwy
 j3g3jAMV4SWCXexq9ZEHxwLVvaNvItC8LuDZOL6jhHPUHF5mTRhFi2nqheI//g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YkTK0Fw+
Subject: Re: [Buildroot] [PATCH] package/tar: fix linking with libiconv
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

Hello Yann,

On Sun, 30 Jun 2024 23:09:38 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Backport two patches from upstream to fix linking with libiconv, e.g.
> with this defconfig:
> 
>     BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
>     BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>     BR2_SYSTEM_ENABLE_NLS=y
>     BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>     BR2_PACKAGE_LIBICONV=y
>     BR2_PACKAGE_TAR=y
> 
> It is interesting to note that the first patch we backport is the first
> commit in the tar repository after the 1.35 tag, and was comitted the
> same day the release was cut...
> 
> Fixes: #4

I've changed this to:

    Fixes:
    
     https://gitlab.com/buildroot.org/buildroot/-/issues/4
     http://autobuild.buildroot.net/results/c074c2e22a7f764400ecc7dd1a6cd6022fa87fb9/

I don't know if Peter will agree, but I find the full URL to the gitlab
issue to be clearer. One can directly click, we can more easily grep
through the git commit messages to find all commits that fix a Gitlab
issue, etc.

And of course, I've added an autobuilder failure.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
