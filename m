Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C13F5513E
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F141A41A6F;
	Sun,  8 Mar 2026 10:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNwLnPtXqtdF; Sun,  8 Mar 2026 10:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E5641A77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772966850;
	bh=96mvwWkmpcPfh84Lrv8Jqz312jlFMQxeD9BEvwaWlNo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RhFw3OFwe4/OCAzzopiilUYNYAF+ZjShbTZeBATmPGyMmxJrvVhsehSGT0LFI7v4p
	 C7Fg+vyqgTmzkM9Aah/LeEN6c+gGWASDqjM+e95PLfj+46Uv3SHZBoY4qk5ZuXoByX
	 uo3bT54uN670HV8NqOXLGr6IVyhqBC0NROSxk1PDDA8AoshQbvkYKQjzTIlI4Z/KOO
	 Z5bB5csFp5u7r5b/UntDUon+U/lRcqYTWDppNITYfgKYuthfzunhQLcjTLXO1S52xS
	 iqyQKqkJUqeh851dzispOCkmjjA7trM9X4jdzrpKnvvhwNE8hl7zWavWQkzcdbtk6p
	 pTw9DZMjjHu4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5E5641A77;
	Sun,  8 Mar 2026 10:47:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9165223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF21440341
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGJut295ov5x for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0426340194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0426340194
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0426340194
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:47:27 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2aae4816912so70899225ad.2
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 03:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772966846; x=1773571646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsRVSgne+kOjGhVF7OC26F9+7jncAo+ML0m5voKRFsY=;
 b=Jhe1hOMXgZFx0vixetdSdytfVkyszVYQCTHuB1ZjLuI/kUixWZr35/i9SyOiZ5NXvo
 lgmuL6w4UXNEWzPFzWZK4QNjjLQ284rjLnA1RGe+tjYIGplTx+PneDTSDHXIEd1geKBg
 yQzAwIiGED19tBEwUQzPeI1YNAtd0+GjK35C0uR8ZmbynhEhm7PfhGKuJpoX4UVtHbao
 IKMjjJOuc7cgr/tN/MjNrvtB00svyrniCQxCHNAooEkF2OU5sXiZRGkIQ3HdYOdvM8YJ
 GDcq81cV5bCYmKRGIOk8TURbmIpRNcbjGihCjwRL8e8iD9An+iLiuv+PCuzDh0Y+KeVR
 7rjQ==
X-Gm-Message-State: AOJu0YxpAP2RiRxyTlx1j+ZNM9t37xrm6S7oKSwaYlOlKjmlNM8G6Mu7
 o2c0F5fmfPlOych96oGPoorAkjm8Yf5h3mw/K2WijJTUN5je7T4ki1Vkdc1dDA==
X-Gm-Gg: ATEYQzz967cjLXeOxJ+6G84vnKdbebnipEO/cbfB4IryTRw7HsGuopfBtdAI6Ooijnn
 waOzh14RmpITIqdm5Ce2vkqb4FIUPzEUfRkdGeWxIsXPgvQukaGeYpTgLZcsoRybMtmsNTg/8nW
 v7iIKdvJOsM6NMoA4c0e2pXor0PI0XCSZR58Fz/R7NczIt0V3zu8cjfbTaA3dd29gEFFgUFZki1
 qVqQggFMxNihv4j/Sj04eKd0kFhvo0WL4ZKIzu8Lw3I2rhn2f3BCeawGKTUGUBRDSgTLNfl3/7o
 +8YSJfU9Va1NtgAWH4Hus4XjYX/2K4ZKXK3ULHMk1lftrwauzAVFLmDusHZLAFh923OghJm3tFS
 1qM7juB/h2222p+fahaQXI76AwACTAuaOyguiYXyrSh4rB+uOmlVamxg2KyMGmx/AsmtQa16/5w
 nrv4p8v+VLJOUPdr7DCHWkuJLiQKH9R84rCPjJ0joY50A/Cw==
X-Received: by 2002:a17:903:1207:b0:2aa:d608:ec55 with SMTP id
 d9443c01a7336-2ae82444775mr78627095ad.28.1772966846509; 
 Sun, 08 Mar 2026 03:47:26 -0700 (PDT)
Received: from fedora ([2409:40e5:116b:3332:bcdc:5bdf:dbca:b2ec])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f74280sm75231625ad.53.2026.03.08.03.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 03:47:25 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  8 Mar 2026 16:16:59 +0530
Message-ID: <20260308104659.1118410-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772966846; x=1773571646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bsRVSgne+kOjGhVF7OC26F9+7jncAo+ML0m5voKRFsY=;
 b=J6k410yNAUVLvCWi05BYGxgU9ByScpF51Uz/Twj2Ha6EHMfVcNJgepOchxFh3SG2gG
 cBTx46w6sYnuJFqjDErVwUU6IpjArdrF682MReSYwswLHqHKWu+BuEFHWXiqz3+VT/qa
 ayQzawWUCm+pSfIDpkHnhl5T4xo4Hx/seckj8DS9jiI66MxsRra+FFHjJVeXMm9v3W9N
 uIVXnKT4wn7uG7RnbVQ1YWhPiTPYf6CqiG/cpNOXJZSiMZKUFDTq/UyxXvGnWVg1HX9V
 rSC6f4he+TYxAcec7pgUKr/xX9SBFRVrfquy1sCh/W/DrQnacyKeqX1CsErtyk6pEfok
 7hIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J6k410yN
