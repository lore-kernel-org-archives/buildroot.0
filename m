Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E2BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A887C402ED;
	Mon, 22 Jul 2024 08:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1SxPDQKHRLf; Mon, 22 Jul 2024 08:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E4C40324
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E4C40324;
	Mon, 22 Jul 2024 08:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1FA71BF29F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 826B9810B6
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8LyAqWh_r5k for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B588810EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B588810EA
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B588810EA
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:03:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3685afd0c56so188517f8f.1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635386; x=1722240186;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lINFXGBN9sUR4ZgKxCpy97/lZuV6gmp0d1jaFhT/bGo=;
 b=hr4FdJw3M1uCKL8h/2fLIEz5xXaYRdaew7XUI0QeZ5gdYmIn/On2Ar0/CzLZMRzeuT
 SlQ5TFWZqoWDNI2M7PGhpr/IAHdm6nDem2/A7nNaOusQewHrVkrYtes2YupZmNQ1l1ww
 FgMXEzLgAi1YK/eEwHZFhQSZnINmF2lKN06siH3+3m2jo9xIagzgEvHaG/Qhpg3tclIF
 AOYaTNG7KENga/vDlNDETxQP3VaHrLFVc/2NFAOQAZX/xzlCWv+3rF7OV9s40su20aeA
 ISlyny8GN8vYMsZxbwqgK08XsCfIhRvr/KEziKOHTwoWJfoOFIw+c0HhKrgqHm0j6lpn
 wucQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvU59+pX22LTnRd4AHwBsJvRkJV4vfjL6bL9jJc0boSORTJjIyvYWyciNMZ4uCXgv4y9CcrThp4LzCnxfQm26AtqhITqMMHQ==
X-Gm-Message-State: AOJu0Yy70LZn8XDjzXTM5Y5NDqSaFh+jOcRnYjc+JblV3kSnkfFC0h8l
 frakW2EH5BsozkGL9ZCW7vTi6zxlas6cm8Y2DGfH87SXJvNX4ENsWM86NcBGaNE=
X-Google-Smtp-Source: AGHT+IGFRZ2Qj6hXo7qzTvQ4fg42eBpfYhd2zM3tCPCHqnTAMmbbMp1rcTIOjO11TG8UgPMfW2pRaA==
X-Received: by 2002:a5d:6acd:0:b0:368:6633:c54d with SMTP id
 ffacd0b85a97d-369bae51fe7mr3727020f8f.35.1721635386103; 
 Mon, 22 Jul 2024 01:03:06 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ed580sm7732452f8f.112.2024.07.22.01.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:03:05 -0700 (PDT)
Message-ID: <efc45e24-775b-410c-ae34-87081ab4b2d0@mind.be>
Date: Mon, 22 Jul 2024 10:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240721205731.266149-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240721205731.266149-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635386; x=1722240186; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lINFXGBN9sUR4ZgKxCpy97/lZuV6gmp0d1jaFhT/bGo=;
 b=QR1HMlDp/BSu5Bg+l8smAuwFPYvqDoyFC4R+nE8MXGZye3ScFuxWL4Mc3QaCkRZ8AS
 kae2OjIN942REMkAO/sK+v3X9pMRxqbEE3Fc6E6GlUrSr4mZCtR9nv39mVcin2isLuY8
 +p2XOemQ40pD+fcAUbyt8wpRlyUv8hG3Avc+awukhliJthpPeBcrVpLIUsOcl0QOh5Cy
 +lp8AtlBs5Ci1B3ULJSH3H8sWDaCNAjH513Zv1hEeeKUi6N652yTUvEYMWBFhRe2RJYs
 kSh+kkqNzkKepAPNlmBIJieNlR5zQxa4++dfUHMofA2lqRHoyYnDqaPId+uzjIe6PIL4
 V9Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QR1HMlDp
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add nmap runtime test
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



On 21/07/2024 22:57, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                 |  1 +
>   support/testing/tests/package/test_nmap.py | 42 ++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 support/testing/tests/package/test_nmap.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 333e26d74e..60f6b740c7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1918,6 +1918,7 @@ F:	support/testing/tests/package/test_netsnmp/
>   F:	support/testing/tests/package/test_nftables.py
>   F:	support/testing/tests/package/test_nftables/
>   F:	support/testing/tests/package/test_ngrep.py
> +F:	support/testing/tests/package/test_nmap.py
>   F:	support/testing/tests/package/test_ntp.py
>   F:	support/testing/tests/package/test_ntp/
>   F:	support/testing/tests/package/test_numactl.py
> diff --git a/support/testing/tests/package/test_nmap.py b/support/testing/tests/package/test_nmap.py
> new file mode 100644
> index 0000000000..92b085ece9
> --- /dev/null
> +++ b/support/testing/tests/package/test_nmap.py
> @@ -0,0 +1,42 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestNmap(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +        BR2_PACKAGE_NMAP=y
> +        BR2_PACKAGE_NMAP_NCAT=y
> +        BR2_PACKAGE_NMAP_NMAP=y
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
> +        # Check the program can execute.
> +        self.assertRunOk("nmap --version")
> +
> +        # We open few ports, using the nmap netcat "nc" commands.
> +        ports = [21, 23, 25, 80]
> +        for port in ports:
> +            cmd = f"nc -l -p {port} </dev/null &>/dev/null &"
> +            self.assertRunOk(cmd)
> +
> +        time.sleep(1 * self.timeout_multiplier)
> +
> +        # We run a local port scan. We should see in the output the
> +        # ports we previously opened.
> +        out, ret = self.emulator.run("nmap -n -sS 127.0.0.1", timeout=20)
> +        self.assertEqual(ret, 0)
> +        nmap_out = "\n".join(out)
> +        for port in ports:
> +            self.assertRegex(nmap_out, f"{port}/tcp *open")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
