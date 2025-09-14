Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5FECA0EE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4499C60A89;
	Sun, 14 Sep 2025 20:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy8YKEcqkpvT; Sun, 14 Sep 2025 20:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BAE86F69A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BAE86F69A;
	Sun, 14 Sep 2025 20:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E289F1F7
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C945F418A5
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjukjrGClAJJ for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3C8D41610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3C8D41610
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3C8D41610
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:52:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E52282003CA;
 Sun, 14 Sep 2025 22:51:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 22:51:57 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 22:51:57 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250913190434.2224911-4-thomas@devoogdt.com>
References: <20250913190434.2224911-1-thomas@devoogdt.com>
 <20250913190434.2224911-4-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e39704c3929be94d9a88940487bcfc1c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757883120;
 bh=DXn1HLIaORCUB1pWnPV3gP30uJuFntNztdow2xrjGh8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zmx0sBrf6E9/fV6JUEsccnxyzce/2Iv04Au8kBrfVK9mwLFuW7mJqY2zAliiRD/LI
 nRH12SQIi7qZeHprHoDeRVydBD5Ihd6XXXkAgEf6mLZEW/uVQOgEFAqtkYQa88eBmQ
 njaEYkwMgGJCFUl2Sqv1Mmj+1+Ru7S9YOapD7BivbLpQt+H6aDtJxKTDhdDZTQODT3
 Fp93Ht7WCobMwJQEbSvqD4UTPjbdRuruB9FN2dzVfHIdB8gD7r+jFcaTH5oGLgUT9g
 OMvfyiQqaNFpVUEnH51fY9Q1n15rudicRJDHfSDIZPi4o1KboPYmAEsVC5eXl9SKKc
 m0ppZlOQB+NLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zmx0sBrf
Subject: Re: [Buildroot] [PATCH v1 4/4] package/libgtk4: bump to 4.20.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 13/09/2025 21:04, Thomas Devoogdt wrote:
> News: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.1/NEWS
> 
> Also select librsvg as it is required now. (See changes in 4.19.2)
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> $ ./utils/test-pkg -p libgtk4 -c libgtk4.config -a
>                              arm-aarch64 [ 1/35]: OK
>                    bootlin-aarch64-glibc [ 2/35]: OK
>                bootlin-arcle-hs38-uclibc [ 3/35]: SKIPPED
>                     bootlin-armv5-uclibc [ 4/35]: SKIPPED
>                      bootlin-armv7-glibc [ 5/35]: OK
>                    bootlin-armv7m-uclibc [ 6/35]: SKIPPED
>                       bootlin-armv7-musl [ 7/35]: FAILED
>                 bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/35]: SKIPPED
>              bootlin-microblazeel-uclibc [10/35]: SKIPPED
>                 bootlin-mipsel32r6-glibc [11/35]: SKIPPED
>                    bootlin-mipsel-uclibc [12/35]: SKIPPED
>                  bootlin-openrisc-uclibc [13/35]: SKIPPED
>         bootlin-powerpc64le-power8-glibc [14/35]: OK
>            bootlin-powerpc-e500mc-uclibc [15/35]: SKIPPED
>                    bootlin-riscv32-glibc [16/35]: SKIPPED
>                    bootlin-riscv64-glibc [17/35]: SKIPPED
>                     bootlin-riscv64-musl [18/35]: SKIPPED
>                  bootlin-s390x-z13-glibc [19/35]: OK
>                       bootlin-sh4-uclibc [20/35]: SKIPPED
>                    bootlin-sparc64-glibc [21/35]: OK
>                     bootlin-sparc-uclibc [22/35]: SKIPPED
>                     bootlin-x86-64-glibc [23/35]: OK
>                      bootlin-x86-64-musl [24/35]: FAILED
>                    bootlin-x86-64-uclibc [25/35]: SKIPPED
>                    bootlin-x86-i686-musl [26/35]: FAILED
>                    bootlin-xtensa-uclibc [27/35]: SKIPPED
>                             br-arm-basic [28/35]: SKIPPED
>                     br-arm-full-nothread [29/35]: SKIPPED
>                       br-arm-full-static [30/35]: SKIPPED
>                    br-i386-pentium4-full [31/35]: SKIPPED
>                       br-mips64-n64-full [32/35]: SKIPPED
>                  br-mips64r6-el-hf-glibc [33/35]: SKIPPED
>                br-powerpc-603e-basic-cpp [34/35]: SKIPPED
>                br-powerpc64-power7-glibc [35/35]: OK
> 35 builds, 24 skipped, 3 build failed, 0 legal-info failed, 0 show-info 
> failed

Since there is still known build failures, it would be great to have
followup patches fixing those. Failures seems related to musl libc.

I applied this patch anyway, because while testing, I had less build
failures with this new version than with the previous one.

Could you have a look to pass "test=pkg -a", please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
