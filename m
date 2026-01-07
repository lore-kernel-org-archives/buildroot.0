Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D49BD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B644099A;
	Wed,  7 Jan 2026 17:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUYDBNpNpORr; Wed,  7 Jan 2026 17:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B81C40A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808182;
	bh=DJFpUaFOx8eAoceVEAwc2SVrf9kcYqehl54MQ2Ue+TI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HbjoqZEKUbX+ybMxhqMNpIRXTlx+TcU1y0VqS2WSFJsV0ULOczpSKRTuyune4GZu6
	 Vqmgd0VOgfXRVPU1asY5WtFDC5msTDYNxvDomiN2lEiHi+fc/dOAayKhpLiaM2FRp+
	 nnhxK5heU0LVPtKLUXaJHSKaRAZjNl9q2BoH5zcWN7zYeWpdDy6V7N+/pPL+jp9jB6
	 DZ9PVOveGXYdOMso8aqb6jQZmoxvVu5G9n7dMjD4ZG0nxNKhs0ONRxtwYLU6e0zkMS
	 i3SyHWJ8euFe3/KwuTBGtDhZFJCEXxg7U6f72NhtLOE6nFDVvlOjs6L0nEJpVdkVOS
	 zWTlkSpUQYSOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B81C40A18;
	Wed,  7 Jan 2026 17:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3965C25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF324099A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVBvNm2iXvGk for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4353B4093B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4353B4093B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4353B4093B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EEB6B97A70C; Wed,  7 Jan 2026 18:49:36 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:34 +0100
