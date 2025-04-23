Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ABCC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A61460617;
	Wed, 23 Apr 2025 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IknlbbOxcPk4; Wed, 23 Apr 2025 19:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9792A60625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9792A60625;
	Wed, 23 Apr 2025 19:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 060621BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB84B40DD3
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wynTE0uVfVV7 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1E5840C4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E5840C4D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1E5840C4D
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:30:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1EFEB13F8AD;
 Wed, 23 Apr 2025 21:30:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 21:30:36 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 21:30:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
References: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <c9ae19bbafb52e031db812448725f3ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745436637;
 bh=hDNeuKeqdWpLCLsFPKapL9wlzeLLL3uFPCDshClv+/o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SuAPEp43oU9RD0TfhS8HCfoD2XYuRb6Cfbu0ZUqZitKtzMauikCardG7yC5hVEfiB
 CP6W9JGRy+jIt+07UMhxUMkL4YsyQGVUdUoerQaVl6n1x5KcYoqWEZBDNW1nzTwBZ0
 qwMeKnJ3Rg0obn0WXTpdDERAXX1sCh5JiNBhzXW/8rzs3YiJIP506TVPXXoQ1PlCnm
 AGpQXbTPG8rbVQikSOECURpfEt4iT5EWUqAfRmGcpCVK4kHAE13je+ozT894N9J5Hl
 n71QcI5NmtUx+2L8YiLq+BJ/LUtDhBeu4NBp6H3I49RIU3DVz5jwWFiD4PcP3ODtd8
 d/29Zs2ukzvbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SuAPEp43
Subject: Re: [Buildroot] [PATCH 1/2] support/test: new dust runtime test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi El Mehdi,

Thanks for the patch!

On 22/04/2025 16:55, El Mehdi YOUNES via buildroot wrote:
> Add a runtime test for the 'dust' package to verify that the binary
> executes correctly in a minimal buildroot rootfs. The test checks that:
> - 'dust --version' runs without error
> - 'dust' can analyze a directory structure with files
> - The output includes the expected directory names
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  support/testing/tests/package/test_dust.py | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 support/testing/tests/package/test_dust.py
> 
> diff --git a/support/testing/tests/package/test_dust.py 
> b/support/testing/tests/package/test_dust.py
> new file mode 100644
> index 0000000000..85c05934e5
> --- /dev/null
> +++ b/support/testing/tests/package/test_dust.py
> @@ -0,0 +1,31 @@
> +import os
> +import infra.basetest
> +
> +
> +class TestDust(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_DUST=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", 
> "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check that dust is installed and can be executed
> +        self.assertRunOk("dust --version")
> +
> +        # Create a test directory structure with some files
> +        self.assertRunOk("mkdir -p testdir/subdir")
> +        self.assertRunOk("dd if=/dev/zero of=testdir/a bs=1K 
> count=10")
> +        self.assertRunOk("dd if=/dev/zero of=testdir/subdir/b bs=1K 
> count=5")
> +
> +        # Run dust on the test directory and capture the output
> +        output = self.emulator.run("dust testdir", timeout=10)

I have the same comment as in the "bat" runtime test.

The emultor.run() function returns a tuple (output, exit_code). See [1].

Could you:
1. get the output array and the return code in separate variables
   (in your patch output[1] is in fact the error code which is
    not checked)
2. check the return code is a success (before checking the
    output content)
3. join the output string with a new-line, e.g. "\n".join(output)
    to have a string that will better look like to the actual
    output.

See for example [2].

I already applied the second patch of this series, so you can
simply send a v2 of this runtime test.

> +        self.assertIn("testdir", ' '.join(output[0]))
> +        self.assertIn("subdir", ' '.join(output[0]))

[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.1/support/testing/infra/emulator.py#L187
[2] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.1/support/testing/tests/package/test_attr.py#L62
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
