Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19640CD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAF2283276;
	Thu, 14 May 2026 21:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJoneEnl-gOc; Thu, 14 May 2026 21:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3B7A83299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778793705;
	bh=lllnVMirwuCIsGkuNWV+ASe0zY70OK0tOfmq8Y0qPB4=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N2eh/jOcLraiHCcHpAF7YGFpVowmT2sqkJO9QfHmdFCYLIOMyJF87bhd08jrQqRzK
	 DIm34/hg69yEgNyA+fODS9/eEPyRPC7BnSmfSob/USHXaAInyX6r40+nEOfHzflNdZ
	 1JHTAgireI7SWcdkbITGbt9jxLU2xkZx5dZGE0YZXFK0vQ/TglltdKuQjySrfkoATd
	 TzQU61y3iM4qKUUQ5eTk3yfWvfW8x/89E3uiQmduPShp0doe3IXxxbTQGwlaQpSKpA
	 qN4b3DiXk5aBNaPqF+S6G61ydpMP5UovB6q4RBOsoaq3nmxrRCZhbZyezT+EAy7KMJ
	 ULHDtq99/9crg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B7A83299;
	Thu, 14 May 2026 21:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C518336F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B604A83276
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmkZhlFNAlyp for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9156F83147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9156F83147
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9156F83147
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:21:42 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-43587e63a8eso3491547fac.0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778793701; x=1779398501;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqUFX6cDYafrAsCUWcGI26gdq+Yrk77Z3mB84LpMaUY=;
 b=aEM6TkEXHgmrLkHDQbsYqp7Gh6ixnC7G9OFQ0GEYikwd3cGWr8Z5t7/ggabrkbAioY
 ZNMjh7IeUQnbgwOo9ADYFz2yXsKe+n6+9TeYFwkw+6IdLj8maTZ6T1cbqcOTQTBaVRJp
 OjwtgN8zTawehUYCdNVvMwsK8Dj8s/3+gAQeF4UW4BAu8C3QYGPdBnnTx2PuwpY9znd5
 eldNH/3lOU7nGq+D/8dEO0vZ/79i49p0LM7BPdtAHiLeZrf/BTHnrN+kl/SW1HTwyj83
 LuKQi7Jqbssg4IVZe1t/1rT13J6m6jFXg6mda49PCTTEQl5LLrpo4KZj2B5mV2+FYteE
 X3yg==
X-Gm-Message-State: AOJu0Yx2xQmv/q1AaC2DkLoLx8XcI72Qh6Ly3VkHS7bBdm3kNI4mBbY6
 94j8O61eba/n3b0/ahrOMaJy26qIfpiWF98Z4bVPq3U86borjoe3xUZcJ9BudYQ4sEe9JJrPeiR
 W65IA
X-Gm-Gg: Acq92OFbjwI131rOhHqezOBkLZX1ao3PPvdEepHWrzgIN4II8k6d1tV81MzfoTNmVfx
 tGVseE6ky4L/SGiY9hI/+jMR7rnMnOj1PREfK3+t1CYl6Mj0SzkhLXZQuG62iwMVEfd3lzeJPu3
 CjeIXAvGxEfJJl9pbS09Y4dLvX2/Xl5IdhYK5Akxb7OyWBgsgGNL/Ab5vj2msamGkSGkFqAZAkc
 PGdVoEXKqtZfEoHGzD2FXQdt5js0sOmC9S/awwuQkfHi5xL93O5gADdK3pMFNvtPwZ65iwEWUy3
 jnjhPzPpQUynUsk3HB++UI++/dsbYMIzG7ApdbG2yhNL9pBtzyQzlmvTOMdP49a+fmyRTA/fa0s
 EYznl1BvBDmT8aMT6DZBcLf+AvrZsuKtPTs16xvLVzDqDUw3Jl/o3pOOfrJwoz3sGItUazqZtPg
 gCFxX2ubUTdLR1MTZBjaY=
X-Received: by 2002:a17:903:1a4e:b0:2ba:4f37:d3a7 with SMTP id
 d9443c01a7336-2bd7e9771e3mr10445695ad.27.1778791584838; 
 Thu, 14 May 2026 13:46:24 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5bd5fe67sm37031005ad.3.2026.05.14.13.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 13:46:24 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 13:46:21 -0700
