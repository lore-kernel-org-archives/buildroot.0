Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E7D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C5098089C;
	Mon, 11 Nov 2024 20:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75XaL6MYLvXb; Mon, 11 Nov 2024 20:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F3580E19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F3580E19;
	Mon, 11 Nov 2024 20:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D17CDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B528402A3
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3eLhZx9CyTu for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2A97402A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A97402A2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A97402A2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:16:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94C3940002;
 Mon, 11 Nov 2024 20:16:13 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:16:12 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241111211612.2c5a64bd@windsurf>
In-Reply-To: <20241105204144.2563973-1-ju.o@free.fr>
References: <20241105204144.2563973-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82VRrEZPGaF6zXSUVJeJqUZk4bktQcrg8QjnzIlKBAA=;
 b=HDMotzEzVzWZ3I9ntwfM9W+9WQ11C8VmiMfpk765UfmyNZAIxjyO9en7BBiooQkNW6M5N1
 BgP40WKBQoP1MYpbNc4s1t3WCnPfMiI4esv0Qhv9833kxUWBunZsKlDv/aid/GQ3dAJ418
 8UYeFn4R81Kwt/VOFn9G5/uAGem/lg8ibVncfg2MlglrW8C5BEu5Dk7IiEId9gTJL2zx/n
 ZdRLFJoKN5T/26Mz8DPOKhHuc6xtXcxDJncViAT/IkrpY11ePIvjqsss+BMY433B5KPMhh
 +g89TZ18GjEH9E4iLnlgc2YLJa4HlS1bbky9vZBRt2860E7jA8Sy0ylhsI4/4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HDMotzEz
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/boot/test_grub.py: new test for RISCV64 EFI
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

On Tue,  5 Nov 2024 21:41:44 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Commit f439b47ed "boot/grub2: add RISC-V 64bit EFI support" [1]
> introduced the grub2 RISC-V UEFI support.
> 
> At that time, it was not possible to have a runtime test for this.
> qemu-system-riscv64 is not in the Buildroot Docker reference image,
> and the base distribution (Debian 11) does not provide a
> sufficiently recent version. A qemu-system-riscv64 >= 8.0.0 is needed.
> 
> Commit 0d4177598 "support/testing/infra/emulator.py: add build host
> dir to qemu search path" [2] added the capability to use the
> Buildroot host-qemu package inside runtime test.
> 
> With this support, it is now possible to add a runtime test for a
> grub2 UEFI boot on RISC-V 64bit.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/f439b47ed6e987306c7de6d9c3be11de04935377
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/boot/test_grub.py | 44 +++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

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
