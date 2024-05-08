Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B423C19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB99860D5C;
	Wed,  8 May 2024 16:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfzYfdLWXDUR; Wed,  8 May 2024 16:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FE560E02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3FE560E02;
	Wed,  8 May 2024 16:34:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6F71BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C294028B
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oT_qLVZrWhh for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2025401F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2025401F9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2025401F9
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:34:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1CFC1BF208;
 Wed,  8 May 2024 16:34:28 +0000 (UTC)
Date: Wed, 8 May 2024 18:34:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240508183427.33d70e6d@windsurf>
In-Reply-To: <Zjt2LJ9JGGPPWFu2@waldemar-brodkorb.de>
References: <Zjt2LJ9JGGPPWFu2@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715186068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41WzYVGrGaV+vQ3bR80JmVRehpSWReaj2AXdfjyt9Co=;
 b=iPdTImtbxR7tlUg1XT9BkWXapyXK3JEgubcndj8dsq3DRDh6dRZ5z5Vi25JSw1jidZ7tm1
 Ckjuo6Z25QsGxFFtcB1HABopNC8ysIZQQ/1hkJfKfwc7KXn8yWvAle5Rs35sdPxvNjPae7
 Ix/vB8AGbQ8J04367GGLnenTHpSy17NKoiE6rDfvbX2PsfMjICdSHE4FVJmUy+4605sqLA
 rKM/KoeiJT9MJZsRF/4YNTi8bXC05qbkS0ylyb0H6s80bhGX+wVdIaHd+kdJ78mvMd/Ef0
 SA6wShyr5ni/SifhPObm4bDtBUZDl4DD7l6VNV2FWn4g39kDKtcFDavQq5Nk/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iPdTImtb
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable riscv32
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

On Wed, 8 May 2024 14:55:08 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Tested with qemu_riscv32_virt_defconfig.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

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
