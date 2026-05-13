Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163FFCD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 20:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73B781216;
	Wed, 13 May 2026 20:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JKStpzj0f9s; Wed, 13 May 2026 20:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8560811F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778703820;
	bh=Ii4/cdqV98V2cuFAnLlWi+YqZ9ZbTl7TCk+29OkbY8o=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mdxqP/lEDhMs+4AswZjV2xZHcEP72KivoaJetwbxnzCvLNy+BhAgnNGaAkVjRtqXs
	 ke8Vvam4Iq6zhXi6WDaB0DPoIWt7EkNflfSiGwJU/ilBHnF1zit5zdoTfEXIIiLqkg
	 YVKnpG6hhWhdM/rOSZ8Pt+B7BocZZ9vcAOsMC2JPB0gKDjibbObVJtvZ8ueEpoxZqL
	 la4gfY3AI4Gss/bvoKqAUF7BWcEm1gHA5WgMV2lAdNzyEq2n8J/iokOfNawZB6TgHy
	 tplVQVNbHWMSSffH5v9zufOPowtK1Q13QcAJybGi2fYCE+UiE1jgtjwRwbyplD3njt
	 NuoFkbW7KMiwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8560811F6;
	Wed, 13 May 2026 20:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F22E6270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 20:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D457B40A0F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 20:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_YT6sp9bdKO for <buildroot@buildroot.org>;
 Wed, 13 May 2026 20:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DE0240A0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE0240A0E
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DE0240A0E
 for <buildroot@buildroot.org>; Wed, 13 May 2026 20:23:36 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c70e27e2b74so3053411a12.0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 13:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778703816; x=1779308616;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mphbcLZpIc0gBnhO33tlOmuMDhdCGsPcnkfX+3Kc14=;
 b=Y79v6LvMhHI90vipYxEu7lkl9+NGxSag7VYLrGBAD1/gUbjrAwY5HwGmERxPJH1Hpi
 OJDTsT0exPo/H0cPtyI3Fe8f58yeT6+LPDcRY0Chxqg6l3bkYtDTWpfQukOPr09sbv9G
 LO5LT4AHPSa5Lk+Qg5TvfDdmT1U7Iu0Zc1HObnhpz0C6TlVo5RtIEnZbUXEZqM0zoJVF
 x6ugixn20ExJ600DZaTshfU0YEmhatiOWDpCqxNlBJ1Poqf58LUy0xOiPdt/KAO9q8mi
 3Qe+C4RWsaPWcSxvTHBIoICqS0X0Mv6GBVLSk0dr4xLwTHEP4lerT/7Hi2N8iGTNOZqE
 MSXg==
X-Gm-Message-State: AOJu0YwRzKzLxWV5H81BCluhSIJQPL6nU3Zf3T3iF/xl7tPSNV8rvbpa
 3beVjhJPqQKg+sSzXjChBBqA7xGcVpGpv4vSxsjhRLMt12ms/TDHbw5eH7s6EE45osk=
X-Gm-Gg: Acq92OGErmLI66d1wnSo+ANNVLWytBzqBWOapwxF0WCt3wsxhKred+dsUPdd0pz2aa2
 3NB3fFEUktR8G9nNeU4NpWh1brC0DJy6ymhT9Iiou+ij63UqI+1NHKHs7CPIsNa69qW+t8wQEP0
 RWJRJdTLnbx02EYxUIBXMMkb3hKVIhp4HXAJDX6fZFtHCyyOvp2OUJiIR6If7yrzoqFtKWBbh1B
 VBQbSiQgcZWfmdW2gsnBaVdBjkGmzBbhDxe6n/zAiE49POJPfH4SGvew+Ne/gUsBDPX3xqFhW7B
 vPeviThQ2YYVWKJ5lA9eFVzUhEM5pPURqyM2oDIzfjcgx1p6dlhNKUvUGaNOStxv+1pwtOZ13Sb
 1jhqxvixQ2ktDDYtPItc4BeuXWIgUHzrTRDx4/SSanq4g/f4gSZnowSxWWHadpeHEcSxXVZRoFT
 gMLHRKj+r427W8PPV+Vco=
X-Received: by 2002:a05:6a20:5497:b0:398:bda8:d8cd with SMTP id
 adf61e73a8af0-3af7fb74ea0mr5188008637.7.1778703815669; 
 Wed, 13 May 2026 13:23:35 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb114c08sm99340a12.23.2026.05.13.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 13:23:35 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Wed, 13 May 2026 13:23:32 -0700
MIME-Version: 1.0
Message-Id: <20260513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WPzQ7CIBCEX8VwFlPor558D9MDSxfBpEWBErXpu
 1vqwfRg9jTZ2W9mJ+LRGfTktJuIw2i8scMi+H5HpBbDFanpFk14xqusZJw+sB9pZIxmaZqKg8q
 h5lKS5eTuUJnniru0X+1HuKEMiZEcytmeBu1Q/LAFL7bYyCijUIqyPuZNpTo8i8F25o0HaftEA
 eGRghOD1InSCx/QpYU2Plj3Wt+JLNX403yNqOsKQSmAXKhNRDvP8wc9wmzNGwEAAA==
