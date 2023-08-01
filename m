Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1F1C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF64260017;
	Tue,  1 Aug 2023 21:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF64260017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3mNxoPav5ic; Tue,  1 Aug 2023 21:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87F3461169;
	Tue,  1 Aug 2023 21:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F3461169
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 781A31BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35CA5400DF
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35CA5400DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcatBbqsncpu for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:13:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEAAA4007D
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEAAA4007D
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADC8FFF802;
 Tue,  1 Aug 2023 21:13:01 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:13:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230801231300.6c41b8ba@windsurf>
In-Reply-To: <20230801202141.2957846-1-bernd@kuhls.net>
References: <20230801202141.2957846-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690924382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GE6o1tJKQMMFPHaYXqU7+KWkaQEFRwi2JHTDKhojT5A=;
 b=g5U+1GyCGdVKWDkfoti6bd00dY2+kew/QZOv9+6hNq//PUOGpHFtUOzjE5iglFKRske/BP
 OsMlBrGSMssAROh/jM/vrAAjP81KJkNsXszHMBaCiZ2IkfTssA6hXDTiyf/A+ZbeNzLRSe
 BZueV77rP+LRfq+AehKPQT2EGQ02KYai07qznLnRxEfqeDRfTopxa1akX4r4SQhcAfDFc9
 HQfP9nv59kKxchJqbnJX4V+Bo5QmiIxN5c68SgLMAcuTMgqpUDXMBiWULErjFCn7a7lA3u
 HVS87C+jWOJ7N0A452gN3AUGVfaopPLkydVAyesLZWiH2T4RuKrf5gcaZLRDww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g5U+1GyC
Subject: Re: [Buildroot] [PATCH 1/4] package/ffmpeg: fix build with binutils
 >= 2.41
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Aug 2023 22:21:37 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...xes-assembling-with-binutils-as-2.41.patch | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch

Series applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
