Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E2C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8E5810BE;
	Mon, 15 Jul 2024 14:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MNo772I1ohO; Mon, 15 Jul 2024 14:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5039810DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5039810DC;
	Mon, 15 Jul 2024 14:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 366881BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 225FF405F2
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5fMnPLbiiRX for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95BB8405E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BB8405E9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95BB8405E9
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:02:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-426636ef8c9so29129045e9.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721052123; x=1721656923;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7LXMoZRM0EdUZmUZdTzp8AyI8Wmi2HLUUQZ/d4NGLKA=;
 b=EzimvdaExPuh5dl8ctC+ds+QqNFvLlhiUlJ2tkZHgwOHSCNVaGkt3ngFvmqdjc8DRG
 TFJ3ZWMUskxIiV96keS4yY4l1fn0Xndj7KVuUd5pOkTZPedzvszuS1lFqhSsIc9kT5z7
 H9SiFRoe8S/yaH4pT+FbjUuLF+YUw+icD2gWb0KpTlqel61t41c5QcjdAW5bDSKTFfqS
 t6YNmBtJ76Ivcszh4nAqcGqArRA4cmdwCR6KgnI2IGVpiA81PA6rxcIANyJ8gjekzZ3D
 1/53Dvkbq8Y1RXbmha7HPeouf73b9La/HvlEKJrGjKQ7efFuDjZyg2gb8j33PNkFag1g
 uOWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKCbw2DZTVTzSiWaZefUfeyvq2vtxjeZvOOs85ay8DIvzaxOC7tRBwhStY5OFLAonKSvty+/lZ1fu3ejLWLd/oh9zmTOX7Vw==
X-Gm-Message-State: AOJu0Yxg6nP9VKv0hOGFO6vjcAF930tj3qz4vo9YCaaEB0ADEHBDQ2uG
 bLLiQaP6ntB3HBxgU6XINJziXNMDdjiur89R4oXPivGf00+lx1EENfqbMwZYAYQ=
X-Google-Smtp-Source: AGHT+IE7bfAYq5fk1YEOHZXg2c47S5lXCn5nTsKSZ4jfXKAWqVeK8f/VzaQZeiHSgdXspSzQ3uh22g==
X-Received: by 2002:a05:600c:4a99:b0:426:5de3:2ae5 with SMTP id
 5b1f17b1804b1-426707d8ae6mr141472535e9.10.1721052123266; 
 Mon, 15 Jul 2024 07:02:03 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccd68sm6483197f8f.63.2024.07.15.07.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:02:02 -0700 (PDT)
Message-ID: <7a2cae8e-dc23-497d-bf16-7a5afb5b5976@mind.be>
Date: Mon, 15 Jul 2024 11:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240714165527.2451312-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240714165527.2451312-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721052123; x=1721656923; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7LXMoZRM0EdUZmUZdTzp8AyI8Wmi2HLUUQZ/d4NGLKA=;
 b=XRYqxXfgKD4gs8Zxw9HUfc12fEJp9tt527PU6JYCIiuEnUAmGMDh/J5YYP5eRj/g7r
 vrMZNMLncLShNwNOSZo1A4v5J7u1EYXBdJPIV3K0rb1bKA6x8K6HCuWEKkRkcMPuRA22
 EvJKUuGlzR+pL9/VHH3MOuUlL5NnqGj2IzYmrxQmu/PXobW9tRRq3gDyWHkZBysjYYlq
 AvnS8XqgqyOgyyMvbIQR5JeT9sZrUkqdIGD06qSM6PdOH+eovT7PcwiFxKlvWyyWuQH5
 PE2scopY9d9mNEPy2XNnGtcYo6FB8mxs6EdKxUPoW0h2cDXOZUfSSoZwJpRezZkKaItv
 DmeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XRYqxXfg
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new dmidecode runtime
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



On 14/07/2024 18:55, Julien Olivain wrote:
> Note: this test was not working in Buildroot test infrastructure
> before commit [1] was merged, because dmidecode has the string "# "
> in its output.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |  1 +
>   .../testing/tests/package/test_dmidecode.py   | 67 +++++++++++++++++++
>   2 files changed, 68 insertions(+)
>   create mode 100644 support/testing/tests/package/test_dmidecode.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 466dcd4826..2190567246 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1831,6 +1831,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
>   F:	support/testing/tests/package/test_cryptsetup/
>   F:	support/testing/tests/package/test_ddrescue.py
>   F:	support/testing/tests/package/test_ddrescue/
> +F:	support/testing/tests/package/test_dmidecode.py
>   F:	support/testing/tests/package/test_dos2unix.py
>   F:	support/testing/tests/package/test_ed.py
>   F:	support/testing/tests/package/test_ethtool.py
> diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
> new file mode 100644
> index 0000000000..33c19f0d96
> --- /dev/null
> +++ b/support/testing/tests/package/test_dmidecode.py
> @@ -0,0 +1,67 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestDmidecode(infra.basetest.BRTest):
> +    # We use a x86_64 arch for this dmidecode test because aarch64
> +    # SMBIOS is not supported in non-UEFI use-cases (and using a UEFI
> +    # aarch64 would make the test longer).
> +    config = \
> +        """
> +        BR2_x86_64=y
> +        BR2_x86_corei7=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +        BR2_PACKAGE_DMIDECODE=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +
> +        # An arbitrary SMBIOS OEM string for the test
> +        oem_string = "Hello Buildroot SMBIOS"
> +
> +        kernel = os.path.join(self.builddir, "images", "bzImage")
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        self.emulator.boot(
> +            arch="x86_64",
> +            kernel=kernel,
> +            kernel_cmdline=["console=ttyS0"],
> +            options=["-cpu", "Nehalem", "-m", "256", "-initrd", cpio_file,
> +                     "-smbios", f"type=11,value={oem_string}"],
> +        )
> +        self.emulator.login()
> +
> +        # Check the program can run
> +        cmd = "dmidecode --version"
> +        self.assertRunOk(cmd)
> +
> +        # Check a simple invocation of "dmidecode"
> +        self.assertRunOk("dmidecode")
> +
> +        # Check a simple invocation of "biosdecode"
> +        self.assertRunOk("biosdecode")
> +
> +        # Check dmidecode detects SMBIOS
> +        cmd = "dmidecode | grep -E '^SMBIOS .* present\\.$'"
> +        self.assertRunOk(cmd)
> +
> +        # Check the system-manufacturer is QEMU
> +        cmd = "dmidecode -s system-manufacturer"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], "QEMU")
> +
> +        # Check we read back our OEM string
> +        cmd = "dmidecode --oem-string 1"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], oem_string)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
