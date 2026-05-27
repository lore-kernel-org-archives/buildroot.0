Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B883CD5BDE
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 07:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA4081FD2;
	Wed, 27 May 2026 07:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GffAgR0wotY; Wed, 27 May 2026 07:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213D181FD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779865263;
	bh=T7Gkmb665+HIZLBycmEz4mLdKcU80f+4VxrLmuiWbiQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PzZKL+OqEy229gR/TCbsp3ijFBPMNmTGEUjLT9n1AF3GMSX96oEe1qra1TEjXAfCf
	 +zMhO4tUyWLWO0PuxPqBy/29rDZZuM8TxC5uoNosUqTr2Ekb/iL2qY0HFOUK5NVOP1
	 RJOLuwYA/R8dBWLjy95RP6+kfUMZU96ssaeFso9fhpa+LLp0I4PTjCEFI54N6gumFc
	 CC7+3Aa8nM1TFg+9tbE17QY828bP8HGTi5lDprO516aZM7gsXu0WJ0SBNJ1GnoJVeM
	 Jj7aRWgtbFp1FH/D4+6YHrS3iZbFAgXg4Ei1uUz9CcSR4ppQfXEZiO0Fnv6qxoWpcP
	 EvXfKnCgHHHvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213D181FD3;
	Wed, 27 May 2026 07:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 068B123F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 07:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC43D61334
 for <buildroot@buildroot.org>; Wed, 27 May 2026 07:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jR3CX7WVE2Dy for <buildroot@buildroot.org>;
 Wed, 27 May 2026 07:01:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D1D36106E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1D36106E
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D1D36106E
 for <buildroot@buildroot.org>; Wed, 27 May 2026 07:01:00 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8354461da74so5285361b3a.1
 for <buildroot@buildroot.org>; Wed, 27 May 2026 00:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779865259; x=1780470059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0Z5Jj/zih9ngxLGyigDGr9TtYvLvNXJVk6h5BHVPwA=;
 b=o2dL3PkywxrSUiTu5QejRRO9Nxfs2/YQVaWmFkPrkPhXO3cIGPsHJjBFV9hRD9azp+
 gpI3xaqiUD8SQILNCbHLonfd4VWBw9Jwkggs8COHwXclHQUTPy4KYhTZpdjSE6QHwcUu
 Vwq1YLEgpOo7DAWCdy169Z/B2ed+Um8czL5I47G1yyzsmielICmIkacgcBKhXIZfy2e2
 H2J6f2tUQB53W53TsPjq0nslnGrttHwTO5Hg3xm5sIUEFqxbYGlEEhMcyz/qm1/EBlnn
 MgJDlG/fG5umHHGq/Lfzn1sfAKBfIbuYYLpWxOEIES+56CryMPAvwmcVAFUWW7BUAVDC
 ToVA==
X-Gm-Message-State: AOJu0YyzzGayEO+ClXhHxlKVMo1/59X2WoaO0S2rjn0hGS/fQcJa1vrn
 Nk5y45xy9u01/Ardb53tllfvv3sh90Fb/Ub8k+k1LuraC3OCTkuxABBkFRjNBuRmtoY=
X-Gm-Gg: Acq92OGQH5HK7zrHyFKwbI1mnA7EnXv6zqSqh8+b3CDXW9DazLq93KbWTINCzr9r+UD
 hr+RfhBGc5pPoBxJ9Aw74WQOt7j57r+kUKwjaGQ1yuczdyD+z8cXRBeZJwCD1cvLkqvnl+85FU0
 V21V45iTxtxxaXGjUdtmfJbVfpNK8WU/m0FqIcpe/8RduRBwq3MDYigx6JmbtRvNZfbAyb4J3ES
 cim3VsmArynLhuc1e43EEVEl/4K7nZGXyLGc7W9mUbnNB+7pxR+fMDeuX7Zl2q2oNZld65AvFD0
 Jx2JyOuXC4R6cQdMLT+tGVdg3q6zpUi1jza6dtx0Pxcu1eI+XFB0U+5g7GiaklKXZhhqYPWJ5vW
 JQH9cjQTyX/JxyKxyfa3Y8uBb+pYPLnZS4zWKIBMLvdWZeEjE75rd+PqNSWJRkUbBpV5iGLTLja
 pjTQMpR0jb7/vzoIEyvjY9mocl6GWAdwBCURgzdtA16/g/9Kf3gOKlCyJUZnEGmbzbsrIKvw==
