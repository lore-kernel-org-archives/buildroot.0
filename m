Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C020C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B43D540C21;
	Mon, 25 Jul 2022 15:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43D540C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oToVH2YcBbaM; Mon, 25 Jul 2022 15:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3A2E40CE5;
	Mon, 25 Jul 2022 15:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A2E40CE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA1221BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8375A408BC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8375A408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxCQuNtkom3K for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:36:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 283F7400AB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 283F7400AB
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:36:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d13so8861442wrn.10
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qmu0p7a6nRpzUzTBoCaHU4PzpwgPgw+nzzy4wd/7yck=;
 b=6h7cDgMsdndpuLDf8IHvE1OX5IU14xpdQrWSE+4za7Bct9wadiO24F91yn+NDfVQWf
 5bJU0en3N1W/IkFzMKAGmB5nwp9X8fm0HwGxWefBS1aZqgGRwtG3MI0a+ArmtzYnNXoT
 HYNI14TnzxhePJQPm3q62fW6wdEJI2Xjy+jQLZPhYNJ+ZS7LgYj5HnaV2E4Yy5zydtbz
 Tucp/48HPRzu8ytgW2382qtdX3PSCSQo0OxkIq42ZlT6IBzrHbJXrFfjdocMHx96Rdh5
 GiYkkg0kzW2vPzsBL3AjRDyej0dIj2HF5HBRD/mhSW5jbv0g0+alVKUo4X6NnumnfAev
 tItw==
X-Gm-Message-State: AJIora8coHRaiZQ6A6Z0Fq0x5RoWxNH+I7LkxdnbCrLDl9tHKCPhCoyE
 6M8IbTz/gwnNiuDj16d57xDmnjuLnAznhA==
X-Google-Smtp-Source: AGRyM1svzvsJem/gQJnaEvdr3moNEprLNwVT+r7uif3eBFaF1ztWdbJWJ2CWqygck2RAq++6VwuKWg==
X-Received: by 2002:adf:d1e2:0:b0:21d:bca6:2371 with SMTP id
 g2-20020adfd1e2000000b0021dbca62371mr7888613wrd.315.1658763363915; 
 Mon, 25 Jul 2022 08:36:03 -0700 (PDT)
Received: from P-NTS-Evian.home ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003a2c7bf0497sm14893857wmo.16.2022.07.25.08.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:36:03 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 17:36:01 +0200
Message-Id: <20220725153601.25254-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qmu0p7a6nRpzUzTBoCaHU4PzpwgPgw+nzzy4wd/7yck=;
 b=DTD95GK7a1sKhyCQnQwOb+8ZxNT0geiztIV5DUkWdzVcqBLZaprrQYGgBMHc271wph
 wp+h1Q8OlJl1MKkf08befHx+UkT7oyhLAK5JMYqMwi9qzk1sChMibwg/0PwKOjX5330N
 0tQpfsBVMTJoXr+3YtBsu35VOgwmLbaYcMyF4Iim7b+b5c2ny59QkZzSVEE5rWGwGXbT
 7UZV4hctS3viQoln2lZotHFDpKom3X++QyUOMCe+Sr7JcxQtE7odzyp+iptoOKiKQE2O
 WcXCp9Feh0wFKkhOumVWnCsxy3IjT8EH3cnpEPzEEX/OlF5S98nGSm3KaiD+7CZJGxyY
 QLRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DTD95GK7
Subject: [Buildroot] [PATCH] package/rustc: needs C++
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building host-rust with a musl based toolchain without C++ compiler,
the build fail since libunwind bundled in rust sources needs a C++ compiler.

cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system

Note: the issues can't be reproduced with a glibc based toolchain without
C++ probaly due to extra steps required to support musl libc.

Actually, rust compiler is based on LLVM so it likely depends on the same
dependencies as host-llvm package.

Add C++ dependency to rustc virtual package and its reverse dependencies.

Fixes:
http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/bat/Config.in             | 4 ++++
 package/hyperfine/Config.in       | 4 ++++
 package/librsvg/Config.in         | 2 +-
 package/ripgrep/Config.in         | 4 ++++
 package/rustc/Config.in.host      | 4 ++++
 package/sentry-cli/Config.in.host | 4 ++++
 package/suricata/Config.in        | 5 +++--
 7 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/package/bat/Config.in b/package/bat/Config.in
index 515eaf591a..8b95f253ad 100644
--- a/package/bat/Config.in
+++ b/package/bat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BAT
 	bool "bat"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
 	select BR2_PACKAGE_HOST_RUSTC
 	# we need a full version of less
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -9,3 +10,6 @@ config BR2_PACKAGE_BAT
 	  A cat(1) clone with syntax highlighting and Git integration.
 
 	  https://github.com/sharkdp/bat
+
+comment "bat needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/hyperfine/Config.in b/package/hyperfine/Config.in
index 527e978146..c052ba8242 100644
--- a/package/hyperfine/Config.in
+++ b/package/hyperfine/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HYPERFINE
 	bool "hyperfine"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  hyperfine is a benchmark tool written in Rust. It evaluates
@@ -9,3 +10,6 @@ config BR2_PACKAGE_HYPERFINE
 	  same time.
 
 	  https://github.com/sharkdp/hyperfine
+
+comment "hyperfine needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 270b524b37..91a8d4fe95 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_INSTALL_LIBSTDCPP # pango, host-rustc
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
index 0ea2902b34..352f38a9a4 100644
--- a/package/ripgrep/Config.in
+++ b/package/ripgrep/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RIPGREP
 	bool "ripgrep"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  ripgrep is a line-oriented search tool that
@@ -12,3 +13,6 @@ config BR2_PACKAGE_RIPGREP
 	  The Silver Searcher, ack and grep.
 
 	  https://github.com/BurntSushi/ripgrep
+
+comment "ripgrep needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index fec8726aee..1aa5405abf 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -135,11 +135,15 @@ config BR2_PACKAGE_HOST_RUSTC_ABI
 config BR2_PACKAGE_HOST_RUSTC
 	bool "host rustc"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # llvm
 	help
 	  Compiler for the Rust language
 
 	  http://www.rust-lang.org
 
+comment "host-rustc needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 if BR2_PACKAGE_HOST_RUSTC
 
 choice
diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
index 3124015367..d32c962338 100644
--- a/package/sentry-cli/Config.in.host
+++ b/package/sentry-cli/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_SENTRY_CLI
 	bool "host sentry-cli"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  Official Sentry command line interface
@@ -8,3 +9,6 @@ config BR2_PACKAGE_HOST_SENTRY_CLI
 	  For managing debug information files and source maps.
 
 	  https://docs.sentry.io/cli/
+
+comment "host sentry-cli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/suricata/Config.in b/package/suricata/Config.in
index 5f7eb21da0..cdeba3f103 100644
--- a/package/suricata/Config.in
+++ b/package/suricata/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SURICATA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBHTP
@@ -20,7 +21,7 @@ config BR2_PACKAGE_SURICATA
 
 	  https://suricata-ids.org
 
-comment "suricata needs a toolchain w/ wchar, threads"
+comment "suricata needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
