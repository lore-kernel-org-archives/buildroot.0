Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61A5107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9C560EF6;
	Sat, 14 Mar 2026 07:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1uaQBJ5tmPd; Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B95C60EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474804;
	bh=TBIY0xurfkGQiRUzcz4grXBpLFfvnAui+EgShSSlFds=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AUyI7+aj0cSYoeDOSaS7yTMpJZrqoASZMD1jJwRpv5EJ4VvzWX9i/k1egP1kcZ2YV
	 h43zGKQv91W7lQOLsCm3NMGEqcWaiHUnK6vjqIb024uCuUk8AvZWkSU4OopHfjJcoL
	 wlYRyCNt498w77Hnrj4UZJd7alNUcatSYvxEux8OSnCxu9KgbW6iUFOz3JdF5A18rD
	 H+9/GAe4oSRD5V6RqErf8z4yY2GZL+3rda7Gc7kpRSnrO//le/UJGTD7YPqVOhBkG1
	 UcFdQrWN9+5Gis4dFBbklVNwUYNYdHjF47y9xl6DPhq+IVPms7nMgYvDGJV+0qbjMh
	 KZhBWTOCMTIWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B95C60EE7;
	Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A7131B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D16C407AE
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36wX7uXfep-y for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8482840785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8482840785
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8482840785
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso25229845e9.2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474799; x=1774079599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C3cP7hV5Hu7uhAQlkyyqTM1lqKVJZPSY0e06Nk7vtNw=;
 b=AUmxPpGP+nJgoT1/PBb/+nOzSbUY1MiUbsIfkQYHOAxB6ank2r/QdUiPbsiRgEYT5f
 sCdsZ3O6GbjuWvIJkvxWGzgxrY98bPQK0AMfWhqaEnv0fKAOf0l0sRmFlaItU7+D2EkU
 2oUAhRP2QovZTGRfjD82hiZDHTHpZhDm30gMicdxB6jVuvoOp5BgyWxGoB0V48t4Au23
 /b90lN8vIM8u7snJpNTz3XBX6QhlN7ZhMmN9zaJN66TBF9HxBIxMx3vW7vLHtU8ru4ED
 +xWENEvJEh2y7Aj1o9ongksVmuhsb2gOFIsG2/MNHNc5gCctz3Y/CJwdpdPT5CrbokKw
 Fzpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtUvObxnRXiFcWLGzJbVog6ku5F6XvE4GaNthU/0nCEFBc/SyyMDvp7XCONdT2p/LGOd6NjS8g2R0=@buildroot.org
X-Gm-Message-State: AOJu0YyqgPW5lLzoyHh4RkanznToRgyXnzYkAYVyh49MHbYALwUEOwbA
 2GGfv/NFJscNzdoQww1Fk8eDZq0I/YjgqDqyyoJXNywlyZoatu5IeH35wHEJ+kk0cgD/ATqA9+d
 ++rCP
X-Gm-Gg: ATEYQzylJ08XmoemgRCjb8HUGiRBBP1IPGVK7KL9vmZVK/9mRsIGfsFlJJcoOJQBj+5
 /4h7o7bTfhp+3K+6/Yajzo2zkrTdYd/XDo5tkLxBwWQU5af9MDllwZytiFXzocHMKmq9XCWkySz
 SK6D0GiprsSalyHfM0bUVuAovKKCbocsJQnl+KkHZiZN46mwqoAO51npGRFQZpoMqRziSjfcpol
 yp+fdLae0rMSvAWgCRebl3dkUbVCXsDTBYeKymBfHFRAii/IpHoi0dNO/n/2BB0E9hsh2b9zoMp
 BaewSK0FHNSuulPmJVGYdQhMjP8qe3qOu9Ma9T84Cae7oCIKgCtt8aOd1zuHqQwpV95oXoiiu/x
 m+GCnoBcsBG7U2JiJLA8hVIiWr9LLyENBeB/8qnX0IFi+5SEdFjZYSsahdFFuixZEahcZ28OV3M
 CTbBik8oh3HXXiQnsyTUgRSZZp4Q==
X-Received: by 2002:a05:600c:4fc6:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-485566cfccfmr92476675e9.10.1773474798725; 
 Sat, 14 Mar 2026 00:53:18 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b66dedfsm265990625e9.12.2026.03.14.00.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:18 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:17 +0100
Message-ID: <20260314075317.14451-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260124131337.1022030-2-ju.o@free.fr>
References: <20260124131337.1022030-2-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474799; x=1774079599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3cP7hV5Hu7uhAQlkyyqTM1lqKVJZPSY0e06Nk7vtNw=;
 b=HAYvDMl0/GzBPRlO7dFPY5aiVM7ay5VaWYn4/ZdLRQ8o/IqyQI0nBwtDs7N1LW95Cu
 RAyJRNKutkYm5wCS1SciV4xmVpb7oVcp/n1yBDdyXMfX+VF1Y8eWLepXwTenY2DeMX1x
 oOaaFsTLB+UwKncydR89DUSqOc5i3oN0tePZX9CEvtbdFZX887SSmmUbh7z34YrHnsdt
 A2wCryM9LRj3skQchqQbk2cEZg6OyHU3t0A5VJsDCJZELa9BZ1AaS2dRfEbV8S1eo17w
 uEazNKSiKhmGEF29QfxF+D+/UAFDXHTBgEoxJqA7PgRkNuO0XS6s8zo7pVHrd2dJ5MUO
 lUQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HAYvDMl0
Subject: Re: [Buildroot] [PATCH 2/3] support/testing: boot/test_grub: remove
 32bit EFI test
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
> EDK2 removed OVMF IA32 support in commit [1], which is included in
> version edk2-stable202511. This commit removes the test relying on it.
> 
> [1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.11.x & 2026.02.x. Thanks

> ---
>  support/testing/tests/boot/test_grub.py | 50 -------------------------
>  1 file changed, 50 deletions(-)
> 
> diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
> index 7ce7066875..061bfc9a2f 100644
> --- a/support/testing/tests/boot/test_grub.py
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -32,56 +32,6 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
>          self.emulator.login()
>  
>  
> -class TestGrubi386EFI(infra.basetest.BRTest):
> -    config = \
> -        """
> -        BR2_x86_core2=y
> -        BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
> -        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
> -        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
> -        BR2_LINUX_KERNEL=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> -        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> -        BR2_LINUX_KERNEL_INSTALL_TARGET=y
> -        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> -        BR2_PACKAGE_EFIVAR=y
> -        BR2_TARGET_ROOTFS_EXT2=y
> -        BR2_TARGET_EDK2=y
> -        BR2_TARGET_GRUB2=y
> -        BR2_TARGET_GRUB2_I386_EFI=y
> -        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
> -        BR2_PACKAGE_HOST_GENIMAGE=y
> -        BR2_PACKAGE_HOST_MTOOLS=y
> -        BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
> -
> -    def test_run(self):
> -        hda = os.path.join(self.builddir, "images", "disk.img")
> -        bios = os.path.join(self.builddir, "images", "OVMF.fd")
> -        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
> -        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
> -        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
> -        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
> -        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
> -        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
> -        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
> -        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
> -        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
> -        self.emulator.login()
> -
> -        cmd = "modprobe efivarfs"
> -        self.assertRunOk(cmd)
> -
> -        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
> -        self.assertRunOk(cmd)
> -
> -        cmd = "efivar -l"
> -        self.assertRunOk(cmd)
> -
> -
>  class TestGrubX8664EFI(infra.basetest.BRTest):
>      config = \
>          """
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