X-Received: by 2002:a05:6a00:2d8e:b0:82c:6bcc:f3fa with SMTP id
 d2e1a72fcca58-8415f5d8f6cmr21530788b3a.35.1779865259229; 
 Wed, 27 May 2026 00:00:59 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:1130:3626:6069:8aa9:97db:6e15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-841d6ed040asm1537213b3a.27.2026.05.27.00.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 00:00:58 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 May 2026 12:30:37 +0530
Message-ID: <20260527070041.1554793-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779865259; x=1780470059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N0Z5Jj/zih9ngxLGyigDGr9TtYvLvNXJVk6h5BHVPwA=;
 b=HsGg89W7XISD3xjzMS1JWz5t1nRlU4YDVQ7jmBHLltuEZTiioI8v6rsc3zHCkRLLTi
 DGo1N/XK9E5fX2Qn11ALGSa+1f3ouXL9hN2EKwjN4DNipQjvvM6UQOdycj9KT96JCIuH
 sOvwR6buw6cjGc/7sJw4yr5RDN0vC16k5zIce0sbG6gr4tgCMOOnTmUqUO+6M7zeqdVy
 sYFhfuUSIayRN3IB7YNiuBVMzj4PCtVw5TH34qtR0XipNAnjcag4E+XKbGDgb0fNBRJ3
 nk0Q6rbnz9Ale5CK++POyNM+wyUcwo2IBRZcN+1TADR6JFymDI25oBCif6lhHgrweVVU
 mGcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HsGg89W7
Subject: [Buildroot] [PATCH] package/qemu: bump to version 11.0.0
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

Changes include:
- Refined architecture support conditions for better target/host compatibility
- Removed support for 32-bit ARM, i386, MIPS targets (now 64-bit only where applicable)
- Added host architecture dependencies for QEMU tools
- New build dependencies: host-python-setuptools and host-python-wheel without these
  the build of host fails.
- Added --disable-download flag to prevent runtime downloads
- Fixed typo: BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT to BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS

For upstream release notes, see:
- https://wiki.qemu.org/ChangeLog/11.0

Tested using:
- ./utils/test-pkg -p qemu -a

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/qemu/Config.in      | 6 +-----
 package/qemu/Config.in.host | 8 +++++++-
 package/qemu/qemu.hash      | 2 +-
 package/qemu/qemu.mk        | 7 ++++++-
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0b16c8c284..4469ba6340 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -2,13 +2,9 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
 	default y if BR2_aarch64
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_i386
-	default y if BR2_mips
-	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
-	default y if BR2_riscv
+	default y if BR2_riscv && BR2_ARCH_IS_64
 	default y if BR2_s390x
 	default y if BR2_x86_64
 
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c7dd5876e5..c72f418668 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -24,12 +24,18 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64" || \
+		BR2_HOSTARCH = "powerpc64le" || BR2_HOSTARCH = "s390x" || \
+		BR2_HOSTARCH = "loongarch64" || BR2_HOSTARCH = "riscv64"
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_mips64
 	default y if BR2_mips64el
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64" || \
+		BR2_HOSTARCH = "powerpc64le" || BR2_HOSTARCH = "s390x" || \
+		BR2_HOSTARCH = "loongarch64" || BR2_HOSTARCH = "riscv64"
 
 config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	bool
@@ -37,7 +43,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
 comment "host-qemu needs a host gcc >= 8"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
-		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_HOST_QEMU
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
index b7007e3b98..8999e33f87 100644
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
@@ -28,6 +28,8 @@ QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	host-python-distlib \
+	host-python-setuptools \
+	host-python-wheel \
 	libglib2 \
 	zlib
 
@@ -372,6 +374,8 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	host-python-distlib \
+	host-python-setuptools \
+	host-python-wheel \
 	host-slirp \
 	host-zlib
 
@@ -528,6 +532,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--enable-slirp \
 		--enable-tools \
 		--disable-guest-agent \
+		--disable-download \
 		$(HOST_QEMU_OPTS)
 endef
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
