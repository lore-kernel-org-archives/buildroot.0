Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4684E107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 184DD40785;
	Sat, 14 Mar 2026 07:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvM-gSWP0R_t; Sat, 14 Mar 2026 07:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4327C407AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474808;
	bh=5ks/qHF+yQJNF9KKYEI9Pn5g4npxNCZb/sxODy+IuDo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YkEUlTkLJ5+xXru0o0/QOvsxKCIz/bbg33i7ZPeaswrILHROW5+PVRX+7iziDGm+w
	 GS2R5hUH+lpSbl03sDWlq40Y0pIDj+jLFouLDj/VyydwQmDEUTeMTwEhj4MDeF3mv0
	 oiMTUDrmliKLpRUqEEbN4mWvd3AV53RRqMKdTSgqxT1rx9TrfaamAaFrDiinSaxPVc
	 X075VqufPY3wMq8WPp8bffSyZU8CIBq7cY+hvI44GgzEg3dXsedbKMbdRdZwqsxMfM
	 CMZNOyp4SG1gpx90VV2xxxq4M9j2oPBbANkQsNmKxKGKLfbHE+eK5BQDkBXVJrSTZp
	 RmFRPcdp3zZwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4327C407AE;
	Sat, 14 Mar 2026 07:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE87F1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7784240785
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ_YMOXdyxb1 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E7D240786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7D240786
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E7D240786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43a03cb1df9so2731295f8f.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474800; x=1774079600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J5KDTeK9EI+euws399RgI25zz3wFBE1gHfxp/1gFBHc=;
 b=gVXeL1VwZvUDtbZKBu0ItVzzbbNZlJUJJavRuRn1CRYwj5zywxUeQZP140Bkg9aziM
 T3xn8mMQBI1SVy1qxVZ77gqdTP4z+D6ya62+Y1RWXNaJGP5TdYF0aqowxgr/6Y/jZcmq
 8Sei9e/UkNHEYbREizFwu44FOzo/3VirGO1Eeg4mmfypZdYbD/Cm+AFyxOODYzwDLq0K
 Iqehu6TIqQa8BFaJFDREBPZxdOXPJoJ9VilwnIUmdqDs090SvJLwshybgnCfNL/U49lr
 wBQ1KppTmiAHjn8lyeYanE2nDG4WngPZysH/WhiyPgjEOQ28VCekiH5p9yTOvQDz5Xle
 eYgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUywPDV986N+dmneR7n681Q/3XgETDTMkh9nZH67hqY0hRVyjQfo989DX7KuCg9nazoevRwvHXz9bE=@buildroot.org
X-Gm-Message-State: AOJu0YzToSLSxHCzMkDa6NgzN9yxVv3UDRHHRtNhEJaddv5VT6KrUr/c
 w6JSvb60O/toorV+E9x9lwinmyudjYVuZZHegWhRN/PqbsEFgtAzLu1+5pXJlM3CNI9R8ij83AM
 txZ7k
X-Gm-Gg: ATEYQzysliYmLnFMw92/EaWrZFtXvP95VH0z5OBHzl3Ts1q+LQIjM3qnZ6r2Q/YGTAs
 3JN0WIocANIqGdqjXk5hqyAqzefwyhq3uaHrQCyd2c6Avx+jDcnzjoYvoKV0V9z2xFmmUWDcyoF
 EhP3nwTdQ5Grkgftafguy1cdXYEBWNFUVO1+hQs3l/f4feie02PXEcrEQm3KkjkHLdGPGVBAFF+
 1nilcHFB2hTAzL/Me5K+oC4Pn1ft1XEInIodSq8RZUadEkz+3t4Tf6Ebt0YKGF4rUalYujW3kTg
 vlhNrkHmmTnoVFyQqx36aUAII3rLbw0f5Ds6iFDoSld+hZJXgsesFWToNI1pkIL01WUjXjnyXbn
 xmshL0ylup+H5JVuRrSW2qX6Io2Z6pwBI0R6L6IRghZE/wNb+m6vVKFSWgYzZM4MEdWm3Gxgs+U
 7v+C0mnIbkWo7i7ck=
X-Received: by 2002:a05:6000:2584:b0:439:abcd:b314 with SMTP id
 ffacd0b85a97d-43a04d87b68mr11576522f8f.18.1773474799693; 
 Sat, 14 Mar 2026 00:53:19 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43a0b2e2c71sm8245891f8f.22.2026.03.14.00.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:19 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:18 +0100
