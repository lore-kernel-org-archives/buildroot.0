Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F156BC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBAFC823CF;
	Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SepTR6NL37V7; Fri, 26 Jun 2026 14:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DFED82416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485775;
	bh=PpeAKk9O7bwxMk26ibGg3kT1GB+3oHBEFQH7EgiE0Hc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NKe/qi7cHn16IGWouDcAYH1qTlHdWzGkxuXY2YX5GEvbWuw5Qmr9rw7/zxc3aCkyK
	 Hyk4wV5aLG+rjt8oiXJm8ovUgNE/kVx+F9ffDJ75dCT7tQRtE3x0RGECj6Cqldn0Up
	 LDu89P0HwRDkt05tzKzhpCnp04I9alXThtCYVhWeJ8lLMgWtfHXG4tO1ATySkMPfTn
	 EbYcO4FW7MAEzjsapLFg+ekQJuQtJhm7Q8ecW31VsZ1IPPOtSR+JXJC+lYIeAjopvN
	 VA+xzkH+tvTi98JqLkAhkXAPySJvu/Y8Tz7i2siOboX2Zfwl/JzaLNXkCS/DEbFStA
	 KJB+HzO706dRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DFED82416;
	Fri, 26 Jun 2026 14:56:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CC83231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 238FD82390
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tZvaEWOKkXM for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A76F782361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76F782361
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A76F782361
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-46f098551bfso615701f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485764; x=1783090564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mp5fxDuU1IrPPsNvjVzgpeZ2GHPDDTmINWgkMvHRjRM=;
 b=n9vb3Tj432O+flouetfk1+G4PvK1akJenRh4rF4Ky7b+zbNbzoFflXicLChUbtGO90
 LXyy42/oUvrCRtfvNcrICgaVqR5eEJob4foCqeFi27/P0+AqvYLBFy+u2pQzrQT8BTut
 dSQAXG7jhnA/CbpihdfPxrPsqOn9AlE5WPWns05itZgHo7sCcnwa0WjAOnzklRWjR+cN
 BR0B034W1y5uX+uo29e+KS5Ebpm4TSI5jLBV7cxbkxdmtuuaQrdN8t+c7Kwxmeo2An/6
 JGLsXo3SVPU5YRf6QJKdl66v5AtzA9A519KYqAjSdw87jwXhQKCS5Mu4aVBvxufigiKX
 SIGA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6xL5VVjVIVrjhtJdfjin+WueFwsw/i2/I4lZaHdmkK9Lnc7nMpUA0ziukGxRUaI2E5sSh0U1dNkw=@buildroot.org
X-Gm-Message-State: AOJu0YzHW2ZuVCgayIdJweh0D4luXQMYispn8OlimcRk7YJmtIDbQlmv
 itehAExWX+HLJEtzB0TRW0weFsDULTgBo4nJ0j7lU/KSLxVnosoQyvPmzDqj0kMKBJNVFeoz3YQ
 r7PBP
X-Gm-Gg: AfdE7cktNY3yCzSazrGV2tGlWAZIJkaQou9FSXn8B/YX6M+Us7hYqMAtJibLhS8QVSO
 bdZRcwCoaAm/Anx/heXrPIo1A1xhM0rkrK8JSH/Aj1At6R97ZqwXH6y1Q5Z+TWbMbhJYejC1K3j
 49pHI5UjvD1E7OAiXnRyqqZn9kE1xcWtg11FwRQDm9gGvZRWa+b+kLY4yhbED41Dzh5zTbuZ1B6
 i02DeuNwvDEbkr5V4rfIPl6Zc17nDVLkiEh417mS8txRAxUexpGHAkBiVlYGbOmEfV1tGUglRdi
 dKQWxLG07XP71bYthl7CyFsvGe/lVWlVaTnF+5DXPW2ZM/qdO1jSVbB9GF+dQVnbj07+7TtiV8g
 kresmxcxTiNTUgXtZfykCTXj/Iokmaxbfh3FqnSEqqZ8WTBjx188x2ghDT792FrEsiVRJUzBERj
 FMyV2n
X-Received: by 2002:a05:6000:4692:b0:46d:d5f9:d171 with SMTP id
 ffacd0b85a97d-46dd5f9d39bmr7567830f8f.47.1782485764417; 
 Fri, 26 Jun 2026 07:56:04 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d86960983sm16988656f8f.4.2026.06.26.07.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:04 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:03 +0200
