Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09258C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C611740AFB;
	Sat, 31 May 2025 16:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bOXz89W3Ikd; Sat, 31 May 2025 16:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF29B40AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF29B40AED;
	Sat, 31 May 2025 16:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17AB5127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 095FF40AED
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yvXmKuzUx9F for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 198CC40AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 198CC40AE5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 198CC40AE5
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:51:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08E581C00BB; Sat, 31 May 2025 18:51:29 +0200 (CEST)
Message-ID: <7ee04275-333d-4627-88fc-716f7206c769@rnout.be>
Date: Sat, 31 May 2025 18:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240715173822.95475-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20240715173822.95475-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710289; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=G6B69D65v/OYwIU0/FG+YjxXs20FWgx0JCIHwDrRqi0=;
 b=dK+r/t9XTs7/+cusvOvZhyKpDWgfwkkL/ZL1eRz0D+NjGE2+Y83sNhGMHJAVVP/sJzl1rg
 yq+glrdtMuRvDYpSgSmPO0qNFti0be5M3en6L7NFiJV2K84/1i82XXrmch5ITS2w3C7dMa
 j0irRlzg2oFTb7MjWmEuQoptcS+ozhkGtIHyZ+4G76y2l6DA+roYzFBoQ+J3l93FkHpHe9
 lEIVjyiuhxhAN4bp8Ody1hZetSsbbwNhAFiMRXfefFvjwejkH72bW6iu1gqr33zg/UkLPk
 61WnQAo/bg7gqNZBYevZkrEyd7CN9J71OvDIEJl8EmnFlOWc4YnozfnqG9Atag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dK+r/t9X
Subject: Re: [Buildroot] [PATCH v2 1/1] support/testing: new dieharder
 runtime test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 19:38, Julien Olivain wrote:
> Note: this test was not working in Buildroot test infrastructure
> before commit [1] was merged, because dieharder has the string "# "
> in its output.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
> Included comments from Arnout:
> https://lists.buildroot.org/pipermail/buildroot/2024-July/758014.html
> - Removed a test case (the other two are sufficient)
> - Reworded comments to clarify that other test cases are expected
>    to always succeed/fail.
> ---
>   DEVELOPERS                                    |  1 +
>   .../testing/tests/package/test_dieharder.py   | 36 +++++++++++++++++++
>   2 files changed, 37 insertions(+)
>   create mode 100644 support/testing/tests/package/test_dieharder.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4a22b74779..7455a6e0c7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1839,6 +1839,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
>   F:	support/testing/tests/package/test_cryptsetup/
>   F:	support/testing/tests/package/test_ddrescue.py
>   F:	support/testing/tests/package/test_ddrescue/
> +F:	support/testing/tests/package/test_dieharder.py
>   F:	support/testing/tests/package/test_dmidecode.py
>   F:	support/testing/tests/package/test_dos2unix.py
>   F:	support/testing/tests/package/test_ed.py
> diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
> new file mode 100644
> index 0000000000..de09b383b4
> --- /dev/null
> +++ b/support/testing/tests/package/test_dieharder.py
> @@ -0,0 +1,36 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestDieharder(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_DIEHARDER=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check the program can run (by showing its version)
> +        self.assertRunOk("dieharder -V")
> +
> +        # The birthdays randomness test on the mt19937 random number
> +        # generator with 25 sample is expected to always succeed.
> +        cmd = "dieharder -g mt19937 -d diehard_birthdays -t 25"
> +        output, exit_code = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(exit_code, 0)
> +        self.assertIn("PASSED", '\n'.join(output))
> +
> +        # The birthdays randomness test on file /dev/zero is expected
> +        # to always fail.
> +        cmd = "dieharder -g file_input_raw -f /dev/zero -d diehard_birthdays -t 25"
> +        output, exit_code = self.emulator.run(cmd, timeout=40)
> +        self.assertEqual(exit_code, 0)
> +        self.assertIn("FAILED", '\n'.join(output))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
