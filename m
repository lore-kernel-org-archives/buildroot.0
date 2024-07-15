Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8A7C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4710480E84;
	Mon, 15 Jul 2024 09:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWp_29Yg3vU0; Mon, 15 Jul 2024 09:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E09980C83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E09980C83;
	Mon, 15 Jul 2024 09:22:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18BED1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0554A40585
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHDqv3On1rLH for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D28140500
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D28140500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D28140500
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:22:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3679f806223so2970754f8f.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 02:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721035318; x=1721640118;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JAlZiFxZ60u1eN9Sm7eegqQGpLlAwLU3CHL1ar8T1Q0=;
 b=naCnp/LZQEtvShUmn/TLuUxnsUG7veUG3p/HPk1/aNErHrrztSYmCU3IOp1+unOmwO
 kwQCKWWpCUvnxcY/8k5JO3ED2z5QY8vviMaSZBARvV0nZQa5qwQ67/CccI5Gd7GvmW/f
 bljR6sa8aYpQD764lr+PZ84VkSaaAbCTAeC/+AEFddHJ4MFksoMOfMt9dY/V1JEuv+Uv
 rRXgNW7CaEOGOPvYL/SqT9RuSfH2EV+uLsJMJdv/UpbTuu0K/ypEK91Pni5hEHbR7RqT
 K3v7/5Sn4k7+QMejC9uA5rR7qAw2hC/5WCjgrafILyCOGf8azmR4pUu+4UBgS9i6Ydlb
 h3uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pjwhH1f9z3Da02OpVeTz7Yupfva7Uh+AyzeGRy33XOOXB0hfTREJa2OXTzqq0xZKdfqPAGwSb9np9lvqLKikezoa4sP3SQ==
X-Gm-Message-State: AOJu0Yz/fXp+69T/si0cy4FPXpaApowTTNUSZem8Xvc0Gq2w+lWzjyZ3
 3I4FBrCIeurYnQEAQbTqeckdXC3VsVzjO4Sb+e7ufqyabEGEkaULx7fkaU91oDg=
X-Google-Smtp-Source: AGHT+IExqKWqamMuct2cd9SuvSecbORccNZNYkYCvadDOjSJPXBmBG+xS0TcjCWy/pgC338muvb2Aw==
X-Received: by 2002:a5d:480c:0:b0:362:ff95:5697 with SMTP id
 ffacd0b85a97d-367ff70cc30mr6572203f8f.28.1721035318391; 
 Mon, 15 Jul 2024 02:21:58 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e9a809sm78657085e9.28.2024.07.15.02.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:21:58 -0700 (PDT)
Message-ID: <cb3cf06f-3635-443a-946e-533a6ad46221@mind.be>
Date: Mon, 15 Jul 2024 11:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240714213530.497428-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240714213530.497428-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721035318; x=1721640118; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JAlZiFxZ60u1eN9Sm7eegqQGpLlAwLU3CHL1ar8T1Q0=;
 b=UDMdL2RasTb13zb/mDJIv9zXLa6xfTWoaEyHFW2I8Ef8oivoT13czJcmID6YBx3Pet
 Ac+VPdC0k0bT/9FPLlOUSXu48PYiH8pv8CSom/1Yamhver4DciV1HSSHRBYfzFCdx/ic
 EwcyCihAWN6CVHoVyWJ2KsrZjVr/ZJs4yURR130j9bWqYwsKwH3R28Shw4lQYryzFJj5
 ujQAqdSlO7ydxR4OILb73gDJXboHNPnWpV9J8jfKrR75Qfd59lKdS8Vvax2/1GUnAuhK
 cVEGLXVZJlmj+xcRRvErOQHaV08mUhLb+Uf/OS7fgilEa3WULrQWD49l+9bxldEZu2ew
 wR1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UDMdL2Ra
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fs: new btrfs runtime
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



On 14/07/2024 23:35, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> For reference, this test was proposed in:
> https://lists.buildroot.org/pipermail/buildroot/2024-July/757853.html
> ---
>   DEVELOPERS                                    |  2 +
>   support/testing/tests/fs/test_btrfs.py        | 56 +++++++++++++++++++
>   .../tests/fs/test_btrfs/linux-btrfs.fragment  |  1 +
>   3 files changed, 59 insertions(+)
>   create mode 100644 support/testing/tests/fs/test_btrfs.py
>   create mode 100644 support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9f67e3b02f..6d989b1e72 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1808,6 +1808,8 @@ F:	package/z3/
>   F:	package/zynaddsubfx/
>   F:	support/testing/tests/boot/test_optee_os.py
>   F:	support/testing/tests/boot/test_optee_os/
> +F:	support/testing/tests/fs/test_btrfs.py
> +F:	support/testing/tests/fs/test_btrfs/
>   F:	support/testing/tests/package/sample_python_distro.py
>   F:	support/testing/tests/package/sample_python_gnupg.py
>   F:	support/testing/tests/package/sample_python_hwdata.py
> diff --git a/support/testing/tests/fs/test_btrfs.py b/support/testing/tests/fs/test_btrfs.py
> new file mode 100644
> index 0000000000..90b868a955
> --- /dev/null
> +++ b/support/testing/tests/fs/test_btrfs.py
> @@ -0,0 +1,56 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestBtrfs(infra.basetest.BRTest):
> +    kern_frag = \
> +        infra.filepath("tests/fs/test_btrfs/linux-btrfs.fragment")
> +    btrfs_label = "BR_TEST"
> +    config = \
> +        f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_BTRFS_PROGS=y
> +        BR2_TARGET_ROOTFS_BTRFS=y
> +        BR2_TARGET_ROOTFS_BTRFS_LABEL="{btrfs_label}"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        disk = os.path.join(self.builddir, "images", "rootfs.btrfs")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        bootargs = ["root=/dev/vda", "console=ttyAMA0"]
> +        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
> +                     "-drive", f"file={disk},if=virtio,format=raw"]
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=bootargs,
> +                           options=qemu_opts)
> +        self.emulator.login()
> +
> +        # We check our root filesystem is in btrfs format.
> +        cmd = "mount | grep '/dev/root on / type btrfs'"
> +        self.assertRunOk(cmd)
> +
> +        # We show the root filesystem info with btrfs-progs, using the
> +        # target btrfs-progs.
> +        self.assertRunOk("btrfs filesystem show /")
> +
> +        # We query the label and check it is the one from the
> +        # Buildroot config.
> +        out, ret = self.emulator.run("btrfs filesystem label /")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], self.btrfs_label)
> +
> +        # We try to write data on the root filesystem.
> +        self.assertRunOk("echo 'Hello Buildroot' > /root/file.txt")
> +        self.assertRunOk("sync")
> diff --git a/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment b/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
> new file mode 100644
> index 0000000000..605c1837e1
> --- /dev/null
> +++ b/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
> @@ -0,0 +1 @@
> +CONFIG_BTRFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
