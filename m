Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57180C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011CA61AE3;
	Thu,  4 Jan 2024 21:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011CA61AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElbL29TKoeq7; Thu,  4 Jan 2024 21:26:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6FB61AE5;
	Thu,  4 Jan 2024 21:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F6FB61AE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2B51BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E79D742DFE
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79D742DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKjjSUcaN_cl for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:19:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81930424FC
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81930424FC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 547AC1C0004;
 Thu,  4 Jan 2024 21:19:42 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:19:41 +0100
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20240104221941.044adcb5@windsurf>
In-Reply-To: <20240103102311.4048759-1-abrodkin@synopsys.com>
References: <20240103102311.4048759-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGoQWyrsa3eszImlBCX6Glj2YyTzJjTTEhjN1L6wNjI=;
 b=M+mumfxhgZnVz3FV9sngtgE8ufQYqQKHZl0DJzTP1NZ5H+7f+u08e84TzgFeGM6q6KcHbI
 8gntXlucrkhl2CGSMhlATLz4McjcPrANQAzgVGq1Lmldt7k5NJTVZAPvppHCfDMLoyMCXH
 ZFERRuhEgZn8jfVmL13uQCgNGrZcu1qJuzius/PwxccfA9lozZ/wrySpbr2Voro3D4TtCc
 1Q+WnGAdTrpBXrYocl/buDkzIGXo2WRYnTqox4CTu0PJKKA0hBxp6kcHVluAUVMq3+mdrw
 5rQVoQ7icTk7m8PLi/1aD2hCdksdVYgA9GqcrnTM9A8vApMOmArEBRvmruDyZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M+mumfxh
Subject: Re: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Vladimir Isaev <VVIsaev@gmail.com>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

Thanks for the patch. See below some comments.

On Wed,  3 Jan 2024 02:23:11 -0800
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> I would agree that it gets more and more ugly, but so far I cannot see
> any more elegant solution. So if there're suggestions how to improve,
> let's discuss.

Indeed, it's not super great as you realized yourself. Also, I believe
it's not the first time we identify a discrepancy in CFLAGS that are in
the wrapper, but that we forget to pass when building gcc/libc. See
your own commit d2ae7eb2a24c9033f8d8a9f81c5fe2ff2febdb5f from 2020,
which also added -matomic in gcc.mk.

Things are also a bit messy in the different C libraries:

- uClibc is built with $(TARGET_ABI) and $(TARGET_DEBUGGING)

- glibc is built with $(TARGET_OPTIMIZATION) and a bunch of additional
  flags

- musl is built with the full $(TARGET_CFLAGS)

Seems a bit meh to me.

So I think ideally we would to distinguish in a clear manner:

- CFLAGS that are passed through the wrapper, and which therefore need
  to be manually passed when building gcc and C libraries

- CFLAGS that are passed through the environment

I think at least for now what could be done is to use
$(ARCH_TOOLCHAIN_WRAPPER_OPTS) in gcc.mk.

But I'm surprised they are not needed also in the C library build. Why
are you not seeing the same problem with the C library build, it should
also need the same page size flags, doesn't it?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
