Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10375C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8758881854;
	Tue,  2 Aug 2022 22:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8758881854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALP8GCEyrnoN; Tue,  2 Aug 2022 22:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47C181772;
	Tue,  2 Aug 2022 22:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B47C181772
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 702351BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57B706058C
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57B706058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XvLbs3x-vrd for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F37600CB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59F37600CB
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:15:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D6A21BF205;
 Tue,  2 Aug 2022 22:15:28 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:15:27 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20220803001527.5aee21c7@windsurf>
In-Reply-To: <20220802202142.1770838-4-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
 <20220802202142.1770838-4-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659478529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Abax8ErpLiDipWUeAGYAXu6DyapHSLO63J7p8+Mnnxw=;
 b=A8kDWk0+Cx3nBvITfWeVe7PI0ToCd5RQ29rJeUQEmlFZapJV6NaG3AxVacO+mUGzafxOck
 Uw8jOeWw7FcstsQIAnAHqDJumyJePuBs9YOK6jVlEcJSE2S82ibXteEOkD8ocQkVa0kUUJ
 PNZFoFKcoOtAF/3DlXR0YsNILpth2kjAYkFX9gLhw68zu5C0x0g+jgDQGqG/capc9WO0V/
 fftpEM3neL3RynoDho1ygrw+Nw4UB9Ido6wXE0qWbAy7RsML/o9olGf26zlBJptikKraMA
 5MtEpLfvWKhFERKGg5D0eO5imL/LTEMHKdU4iNAaRwT9Sc/J3AdLcgB8x5872Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A8kDWk0+
Subject: Re: [Buildroot] [PATCH v2 3/4] boot/uboot: pass -mno-fdpic if FDPIC
 is enabled
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Aug 2022 16:21:41 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> If the FDPIC ABI is enabled by default in the toolchain, it must be
> explicitly disabled when building U-Boot.

Missing SoB.

Who added -mfdpic by default? Directly the compiler?

If -mfdpic was added by our toolchain wrapper, then the toolchain
wrapper (toolchain/toolchain-wrapper.c) already has a few checks to
avoid adding -fPIE when building the kernel/U-Boot.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
