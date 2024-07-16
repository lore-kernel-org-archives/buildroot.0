Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4691EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 14:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043A060A7E;
	Tue, 16 Jul 2024 14:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHyM41fNIJWN; Tue, 16 Jul 2024 14:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EEB60A87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12EEB60A87;
	Tue, 16 Jul 2024 14:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16D881BF37F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 036E540394
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ax1bPaUN1YGd for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 14:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD6DB403C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD6DB403C6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD6DB403C6
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 14:23:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 607BEE0004;
 Tue, 16 Jul 2024 14:23:24 +0000 (UTC)
Date: Tue, 16 Jul 2024 16:23:23 +0200
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Message-ID: <20240716162323.48fb829b@windsurf>
In-Reply-To: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
References: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
 <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721139804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYotHCANXUjUr4xvr4uD//P43lNiFgsYhrCBEtKh9bc=;
 b=T4FEONHp3ZquXY7Gc4x5h1J6gi4SFy4Vt3hm8WUVeNBFxwuv1OgJKsKqj65YIqxFAdyLfS
 BXt3TV3hRx0mu6HVET+exFUeJBmNMdGVCZ5SoBzZyEKygiGOipuLJOC8VgFaRgaXTFZ0nk
 qPaoPZacR8Rfdn9DO6nLICz4QXibDreJ/q18ASsjX0Yj3ElqsJlEwKNsFLOnNY3oyOFrpH
 CUNIF23kwcUBZul5C2pH3yXhpZP3rc7EfAHOWBs+dlplwWdjHAZs/PhB8EqDLSi538hcpe
 8VzQJBoNZYDBkBNh6h1cNQSwGre1xtcKO6DDq6/AWRS745RN95rA383GWxwbPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T4FEONHp
Subject: Re: [Buildroot] [PATCH v3] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fred,

On Tue, 16 Jul 2024 09:59:34 +0200
Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:

> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> As glibc's libcrypt was providing busybox's libcrypt dependency this
> broke any busybox build using glibc version 2.39.

Thanks for the new patch, but this still is wrong or too vague.

When you say "this broke any busybox build", it means that Busybox
build is completely broken. However, I don't see any Busybox build
failures in our autobuilders. So quite certainly, it's not all Busybox
builds that are broken.

So your commit should much better document which Busybox configurations
are broken. What is the build failure you encounter? After enabling
which option?

From a quick look, <crypt.h> is included by libbb/pw_encrypt.c, which
does:

#if !ENABLE_USE_BB_CRYPT
# if !defined(__FreeBSD__)
#  include <crypt.h>
# endif
#endif

So it's only if you *disable* USE_BB_CRYPT that you will have an issue
I believe? And USE_BB_CRYPT is enabled in our default configuration.

Could you please be a lot more specific/precise in your commit log? I
think your change is correct, but your commit log doesn't provide a
good justification for it.

On my side, I confirm that I can reproduce the build issue if I disable
USE_BB_CRYPT in my Busybox configuration. Is this the issue you're
seeing?

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
