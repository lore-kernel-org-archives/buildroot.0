Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5377FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB8083A35;
	Sat,  1 Jun 2024 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f85i7y1E_Dgr; Sat,  1 Jun 2024 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E788483A7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E788483A7B;
	Sat,  1 Jun 2024 19:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEDC31BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB487608A1
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_uCgT048Q-O for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40CC0605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CC0605ED
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40CC0605ED
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:36:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB27913F89C;
 Sat,  1 Jun 2024 21:36:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:36:53 +0200
Date: Sat, 1 Jun 2024 21:36:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <Zlt4Vce7XMIE55Z6@landeda>
References: <20240529202425.469185-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529202425.469185-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717270616;
 bh=qnQ4ufBN2ZpA9PG8wFFp6oKKzSXqPRV6YsKCkgfDIgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YtKOyfcfbbu5WSoDXnBbhbTl2Hu1Mwvb3cmk2TgoBqAOkDSnLdp96QREU4sM5hcNV
 9SoZ68X5XJx1jmSJlswgDYdT2Gx85p9JAoOG1hIGhqJr5U+JRQ/V2yXPzEOhHP2m63
 Im0PTmXAIyvZCNotSsJa9NB8yy2GY6JxeNYj+Ap4XMfAYfeR+BAkxr5bz0DTaJAsYE
 MPBj6vKlsJmXuxbTdRs6ZiFjTkuL3e4ajyylCeeES+ImcP/ZHC9JgNEWB2/NiCVhV6
 RJJTIX/x82y0HjKJJ386C75P00hedu4iMirEELpnSiI8EqfBbxPoW25L296MzIvN6O
 G0vhMocUY2HwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YtKOyfcf
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: add mtd test
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

Brandon, All,

On 2024-05-29 20:24 +0000, Brandon Maier via buildroot spake thusly:
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

I've dropped the BR2_ENABLE_LOCALE_WHITELIST seting, because it is not
needed.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_mtd.py | 48 +++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 support/testing/tests/package/test_mtd.py
> 
> diff --git a/support/testing/tests/package/test_mtd.py b/support/testing/tests/package/test_mtd.py
> new file mode 100644
> index 0000000000..0871ab6457
> --- /dev/null
> +++ b/support/testing/tests/package/test_mtd.py
> @@ -0,0 +1,48 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestMtd(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_ENABLE_LOCALE_WHITELIST=""
> +        BR2_PACKAGE_MTD=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +
> +        self.emulator.login()
> +
> +        mtd = "/dev/mtd0"
> +        erasesize = 256 * 1024
> +        test_sectors = 4
> +        test_size = erasesize * test_sectors
> +
> +        output, exit_code = self.emulator.run(f"mtd_debug info {mtd}")
> +        output = [x.strip() for x in output if x.strip()]
> +        self.assertEqual(output, [
> +            "mtd.type = MTD_NORFLASH",
> +            "mtd.flags = MTD_CAP_NORFLASH",
> +            "mtd.size = 134217728 (128M)",
> +            "mtd.erasesize = 262144 (256K)",
> +            "mtd.writesize = 1",
> +            "mtd.oobsize = 0",
> +            "regions = 0",
> +        ])
> +
> +        # Test flashcp
> +        self.assertRunOk(f"dd if=/dev/urandom of=random.bin bs={test_size} count=1")
> +        self.assertRunOk(f"flashcp random.bin {mtd}")
> +        self.assertRunOk(f"cmp -s -n {test_size} random.bin {mtd}")
> +
> +        # Test flash_erase
> +        self.assertRunOk(f"dd if=/dev/zero bs={test_size} count=1 | tr '\\000' '\\377' >nor-erase.bin")
> +        self.assertRunOk(f"flash_erase {mtd} 0 {test_sectors}")
> +        self.assertRunOk(f"cmp -s -n {test_size} nor-erase.bin {mtd}")
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
