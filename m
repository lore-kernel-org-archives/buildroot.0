Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3200C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E2B480B28;
	Fri,  2 Aug 2024 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAiL4_T1DU14; Fri,  2 Aug 2024 17:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AFF680C92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFF680C92;
	Fri,  2 Aug 2024 17:43:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 667491BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 530D940112
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYUtpfxQeoBx for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:43:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3E1D400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E1D400F5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E1D400F5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:43:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D61D860002;
 Fri,  2 Aug 2024 17:43:16 +0000 (UTC)
Date: Fri, 2 Aug 2024 19:43:15 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20240802194315.2de20808@windsurf>
In-Reply-To: <CAMo8BfK7FSn8imzqjTW8BLS7mPk6HLTKvCM4aBFaJw93z-ZpmQ@mail.gmail.com>
References: <20240802170713.2790A83B45@busybox.osuosl.org>
 <CAMo8BfK7FSn8imzqjTW8BLS7mPk6HLTKvCM4aBFaJw93z-ZpmQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722620597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/c5BQ3+64a3/0uM9oZ7OnyPsorlgoUk3MIWbYZm6So=;
 b=ZjgqpkOC7GpbuE+yaVqB/IJMsZhzJ0jiwM/r5duvJRCbVKgmGhXzDCPgjbis/sqU/ZcLcS
 wnBl6HhZLI0FsOB4tjrrgM5uHiBWhAwddsQ3RWNU9+JFqQtUPCKZsa+mKgJJNnpE/PZW35
 M0mbMvwn7h0LnWxvqihQiS3VyoRH8LRLma7aSv87C314MgA4TjFWaJjRM+COMBuk39iJCZ
 ZpYvzP8GkcbIYJv+keBj7eIrxFSIhzzp+GCUYAjzjEe6kWj8urUnBNeGUNuRfcbQXE+Svs
 0aZqDk7YA4wDRgTjDurl9A86ZVoQCZ82dhiciTtK0hVTpmUXpYnbJ+eEpn/CRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZjgqpkOC
Subject: Re: [Buildroot] [git commit] package/chicken: move literals into
 text section for xtensa architecture
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Max,

On Fri, 2 Aug 2024 10:24:20 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> > ++ifeq ($(ARCH),xtensa)
> > ++C_COMPILER_OPTIONS += -mtext-section-literals
> > ++LINKER_OPTIONS += -mtext-section-literals  
> 
> There's a stronger version of this option, -mauto-litpools, in the xtensa
> TARGET_ABI and it is passed to the TARGET_CFLAGS. Why does
> this package need special treatment?

It causes build failures:

  http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e/

There's some explanation from the patch contributor in the commit
message BTW:

    This solves a build problem -- by default xtensa-gcc puts literals in a
    different section of memory then the program text, and chicken is a very
    literal-heavy program, so they don't all fit there. This avoids that problem.

Note: I'm not at all an expert with Xtensa, so I'd be happy to have
your input on this!

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
