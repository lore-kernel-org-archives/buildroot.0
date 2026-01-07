Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF13D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376D682238;
	Wed,  7 Jan 2026 17:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqkpsWkeGugF; Wed,  7 Jan 2026 17:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA5582240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808470;
	bh=vjywTjGbWS0r2h1QVTVTmwte0NLLHlH68r6s9I3rDbQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MTUW3vs8OoXVZ2gcQTJZQ/RH5a+KeEy01RI/2l+JFxjg4ZzlnRf4cP4LkS4C3Y2ef
	 iZ5uYSZciShdwbameKakot7djvybC1U2Dr1qN1qEUIqqqWpoC9t3RfZtbOplZC5ZDQ
	 8BVhjIWxyIf29M8Nifs5FMue88SAt0rlhqMCdpsDBBsaU4s0Yy2VzXI6EcEDIieNeF
	 iVQlVATvgLaAS0P5T9JEhdLi0PJV0YUTPfBn0QjitzsvOlIKz2KozID0Gy3hdpZl5p
	 8IVjBd9ovw5w6FBlxhsQcLpGRaay3RghgmSMkz8vPvpoNVj9NAyTILaROu6QHfZfRy
	 ZEoGOSkaI02/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA5582240;
	Wed,  7 Jan 2026 17:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1167425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC9B841014
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0b9QwUzcqHZ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 721AF41015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721AF41015
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 721AF41015
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B773B97A596; Wed,  7 Jan 2026 18:54:24 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:22 +0100
Message-ID: <20260107175422.229408-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251116202053.3276072-3-fiona.klute@gmx.de>
References: <20251116202053.3276072-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808464; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=cT9dsYIkTPPgTaKaySp4rvHZqGx4+LBaiPuq/LNoO0w=;
 b=mYGEJ80/iXvyPLIwBV6pDMfU0UmVe4ioDkHbLYuN9tarjQMPKGgj9PEOQklAn1zP49g+C7
 bq4JVz4uaGHXDy6iajGoCW1wo03LPpaB6vD5fWgjXadEoi56s02KOJB2Av974IhwejHeR2
 cR8n39/4USBw35wr5CUJdC2RXNlFWXqOs0dQdsSwZjfn7T5BNf7h02elRgUb3EO/1pZ7EI
 uQSTjcMcfjkQrk4jbc97WGiKbpuxefMTwthVifK0RcNdIqObDoOqYPDB2YMpL3EhkVC3wJ
 TjjQigCSKyrfbXgqJnc/mvSXTTrU/jwh1IHXDCdHkK5urEvpX7k1ymNHzSbMbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mYGEJ80/
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add tests for FIT hash
 support in package/uboot-tools
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The tests check if all supported hash algorithms are usable in
> mkimage, for both host and target packages. Additionally, as a
> necessary tool, it verifies the previous fix for FIT output from
> dumpimage.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.11.x. Thanks

