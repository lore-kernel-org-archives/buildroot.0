Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E8D5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA1D80A49;
	Mon, 28 Oct 2024 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmQE1OrHLbq7; Mon, 28 Oct 2024 21:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8BC80A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A8BC80A50;
	Mon, 28 Oct 2024 21:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 658874EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 547EF80A50
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2WZtSYbA9Ku for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19FF0805B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19FF0805B3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19FF0805B3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:36:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5515A1C0002;
 Mon, 28 Oct 2024 21:36:18 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:36:17 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
Message-ID: <20241028223617.1b728716@windsurf>
In-Reply-To: <20241026110059.3204413-1-romain.naour@smile.fr>
References: <20241026110059.3204413-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xoEkH9YvW5gHWyn5Gd7yNPmg9Uo5dLev8avf1LhQn0=;
 b=aex5Pf5l/MY3LWho+qTnMYsdWWJ20ZrKpjM+vaaSqq7Z0hFyrihGUbPFf5uxj2zjzJxQ42
 9Lat9HmdX4vOXbeYToHbe9Hygx6eeDeYEW/usjXMw5GQO33+MzIKIbt4sAN/FeylPmS1Hg
 5IG1vs2vsLTT7e7ZXPw5fP+7/iUAajMeq0Gs3/lQQrMXfODvujCbDjUxmQ9TCHjT354ZpN
 LzKTkitOOs80Q1R2VX9kBPu24f7Oj9Lc4EMs44M8xsf9iaJvL5brlSIbvBd11/CDI/xplE
 +6x6kFHtYU9v3+tdeBAKd+kqtfN5kCNCRLsS9yUlLdDRI2JTX9fDHyb1vjcRHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aex5Pf5l
Subject: Re: [Buildroot] [PATCH v3 1/5] board/qemu/riscv{32,
 64}-virt: do not use the default bus implicitly
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Oct 2024 13:00:55 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> From: Waldemar Brodkorb <wbx@openadk.org>
> 
> Qemu 9.1 recently fixed the RISC-V virt target by adding the missing
> default type for block devices [1].
> 
> But the qemu command line we use for RISC-V virt is slightly incorrect:
> 
>   -drive file=rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
> 
> With Qemu 9.1, this command line now rejected since it conflict with
> the new default bus:
> 
>   qemu-system-riscv64: -drive file=rootfs.ext2,format=raw,id=hd0: Drive 'hd0' is already in use because it has been automatically connected to another device (did you need 'if=none' in the drive options?)
> 
> Since we are currently still using Qemu 9.0, apply the suggested change by
> adding 'if=none'.
> 
> Note: '-drive file=rootfs.ext2,format=raw,id=hd0' can be removed
> in a followup patch after the qemu version bump 9.1 is merged.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/commit/4406ba2b5efce6af64905f827ca244f699db8170
> 
> [Romain: rework the commit log]
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  board/qemu/riscv32-virt/readme.txt     | 4 ++--
>  board/qemu/riscv64-virt-efi/readme.txt | 2 +-
>  board/qemu/riscv64-virt/readme.txt     | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
