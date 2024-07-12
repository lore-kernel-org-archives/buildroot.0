Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D0CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD2E40954;
	Fri, 12 Jul 2024 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlZ0L7vqTbAH; Fri, 12 Jul 2024 20:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 926B540959
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 926B540959;
	Fri, 12 Jul 2024 20:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9551BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51B9B402C8
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iR_RVne5SYlN for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1395840929
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1395840929
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1395840929
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:43:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06EAF1BF203;
 Fri, 12 Jul 2024 20:43:40 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:43:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712224340.383674fa@windsurf>
In-Reply-To: <20240712183318.243890-1-ju.o@free.fr>
References: <20240712183318.243890-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720817021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hob8qR4DVwWhMElCe4IGBUIgZgVhyO5asQlu6fS99Rs=;
 b=NpNpDRqt5ZKv3kv//su9fEd4v466cR5uHs4OQoZafI3/b+oE0k58zEiE8m6083Y6S+uwd2
 qvVcWMw1UR3836deulpk2wfoQvt5I9jhgsmRztGzPFa50brQGLUa8qTAdT+sTjdb9dHZdq
 mIQMOSywLwr3UqDzvqa+R1TqjS9CGfvdbon/43GRl5Bmr1ubZf7aLc1q13iMA5AOw7xIVM
 y3e535bdDDbJSp6+k/vdUukOhqgD2HK3uvWx6O28xcP2HgdDcYYdBfLUPjmVuGPgkv+nJw
 6TxWQa4zYFLNC2N0VHbZg+7XgGlH620dHDIgpuM9IK7Hhpfo+58/hz2GkevG+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NpNpDRqt
Subject: Re: [Buildroot] [PATCH 1/1] board/spike/riscv64/readme.txt: remove
 obsolete comment
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

On Fri, 12 Jul 2024 20:33:18 +0200
Julien Olivain <ju.o@free.fr> wrote:

> At the time the spike_riscv64_defconfig was introduced in commit [1], it
> was not possible to have a console input using Spike and OpenSBI for
> RISC-V 32 bits. This limitation no longer applies, as upstream
> components now implements support for this.
> 
> Buildroot commit [2] updated riscv-isa-sim (Spike), which now includes a
> NS16550 uart emulation. This can be used by RV32 Linux Kernel. Finally,
> a spike_riscv32_defconfig was added in [3].
> 
> This commit removes the comment about this limitation, since it no
> longer applies.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/24d07fdc1404901fb1872ac55f875fe1d555cbb3
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/a83ab3f4c8621dec58dc78a8dcb48e519377ac3d
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  board/spike/riscv64/readme.txt | 8 --------
>  1 file changed, 8 deletions(-)

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