Message-ID: <20260626145603.343702-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615163212.2475581-1-romain.naour@smile.fr>
References: <20260615163212.2475581-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485764; x=1783090564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mp5fxDuU1IrPPsNvjVzgpeZ2GHPDDTmINWgkMvHRjRM=;
 b=BaRhLbnL7oykO9hdxJUVpMB+sSDH45TzqYEU9QCDMkilZj3sr3X8zQA3kjUmmvdoRK
 prADDKOOfpqi7Ms9K68NQ+Ygj1hUHRhTqPPcrmx9Atu72PzvR2QV9lsCj1829gNdwJvG
 4uoH+9SuQ+m4cKW+JCriylXkVcOFgPOOfAlKPy8fN5N2gJ5Got1BUDpgU7QEeC3FDxIS
 3HR4QL8sheNJOKFEkfqjjHPHmJD+E+G1SYu6qL3BLxJCkpn4gSTnpGwmB9/b/vBrQqlk
 RNvA4mWGvtsS7s5O58p2z4glEqz+fKySZox9QoIdD6Biu4JN1UeaUsCP2W1GOCQx1yOg
 KWtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BaRhLbnL
Subject: Re: [Buildroot] [PATCH] Revert
 "support/testing/tests/package/test_kexec.py: fix kexec test for qemu 5.2"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Our docker image was finally updated to Debian 12 and now provide Qemu