Message-ID: <20260107174934.225366-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216231456.347739-3-ju.o@free.fr>
References: <20251216231456.347739-3-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808176; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Y4pkYRxzrnI/wjJaK6Iwx+L/J7IW82z6RNT1Bc7mcKg=;
 b=pNRQheJhReazYb/noYNqOqEXmX/SJ2ySJ+NSI23iWUoj05Mg2ejSlv2tMN4QDbQYwginIN
 svYHo43ajtZ2KBMA86HrRJlf5hRgOm/SyyB4pD1jhv3HRpTfE5siEwbEMRcmJaVa3aqiC9
 WtaqlDbNprO73NTEIzjlcSwvWZ5Wl6WVtZ2ARXMYrUfABIbcgkWQcwNZXi6Xlkcne48ojD
 CQn6Hd4QQSB00vSppUKxKxXy4jx7l9mCkxjwmhvLbBZu2sxPoQAoG09LUWFyrx9HMu6yCM
 wUvl1D5FCRP9taKqfF27VZUZe9HS9g7bNWzMFjQwX8pdN1Kw2Jb3mvuTWdD3CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pNRQheJh
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: new kvmtool runtime
 test
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
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Patch series tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12462463585
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_kvmtool.py | 97 +++++++++++++++++++
>  .../package/test_kvmtool/linux-kvm.fragment   |  6 ++
>  .../rootfs-overlay/etc/profile.d/stty-raw.sh  |  3 +
>  4 files changed, 108 insertions(+)
>  create mode 100644 support/testing/tests/package/test_kvmtool.py
>  create mode 100644 support/testing/tests/package/test_kvmtool/linux-kvm.fragment
>  create mode 100644 support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1b27df9beb..ca2cb44b87 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1926,6 +1926,8 @@ F:	support/testing/tests/package/test_kmod.py
>  F:	support/testing/tests/package/test_kmod/
>  F:	support/testing/tests/package/test_kmscube.py
>  F:	support/testing/tests/package/test_kmscube/
> +F:	support/testing/tests/package/test_kvmtool.py
> +F:	support/testing/tests/package/test_kvmtool/
>  F:	support/testing/tests/package/test_lame.py
>  F:	support/testing/tests/package/test_less.py
>  F:	support/testing/tests/package/test_libcamera.py
> diff --git a/support/testing/tests/package/test_kvmtool.py b/support/testing/tests/package/test_kvmtool.py
> new file mode 100644
> index 0000000000..d6859172bd
> --- /dev/null
> +++ b/support/testing/tests/package/test_kvmtool.py
> @@ -0,0 +1,97 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestKvmTool(infra.basetest.BRTest):
> +    # This test passes the Buildroot image directory to the emulated
> +    # guest using the 9p virtiofs. This guest enables the
> +    # virtualization support. It will start a nested KVM virtual
> +    # machine, using the same Kernel/initramfs images. For these
> +    # reasons, we need a specific kernel configuration that enables
> +    # KVM and 9P.
> +    kern_frag = \
> +        infra.filepath("tests/package/test_kvmtool/linux-kvm.fragment")
> +    rootfs_overlay = \
> +        infra.filepath("tests/package/test_kvmtool/rootfs-overlay")
> +    config = \
> +        f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_KVMTOOL=y
> +        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        img_dir = os.path.join(self.builddir, "images")
> +        virtfs_tag = "br-imgs"
> +        virtfs_opts = [
> +            f"local,path={img_dir}",
> +            f"mount_tag={virtfs_tag}",
> +            "security_model=mapped-xattr",
> +            "readonly"
> +        ]
> +        qemu_opts = ["-M", "virt,gic-version=3,virtualization=on",
> +                     "-cpu", "cortex-a57",
> +                     "-smp", "4",
> +                     "-m", "1G",
> +                     "-virtfs", ','.join(virtfs_opts),
> +                     "-initrd", img]
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           options=qemu_opts)
> +        self.emulator.login()
> +
> +        # Test the program can execute.
> +        self.assertRunOk("lkvm --version")
> +
> +        # We mount the virtfs to get the Kernel and initramfs from the
> +        # test host.
> +        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
> +
> +        # We define an arbitrary kernel command line argument that we
> +        # will use to detect we are in our virtual machine.
> +        kvm_karg = "br-kvm"
> +
> +        # The number of CPU of our virtual machine
> +        kvm_nproc = 2
> +
> +        # We run the KVM virtual machine
> +        cmd = "lkvm run"
> +        cmd += " --kernel /mnt/Image"
> +        cmd += " --initrd /mnt/rootfs.cpio"
> +        cmd += f" --cpus {kvm_nproc}"
> +        cmd += " --mem 320M"
> +        cmd += " --console virtio"
> +        cmd += " --irqchip gicv3"
> +        cmd += f" --params {kvm_karg}"
> +
> +        # We use qemu.sendline() to run the command because the
> +        # program will not return an exit code. The command "lkvm run"
> +        # will spawn the new virtual machine console. The login is
> +        # expected to be reached after the command is issued.
> +        self.emulator.qemu.sendline(cmd)
> +
> +        # We login in the virtual machine.
> +        self.emulator.login()
> +
> +        # We check we can see our kernel argument.
> +        out, ret = self.emulator.run("cat /proc/cmdline")
> +        self.assertEqual(ret, 0)
> +        self.assertIn(kvm_karg, out[0])
> +
> +        # We check the virtual machine has the expected number of CPU.
> +        out, ret = self.emulator.run("nproc")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(int(out[0]), kvm_nproc)
> diff --git a/support/testing/tests/package/test_kvmtool/linux-kvm.fragment b/support/testing/tests/package/test_kvmtool/linux-kvm.fragment
> new file mode 100644
> index 0000000000..8058ac41c3
> --- /dev/null
> +++ b/support/testing/tests/package/test_kvmtool/linux-kvm.fragment
> @@ -0,0 +1,6 @@
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=y
> +CONFIG_NET_9P=y
> +CONFIG_NET_9P_VIRTIO=y
> +CONFIG_9P_FS=y
> +CONFIG_9P_FS_POSIX_ACL=y
> diff --git a/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
> new file mode 100644
> index 0000000000..24d72995e6
> --- /dev/null
> +++ b/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
> @@ -0,0 +1,3 @@
> +# Avoid double-cooking the terminal, otherwise the test infrastructure
> +# would not be able to retrieve return codes properly.
> +grep -Fq br-kvm /proc/cmdline && stty raw
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
