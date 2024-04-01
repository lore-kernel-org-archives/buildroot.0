Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7DCD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EADE60672;
	Mon,  1 Apr 2024 14:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggeKYheLC8Yp; Mon,  1 Apr 2024 14:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1AE607A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1AE607A0;
	Mon,  1 Apr 2024 14:28:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2301BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1814B81462
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQH-QjbjDEEq for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D53E281514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53E281514
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D53E281514
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 14:28:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 20E8713F89C;
 Mon,  1 Apr 2024 16:28:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 16:28:50 +0200
Date: Mon, 1 Apr 2024 16:28:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZgrEokl8om5MklrA@landeda>
References: <20240331201423.174954-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331201423.174954-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711981733;
 bh=Nxsg30+CdWdBD6UwO/Qk9ml/hGVsQv9dt9qZDas8ib4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DS4QEj7TT8kLgsQT+lUGhP+Sz8LblfULV8MfjfxVi7sg+Oy14fKP00AtirMP+NMmV
 3S0C4Va4STFc1u4/SYbSsaG/GM6fd/JLVI0gs/9F1IAqoOHWPa0D4lqhUZdjZAyTUx
 Rkl+IZ2D8OCPtia+U+IS66GPUAti3a+ZL9iAKiSYIx8VDZcRk+uWkhbdpJe0bvOCFQ
 Y+uYXLThg0l1tAy+dEBtXSIV10FE3jOgdwgipWFmO3xiIpbIiYMmy05PxPjhRKcmiF
 rOMNosSA5zRhe8+cD4f3fiylsjCGTEoxiNiA2O4Jy6NyuSzoV/+kQJIscY3Cj22Bfa
 T0+9jUi5RVjRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DS4QEj7T
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add ed runtime test
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

Julien, All,

On 2024-03-31 22:14 +0200, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                               |  1 +
>  support/testing/tests/package/test_ed.py | 98 ++++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 support/testing/tests/package/test_ed.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 313fc16b9d7..288a3ce0e68 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1780,6 +1780,7 @@ F:	support/testing/tests/package/test_cryptsetup/
>  F:	support/testing/tests/package/test_ddrescue.py
>  F:	support/testing/tests/package/test_ddrescue/
>  F:	support/testing/tests/package/test_dos2unix.py
> +F:	support/testing/tests/package/test_ed.py
>  F:	support/testing/tests/package/test_file.py
>  F:	support/testing/tests/package/test_file/
>  F:	support/testing/tests/package/test_fluidsynth.py
> diff --git a/support/testing/tests/package/test_ed.py b/support/testing/tests/package/test_ed.py
> new file mode 100644
> index 00000000000..eee5f8c4fc6
> --- /dev/null
> +++ b/support/testing/tests/package/test_ed.py
> @@ -0,0 +1,98 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestEd(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_ED=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def run_ed_cmds(self, ed_cmds):
> +        cmd = "ed <<EOF\n"
> +        cmd += "\n".join(ed_cmds)
> +        cmd += "\nEOF"
> +        self.assertRunOk(cmd)
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can run. This also check we have the
> +        # actual GNU ed, rather than the Busybox ed, which does not
> +        # recognize the --version option.
> +        self.assertRunOk("ed --version")
> +
> +        test_fname = "test.txt"
> +        input_text_lines = [
> +            "Hello World",
> +            "Embedded Linux is Hard."
> +        ]
> +        output_expected_text = [
> +            "Hello Buildroot",
> +            "---------------",
> +            "Making Embedded Linux Easy."
> +        ]
> +
> +        # We define few "ed" command sequences, creating and editing a
> +        # text file. The final output of this sequence is expected to
> +        # match the expected text previously defined.
> +        create_file = ["a"]
> +        create_file += input_text_lines
> +        create_file += [
> +            ".",
> +            f"w {test_fname}",
> +            "q"
> +        ]
> +
> +        edit_file = [
> +            f"r {test_fname}",
> +            "1",
> +            "s/World/Buildroot/",
> +            "2",
> +            "s/is Hard/Easy/",
> +            "s/^/Making /",
> +            "w",
> +            "q"
> +        ]
> +
> +        insert_txt = [
> +            f"r {test_fname}",
> +            "2",
> +            "i",
> +            "This is a new line",
> +            ".",
> +            "w",
> +            "q"
> +        ]
> +
> +        change_txt = [
> +            f"r {test_fname}",
> +            "2",
> +            "c",
> +            "---------------",
> +            ".",
> +            "w"
> +            "q"
> +        ]
> +
> +        # We execute all "ed" command batches.
> +        ed_cmd_batches = [
> +            create_file,
> +            edit_file,
> +            insert_txt,
> +            change_txt
> +        ]
> +        for ed_cmd_batch in ed_cmd_batches:
> +            self.run_ed_cmds(ed_cmd_batch)
> +
> +        # The final test file should contain the expected text.
> +        out, ret = self.emulator.run(f"cat {test_fname}")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out, output_expected_text)
> -- 
> 2.44.0
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
