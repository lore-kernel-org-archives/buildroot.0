Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE6D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05488402E2;
	Wed,  7 Jan 2026 17:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24sdUj-XoQaB; Wed,  7 Jan 2026 17:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C2A40238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808247;
	bh=t4KZejJkB+OpmJJjUSqI2iByEQa6Iceo4973i0+P6BI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qiOKypFIiZuhL8ckDP4F+hIWF/Y4a4cO9rdt48WJ5xAXFsKutItpDLNBVDrCRhz2n
	 NhZq/nBeN7pqb78pRaSFryAN/UyNgXg9eQPxO/9qjv/ZaLlHf29t+6PUIan9bV+NXK
	 Hsqb5Nv3VidNGKlzbrLG2miz9rMLoB36+38uZ3Ke6nKXFP9ZdGTIJ+Tqr2cqTiwEPh
	 F7vwhJIptu3zq4nHFyEWi9HaD6dO/4JR6GtEzqIGNjICBTlYUdhAV4nYThvvwJvxQl
	 3Khjm8Eu+senyAMSCXiKTwdwmNYJWYIhmpTzfqKQeUEre3eJTiJE4zsxMOx7/rrL0o
	 sy+AHK98dq6YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C2A40238;
	Wed,  7 Jan 2026 17:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F45325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9895D82387
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csch3Wm6adHs for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79E5F80E75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E5F80E75
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79E5F80E75
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3759B97A192; Wed,  7 Jan 2026 18:50:43 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:42 +0100
Message-ID: <20260107175042.226813-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221180810.3770181-1-ju.o@free.fr>
References: <20251221180810.3770181-1-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808243; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5lcmL8ypAtRkoMH2knCZNbO02Evm8h5fCHPO2+fUQVo=;
 b=U4QXSwyO01h5Rnl3XWNHKDaZpGgVmZqJ9zCNfhtjAGITrCebKSpOcmltE76ElDoFdWpxXX
 2SjEzN19RYN6QXtF2H2A61GBQxLHaxDjTHDG0uCk2YITbhG0q9KwaCaCklrJMeIkFf+ylW
 cnpJ4e/+grG/bmK6oJWC/Br6dVCVgzvJizW8yAnatU7obbI4tOxFNi2yn7S+Y/Fo//dpYc
 RvJKcrO6BGi8J4lcsyMZz7YL++rj13+FxDJFJ8bFFiwHHGIFiPntF6ZgYqmcy9GisorVAL
 MtqWYRqxu+JglWWufPwS6aeceY6adP2m2oPjhY2Aah3AEJ5o1JRzoiw5yEtu1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=U4QXSwyO
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: ltp-testsuite: replace
 runltp by kirk
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
> The run log of this ltp-testsuite test shows:
> 
>     INFO: runltp script is deprecated, try kirk
>     https://github.com/linux-test-project/kirk
> 
> This commit updates this test to replace this deprecated runltp
> shell script with the newer kirk Python script.
> 
> The logic of this runtime test remains the same: it runs a small number
> of 'read' system call tests, and checks there is no failures and at
> least one test succeed.
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12510635102
> ---
>  .../tests/package/test_ltp_testsuite.py       | 33 +++++++++++--------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
> index a85ceb35a6..6ff59b9700 100644
> --- a/support/testing/tests/package/test_ltp_testsuite.py
> +++ b/support/testing/tests/package/test_ltp_testsuite.py
> @@ -1,3 +1,4 @@
> +import json
>  import os
>  
>  import infra.basetest
> @@ -7,6 +8,7 @@ class TestLtpTestsuite(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
>          BR2_PACKAGE_LTP_TESTSUITE=y
> +        BR2_PACKAGE_PYTHON3=y
>          BR2_TARGET_ROOTFS_EXT2=y
>          BR2_TARGET_ROOTFS_EXT2_4=y
>          BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
> @@ -21,19 +23,24 @@ class TestLtpTestsuite(infra.basetest.BRTest):
>                             options=["-drive", f"file={drive},if=scsi,format=raw"])
>          self.emulator.login()
>  
> +        ltp_root = "/usr/lib/ltp-testsuite"
> +        report_file = "/tmp/ltp-report.json"
> +
>          # We run a reduced number of tests (read syscall tests) for a
> -        # fast execution. See "runltp --help" for option details.
> -        cmd = "/usr/lib/ltp-testsuite/runltp"
> -        cmd += " -p -q"
> -        cmd += " -s ^read0[0-9]*"
> -        cmd += " -l /tmp/ltp.log"
> -        cmd += " -o /tmp/ltp.output"
> -        cmd += " -C /tmp/ltp.failed"
> -        cmd += " -T /tmp/ltp.tconf"
> -        self.assertRunOk(cmd)
> +        # fast execution. See "kirk --help" for option details.
> +        cmd = f"LTPROOT={ltp_root}"
> +        cmd += f" {ltp_root}/kirk"
> +        cmd += " --sut host"
> +        cmd += " --framework ltp"
> +        cmd += " --run-suite syscalls"
> +        cmd += " --run-pattern '^read0[0-9]*'"
> +        cmd += f" --json-report {report_file}"
> +        self.assertRunOk(cmd, timeout=30)
>  
> -        # We print the LTP run log and check there was zero failure in
> -        # our test selection.
> -        out, ret = self.emulator.run("cat /tmp/ltp.log")
> +        # We print the LTP report and check there was at least one
> +        # passed test and zero failure in our selection.
> +        out, ret = self.emulator.run(f"cat {report_file} && echo")
>          self.assertEqual(ret, 0)
> -        self.assertIn("Total Failures: 0", out)
> +        report = json.loads("".join(out))
> +        self.assertEqual(report['stats']['failed'], 0)
> +        self.assertGreater(report['stats']['passed'], 0)
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
