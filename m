Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C4FC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0108060EC0
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0108060EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0C860729;
	Sat,  7 Aug 2021 10:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJH4mHi12PjQ; Sat,  7 Aug 2021 10:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10524606BA;
	Sat,  7 Aug 2021 10:01:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC1CC1BF5E0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF2C040265
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0B3NknQS1Ze for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CFC7401B8
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 10:01:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8C40913F866;
 Sat,  7 Aug 2021 12:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628330463;
 bh=tpZj4M8RUY74kX9gbS/8ck0BqjBuNIgwuKMUyNMwGxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LVanJjAwECG2aa64wmP9E8z3iHLbqiar8+QWgXB4iXmUpbBFvBq0V/p+QWoHDkVi2
 QgRShY6HexOZorcoQsLIye7oaWj4/tXLB+fPiZxU9uo19KkR40/2m6Z1a4vs7i3TFt
 +TYQVu1Q2O1bsCsKi2sq8QqA8s9UtIpYFmAtY+WN+eie5/1K78F9ZV79K8N7Zq1H4W
 2sknUchFlgRjW02CpkWPDL1nUVylVuivi1YVbj2IAYF3Lo2WZnM1Zi2IyFGaQZZb8a
 A5w3jz1dmGcGc43ThrDtPNNIbO5yGTzqIJoevnmSbj73o/nkftmHYg/k1eETumC7C9
 0OQC8yvqzxQVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 12:00:49 +0200
Date: Sat, 7 Aug 2021 12:00:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20210807100049.GA27036@scaer>
References: <20210806003144.455964-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806003144.455964-1-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/glibc: Use 2.33 for RISC-V 32-bit
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Joel, All,

On 2021-08-06 10:01 +0930, Joel Stanley spake thusly:
> RISC-V 32-bit was special cased to use glibc master as support was not
> in a released version.
> 
> Recently 2.33 was released, so RV32 can now use the same glibc version
> as other platforms.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Although we're in release-freeze, we've still considered whether it made
sense to have this on master, and with Thomas and Peter, we concluded
that this was indeed better.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> I was adding some glibc patches and was confused by the version
> situation. I think this was overlooked when bumping the version to 2.33.
> 
> I built qemu_riscv32_virt_defconfig and boot tested this in qemu:
> 
> # /lib/ld-linux-riscv32-ilp32d.so.1 --version
> ld.so (Buildroot) release release version 2.33.
> 
>  .../glibc.hash                                             | 7 -------
>  package/glibc/glibc.mk                                     | 6 ------
>  2 files changed, 13 deletions(-)
>  delete mode 100644 package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
> 
> diff --git a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
> deleted file mode 100644
> index 558591522e3a..000000000000
> --- a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Locally calculated (fetched from Github)
> -sha256 c3828224d69a42f5b6982cbec8ae01cf494fe975ce9023e36ff2c10a2fb93e42 glibc-2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99.tar.gz
> -
> -# Hashes for license files
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 1c8c40987812..1eff2455881d 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -11,13 +11,7 @@ else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -ifeq ($(BR2_RISCV_32),y)
> -# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
> -# Until 2.33 is released, just use master
> -GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
> -else
>  GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
> -endif
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
