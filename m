Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6D6E6FE51
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 00:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9388540A35;
	Wed, 24 Dec 2025 00:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZQt8pl0_Z-R; Wed, 24 Dec 2025 00:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7144E40A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766535302;
	bh=rCRpBrb9Rocu6wuBECXEITALOO/OdHMriOWxIkMQGf4=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=mj2zPajNcs7wP8Idy+VlBO/22QS1zc6Zxn3uwl8WAATYpuGpiqJRHGSKBM0+k6+mI
	 5YYofRcV/xhidj2tZF1pCIUkJktQklDqwLlGcmFD5yxK4X9j9lkKY+RHYGwyMGxHjP
	 gGoC0SalFC0SJZCFt1PLEO+Ttur6jILtrkpLvGNtelCdM0Ptvf6ZYEeyAaBuAbXOiq
	 AAcspX+cyFzD88PPUbBa3dvbXKTajkOwsA1JTbp+AKA8A9fa32Cc2QjEkvFffpMKQk
	 MCvAHgi9zITBLmndeUL4+w8JBcrN6+XGHmPQ0zHG0oCttyoUPRKHUSH5zM07mVjE5h
	 d/0p6EgME2YOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7144E40A34;
	Wed, 24 Dec 2025 00:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3235ABE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 00:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23C79824EE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 00:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKiocZd10zgP for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 00:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A48F823FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A48F823FB
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A48F823FB
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 00:14:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so31394135e9.3
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 16:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766535298; x=1767140098;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rFKQS2+3rFPRgO3YBgd+4FptAj5tttGkwFaalGXIieE=;
 b=WmRxFC+HXQd/bKF90b4b01W5ZQN5JXiZtFe9o8/ZKLsqLokQf2ul8bAdXW5Qe5n9pJ
 7Xudsii6I4rb4A1s3pnYw837GNEWROlu7myWvQR1Prm+ZMwQys+FWntIx+uUgEsUmxSS
 hVcWRilbwDK4n+RIxDJ2fs6/SyHDpVzsHc1qfEZHjwHRc3KTdzVCMI120tfZkp7mQU60
 KLDfhmVfX3gWB7GB+us/mGXXSKcIbnVuCImrDWanabhFjyUemmESykwDSxVmld+KGmoM
 YVZGJn0fAMI0T/lO60xnsQS269EcsuTFS9cLzYg602Da7bEHNrsXkNA3RCOrC+r2uizy
 2nGA==
X-Gm-Message-State: AOJu0Yzmzb8YUQzFC+h0p9rbrIChiiXtnlyaNbb+i/4mOb5KfAFVhI9I
 /7DhEuQs50CAPmbj6RRfJQfCKNYj7ugZ9juRI3bNBwcLb+cOZ8BLSBdO
X-Gm-Gg: AY/fxX4rGypoV0OLZggv4KSoVu1tDL8QnvUsCYpTf0TEjX7TNJcwXTMc4tTvkR+pAft
 XJjom7nWU3qAuFfNZt1fBbwGecW0NFzeGblknx93RztKyRY/2icUT5IGGqcWrtixPc80J/ym0cK
 Uv7jli38w1U729ucwRdxlRO++Y8U7ylvfnmSwnyc+7UOCkK43giM7eDERzqGZy3vtErRZU3in0q
 I/kP/aBz1u3vi6ZFbSNxXVg09YkCK8aJZY+vZcQjXJNyYwcSvddKUWip20lYOm5bVjt5KAUliTv
 mRe3zZy8LoZ9CjftrkK1fjtqcqe/OLFfpCUqQ3/ausmnjSPGTmnkAt+z33ZC+AN5r+8PWKse0J6
 TmkpfYEBrRlI2fa3nHm53UFJkyx5mi52tg8ONF+JWBJAMZOPQfjjNZWbuF5fCww3KlZrk4eY2bv
 OtG+H2Mr28lc39zhJ2G7EOqZUQjcCz72L08vexb2nBRKr9FcH1