Subject: [Buildroot] [PATCH] toolchain: add option to build
 statically-linked host toolchain
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

Add BR2_HOST_STATIC_LINK option to build core toolchain binaries
(gcc, binutils, toolchain-wrapper) as fully static executables.

This improves SDK portability across different host glibc versions.

Problem:
Buildroot SDKs use RPATH/$ORIGIN for relocatable libraries, but the
toolchain binaries still dynamically link against the build host's
glibc.

This limits SDK distribution to systems with equal or newer glibc.

Solution:
Static linking eliminates the host glibc dependency, enabling "build
once, run anywhere" SDK distribution.

Implementation:
- Config.in: Add BR2_HOST_STATIC_LINK option (default: n)
- pkg-autotools: Enable --enable-static for host packages when option set
- binutils/gcc: Inject -static into LDFLAGS and use --with-host-libstdcxx
  for static libstdc++/libgcc linking
- toolchain-wrapper: Build as static binary.

Tested on Fedora 43 with ARM toolchain; resulting SDK verified portable
to Debian chroot environments. Confirmed with ldd: "not a dynamic executable"

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Config.in                            |  9 +++++++++
 package/binutils/binutils.mk         |  5 +++++
 package/gcc/gcc.mk                   | 10 ++++++++++
 package/pkg-autotools.mk             |  2 +-
 support/dependencies/dependencies.sh | 15 +++++++++++++++
 toolchain/toolchain-wrapper.mk       |  1 +
 6 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d730f2034b..23a8ad6ac7 100644
--- a/Config.in
+++ b/Config.in
@@ -787,6 +787,15 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_HOST_STATIC_LINK
+	bool "Build host toolchain binaries statically"
+	help
+	  Build host-side toolchain binaries (gcc, binutils, etc.)
+	  statically. This makes the resulting toolchain/SDK more
+	  portable across different host Linux distributions by
+	  removing dependencies on the host's dynamic C library
+	  and other host libraries.
+
 config BR2_PER_PACKAGE_DIRECTORIES
 	bool "Use per-package directories (experimental)"
 	help
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f772c9cf9a..4f972e5e50 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -78,6 +78,11 @@ BINUTILS_CONF_ENV += MAKEINFO=true
 BINUTILS_MAKE_OPTS += MAKEINFO=true
 BINUTILS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MAKEINFO=true install
 HOST_BINUTILS_CONF_ENV += MAKEINFO=true
+
+ifeq ($(BR2_HOST_STATIC_LINK),y)
+HOST_BINUTILS_CONF_ENV += LDFLAGS="$(filter-out -Wl$(comma)-rpath%,$(HOST_LDFLAGS)) -static"
+endif
+
 HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true install
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ea96286c32..d486d03724 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -95,6 +95,11 @@ endif
 # for a modern makeinfo otherwise the configure scripts will still enable it.
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
+
+ifeq ($(BR2_HOST_STATIC_LINK),y)
+HOST_GCC_COMMON_CONF_ENV += LDFLAGS="$(filter-out -Wl$(comma)-rpath%,$(HOST_LDFLAGS)) -static"
+endif
+
 HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_prog_makeinfo_modern=no
 
@@ -259,6 +264,11 @@ ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
 
+ifeq ($(BR2_HOST_STATIC_LINK),y)
+HOST_GCC_COMMON_CONF_OPTS += \
+	--with-host-libstdcxx='-static-libstdc++ -static-libgcc'
+endif
+
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 16b21acb6d..9ae3793e06 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -208,7 +208,7 @@ define $(2)_CONFIGURE_CMDS
 		--prefix="$$(HOST_DIR)" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--localstatedir="$$(HOST_DIR)/var" \
-		--enable-shared --disable-static \
+		--enable-shared $$(if $$(BR2_HOST_STATIC_LINK),--enable-static,--disable-static) \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
 		--disable-doc \
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9c2aeaf23f..89065906e0 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -246,6 +246,21 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	fi
 fi
 
+if grep -q ^BR2_HOST_STATIC_LINK=y $BR2_CONFIG ; then
+	if ! echo 'int main(void) {return 0;}' | $CXXCOMPILER -static -x c++ - -o /dev/null > /dev/null 2>&1; then
+		echo
+		echo "Your Buildroot configuration requests building host toolchain"
+		echo "binaries statically, but your host compiler cannot link a"
+		echo "simple static program."
+		echo "Please install the static standard C and C++ libraries on your host:"
+		echo "- Debian/Ubuntu: libc6-dev, libstdc++-dev"
+		echo "- Fedora/RHEL: glibc-static, libstdc++-static"
+		echo "- Arch Linux: glibc, gcc-libs"
+		echo "- Alpine: libc-dev, libstdc++-dev"
+		exit 1
+	fi
+fi
+
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null 2>/dev/null; then
 		echo
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index cbf46f15fa..09aaa49c2e 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -85,6 +85,7 @@ endif
 
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
+		$(if $(BR2_HOST_STATIC_LINK),$(filter-out -Wl$(comma)-rpath%,$(HOST_LDFLAGS)) -static) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-wrapper.c \
 		-o $(@D)/toolchain-wrapper
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
