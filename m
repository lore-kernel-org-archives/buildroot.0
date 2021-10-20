Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F31C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94DAA60FE8
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94DAA60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597D880EDA;
	Wed, 20 Oct 2021 16:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4HlDDBtCrzm; Wed, 20 Oct 2021 16:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4E4825E8;
	Wed, 20 Oct 2021 16:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C48371BF3C6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C15486074D
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P30WRsrlfZNG for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:54:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EF906071F
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634748876;
 bh=6b6Ip5vd44cDGzGzVl5b5zABeuuY+w+g+HwnJe3XQ1g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=R3ab4KrnflTn30SSaEZZqNvA2xegEWwzVIfBgUlhQA8Je7DQAeMUWrcWwzxihirvX
 5aOmy+VGK9AR4C9sx4NzX+zkRctqQCAxbOranAfXdFys1q0wtVfOelovvng07/HV/Y
 B1nRvEWA1k1/nm18jwdXwx83QHt7NHPoWKEcGoqM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.182]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1mqWUO0Its-00vQUi; Wed, 20
 Oct 2021 18:54:36 +0200
Date: Wed, 20 Oct 2021 18:54:35 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Steve <sleepy_dog@gmx.de>
Message-ID: <20211020185435.48c2eddb@gmx.net>
In-Reply-To: <20211020185304.60af9ff8@gmx.net>
References: <trinity-007290bc-de5f-4ff6-86dc-7caa998c06c5-1634729803292@3c-app-gmx-bap28>
 <e9c4ad82-8cdd-9c17-6d77-8ebf2449fb37@mind.be>
 <trinity-09b27e65-87f1-4757-866e-d1edf67f30e9-1634737088797@3c-app-gmx-bap28>
 <20211020185304.60af9ff8@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Lf798G4rPYCG7HOKWMk9Qrk0t7zDlkxEKUZzUiKcmIxaqOnnLoS
 WM4cMWaianKUU2mWkDlyDh/cPgiYByYU7VrFZGOtE1YharRfJWicyA33/pkVfTHbWRhpmtm
 IyaBkFKV/CSozxC17QbUu7pPZ46r2Bein7JDNCXVfvtqvKs+PtW+C+FAAka1MJ98OkTBcl7
 uPauN3uEdKCJwClPASVxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oy8Fc8wD+S8=:vJlhVbKvZGm3+WEbPUNXm5
 dH8cN0tcVVHga+QEqzenIPq+egHQ4lJ4q0N9QZpIKIqdRau6TImQurS5hHcl2bbyN/TEgJfFy
 jmY1X51u3NYpwaD379+TInfzhDShogNBoQ2rY4ibsUBlD1rotNwQHcdLhaRdhZHSqc2RfkEwy
 IJp48b1K9L2FKaZuHPYVYNS9MospySdKRM3eKve82Fm+uTJ7r9/9jYt3/p93QssCv91USrSzm
 NKg8J+e1IjRo5jND0VifVxq8KREupoQTAwXq8JhsfcnskkG8pCvgStXOSuUU2fmQ/T86Db+xn
 IUmVVyxT3xWbbs64yQwbqE9XC8EFHZfygt7RDSvPw70TnGJ8uUh7iAflAOmG6AGCyyJFP/FvP
 /bppmUXBMme0d4piQesxNhmcUbXCjlrbv0BenReMiyY43NCsihU+XfApd0PxTCf4t9PdhXgby
 G3O9zzF95SzirGlj45SFrd/BYzDWzP/XxuHaAijSrgWem3GhkysJBATg/VgWZQ/m2RkSFPxoO
 041600b4+zBK30PWv23DTACzOfhHloPbVQXOFzhZ80G1KEqcQTs3zALfrASPd58WYLv8yQUMu
 BmybnCzEkDFNJc1Z11CDK4wUWqY9/DNCHvJuCIm5U5fE3r+sZ1gkuQOuDGdnjvwjCcyki9wli
 MB0U3qqTEPKOFmc0NPoStj/5ZApZzFiyVeq/2ATvHewSY20i7uDeknWa0d6zx3W7K6YtrueQD
 lnlP6neSRetFQhyQZYITNGyF8VpaL0pV9o6dpCsM1RRnecCVK9br926nVwAVFzrgncq6n8Pyv
 B14nHEJ8JcRuoUv8nxl40rsSij8+Pa5pQ9UUCMp/xAxZGsTNRUN9O+Or5qQawaum2wK6iPelC
 Xlls1eroPvNrtAmVfazHHGnS37B5XWhVsC7LpWtbINYCqt37uaAelxupJsWcvMbmxEpQnUZEy
 QvtK4sI7EA+MoKarQ/nxhwmvdQeH/pMpyRhbXZL8jrdvKl73/MALmCPUK5F771CkUY/L/YwrZ
 UrGhlhNRZaBDWL8P88vYVXLwWNfS/c5/Z5iAe7V563JWNdl0fnvKYDSt4Ei/ZbZUahbT3Jzm6
 su2WRNKiq+I82E=
Subject: Re: [Buildroot] openssh - kernel messages upon connection attempts
 (always ending with "connection reset" at the other end)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hallo Steve,

>
> This is maybe a known feature/bug of the combination of openssh and (some) external
> toolchains, see [1] for discussion, patch/hack to avoid the problem and/or
> the hint to use another/internal toolchain..., or use dropbear instead of openssh...
>
> Regards,
> Peter
>

And the missing link:

	[1] https://bugs.busybox.net/show_bug.cgi?id=13671

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