X-Google-Smtp-Source: AGHT+IHNa//7lgGuctYav5ZFraoLwG/ZdX1ypZXGhOspI9vpHf9og47GYaCCp9oiR0AqRWggVE2jrg==
X-Received: by 2002:a05:600c:458f:b0:46f:b32e:5094 with SMTP id
 5b1f17b1804b1-47d19592a3dmr150786845e9.32.1766535297569; 
 Tue, 23 Dec 2025 16:14:57 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be279c5f8sm302161895e9.9.2025.12.23.16.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 16:14:57 -0800 (PST)
Date: Wed, 24 Dec 2025 01:14:55 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20251224001455.GB161937@pevik>
References: <20251221180810.3770181-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251221180810.3770181-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766535298; x=1767140098; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFKQS2+3rFPRgO3YBgd+4FptAj5tttGkwFaalGXIieE=;
 b=UpEUHDjK5N9mPmVb8gc7uPkFVwoZ8nGbVy+j/QJhUpBbuT6W+Vtz2xFNgk4y7XyRAx
 hi6BrjQQwbu/LVFT1YTQbYx54zvhGIUgmEBBefaUa/csgSKEeuU9/FyW7Ec3DVbuxYsU
 I+2PdHPCpxgoM/2mkaO4YD7149VqSlZl+NaBO23YFE7DWfOyY6E6zBC6knFOowLgjJKJ
 xfk3+SgcpREN7/ypcySJIe8VKWSUP381WHCemfYtquQ5PBFNXZdOrtpY91kKuom2RJlm
 jAlZX0Z3/0e25sjr/NVd6uGhqAoqMDlJ52/3IuwnvyPEblpsNyHR7bWDXPg3plee/mGl
 9+MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UpEUHDjK
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

> The run log of this ltp-testsuite test shows:

>     INFO: runltp script is deprecated, try kirk
>     https://github.com/linux-test-project/kirk

> This commit updates this test to replace this deprecated runltp
> shell script with the newer kirk Python script.

> The logic of this runtime test remains the same: it runs a small number
> of 'read' system call tests, and checks there is no failures and at
> least one test succeed.

Acked-by: Petr Vorel <petr.vorel@gmail.com>

Although this looks to be sufficient for running kirk on SUT (the tested
system), kirk is meant to be run from host (talk: [1], we don't have it
documented nor in kirk nor in LTP, there are just fragments of the discussions
on ML: [2] [3] [4] [5]). In short reliable kernel testing requires test to be
executed outside of the host (some tests influence SUT a lot).

Therefore kirk can connect to SUT via ssh, run qcow image via QEMU [6], or
experimental LTX protocol [7] [2] [3].

Due that I was thinking to create kirk and ltx Buildroot host packages.

Kind regards,
Petr

[1] https://www.youtube.com/watch?v=T1ImuNr9Oxo
[2] https://lore.kernel.org/ltp/ZmM25L0EmJufsS-f@yuki/
[3] https://lore.kernel.org/ltp/ZmbFyjuXndeXCLp8@rei/
[4] https://lore.kernel.org/ltp/ZmMrBnkIXKfrF8Xv@yuki/
[5] https://lore.kernel.org/ltp/ZmM5y3a4xNCsRTT-@yuki/
[6] https://kirk.readthedocs.io/en/latest/users/quickstart.html
[7] https://github.com/linux-test-project/ltx

> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12510635102
> ---
>  .../tests/package/test_ltp_testsuite.py       | 33 +++++++++++--------
>  1 file changed, 20 insertions(+), 13 deletions(-)

> diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
> index a85ceb35a6..6ff59b9700 100644
> --- a/support/testing/tests/package/test_ltp_testsuite.py
> +++ b/support/testing/tests/package/test_ltp_testsuite.py
> @@ -1,3 +1,4 @@
> +import json
>  import os

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