Message-ID: <20260314075318.14501-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260124131337.1022030-1-ju.o@free.fr>
References: <20260124131337.1022030-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474800; x=1774079600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5KDTeK9EI+euws399RgI25zz3wFBE1gHfxp/1gFBHc=;
 b=LpKqlSJBmUZuyXUE0P2G0T4RT9xPvEjgptN3NDClSK7w33nFsttpCCymRoXzCuwtkq
 MrBiDFWojZxO5r21x4iiMcBdDHiPj8HS4pK9pfJJdrxk+bSkUot9+GFWUsKp4fKbZ5iZ
 W5xE7J5HW91NOuz33n8V3UCb6pofSlDy0JRv8xJIh6ynIcOdfHHli/1SBhrTZOvzkXnO
 IVshEdgha1MTfFrhqGfukh6Ux2LbQHHFF4Hg+rkzZg7RemrUuI91RjMEqnXYPtSscxUP
 +DeD5VhBTZBZQ8pyyFY36Qrl5jOJkTbiMPXs6BW2pxDpYS1lER+hKiGxQhp8PS59ECFv
 u1mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LpKqlSJB
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: fs/test_iso9660:
 remove 32bit EFI tests
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
> version edk2-stable202511. This commit removes tests relying on it.
> 
> [1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.11.x & 2026.02.x. Thanks

> ---
>  support/testing/tests/fs/test_iso9660.py | 79 +-----------------------
>  1 file changed, 2 insertions(+), 77 deletions(-)
> 
> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> index 1b86bfbfc1..947aca5f54 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -18,22 +18,9 @@ BASIC_CONFIG = \
>      """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
>  
>  
> -def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
> +def test_mount_internal_external(emulator, builddir, internal=True):
>      img = os.path.join(builddir, "images", "rootfs.iso9660")
> -    if efi:
> -        efi_img = os.path.join(builddir, "images", "OVMF.fd")
> -        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
> -        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
> -        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
> -        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
> -        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
> -        # This workaround is needed only when efi=True since it imply EDK2 is used.
> -        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
> -        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
> -        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
> -        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img, "-fw_cfg", qemu_fw_cfg])
> -    else:
> -        emulator.boot(arch="i386", options=["-cdrom", img])
> +    emulator.boot(arch="i386", options=["-cdrom", img])
>      emulator.login()
>  
>      if internal:
> @@ -114,68 +101,6 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
>          self.assertEqual(exit_code, 0)
>  
>  
> -class TestIso9660Grub2EFI(infra.basetest.BRTest):
> -    config = BASIC_CONFIG + \
> -        """
> -        BR2_TARGET_ROOTFS_ISO9660=y
> -        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
> -        BR2_TARGET_GRUB2=y
> -        BR2_TARGET_GRUB2_I386_EFI=y
> -        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat part_msdos part_gpt normal iso9660"
> -        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
> -        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -        BR2_TARGET_EDK2=y
> -        """.format(infra.filepath("conf/grub2-efi.cfg"),
> -                   infra.filepath("conf/grub2.cfg"))
> -
> -    def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> -                                                 self.builddir, internal=True,
> -                                                 efi=True)
> -        self.assertEqual(exit_code, 0)
> -
> -        exit_code = test_touch_file(self.emulator)
> -        self.assertEqual(exit_code, 0)
> -
> -
> -class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
> -    config = BASIC_CONFIG + \
> -        """
> -        BR2_TARGET_ROOTFS_ISO9660=y
> -        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
> -        BR2_TARGET_GRUB2=y
> -        BR2_TARGET_GRUB2_I386_PC=y
> -        BR2_TARGET_GRUB2_I386_EFI=y
> -        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
> -        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 biosdisk"
> -        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
> -        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 efi_gop"
> -        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
> -        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -        BR2_TARGET_EDK2=y
> -        """.format(infra.filepath("conf/grub2-efi.cfg"),
> -                   infra.filepath("conf/grub2.cfg"))
> -
> -    def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> -                                                 self.builddir, internal=True,
> -                                                 efi=False)
> -        self.assertEqual(exit_code, 0)
> -
> -        exit_code = test_touch_file(self.emulator)
> -        self.assertEqual(exit_code, 0)
> -
> -        self.emulator.stop()
> -
> -        exit_code = test_mount_internal_external(self.emulator,
> -                                                 self.builddir, internal=True,
> -                                                 efi=True)
> -        self.assertEqual(exit_code, 0)
> -
> -        exit_code = test_touch_file(self.emulator)
> -        self.assertEqual(exit_code, 0)
> -
> -
>  #
>  # Syslinux
>  
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
