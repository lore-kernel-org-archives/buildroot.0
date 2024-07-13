Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B0C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65D97404BF;
	Sat, 13 Jul 2024 19:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUipb-KL223I; Sat, 13 Jul 2024 19:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC511401D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC511401D8;
	Sat, 13 Jul 2024 19:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77C3D1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644F8401D8
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEdLXiJgEMTl for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E535B40148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E535B40148
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E535B40148
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:35:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42795086628so20903515e9.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720899354; x=1721504154;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EmOecItM/eUHuBsDj3qL6H1AKGTVOrqMBbJ5mDWryzo=;
 b=UZYIDAVmQaDVMp4CFfb7mAAlQEaacJwxRRy0Ij6EOd+nWbLDK8QSqHgrX73QjyL2xq
 2l1w6iJDodu0eggAPOWO5rWSzcIJHvQKzWM6xDEpVy2jEzeMBfbh6NU/pafV8Xkis8Rz
 LLr/InaJqIQB6W94xpYdC1lL38NfaE0dCd9at+nIXk/4N75oqp0fXvPMjBJcUuvnfnB8
 GXjvyd23U24w2boPusZby1b54pqIfYmIckhc5qJcIG+h+XPbeKw0Eq+C5auVlVcHXPtQ
 PoUN3wC3HPPTO5w14PDu0Ik9e+qROnXdMmpH6H0J0o9u0deMSH0DOVDWkDjsNrngF/hX
 Lc3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMmqLcYTi664BMtyExKmOptTQ1YKTVGLUYsAta+Fv3eL2LWnXoJZ0LBWB2cEsytm/dsfSWmRg0EJ7xtrGBYLTB1wvnTOTiGQ==
X-Gm-Message-State: AOJu0Yw2+Zz42cPUaVIFasTWuR/Jl3Czc92ve8do/DFlg8OWA2BokHxg
 kBVaJM8wIAYE+0M2RxnuHZBE8AcdHbPLYUFLiUtusN3i7bsrRLx9DjRsl1JJvV0=
X-Google-Smtp-Source: AGHT+IHqKBG8G/F6WAOoHqtKLu9BXUVn+Fjz0O+J0rhaYFKpo6ophDq4XkQPggXj0MnQvZnQ9Cbjuw==
X-Received: by 2002:a05:600c:6a09:b0:426:61b4:a2eb with SMTP id
 5b1f17b1804b1-426707e1ffbmr92240655e9.19.1720899353771; 
 Sat, 13 Jul 2024 12:35:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7489sm65745625e9.44.2024.07.13.12.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 12:35:53 -0700 (PDT)
Message-ID: <67b4fc31-cb4a-494d-b74e-6957f13ab79a@mind.be>
Date: Sat, 13 Jul 2024 21:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240706201548.183638-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240706201548.183638-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720899354; x=1721504154; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EmOecItM/eUHuBsDj3qL6H1AKGTVOrqMBbJ5mDWryzo=;
 b=QFLFMjEJ6RVPAXhTQhzY/wR9GnivMTjMJiHr8fezt58/u2NuonibruJrGcGyG//Pti
 Si2UKbdTZoyW7hQbE+ry8fjNYOqz8fSTQ0PBHvMZgV3/SAevHBQst818BW/fG/ioAG5r
 DiL2Pa8v4Up0Q0gmkg0SUrqn3+47BUB5m/UODISPNgGRH77FFbE7M4elVJT6+2bSbUFy
 1lMu4arYf8Zas69OJlXTkU1+PeRzDxqiLaf3jWmm3QScRG/na/id5Kb7Hlv03fol3Tga
 ttGSxvV66xg4csMcJfY0gmMyGB2moLdPTQC2VjBlOLr7ht0Kb6z/j61EQe/vHiG2/EwU
 G7Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QFLFMjEJ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new xfsprogs runtime
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



