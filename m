Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11BFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 22:10:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433E560F59
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 22:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 433E560F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08161400C1;
	Sat, 16 Oct 2021 22:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jcmDexChOuc; Sat, 16 Oct 2021 22:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3356340111;
	Sat, 16 Oct 2021 22:10:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FA451BF335
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 22:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FD808293F
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 22:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkVet6fK0uZm for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 22:10:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF1FD828E3
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634422208;
 bh=IDU8shU4i5bTZOLe5kqrFCBMtymBNAby+HJ5517V0H4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=J1uDlUyzAySmwe9CaG2/QbMxVHr7mDKu3Xd3ZHis7dqrHH+j1qh8OxIW3CtfcP8gl
 Hf3qM9kIfLA/iivQ2Ov/3GkjyrYtic8tM6qpofOxm2FlMlxkllZ4j9IVFwPJ8+9Xbr
 YXeswcxMv3DoTMoe+Bc5xg3zM1K5GS+CDC6jJLfg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.201]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Hdw-1mZ6za2jpC-002qQ0; Sun, 17
 Oct 2021 00:10:08 +0200
Date: Sun, 17 Oct 2021 00:10:07 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Aman Karmani <aman@tmm1.net>
Message-ID: <20211017001007.1e3ee77e@gmx.net>
In-Reply-To: <CAK=uwuz3vn6dLB3NUaEs+yjJu85kjRZvJMNRMtSgNY4ECXFTtQ@mail.gmail.com>
References: <CAK=uwuz3vn6dLB3NUaEs+yjJu85kjRZvJMNRMtSgNY4ECXFTtQ@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:YcZCv4G6+dnay9MYUJfyHSbo8rJ2jGNOB8gG4dlMn+GUfK/aaKN
 Zd/oAtrFze243XJiMi0y4jUNYUJrKoXNrSNJS8QnJGE6WM8U3EPkrQbQu6IsRl5VGORggR9
 EJVTIRYm4+Ded0b7DiIxRgmooMtW0NZ0d7rtamadwKUVM2NHEKftlgGI1A2pBn59fj4ym+4
 VwqGTxmonfDomSpyoI+PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ui2lFtu1sOo=:z4ot4HQqKwdsV5861hPCaD
 zHzO6aefyhXin5SunwV2sEB/Otk43oHxxwdnpXs+Hs/aDiDPMHPHN0KQLaGpa7EyiqHMOXUkJ
 4WuFqmvKT+MYM6pADlVC9/0PzvpiY5Y5xhl0zvyrzDHbBGYH3gFI9MmFcmFqVoRBV81OBSeLg
 hZY3mMon0JfQx5FfnnCiBwD3AkZ29PWi40/hMa7g065+PqIiFGw3vKYIp74/K7MhCx24h2IgJ
 nNj8TF3q5wniEp2KwdhE5RDamnDE03oZf/BLGOXxlYY6yEKOz2T5ST/OwWuUNzoRAgGu15RZi
 7FpEHOwAUVdHhNFkIwWF+wEGg6Z5eEqUCmM6kggZSf7EtGm5yBFK4OCl58SAOcmLA8uQj8Iuu
 co1yeEH6SSOXW0EBHCCMWNFoVcy4owXJTqbGBvUM4xSeX2qC12/zgn7q95+Il6EyKDrBRbwy6
 MuOzslfhBr+G8byMfznIvf7lpGmObC8FihElRxMESSnQfJcOEHPY9S41MUKSVliKVUMKWCpkT
 gpqE1YFfQ7V5QJn77CnbsdGGAUCoKuw4CrkBdLkqUFyaP9i/7jfntLP50bAjSa44QhCrN7upD
 LzSoMhDaSiizU2sPHMZGyWp3AiVeKgBH+QI7ggqSzrg7c8jMTu5uw9CkveIVvPOqdK5b+l5F2
 /eJlfWEiN0GsqH//+apQO+CLDoS8cJVPazV02zJSspI8a0xFSVc50C+yu7TDYvcZ32Lptcei8
 ogHI6WiLiLTRvXR1BlCqFegteW6Bmb+s4RmlgGsfPxf3mx5tmjFC8iONzcMB9x5qRKsaayqG8
 EWJvdehsyszpUAA/i4ZfbTnEnUnolHvm5eQEGOcHpo8j/CDx73BqR2K8B6vACmD7lo/ImPsRr
 QDMIH9wyKkigsYigjeIFH0FjtcSCjCmKFvwEXL9ZTFLlMhOvhz7FsLrXdczBevaX7lCoaEePH
 aUX2tBsbky//ssTX357ozA4m4yScZArwva51vHWgnU0cO29wKToGt2o5eJFGvGXMLGydhHMAz
 Rpl0K9gxudLURTzgppDSmIXAtUmgeWNX800XTsdxmyE9pEGH66CodbwdNUtFcoQvyMvh0NEtg
 kz8fXxZ8jMCnzM=
Subject: Re: [Buildroot] buildroot/package/rpi-userland aarch64 support
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

Hello Aman,

added the buildroot mailing list in CC...

On Fri, 15 Oct 2021 16:47:27 -0700, Aman Karmani <aman@tmm1.net> wrote:

> Hi Peter,
>
> I was curious if you had ever submitted the patch discussed on this thread:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200114094256.23174-3-ps.report@gmx.net/#2341673

No (did not find enough time/interest to push this further)....

>
> It seems there have been several attempts to add aarch64 support to that
> package, and your patch seems like the most comprehensive. It would be
> great to get that merged.

As noted/shown in the thread not all rpi-userland libs/features are supported
for the aarch64 build, specially not libegl/libgles for graphics...

Which libraries are you interested in for the aarch64 build?

Regards,
Peter

>
> Thanks,
> Aman

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
