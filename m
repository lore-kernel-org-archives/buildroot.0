Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A52CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 16:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5770581CE1;
	Sat, 23 Sep 2023 16:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5770581CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTdhqXYJuxab; Sat, 23 Sep 2023 16:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA2281BFA;
	Sat, 23 Sep 2023 16:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA2281BFA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3746D1BF2E5
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 16:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1108560A8D
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 16:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1108560A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9ueQyoSEiVA for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 16:20:39 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de [85.214.38.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B51160888
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 16:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B51160888
Received: from smtpclient.apple (unknown
 [IPv6:2a02:810a:8280:47aa:bdd5:92a0:f93c:e7d8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 0A71E3D42A6B;
 Sat, 23 Sep 2023 18:20:36 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
In-Reply-To: <F16E06C3-7DA0-468C-88A2-80B109908D69@jens-maus.de>
Date: Sat, 23 Sep 2023 18:20:25 +0200
Message-Id: <26242E37-91B2-4D55-8630-C9292ED45663@jens-maus.de>
References: <20230923093901.1372593-1-mail@jens-maus.de>
 <20230923100909.GC1469982@scaer>
 <F16E06C3-7DA0-468C-88A2-80B109908D69@jens-maus.de>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: Apple Mail (2.3731.700.6)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1695486036;
 bh=HLoP2iJ0DF12J0v3AoEsSsNzrcsYeKTnU+xo+WoXL+E=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=IQ4kO1HCCcLoWvRaZuUGSUCmYuklkwS5Ly+i5QMO2vE0ktgkJNnNoBadg6shXLrMx
 oNn1Ajyh3AEhAjnFCIFc+zJizWzcWlMebcbJWHUZ9D9XB1FuOO/fzxgqaUvcjVOVMR
 f08HQOSsVwj64J7GIFBWNGTgewpTTc6QANE+xOSI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=IQ4kO1HC
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix parallel build
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi again,

> Am 23.09.2023 um 13:07 schrieb Jens Maus <mail@jens-maus.de>:
> 
> Ok, I just submitted a new patch just for fixing v8-qemu-wapper.in <http://v8-qemu-wapper.in/>. The other issue with the parallel build I will resubmit as soon as I have the error at hand again and can explain it in more detail.

FYI: I just retested the nodejs build without the top-level makefile patch which I suggested in my initial patch upload. However, I could not reproduce the issue anymore. I have therefore now resubmitted the patch but without the top-level Makefile patch.

Best Regards,

Jens
-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
