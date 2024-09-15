Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F81C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56604021D;
	Sun, 15 Sep 2024 09:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eo1-6nXN--h; Sun, 15 Sep 2024 09:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA4640222
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA4640222;
	Sun, 15 Sep 2024 09:21:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC8E21BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D944680898
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0hjaE7XQMC4 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF44B80594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF44B80594
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF44B80594
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:21:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3787e067230so2475486f8f.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726392087; x=1726996887;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SNNAkUpHz5cZJkFDjhu/m4SSvz1OnFt0sadttiipFIM=;
 b=aXbO/hEokK3vkYVhr1bplGCa5CEUa26QiRlUYIGadgA9V9DoJWHXx2/1EKKIWLJ65t
 innYCuXKqmMqxDKuftZ1+Goa0ghv4ly7kYWwUxQVRQCLSUW04QqcqEooF2XnqZLi7Z7+
 YDRtlYDN0tayZB8QN08CLHlFK3WHLA+t96xGDOtIhHTJ1QnBXxYGt10yDzYNrMT1TKFi
 np/4l00teEo05R+tAsPvYf2NOBsPD8wYgdSSkNTUMzx83Qp+M5vtlM0Rzgn6ZILVqFWA
 mzEDRiDBuL1yvGsRu2n9z/Carqx049R//aKnKbhx6sUQ2+Dz7bPN2pIO73hs4FImaCLt
 8d6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcopBMCvOMC22Gup6CguIV4lt+UQhPu1fGTbZnSMqVbSILxYK/oBhvsrkD1vCUcfV053ORF1ECuVs=@buildroot.org
X-Gm-Message-State: AOJu0YwtqJFdtDKCYB7vOtH8t/+XfuTaYl8W4v2SAL3t+qnMUVJXIm56
 +305I5hKNbNfM1GIgZDwmClZmswugUizOFov5VFL53NJM6QeSQGAehtu0dCDLd+l/RwsDykDAb9
 nm+W0sg==
X-Google-Smtp-Source: AGHT+IGnxiu30HyY8GiosI1HduuoYrfDAtdWzos9iI0DuNmR+dcf9Vvhia70gX6QDokdc3od6OHvGg==
X-Received: by 2002:a5d:61c2:0:b0:374:c4e2:ee00 with SMTP id
 ffacd0b85a97d-378c2d727cdmr6758843f8f.53.1726392087226; 
 Sun, 15 Sep 2024 02:21:27 -0700 (PDT)
Received: from [192.168.197.114] (92-184-117-99.mobile.fr.orangecustomers.net.
 [92.184.117.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780016asm4240603f8f.85.2024.09.15.02.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 02:21:26 -0700 (PDT)
Message-ID: <9dfcc77c-ec81-4a9d-9823-014dd98028bd@mind.be>
Date: Sun, 15 Sep 2024 11:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240818112652.1232927-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240818112652.1232927-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726392087; x=1726996887; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SNNAkUpHz5cZJkFDjhu/m4SSvz1OnFt0sadttiipFIM=;
 b=dR8EnEQaQiTrPv1MxEgbDimS0gwsxD3eqHau06xvsPk3+RvJ8boItHWfwHCh+ejb2c
 eKhJeNW0cC6y+KBxKP+gmT04Rsi014rtVGGUBy4TRQhMOMYkjcYNQh+6wNd3UkVihkpM
 ArN8SbjRVxzG+GOyNmuBNuQpu3c+3LQZrGnG80tWe+VtjORkiUOIKRtWEcXj58ROyxke
 bK6BAY+fLCgLL3I7Nbtr580xKKBHfniKiFeRO2w2Qu/MRmk0ddkT3FY7EW2RAdLIqTXW
 FQ3nU8oy6kYwKK6GxMmN42Ch1q/jy0vsZllDgNdxfqT5kB3bdGDTc2vAtVYO9t+XnocV
 942Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dR8EnEQa
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fs: new erofs runtime
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



On 18/08/2024 13:26, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7606961571
> ---
>   DEVELOPERS                                    |  2 +
>   support/testing/tests/fs/test_erofs.py        | 51 +++++++++++++++++++
>   .../tests/fs/test_erofs/linux-erofs.fragment  |  1 +
>   3 files changed, 54 insertions(+)
>   create mode 100644 support/testing/tests/fs/test_erofs.py
>   create mode 100644 support/testing/tests/fs/test_erofs/linux-erofs.fragment
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..5113b5e60d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1820,6 +1820,8 @@ F:	support/testing/tests/boot/test_optee_os.py
>   F:	support/testing/tests/boot/test_optee_os/
>   F:	support/testing/tests/fs/test_btrfs.py
>   F:	support/testing/tests/fs/test_btrfs/
> +F:	support/testing/tests/fs/test_erofs.py
> +F:	support/testing/tests/fs/test_erofs/
>   F:	support/testing/tests/package/sample_python_distro.py
>   F:	support/testing/tests/package/sample_python_gnupg.py
>   F:	support/testing/tests/package/sample_python_hwdata.py
> diff --git a/support/testing/tests/fs/test_erofs.py b/support/testing/tests/fs/test_erofs.py
> new file mode 100644
> index 0000000000..47c75262e0
> --- /dev/null
> +++ b/support/testing/tests/fs/test_erofs.py
> @@ -0,0 +1,51 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestErofs(infra.basetest.BRTest):
> +    kern_frag = \
> +        infra.filepath("tests/fs/test_erofs/linux-erofs.fragment")
> +    config = \
> +        f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.46"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_EROFS_UTILS=y
> +        BR2_TARGET_ROOTFS_EROFS=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        root_dev = "/dev/vda"
> +        disk = os.path.join(self.builddir, "images", "rootfs.erofs")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        bootargs = [f"root={root_dev}", "console=ttyAMA0"]
> +        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
> +                     "-drive", f"file={disk},if=virtio,format=raw"]
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=bootargs,
> +                           options=qemu_opts)
> +        self.emulator.login()
> +
> +        # We check our root filesystem is in erofs format.
> +        cmd = "mount | grep '/dev/root on / type erofs'"
> +        self.assertRunOk(cmd)
> +
> +        # Since we are on a read-only mounted filesystem, we can run a
> +        # check...
> +        self.assertRunOk(f"fsck.erofs {root_dev}")
> +
> +        # We check we can dump the superblock.
> +        self.assertRunOk(f"dump.erofs -s {root_dev}")
> +
> +        # We check we can dump statistics on the image.
> +        self.assertRunOk(f"dump.erofs -S {root_dev}")
> diff --git a/support/testing/tests/fs/test_erofs/linux-erofs.fragment b/support/testing/tests/fs/test_erofs/linux-erofs.fragment
> new file mode 100644
> index 0000000000..e14017aae4
> --- /dev/null
> +++ b/support/testing/tests/fs/test_erofs/linux-erofs.fragment
> @@ -0,0 +1 @@
> +CONFIG_EROFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
