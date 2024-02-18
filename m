Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453F8C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 22:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19D460697;
	Sun, 18 Feb 2024 22:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6eLjW9M3Y48; Sun, 18 Feb 2024 22:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6C126081A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C126081A;
	Sun, 18 Feb 2024 22:05:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA4041BF4D6
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 22:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4EC98201B
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 22:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHhjJnmn-js2 for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 22:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E7D282011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E7D282011
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E7D282011
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 22:05:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C8B4C0002;
 Sun, 18 Feb 2024 22:05:25 +0000 (UTC)
Date: Sun, 18 Feb 2024 23:05:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240218230524.639348e6@windsurf>
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1708293927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVOYl0CZr2MLzifJmcncXVfykiN/hQkmTfiGJfu9+4A=;
 b=j+BD+LSiud+uf7n7+mICZku8NDwXV04VGuqEsx+eoGCS8PHiCXOxUVLVyBL4fJPBymJyMf
 kddguUk0kwytQEEiyMBoPuB9yZQNcbBKy6UnqYGqUDOe+6euNTQwHQRU4g6fMihiajHnKm
 gv6lb5hBwly/H7Tm34okFrdEPbpchLgvQDhoVf+6VACmDB/uZFsjiI16scfLWrX94icyG2
 pALLiO/K5FvECBId/oWkQyiGB4YK93mApk/+JdHSLJGVuFjnNySU9OGRv+Iz8i1CPviIvH
 eWLJGNXve3kHyG9zJqnl8Il72/ZPfbAHDzljjQ9aRb5ndt0lEueZnX3/H+sVGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j+BD+LSi
Subject: Re: [Buildroot] [PATCH 0/8] Patch and remove Nios2 binutils bug
 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 18 Feb 2024 19:45:28 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This patchset add backported patches for Buildroot Nios2 binutils bug 27597 and
> drop packages dependency on it. Doing this the external toolchain will fail
> building those packages, so I'm not that sure how to deal with this situation.
> The same happened for OpenRisc and as far as I remember the first patch of the
> series has been applied, then Bootlin toolchains have been patched and rebuilt/
> redeployed, in the end the remaining patches have been applied. But here we also
> have Sourcery CodeBench Nios-II 2018.05 toolchain that contain the bug, so I
> don't know how to deal with this situation to avoid build failures.

First of all, thanks for following up on this, I'm really happy to see
that we are not always *adding* more GCC/binutils bug options, but
sometimes *removing* some of them.

Regarding the CodeBench NIOSII toolchain from 2018.05, I think we could
simply delete it. It makes sense to support old toolchains to some
extent, but NIOSII is a very confidential architecture, and almost 6
years old toolchain is really ancient. So I would be entirely fine with
dropping this toolchain.

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
