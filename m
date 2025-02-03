Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458E3C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7521412F8;
	Mon,  3 Feb 2025 11:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcC0_0CYoStk; Mon,  3 Feb 2025 11:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4CEA409F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CEA409F1;
	Mon,  3 Feb 2025 11:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F334B12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFE5E6085E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqEOGCUVt7oS for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD4B260811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4B260811
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD4B260811
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:48:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso29132795e9.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 03:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738583330; x=1739188130;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hWUegT06zr2bDSP5iw9L2jXErPttjwDWeYl60sIU8K4=;
 b=Bt4CHQhEn8noyveyr39oU+W6V3LafamkB/J85slAxHCbqIC17/NeR449Ggtp8zl/FD
 0N1giOeAoLGSEkAAcU/6D3vom3RL6ILUk75Ejy2cXfJ6EKDQCd2YNYtbRysv/vvw2Yhw
 Ac37sQSZl8DwJ1GyQ/6+klatQvHCL6MviwiGIKyCihmWh0iFARh+vLmrbsUY+XUeDyir
 LwKcbee00BmxrgIzz1yNvnt+QVY9C09S9kTz0DjNqbLLvDG1uEr+vmkvF/69y/rUfG+q
 BLd1LM1iDmp0L3sfHozFI29ldmOLIHruH0mUuj+B8v0vTiOavd7jWJjaqVv4sZ2A3euB
 joAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+G7hJ8tgMhMBbde0d9gWL+97bXWTM9uoyYHahObC/v9xp78cQosTPbBy3haw9TBwmXDPPH/2qV0E=@buildroot.org
X-Gm-Message-State: AOJu0YweAfA/IINKms8QxhDeFclzXQngU9Buqr2mzDaSR0lqW2uKKu1O
 LYRvexcIG4ts/pmmC8y5nnlrjRgPe0+7NDjkVQgWonKT1iGzXF2i1USnAAkRCkbVKtBns1JKhGw
 g
X-Gm-Gg: ASbGncurQauVGnexOuvaYFGmVSaZN3s3ODtN+eC9Q553BafmYLiFh9qgznZdKVCMjvM
 NQwZ9aklTeZMzN6SJ4lgJh3U7TD0ibcWJdu9vd8KGWJ5LrnsT3pxP34nTpoWLY+D9RpRPDSPBVv
 tvbtKMquG7kU1bm7v+RjUfPR7j8YZ0ts0lnMfxNsSbMAgC9MJYouVTR86XmqRlyOp68/2m5pq/F
 qvY22O10SOtl85iLi7hHFMQvAY1Bg0CdEdNqGyu8QBBL2wQTg1AFvdD2tyH3XtfLIU8dVVcIpim
 7oIJHR8f3aziHH9tzFP8qzmBYFv9QKHt5HoIFLZEMZD8mN4=
X-Google-Smtp-Source: AGHT+IEEi4QEOaiNb5yK6uINhATYxsevAqg2Ia5GRVGVkGBPbVe5dNwZm74A91rB5lAHmbFQ/KTrrg==
X-Received: by 2002:a05:600c:4704:b0:431:54d9:da57 with SMTP id
 5b1f17b1804b1-438dc42a445mr198513805e9.30.1738583329586; 
 Mon, 03 Feb 2025 03:48:49 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81a39sm185189875e9.35.2025.02.03.03.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 03:48:49 -0800 (PST)
Message-ID: <629727e9-e906-4319-81b7-3ffc6032bdf1@mind.be>
Date: Mon, 3 Feb 2025 12:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241115224753.1074295-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20241115224753.1074295-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738583330; x=1739188130; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hWUegT06zr2bDSP5iw9L2jXErPttjwDWeYl60sIU8K4=;
 b=g5lB7WZjQ69wmpjioVeuWomn5fEuGYHxb8I/xpiGUUKCTqA9dKhzUBr0d1bxTbXg7c
 QbwFHjEcYiSCMeUg6QUFTyaCdK7yyQwKSRqaeb15JveN8r/A3LutwIUyiO8og+AxcRIc
 /s/l34vFM22IeqEH5Go+7351rKMvEW0WpSwxoPx+JKaroC9DmsRseuczZQYVOMduMq7I
 vUa4ajcN1esmaiDj2SOhleLuIQf14eMVwUHyIX4JqwAyHagMKLa4qZlt0odkDiTdHhiD
 us1xRHQWhyWLOVohQEGjen8BxMTxXCwSTdWjyPN10XoS6MiGfeQPrUcZWZH6SQ+l5V7u
 0yOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g5lB7WZj
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/11/2024 23:47, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8388435290
> ---
>   DEVELOPERS                                    |  1 +
>   .../tests/package/test_ltp_testsuite.py       | 39 +++++++++++++++++++
>   2 files changed, 40 insertions(+)
>   create mode 100644 support/testing/tests/package/test_ltp_testsuite.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3945803d53..1ff269b362 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1931,6 +1931,7 @@ F:	support/testing/tests/package/test_links.py
>   F:	support/testing/tests/package/test_links/
>   F:	support/testing/tests/package/test_lrzip.py
>   F:	support/testing/tests/package/test_lrzsz.py
> +F:	support/testing/tests/package/test_ltp_testsuite.py
>   F:	support/testing/tests/package/test_ltrace.py
>   F:	support/testing/tests/package/test_lvm2.py
>   F:	support/testing/tests/package/test_lzip.py
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