On 06/07/2024 22:15, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested on branch master at commit 3ebc7c6 with commands:
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_xfsprogs
>      ...
>      OK
> ---
>   DEVELOPERS                                    |   2 +
>   .../testing/tests/package/test_xfsprogs.py    | 112 ++++++++++++++++++
>   .../package/test_xfsprogs/linux-xfs.fragment  |   1 +
>   3 files changed, 115 insertions(+)
>   create mode 100644 support/testing/tests/package/test_xfsprogs.py
>   create mode 100644 support/testing/tests/package/test_xfsprogs/linux-xfs.fragment
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 90d1a111ab4..d2c39d69e3b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1913,6 +1913,8 @@ F:	support/testing/tests/package/test_usbutils/
>   F:	support/testing/tests/package/test_weston.py
>   F:	support/testing/tests/package/test_weston/
>   F:	support/testing/tests/package/test_wine.py
> +F:	support/testing/tests/package/test_xfsprogs.py
> +F:	support/testing/tests/package/test_xfsprogs/
>   F:	support/testing/tests/package/test_xz.py
>   F:	support/testing/tests/package/test_z3.py
>   F:	support/testing/tests/package/test_z3/
> diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
> new file mode 100644
> index 00000000000..a3a4bd27d83
> --- /dev/null
> +++ b/support/testing/tests/package/test_xfsprogs.py
> @@ -0,0 +1,112 @@
> +import os
> +import subprocess
> +
> +import infra.basetest
> +
> +
> +class TestXfsProgs(infra.basetest.BRTest):
> +    # This test needs a Kernel with XFS support.
> +    kern_frag = \
> +        infra.filepath("tests/package/test_xfsprogs/linux-xfs.fragment")
> +    config = \
> +        f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.37"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_XFSPROGS=y
> +        BR2_PACKAGE_OPENSSL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        # Prepare the disk image. XFS requires at least 300MB of
> +        # storage to work.
> +        disk_file = os.path.join(self.builddir, "images", "disk.img")
> +        self.emulator.logfile.write(f"Creating disk image: {disk_file}")
> +        self.emulator.logfile.flush()
> +        subprocess.check_call(
> +            ["dd", "if=/dev/zero", f"of={disk_file}", "bs=1M", "count=512"],
> +            stdout=self.emulator.logfile,
> +            stderr=self.emulator.logfile)
> +
> +        # Run the emulator with a blank drive.
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        bootargs = ["console=ttyAMA0"]
> +        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
> +                     "-initrd", img,
> +                     "-drive", f"file={disk_file},if=virtio,format=raw"]
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=bootargs,
> +                           options=qemu_opts)
> +        self.emulator.login()
> +
> +        # Check a program can run and show its version.
> +        self.assertRunOk("mkfs.xfs -V")
> +
> +        # Variables for this test.
> +        dev = "/dev/vda"
> +        label = "BR_TEST"
> +        mnt_pt = "/tmp/xfs"
> +        data_file = f"{mnt_pt}/data.bin"
> +
> +        # We create the XFS filesystem on our device.
> +        self.assertRunOk(f"mkfs.xfs {dev}")
> +
> +        # We set a label on this filesystem.
> +        self.assertRunOk(f"xfs_admin -L '{label}' {dev}")
> +
> +        # We create a mount point.
> +        self.assertRunOk(f"mkdir -p {mnt_pt}")
> +
> +        # We mount the XFS filesystem.
> +        self.assertRunOk(f"mount {dev} {mnt_pt}")
> +
> +        # We create a file with random data, to use this new
> +        # filesystem a bit.
> +        self.assertRunOk(f"dd if=/dev/urandom of={data_file} bs=1M count=10")
> +
> +        # We compute the sha256 hash and save it for later.
> +        hash_cmd = f"sha256sum {data_file}"
> +        out, ret = self.emulator.run(hash_cmd)
> +        self.assertEqual(ret, 0)
> +        data_sha256 = out[0]
> +
> +        # We unmount the filesystem.
> +        self.assertRunOk(f"umount {mnt_pt}")
> +
> +        # We query the fragmentation level. Since it's a new
> +        # filesystem, we don't expect any filesystem
> +        # fragmentation. This invocation is just to test the "xfs_db"
> +        # program can run and read the filesystem.
> +        self.assertRunOk(f"xfs_db -c frag -r {dev}")
> +
> +        # We run a repair (this tool is the equivalent of
> +        # "fsck"). Again, since we cleanly unmounted the filesystem,
> +        # we are not expecting any repair. This is just to test the
> +        # program works correctly.
> +        self.assertRunOk(f"xfs_repair {dev}")
> +
> +        # We query the label and check it is the one we set at the
> +        # beginning.
> +        out, ret = self.emulator.run(f"xfs_admin -l {dev}")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], f"label = \"{label}\"")
> +
> +        # We remount our filesystem.
> +        self.assertRunOk(f"mount {dev} {mnt_pt}")
> +
> +        # We should recompute the same sha256 hash as before.
> +        out, ret = self.emulator.run(hash_cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], data_sha256)
> diff --git a/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment b/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment
> new file mode 100644
> index 00000000000..32f7f6d8720
> --- /dev/null
> +++ b/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment
> @@ -0,0 +1 @@
> +CONFIG_XFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