> ---
>  .../testing/tests/package/test_uboot_tools.py | 98 +++++++++++++++++++
>  .../package/test_uboot_tools/example.its      | 48 +++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 support/testing/tests/package/test_uboot_tools.py
>  create mode 100644 support/testing/tests/package/test_uboot_tools/example.its
> 
> diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
> new file mode 100644
> index 0000000000..01b86e5d1e
> --- /dev/null
> +++ b/support/testing/tests/package/test_uboot_tools.py
> @@ -0,0 +1,98 @@
> +import hashlib
> +import re
> +import zlib
> +from pathlib import Path
> +
> +import infra.basetest
> +
> +EXAMPLE_ITS = Path(__file__).parent / "test_uboot_tools/example.its"
> +
> +
> +def get_hashes(output: str) -> dict[str, str]:
> +    """Get hashes from dumpimage output (assumes exactly one image in FIT)"""
> +    pat = re.compile(
> +        r"Hash algo:\s+(\S+)$\s+Hash value:\s+(\w+)$", flags=re.MULTILINE)
> +    return dict(pat.findall(output))
> +
> +
> +def calc_hashes(data: bytes) -> dict[str, str]:
> +    """Calculate the hashes dumpimage should report for a given blob"""
> +    return {
> +        "crc32": f"{zlib.crc32(data):08x}",
> +        "md5": hashlib.md5(data).hexdigest(),
> +        "sha1": hashlib.sha1(data).hexdigest(),
> +        "sha256": hashlib.sha256(data).hexdigest(),
> +        "sha384": hashlib.sha384(data).hexdigest(),
> +        "sha512": hashlib.sha512(data).hexdigest(),
> +    }
> +
> +
> +class TestUbootTools(infra.basetest.BRTest):
> +    rootfs_overlay = \
> +        infra.filepath("tests/package/test_uboot_tools")
> +    config = f"""\
> +        BR2_aarch64=y
> +        BR2_cortex_a72=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_PER_PACKAGE_DIRECTORIES=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.17.8"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_UBOOT_TOOLS=y
> +        BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
> +        BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
> +        BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
> +        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
> +        """
> +
> +    def test_run(self):
> +        ramdisk = Path(self.builddir) / "images/rootfs.cpio"
> +        kernel = Path(self.builddir) / "images/Image"
> +        self.emulator.boot(
> +            arch="aarch64",
> +            kernel=str(kernel),
> +            options=["-M", "virt", "-cpu", "cortex-a72", "-initrd", str(ramdisk)])
> +        self.emulator.login()
> +
> +        self.assertRunOk(f"mkimage -f /{EXAMPLE_ITS.name} /tmp/test.fit")
> +
> +        cmd = "dumpimage -l /tmp/test.fit"
> +        out, exit_code = self.emulator.run(cmd, -1)
> +        self.assertEqual(
> +            exit_code,
> +            0,
> +            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
> +        )
> +        reported = get_hashes("\n".join(out))
> +        expected = calc_hashes(EXAMPLE_ITS.read_bytes())
> +        for h in expected:
> +            with self.subTest(hash=h):
> +                self.assertEqual(expected[h], reported[h])
> +        # Python does not have built-in CRC16 support, just check it is present
> +        self.assertIn("crc16-ccitt", reported)
> +
> +
> +class TestHostUbootTools(infra.basetest.BRHostPkgTest):
> +    hostpkgs = ["host-uboot-tools"]
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +        BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> +        """
> +
> +    def test_run(self):
> +        cmd = ["host/bin/mkimage", "-f", str(EXAMPLE_ITS), "test.fit"]
> +        infra.run_cmd_on_host(self.builddir, cmd)
> +
> +        cmd = ["host/bin/dumpimage", "-l", "test.fit"]
> +        reported = get_hashes(infra.run_cmd_on_host(self.builddir, cmd))
> +        expected = calc_hashes(EXAMPLE_ITS.read_bytes())
> +        for h in expected:
> +            with self.subTest(hash=h):
> +                self.assertEqual(expected[h], reported[h])
> +        # Python does not have built-in CRC16 support, just check it is present
> +        self.assertIn("crc16-ccitt", reported)
> diff --git a/support/testing/tests/package/test_uboot_tools/example.its b/support/testing/tests/package/test_uboot_tools/example.its
> new file mode 100644
> index 0000000000..24291b4e56
> --- /dev/null
> +++ b/support/testing/tests/package/test_uboot_tools/example.its
> @@ -0,0 +1,48 @@
> +/dts-v1/;
> +
> +/ {
> +    description = "Test FIT (build only)";
> +    #address-cells = <1>;
> +
> +    images {
> +        kernel {
> +            description = "This file, pretending to be kernel";
> +            data = /incbin/("example.its");
> +            type = "kernel";
> +            arch = "arm64";
> +            os = "linux";
> +            compression = "none";
> +            load = <0x40400000>;
> +            entry = <0x40400000>;
> +            hash-1 {
> +                algo = "crc16-ccitt";
> +            };
> +            hash-2 {
> +                algo = "crc32";
> +            };
> +            hash-3 {
> +                algo = "md5";
> +            };
> +            hash-4 {
> +                algo = "sha1";
> +            };
> +            hash-5 {
> +                algo = "sha256";
> +            };
> +            hash-6 {
> +                algo = "sha384";
> +            };
> +            hash-7 {
> +                algo = "sha512";
> +            };
> +        };
> +    };
> +
> +    configurations {
> +        default = "config-1";
> +        config-1 {
> +            description = "Test entry";
> +            kernel = "kernel";
> +        };
> +    };
> +};
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
