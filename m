Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E70DC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E3B08118D;
	Mon, 15 Jul 2024 09:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUCHKHGCkdr4; Mon, 15 Jul 2024 09:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2019E811BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2019E811BA;
	Mon, 15 Jul 2024 09:17:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE931BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A5B6811BA
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZUV2-5hCkT0 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 328748118D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 328748118D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 328748118D
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:17:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so563472f8f.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 02:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721035066; x=1721639866;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C50OyMDl2W/XWDB5luOjjHQgYdIilECew4N8N/JkMLI=;
 b=rJ82yuEHqfICfqAfEN1t4E9IpclPoUh1Fzy7qYGNpYz5ZenBryfq/rqnOl0cDYYFhV
 LF0Fj8kYbuXbsJhKhXxJ6tek9XsqOBrFgFYufLLWng+Yz4MCokzUB9z8Bsk2GmMz9H3B
 QqSmOFvGLrIp+2oLlU+TA6+sAwdLD9CK6avsnbob1G9PjhEHN5z8GiO+zmghKBjAh5mn
 WphMfz0chEH3W0LyBn79bQYHA+YgFvMF2y9/uKPnNb/N82JkCpquZYs68PN7C9W/iZd/
 9ToRjhE7GyrQrIUD/MHpsyGmD08hdhA1d58XcZ1ZAhKGhV5beC95lqUNzi0+jpuCfomS
 YN+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW68hZufrxcZP6DcmkXk/fvT8qcaQ+PI2wFdFm39ZsymgRbJqluwLN+5xJ5q6DlpdakjA43PuTdbEBP3y9eg4nFDupwX4x1og==
X-Gm-Message-State: AOJu0Yyv6a5+5677ND8oCCQp4q2V54YRTnMSHi8gTbIaei584h90mW2A
 lPSj1QS8sqA10/0C4BMqO3wvW/QMoPSQnknpzgvqCscitK1pUuCgFT/GrXDQCng=
X-Google-Smtp-Source: AGHT+IG9XBI/pni+aO2VSCGf7sbJN+q9tYX1aveRLkbUey/4Gv42Fclr0OCL1jHXDNz/lOpDx72HNg==
X-Received: by 2002:a05:6000:d82:b0:367:96c5:ae70 with SMTP id
 ffacd0b85a97d-367cea91ff7mr11271861f8f.31.1721035065967; 
 Mon, 15 Jul 2024 02:17:45 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cd1sm5788637f8f.22.2024.07.15.02.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:17:45 -0700 (PDT)
Message-ID: <7e17b6b0-0414-4127-8107-560bfe14ce60@mind.be>
Date: Mon, 15 Jul 2024 11:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240714170550.2527918-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240714170550.2527918-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721035066; x=1721639866; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C50OyMDl2W/XWDB5luOjjHQgYdIilECew4N8N/JkMLI=;
 b=OA7rzWLiQvLiWF4jsGDPto9j+zMIIsbZ0BGIt2LHvptU8G8s+CuhFag6rddYHK+XnK
 WOyuhjGEuCR5YAopx3A39++oKFisxGY7J/8gcWxyOELI5eTPTjdjKdvU/tlzSFc5kE63
 b5y17ZKq9+ufW8gNfFhhfkTuyVhMtuwhjxIGplpj4OVpQudfqZF5aQpMMnV8/CbT/NYT
 no2tbFwCaw2lA6orBHEhuK0gDJnb7iaUMUTBgLP2Dl3MzZGvEjr9l75t+006R+KEpveU
 GbSrFQMYqYqT8wKXy5O2ktu19tnkJJ2pvp9uPDjOAPYbCYNV9XEty0rnANwAwhsSwL3W
 /Dow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OA7rzWLi
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new dieharder runtime
 test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/07/2024 19:05, Julien Olivain wrote:
> Note: this test was not working in Buildroot test infrastructure
> before commit [1] was merged, because dieharder has the string "# "
> in its output.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   DEVELOPERS                                    |  1 +
>   .../testing/tests/package/test_dieharder.py   | 40 +++++++++++++++++++
>   2 files changed, 41 insertions(+)
>   create mode 100644 support/testing/tests/package/test_dieharder.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e3804db1cd..83c60405e0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1832,6 +1832,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
>   F:	support/testing/tests/package/test_cryptsetup/
>   F:	support/testing/tests/package/test_ddrescue.py
>   F:	support/testing/tests/package/test_ddrescue/
> +F:	support/testing/tests/package/test_dieharder.py
>   F:	support/testing/tests/package/test_dos2unix.py
>   F:	support/testing/tests/package/test_ed.py
>   F:	support/testing/tests/package/test_ethtool.py
> diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
> new file mode 100644
> index 0000000000..d324a34557
> --- /dev/null
> +++ b/support/testing/tests/package/test_dieharder.py
> @@ -0,0 +1,40 @@
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
> +        # The birthdays test on small number (1) of sample is expected to fail
> +        cmd = "dieharder -g /dev/urandom -d diehard_birthdays -t 1"

  Are we actually sure that this will always fail, regardless of the random 
numbers that are generated? Isn't there a chance (like 1 in 64K or something) 
that it succeeds?

  If it's not entirely certain, then I think we can simply remove this test. The 
other tests are sufficient IMHO. The only thing we want to know in the end is if 
dieharder is compiled correctly, and just one failing and one succeeding test 
should be more than enough for that.

  Regards,
  Arnout

> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertIn("FAILED", '\n'.join(output))
> +
> +        # The birthdays test on higher number (25) of sample is expected to succeed
> +        cmd = "dieharder -g mt19937 -d diehard_birthdays -t 25"
> +        output, exit_code = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(exit_code, 0)
> +        self.assertIn("PASSED", '\n'.join(output))
> +
> +        # The birthdays test on file /dev/zero is expected to fail
> +        cmd = "dieharder -g file_input_raw -f /dev/zero -d diehard_birthdays -t 25"
> +        output, exit_code = self.emulator.run(cmd, timeout=40)
> +        self.assertEqual(exit_code, 0)
> +        self.assertIn("FAILED", '\n'.join(output))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