X-Change-ID: 20260512-qemu-v11-0-0-0862bf3b72cc
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Fiona Klute <fiona.klute@gmx.de>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778703815; l=6143;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=dja+3wu2MUYdrHwlq8ecIKurv9gtnLl3zV8BixsOkbE=;
 b=IjE8R6oq5CFvEDNjdmH7Gjom349h9FulV4/zGJpM6AvWtlDO+xx3CgEW7Gnxw6pRsyq8gWp8u
 xtgvinyYMmYDgi6bGEYDMKXKS03ryG1y/1XHUrjxLslwEr3hB56kJHO
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778703816; x=1779308616; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/mphbcLZpIc0gBnhO33tlOmuMDhdCGsPcnkfX+3Kc14=;
 b=nX7ofc60edimMcr51FgKYF+tw937whHsjCcwsuMQzjcHgeVo/BSBbK5ZlEHDdxqb6N
 wjH6lxGH7ACi+7x4ZZ19lD0/lDdfVmkJ3+/cG9aAdRVu6COa5s2F5cKpYXjx0JFqoSm2
 THW3S9yTOMuIz+hlLJXBuoZ8iq40f9B6jIZRC3QQjKGBKjDDCM8vCX43tp8cKr/6+t7X
 BAcVNAlhZE5+D7VnowmkCEuvcUUSMk/JIecb2y3chI2oydEyNrQMyCcMdgne2lNNwHtC
 nPm/nzMnXzrRBC+rcSHvCRwb9qobLYOtGlJSNCRZjnqQFyLucYv26DU3ZGB7u/zUVXw/
 HxUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=nX7ofc60
Subject: [Buildroot] [PATCH v2] package/qemu: bump to version 11.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://wiki.qemu.org/ChangeLog/11.0

Note:
  - Support for all 32-bit host systems has been removed.
  - Support for microblazeel has been folded into the microblaze target

Qemu v11.0.0 drops 32-bit support for hosts, all qemu builds must now be
64-bit. Hosts running 64-bit qemu builds can still emulate 32-bit
targets.

Confusingly, the qemu package is also capable of being built and running
on buildroot hosts, and targets. In any case, qemu only supports running
on 64-bit hosts (which may be buildroot targets), so adjust
BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET to indicate no support for 32-bit
buildroot targets, and drop configs for architectures like BR2_arm that
are implicitly 32-bit only.

Separately, the qemu microblazeel target was removed with commit
46a25ae3f0e75e230c06e21435850b1cd1c44f07, as the microblaze (qemu)
target supports both endiannesses, so that's fixed up in the package
Makefile as well.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Changes in v2:
- Added Config.in comment documenting 64-bit requirement
- Expanded commit message to explain 32-bit removal [Baruch]
- Fixed build failure with microblazeel target
- Added legacy config for microblazeel
- Link to v1: https://patch.msgid.link/20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com

To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy       |  8 ++++++++
 package/qemu/Config.in | 12 ++----------
 package/qemu/qemu.hash |  2 +-
 package/qemu/qemu.mk   |  8 +++++---
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ead9ceaa08..1f42c1e68b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
+	bool "qemu target microblazeel removed"
+	select BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
+	select BR2_LEGACY
+	help
+	  Version 11.0.0 of qemu dropped support for microblazeel,
+	  which is now supported by the microblaze target.
+
 config BR2_KERNEL_HEADERS_6_19
 	bool "kernel headers version 6.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0b16c8c284..c79f115b7a 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,11 +1,9 @@
 config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
+	# qemu requires a 64-bit host
+	default n if !BR2_ARCH_IS_64
 	# Only tested on these architectures
 	default y if BR2_aarch64
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_i386
-	default y if BR2_mips
-	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
@@ -223,12 +221,6 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
 	help
 	  Xilinx MicroBlaze soft processor.
 
-config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
-	bool "microblazeel"
-	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
-	help
-	  Xilinx MicroBlaze EL soft processor.
-
 config BR2_PACKAGE_QEMU_TARGET_MIPS
 	bool "mips"
 	help
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index f8e750225f..7c7325a6ce 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
+sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b7007e3b98..ff4a83ed72 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.2.0
+QEMU_VERSION = 11.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
@@ -70,7 +70,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-softmmu
@@ -107,7 +106,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-linux-user
@@ -386,6 +384,7 @@ HOST_QEMU_DEPENDENCIES = \
 #       x86_64          x86_64
 #       m68k            m68k
 #       microblaze      microblaze
+#       microblazeel    microblaze
 #       mips            mips
 #       mipsel          mipsel
 #       mips64          mips64
@@ -416,6 +415,9 @@ endif
 ifeq ($(HOST_QEMU_ARCH),i686)
 HOST_QEMU_ARCH = i386
 endif
+ifeq ($(HOST_QEMU_ARCH),microblazeel)
+HOST_QEMU_ARCH = microblaze
+endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
 HOST_QEMU_ARCH = ppc
 endif

---
base-commit: 9684cb9b4406e01683a9b5136100d81040d56aa0
change-id: 20260512-qemu-v11-0-0-0862bf3b72cc

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