> 7.2.15. We can safely revert this workaround for older Qemu version.
> 
> [1] e5bbe020ca60789bdb0a16e27bc1a4208d8f6a5a
> 
> This reverts commit 37e23e0dd7187bb27abb329f4fbb29c59c31c672.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_kexec.py   |  15 +-
>  .../qemu-aarch64-virt-5.2-machine.dts         | 373 ------------------
>  2 files changed, 4 insertions(+), 384 deletions(-)
>  delete mode 100644 support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
> 
> diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
> index 51d43b0572..77e383373e 100644
> --- a/support/testing/tests/package/test_kexec.py
> +++ b/support/testing/tests/package/test_kexec.py
> @@ -24,8 +24,6 @@ class TestKexec(infra.basetest.BRTest):
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>          BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> -        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -        BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="{}"
>          BR2_LINUX_KERNEL_INSTALL_TARGET=y
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>          BR2_PACKAGE_KEXEC=y
> @@ -33,25 +31,20 @@ class TestKexec(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_EXT2_4=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """.format(
> -            infra.filepath("tests/package/test_kexec/linux-kexec.fragment"),
> -            infra.filepath("tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts")
> +            infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
>          )
>  
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "rootfs.ext4")
>          kern = os.path.join(self.builddir, "images", "Image")
> -        dtb = os.path.join(self.builddir, "images", "qemu-aarch64-virt-5.2-machine.dtb")
>          # Notes:
>          # Sufficient memory is needed to load the kernel: having at
>          # least 512MB works. kexec could silently fail if not enough
>          # memory is present. KASLR needs to be disabled for the test:
> -        # we pass "nokaslr" to kernel bootargs, and also pass a custom
> -        # devicetree to qemu virt machine. This devicetree is based on
> -        # qemu aarch64 5.2 dts with kaslr-seed set 0.
> -        # With newer qemu >= 7.0 we can disable KASLR from the qemu
> -        # command line using "dtb-kaslr-seed=off".
> +        # we pass "nokaslr" to kernel bootargs, and also pass
> +        # "dtb-kaslr-seed=off" to qemu virt machine.
>          bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
> -        qemu_opts = ["-M", "virt", "-dtb", dtb, "-cpu", "cortex-a57", "-m", "512M",
> +        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", "cortex-a57", "-m", "512M",
>                       "-drive", f"file={hda},if=virtio,format=raw"]
>          self.emulator.boot(arch="aarch64",
>                             kernel=kern,
> diff --git a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
> deleted file mode 100644
> index ad96a51c40..0000000000
> --- a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
> +++ /dev/null
> @@ -1,373 +0,0 @@
> -/dts-v1/;
> -
> -/ {
> -	interrupt-parent = <0x8001>;
> -	#size-cells = <0x02>;
> -	#address-cells = <0x02>;
> -	compatible = "linux,dummy-virt";
> -
> -	psci {
> -		migrate = <0x84000005>;
> -		cpu_on = <0x84000003>;
> -		cpu_off = <0x84000002>;
> -		cpu_suspend = <0x84000001>;
> -		method = "hvc";
> -		compatible = "arm,psci-0.2\0arm,psci";
> -	};
> -
> -	memory@40000000 {
> -		reg = <0x00 0x40000000 0x00 0x8000000>;
> -		device_type = "memory";
> -	};
> -
> -	platform@c000000 {
> -		interrupt-parent = <0x8001>;
> -		ranges = <0x00 0x00 0xc000000 0x2000000>;
> -		#address-cells = <0x01>;
> -		#size-cells = <0x01>;
> -		compatible = "qemu,platform\0simple-bus";
> -	};
> -
> -	fw-cfg@9020000 {
> -		dma-coherent;
> -		reg = <0x00 0x9020000 0x00 0x18>;
> -		compatible = "qemu,fw-cfg-mmio";
> -	};
> -
> -	virtio_mmio@a000000 {
> -		dma-coherent;
> -		interrupts = <0x00 0x10 0x01>;
> -		reg = <0x00 0xa000000 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000200 {
> -		dma-coherent;
> -		interrupts = <0x00 0x11 0x01>;
> -		reg = <0x00 0xa000200 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000400 {
> -		dma-coherent;
> -		interrupts = <0x00 0x12 0x01>;
> -		reg = <0x00 0xa000400 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000600 {
> -		dma-coherent;
> -		interrupts = <0x00 0x13 0x01>;
> -		reg = <0x00 0xa000600 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000800 {
> -		dma-coherent;
> -		interrupts = <0x00 0x14 0x01>;
> -		reg = <0x00 0xa000800 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000a00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x15 0x01>;
> -		reg = <0x00 0xa000a00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000c00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x16 0x01>;
> -		reg = <0x00 0xa000c00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a000e00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x17 0x01>;
> -		reg = <0x00 0xa000e00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001000 {
> -		dma-coherent;
> -		interrupts = <0x00 0x18 0x01>;
> -		reg = <0x00 0xa001000 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001200 {
> -		dma-coherent;
> -		interrupts = <0x00 0x19 0x01>;
> -		reg = <0x00 0xa001200 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001400 {
> -		dma-coherent;
> -		interrupts = <0x00 0x1a 0x01>;
> -		reg = <0x00 0xa001400 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001600 {
> -		dma-coherent;
> -		interrupts = <0x00 0x1b 0x01>;
> -		reg = <0x00 0xa001600 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001800 {
> -		dma-coherent;
> -		interrupts = <0x00 0x1c 0x01>;
> -		reg = <0x00 0xa001800 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001a00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x1d 0x01>;
> -		reg = <0x00 0xa001a00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001c00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x1e 0x01>;
> -		reg = <0x00 0xa001c00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a001e00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x1f 0x01>;
> -		reg = <0x00 0xa001e00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002000 {
> -		dma-coherent;
> -		interrupts = <0x00 0x20 0x01>;
> -		reg = <0x00 0xa002000 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002200 {
> -		dma-coherent;
> -		interrupts = <0x00 0x21 0x01>;
> -		reg = <0x00 0xa002200 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002400 {
> -		dma-coherent;
> -		interrupts = <0x00 0x22 0x01>;
> -		reg = <0x00 0xa002400 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002600 {
> -		dma-coherent;
> -		interrupts = <0x00 0x23 0x01>;
> -		reg = <0x00 0xa002600 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002800 {
> -		dma-coherent;
> -		interrupts = <0x00 0x24 0x01>;
> -		reg = <0x00 0xa002800 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002a00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x25 0x01>;
> -		reg = <0x00 0xa002a00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002c00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x26 0x01>;
> -		reg = <0x00 0xa002c00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a002e00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x27 0x01>;
> -		reg = <0x00 0xa002e00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003000 {
> -		dma-coherent;
> -		interrupts = <0x00 0x28 0x01>;
> -		reg = <0x00 0xa003000 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003200 {
> -		dma-coherent;
> -		interrupts = <0x00 0x29 0x01>;
> -		reg = <0x00 0xa003200 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003400 {
> -		dma-coherent;
> -		interrupts = <0x00 0x2a 0x01>;
> -		reg = <0x00 0xa003400 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003600 {
> -		dma-coherent;
> -		interrupts = <0x00 0x2b 0x01>;
> -		reg = <0x00 0xa003600 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003800 {
> -		dma-coherent;
> -		interrupts = <0x00 0x2c 0x01>;
> -		reg = <0x00 0xa003800 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003a00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x2d 0x01>;
> -		reg = <0x00 0xa003a00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003c00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x2e 0x01>;
> -		reg = <0x00 0xa003c00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	virtio_mmio@a003e00 {
> -		dma-coherent;
> -		interrupts = <0x00 0x2f 0x01>;
> -		reg = <0x00 0xa003e00 0x00 0x200>;
> -		compatible = "virtio,mmio";
> -	};
> -
> -	gpio-keys {
> -		#address-cells = <0x01>;
> -		#size-cells = <0x00>;
> -		compatible = "gpio-keys";
> -
> -		poweroff {
> -			gpios = <0x8003 0x03 0x00>;
> -			linux,code = <0x74>;
> -			label = "GPIO Key Poweroff";
> -		};
> -	};
> -
> -	pl061@9030000 {
> -		phandle = <0x8003>;
> -		clock-names = "apb_pclk";
> -		clocks = <0x8000>;
> -		interrupts = <0x00 0x07 0x04>;
> -		gpio-controller;
> -		#gpio-cells = <0x02>;
> -		compatible = "arm,pl061\0arm,primecell";
> -		reg = <0x00 0x9030000 0x00 0x1000>;
> -	};
> -
> -	pcie@10000000 {
> -		interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> -		interrupt-map = <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x03 0x04 0x00 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x04 0x04 0x800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x05 0x04 0x800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x05 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x06 0x04 0x1000 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x03 0x04 0x1800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x05 0x04>;
> -		#interrupt-cells = <0x01>;
> -		ranges = <0x1000000 0x00 0x00 0x00 0x3eff0000 0x00 0x10000 0x2000000 0x00 0x10000000 0x00 0x10000000 0x00 0x2eff0000 0x3000000 0x80 0x00 0x80 0x00 0x80 0x00>;
> -		reg = <0x40 0x10000000 0x00 0x10000000>;
> -		msi-parent = <0x8002>;
> -		dma-coherent;
> -		bus-range = <0x00 0xff>;
> -		linux,pci-domain = <0x00>;
> -		#size-cells = <0x02>;
> -		#address-cells = <0x03>;
> -		device_type = "pci";
> -		compatible = "pci-host-ecam-generic";
> -	};
> -
> -	pl031@9010000 {
> -		clock-names = "apb_pclk";
> -		clocks = <0x8000>;
> -		interrupts = <0x00 0x02 0x04>;
> -		reg = <0x00 0x9010000 0x00 0x1000>;
> -		compatible = "arm,pl031\0arm,primecell";
> -	};
> -
> -	pl011@9000000 {
> -		clock-names = "uartclk\0apb_pclk";
> -		clocks = <0x8000 0x8000>;
> -		interrupts = <0x00 0x01 0x04>;
> -		reg = <0x00 0x9000000 0x00 0x1000>;
> -		compatible = "arm,pl011\0arm,primecell";
> -	};
> -
> -	pmu {
> -	};
> -
> -	intc@8000000 {
> -		phandle = <0x8001>;
> -		reg = <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00 0x10000>;
> -		compatible = "arm,cortex-a15-gic";
> -		ranges;
> -		#size-cells = <0x02>;
> -		#address-cells = <0x02>;
> -		interrupt-controller;
> -		#interrupt-cells = <0x03>;
> -
> -		v2m@8020000 {
> -			phandle = <0x8002>;
> -			reg = <0x00 0x8020000 0x00 0x1000>;
> -			msi-controller;
> -			compatible = "arm,gic-v2m-frame";
> -		};
> -	};
> -
> -	flash@0 {
> -		bank-width = <0x04>;
> -		reg = <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00 0x4000000>;
> -		compatible = "cfi-flash";
> -	};
> -
> -	cpus {
> -		#size-cells = <0x00>;
> -		#address-cells = <0x01>;
> -
> -		cpu@0 {
> -			reg = <0x00>;
> -			compatible = "arm,cortex-a15";
> -			device_type = "cpu";
> -		};
> -	};
> -
> -	timer {
> -		interrupts = <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b 0x104 0x01 0x0a 0x104>;
> -		always-on;
> -		compatible = "arm,armv7-timer";
> -	};
> -
> -	apb-pclk {
> -		phandle = <0x8000>;
> -		clock-output-names = "clk24mhz";
> -		clock-frequency = <0x16e3600>;
> -		#clock-cells = <0x00>;
> -		compatible = "fixed-clock";
> -	};
> -
> -	chosen {
> -		stdout-path = "/pl011@9000000";
> -		/* Buildroot specific: KASLR needs to be disabled for the Kexec test. */
> -		kaslr-seed = <0 0>;
> -	};
> -};
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
