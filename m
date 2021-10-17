Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05346C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:50:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695A26108F
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 695A26108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26E1C40160;
	Sun, 17 Oct 2021 19:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi3ZfhVUJcir; Sun, 17 Oct 2021 19:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB004020A;
	Sun, 17 Oct 2021 19:50:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4EB61BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B444C606DA
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rz5w5-ksLvPP for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:50:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C9E160684
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:50:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8509378031A;
 Sun, 17 Oct 2021 21:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634500202;
 bh=dFLSp2faSYqXfy+TzqHGsxxyPyVbw844bAhrHWISaH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kciHjkSnmCDPHvUCTUXyo62pkrI2gKZz80XWU14pcHJR6rZrItu+yHndy1j2G5VsE
 FfzVzKpfyjt/vBVOsAZRraWyXYJ/mlC6arkDCMHQm+mNsomW37eoblYIOD4mGb8zDZ
 aMRpdrSnFRYzIz2eRK3J+CNNKMHB2NUc7qlXUiV25V5oORD0p/ScQSNDuNagBu7Sa5
 CjbnE7KS0tlISt0VUBu1JDXanw5nkiTDitmsEPmNYy1vdScwEMNYv76pc/3bjR0E7W
 0BBedM/G/Lg1wd/yvU0hb1ZsXQ5I9UqpGqw8tEJiiyTsI+93DyaVMubrWrvcZ11Ny1
 PJsB/hkkTY6EA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 21:49:58 +0200
Date: Sun, 17 Oct 2021 21:49:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211017194958.GJ2400@scaer>
References: <20210912140658.253602-1-romain.naour@gmail.com>
 <20210912141140.253778-11-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912141140.253778-11-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 13/16] support/testing: test_ubi: reduce the
 rootfs.ubi size to 64M to match the Qemu emulated flash device
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

Romain, All,

On 2021-09-12 16:11 +0200, Romain Naour spake thusly:
> The size of the cfi flash device emulated by Qemu is 64M not 128M [1].
> Since Qemu >= 4.0, the size of the device must match the size of the block backend [2].
> 
> Fixes:
> 
>   qemu-system-arm: device requires 67108864 bytes, block backend provides 134217728 bytes
> 
> [1] https://git.qemu.org/?p=qemu.git;a=blob;f=hw/arm/vexpress.c;h=58481c07629aedb09864dcc72757ff7947e733bb;hb=f9baca549e44791be0dd98de15add3d8452a8af0#l50
> [2] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=06f1521795207359a395996c253c306f4ab7586e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_ubi.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
> index 7321f83da9..8148e5f336 100644
> --- a/support/testing/tests/fs/test_ubi.py
> +++ b/support/testing/tests/fs/test_ubi.py
> @@ -25,7 +25,7 @@ class TestUbi(infra.basetest.BRTest):
>          out = out.splitlines()
>          self.assertIn("UBI image, version 1", out[0])
>  
> -        subprocess.call(["truncate", "-s 128M", img])
> +        subprocess.call(["truncate", "-s 64M", img])
>  
>          self.emulator.boot(arch="armv7",
>                             kernel="builtin",
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
