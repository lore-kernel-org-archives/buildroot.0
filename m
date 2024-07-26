Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E5FC3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C7E409C6;
	Fri, 26 Jul 2024 07:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dSyjk-7iml0; Fri, 26 Jul 2024 07:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4A04409C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4A04409C9;
	Fri, 26 Jul 2024 07:35:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2371BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A16A80B76
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5A2tgY2aEFD for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 601ED80B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 601ED80B54
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 601ED80B54
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:35:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FE9520004;
 Fri, 26 Jul 2024 07:35:25 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:35:24 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240726093524.1345a522@windsurf>
In-Reply-To: <20240725082703.615109-1-dm.chestnykh@gmail.com>
References: <20240725082703.615109-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721979325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AinY6sFjGl+rSjkPOKIMtG8Xj5WNa6kM2i7F7c8cBTI=;
 b=ajq3k1zx9ZugM1vESPLzRxEBWRuE5U/pJoh+ZMcsrB09lOxwxwZWr49fFW8sb0tYoJ125m
 4/QnPtrXi4brgJU0Sxyp69NyYuhTiVYTjWZ/nxikdeQC4lIs9R8/h0j4xlH+1ppQ7/atFu
 n+6t1sbzl7jpvCXz8oMwjoo21HzXhocQAFiqjdCzCbY9NDqdT3YEwYls+HSlttjRWMPPX2
 aPA0mkMYUyCqora38kUNDp8qi/NqSwSVRUmoG55a0RHE18/JnR8r1Uaf0wXAWO42yI0uXW
 zU+w6MAPCnoE8l1ZOCVww8udj5RXYKhWGobnVGblpVA6wzm8pGCK5MPmpB6VjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ajq3k1zx
Subject: Re: [Buildroot] [PATCH v3 RESEND] package/uclibc-ng-test: Fix musl
 build
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

On Thu, 25 Jul 2024 11:27:03 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> Musl doesn't provide sys/asm.h header
> so we should add some defines inside
> mips-specific header file to avoid build errors
> 
> Fixes:
>  http://autobuild.buildroot.net/results/af7a1d00930485f87f77762b34cae01873a8cd41/
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---
> Musl doesn't provide sys/asm.h header.
> I think no one has enabled this test before for mips musl builds
> so perhaps this error has only appeared now
> ---
>  .../0001-Fix-error-absent-sys-asm-h.patch     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch

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
