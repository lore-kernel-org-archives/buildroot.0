Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB10C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 22:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA74B80BFB;
	Fri, 31 Jan 2025 22:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfEFA_WLBqTM; Fri, 31 Jan 2025 22:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E319684A13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E319684A13;
	Fri, 31 Jan 2025 22:36:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E62F317D
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 22:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2EBC4144E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 22:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1q36L5AFyfg for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 22:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FBAC41438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FBAC41438
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FBAC41438
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 22:36:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso18405535e9.1
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 14:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738362986; x=1738967786;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svuCxJWHK5+L3NzTE6TOCjQQphs7Ln+l9rbvVCKtXoQ=;
 b=mlfnO2fCSh/c9CwT9H6iWYuD47SNqoYMMSmNUEn3AVVkN6cwGA/21c6GyGZ5xL/4kn
 dv42xnWJHY5mR9f7DUV21cT8BuHsDsm7EfHC25g72J11KNc+KUiBRDUg/PCuh94NqFlg
 rB95WldSaqMQvM1ApO6LiT85y8ibXqW6J3HoCbW7qcGNlpupMCd6dQ2EXGc25HrxJmpI
 pdfP/cQmZeQ1G5uknpB9V9jpPZTr/b0u83zmUwq60X0g3/aJfzAxjbInUcgfwtNtj2rB
 skMfLQwVzr4Vt4KPRnW0OKYSaT8Mne7UtVQTiDWqpET4rPXtNSVuMYmnYevrK5LaGzby
 ak0A==
X-Gm-Message-State: AOJu0Yz8sqD+Ke049y6NrrLEmWcnlBKzKjcStsPB78pibY4OTLrV70gp
 eefN4RwL1pa4X1b15T+CQbynvocUDE2jOQmv32QgSsMdRoKGA32oGBw+pQ==
X-Gm-Gg: ASbGncvLh9dLkeozoGhreFvQxRP58LqdQUo0l2368VUBlBo6UdPiZ+HunHBZo9kGAX4
 jr/nOWIjafd3W3MwIuri+2m7Fa1pSmWV5UB7JI7hMlP4UvFtbFsgieO2GRbL9yGKL2a8SPL4GZU
 /IbkQDh4m3y/PfbvUqQ0+Vs0Qn7mo45PtuxRRA5Wg34bt8L6sCaRu2h3px8u98w0K1D6HhTjRpK
 92h94yhlE1dUlPg/D4ZmaspAF1cB+HCPyUPeVvp+4waG5cujZL4jkxvlqFpsXTFh2jxIhgvvrbv
 0uVaqmRHEozRieoawL6A
X-Google-Smtp-Source: AGHT+IEHzfh5GsJmyq43Cac7JCLAVM9ELUt2G++rDMokMMA91kN8AfrFOOV3mFuV0+C9rSMBZsMPkg==
X-Received: by 2002:a05:600c:1554:b0:436:faf1:9da with SMTP id
 5b1f17b1804b1-438dc3a3f9emr122181455e9.2.1738362983950; 
 Fri, 31 Jan 2025 14:36:23 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2ef08sm104868275e9.22.2025.01.31.14.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 14:36:22 -0800 (PST)
Date: Fri, 31 Jan 2025 23:36:20 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250131223620.GA1139889@pevik>
References: <20241115224753.1074295-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241115224753.1074295-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738362986; x=1738967786; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svuCxJWHK5+L3NzTE6TOCjQQphs7Ln+l9rbvVCKtXoQ=;
 b=ZG8jEpHWdksNabkwlGYbvrZH8lb7KL/BkHbTWutq7qeSqo1ea6ju1P+NpTeu/Ch7lR
 JtTHhB0GUWaDzNtOWqo+c0082Pcvs3ZvxUOuaZw514PyAX/gXBy8LTqlKNX77XiZG5Cp
 cvV7jb2r+W+m5IL+DTFn+XcoHRAnkysuGhkNIhJGjZ43qqd1JpfjiH65krJ02BZLWSrT
 s7cZhVNS8jF+LZLy0xpnH9Ahf0ulHpI531WzIYRsJk1Oo0BT2kIRe4FVHSz3YYzwoGJr
 ZVe4qYEOyGS1zwVXyJyDlf0/kIcZdOUGAog7PmZkF9Kl1TTxLDq3K5Jl+MN9HBqQZw35
 WAzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZG8jEpHW
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new ltp-testsuite
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8388435290
> ---
>  DEVELOPERS                                    |  1 +
>  .../tests/package/test_ltp_testsuite.py       | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 support/testing/tests/package/test_ltp_testsuite.py

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3945803d53..1ff269b362 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1931,6 +1931,7 @@ F:	support/testing/tests/package/test_links.py
>  F:	support/testing/tests/package/test_links/
>  F:	support/testing/tests/package/test_lrzip.py
>  F:	support/testing/tests/package/test_lrzsz.py
> +F:	support/testing/tests/package/test_ltp_testsuite.py
>  F:	support/testing/tests/package/test_ltrace.py
>  F:	support/testing/tests/package/test_lvm2.py
>  F:	support/testing/tests/package/test_lzip.py
> diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
> new file mode 100644
> index 0000000000..a85ceb35a6
> --- /dev/null
> +++ b/support/testing/tests/package/test_ltp_testsuite.py
> @@ -0,0 +1,39 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestLtpTestsuite(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_LTP_TESTSUITE=y

Thanks a lot for taking care about LTP. Feel free to Cc me on LTP related
patches and issues.

> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           kernel_cmdline=["rootwait", "root=/dev/sda"],
> +                           options=["-drive", f"file={drive},if=scsi,format=raw"])
> +        self.emulator.login()
> +
> +        # We run a reduced number of tests (read syscall tests) for a
> +        # fast execution. See "runltp --help" for option details.
> +        cmd = "/usr/lib/ltp-testsuite/runltp"
> +        cmd += " -p -q"
> +        cmd += " -s ^read0[0-9]*"
> +        cmd += " -l /tmp/ltp.log"
> +        cmd += " -o /tmp/ltp.output"
> +        cmd += " -C /tmp/ltp.failed"
> +        cmd += " -T /tmp/ltp.tconf"

While this above is OK, some notes:

1) Many LTP tests require LTPROOT environment variable (to access some data files),
e.g.:

export LTPROOT="/usr/lib/ltp-testsuite"

See https://linux-test-project.readthedocs.io/en/latest/users/setup_tests.html

It looks to me that infra.emulator.Emulator does not support inserting
environment variables via os.environ.

2) runltp old script has been deprecated, kirk is the replacement:

https://github.com/linux-test-project/kirk

Currently kirk supports few testing frameworks: LTP, kselftests and liburing.

While kirk can be run o SUT (like runltp), the best usage is to run it on the
host. It supports testing via starting QEMU VM, SSH and not yet stable LTX
backend.

Due the above I'd like to add kirk host package to Buildroot.

Kind regards,
Petr


> +        self.assertRunOk(cmd)
> +
> +        # We print the LTP run log and check there was zero failure in
> +        # our test selection.
> +        out, ret = self.emulator.run("cat /tmp/ltp.log")
> +        self.assertEqual(ret, 0)
> +        self.assertIn("Total Failures: 0", out)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