MIME-Version: 1.0
Message-Id: <20260514-qemu-v11-0-0-v3-1-e64cbadaa8e5@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WPza7CIBBGX8WwvpgyWFpd+R7GBUMHy01aFCrxJ
 313S114exMzqy/DOfPxZJGCo8h2qycLlFx0vp+C/Fkx0+r+RNw1U2ZQgCpKAfxC3ZUnIXiRp1a
 AVmIFxrAJOQey7jbrDsd3jlf8JTNkR35hg+/40AbSH+0GNkttElxwLHVZbWWtbEN73fvGPWhtf
 JctqCNxDLo3bbZ0Og4U8qJ1cfDhPn8niVzjS/P5RFUpQmsRpbaLE7l7gr+4/IfDhDcEVJM0Za2
 2S3wcxxekIlnqWgEAAA==
X-Change-ID: 20260512-qemu-v11-0-0-0862bf3b72cc
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Fiona Klute <fiona.klute@gmx.de>, 
 Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778791584; l=7389;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=ydGtw/+l3FV8gPkeBgjufJSrEWl/nX8SiVDqzAESHLU=;
 b=n2Wi0rbxq+a5QCsjvc0545WCEDMG87Tyq5v28U+mMSmmPyGBt9tWnv+xkBd8jGgR40UcshocH
 jMYTz8KgiTxBOh7MYP3QFtuCDBpBJmnS9497DPlUJLISvTbrQJoSgsb
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778793701; x=1779398501; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gqUFX6cDYafrAsCUWcGI26gdq+Yrk77Z3mB84LpMaUY=;
 b=MPMqdNXI7vnVFF21eGIQOafyV66GwrBTKHrUV+Ogcu9RZ4exo8M8wlhAtpUZrq2D81
 P5IQQ70lDkp+6y1xj7w7iCYEsHsNpRd2RxRS0nXDkPU3PCOmJZIpDASZgffexAerrfK3
 +lVXk5QekaTPulTIqVg50OvKBzZxoxvjLpA8vwOmH7qMMU7aiXtdwuzdQr7zpbEys75T
 lLHXut+farshJmuVkNY62ov6sh7J89dZ+ALEeOkgVKqMUwSEop91BezFn62jAwiaeZR8
 lDOi0SToFkaHvRlcBmxBZJUSWW9PwNL0Ato1/FHRs6YeDNfmtuDH4XFt2niBuiOuyStS
 KqjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=MPMqdNXI
Subject: [Buildroot] [PATCH v3] package/qemu: bump to version 11.0.0
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
Changes in v3:
- Update Config.in to properly filter out 32-bit builds [Romain]
- Disable downloads from PyPI [Romain]
- Add dependencies for host-python-setuptools and host-python-wheel
- Reword legacy config to clarify that microblazeel is not dropped
  [Romain]
- Link to v2: https://patch.msgid.link/20260513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com

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
 package/qemu/Config.in | 12 +-----------
 package/qemu/qemu.hash |  2 +-
 package/qemu/qemu.mk   | 15 ++++++++++++---
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ead9ceaa08..90606ebd4b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
+	bool "qemu target microblazeel removed"
+	select BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
+	select BR2_LEGACY
+	help
+	  Version 11.0.0 of qemu folded microblazeel support into
+	  the microblaze target.
+
 config BR2_KERNEL_HEADERS_6_19
 	bool "kernel headers version 6.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0b16c8c284..2a6aa288d3 100644
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
+	default y if BR2_RISCV_64
 	default y if BR2_s390x
 	default y if BR2_x86_64
 
@@ -223,12 +219,6 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
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
index b7007e3b98..fc59d3c858 100644
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
 
@@ -70,7 +72,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-softmmu
@@ -107,7 +108,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-linux-user
@@ -318,6 +318,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-curses \
 			--disable-dbus-display \
 			--disable-docs \
+			--disable-download \
 			--disable-dsound \
 			--disable-hvf \
 			--disable-jack \
@@ -372,6 +373,8 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	host-python-distlib \
+	host-python-setuptools \
+	host-python-wheel \
 	host-slirp \
 	host-zlib
 
@@ -386,6 +389,7 @@ HOST_QEMU_DEPENDENCIES = \
 #       x86_64          x86_64
 #       m68k            m68k
 #       microblaze      microblaze
+#       microblazeel    microblaze
 #       mips            mips
 #       mipsel          mipsel
 #       mips64          mips64
@@ -416,6 +420,10 @@ endif
 ifeq ($(HOST_QEMU_ARCH),i686)
 HOST_QEMU_ARCH = i386
 endif
+ifeq ($(HOST_QEMU_ARCH),microblazeel)
+# since v11.0.0, microblazeel emulation is provided by the microblaze target
+HOST_QEMU_ARCH = microblaze
+endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
 HOST_QEMU_ARCH = ppc
 endif
@@ -508,6 +516,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-curl \
 		--disable-dbus-display \
 		--disable-docs \
+		--disable-download \
 		--disable-dsound \
 		--disable-jack \
 		--disable-libssh \

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
