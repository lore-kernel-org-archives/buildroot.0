Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A954C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C73C4035E;
	Sat, 27 Jul 2024 14:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8z98zFESgCW; Sat, 27 Jul 2024 14:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA32040386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA32040386;
	Sat, 27 Jul 2024 14:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 799401BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6577181F95
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlaY0IDCzF91 for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A2D38177C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A2D38177C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A2D38177C
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:19:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3107640002;
 Sat, 27 Jul 2024 14:19:47 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:19:45 +0200
To: franco ariel <fran.millocs@live.com.ar>
Message-ID: <20240727161945.1d175cb4@windsurf>
In-Reply-To: <SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52@SJ0PR19MB5415.namprd19.prod.outlook.com>
References: <SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52@SJ0PR19MB5415.namprd19.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722089987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9KMIAVKNdS1rcDMQ2WD8mL6Ffeq+u1Dv45ZYnjbqJg=;
 b=QNl3wwKl0xb0sR4sp3u+VLZmg04FkFWnUMvb73eHb+Oray6ZrU5mJtzeKinTZ5mKPRZtAX
 HpfL4HGIr78bCL3Zn/AilCsqNAlv5z7uX++22v7uV97TCCLE0tgqLDH6ReMU8eWG8UHZkd
 oLD9ooO6bpimkSLPdrsEAaEGlMb1iU1MCkOBI6fWJp1blchGU7WbaoET5aL6wNvvEDeXQI
 kem5qRwaSeImJudIb/jwhUPYd5QiqwigI545zkFyw0CmfrppYgdr+iigvCrJBoU/ml12Dk
 yOVvdFapqpWYMrsPPfBMUTFKJgDTFtytvS8yAHAqGeosrMcCaNnWfD991wcudQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QNl3wwKl
Subject: Re: [Buildroot] [HELP] Needed with Downstream Kernel and U-Boot
 Compilation for Khadas VIM3
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Franco,

On Sat, 27 Jul 2024 08:05:26 +0000
franco ariel <fran.millocs@live.com.ar> wrote:

> I am seeking help with building a downstream kernel and U-Boot for the Khadas VIM3. Specifically, I am attempting to compile the following repositories and branches:
> 
>   *   Kernel: (https://github.com/khadas/linux.git) khadas-vims-5.4.y<https://github.com/khadas/linux.git> branch
>   *   U-Boot: (https://github.com/khadas/u-boot.git)  khadas-vims-v2015.01<https://github.com/khadas/u-boot.git> branch
> 
> The primary reason for this endeavor is the lack of support for suspend to RAM and resume in the mainline kernel. I have noticed that the Khadas kernel includes the "AMLOGIC_GX_SUSPEND" option, which facilitates suspend compatibility.

Thanks for reaching out to the Buildroot community. However, you should
ask a specific question: what have you tried, what doesn't work?

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
