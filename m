Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E44BEFCBD4
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A703B60F6C;
	Mon, 16 Mar 2026 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAAq3Sh-_zAJ; Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DC5260F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773649533;
	bh=k4hQ/BP738/oMUIBy+itvYLbQcNZfq/tQg+t5DqiNlQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I3mU5LcECK++sefx7Jwy6ji+gEt0CZyV1qq/jTf29YwOMUmfNpsE7dKgUT2m+88Qx
	 Hga2NqSQIGh2vVYQz1NGKuxog8mfOApYz3QSZZQcRA6oNrhJG1n5HHLqj9zpKHoFjT
	 KrpC+m0QbRvc11AcKUg1OR0C8x+BmE2ki8j+oe/fwLlwEQ1dKvZorZij2uVH5UdIoA
	 qbOqlhJg+jO9ZuYTf4hxndc9QxTdugJD7/Csez2JmFtOWaxbufT+WO4EcrEGuwJQcw
	 JtdTFVXlm6ESZgBMhFl5NxOglzK/x2dVfp9ouO+UOTUv4UXaR62Y2Lv/75fOSWRpnB
	 rhl0DcF1yFBLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DC5260F29;
	Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BC2AD3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA9140B16
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmbPu0MLy0S5 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BD3F40AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BD3F40AC6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BD3F40AC6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43b40003d13so766640f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773649528; x=1774254328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7XT/VSSukFLbZ04/02jtqbpnsMatY5qFxYupdek9oWI=;
 b=YZGdFYgLKWu1ALYmqiPfKKoat2j4YZ0YBXXrvkihKuC6g/IcDQeeEFsxKZX6GDxpd+
 hZBYyu2H1KPJ8gC5bcA3igHtwALr0yf/4/cKc+LC2Gdk3S1yuTIkeIMVBP6h/PaI2MZb
 j743lCCL02bflcx13arP5/kjuXxuKv+4oBexahwHcTM08Y9iPfzNeMiSqIkqpLc5TEbj
 Q4fnr0vQIW57aFdm2HU0ztNarNgaTF6Cj0fsDwYD114iU7/qTgGLUfY7s218d5hBMpTz
 meJVKGajiVr+Q/NZY93cjdcZ4Cd7ODKYPhugImzGEpYpGNK15M9rv+lZunjev13bHfnN
 GbMw==
X-Gm-Message-State: AOJu0Yypw79lsnuNAKd4TKrxXAdVeSGKk0GK388+PVnY+JdcLd5BLodd
 t1f4jh9yzjRVPO9K2SMCqc/St1svOYBcLRM5fDUecsPQkrv1NM6/MdFSSrjwNkQOTDxVOL7qC5Z
 0EwHM
X-Gm-Gg: ATEYQzyjHNXnk103J6KmJd2h2Z+XXpP+L0PthKcA1A5eWBiFENpLw4dSII8ZMph4y4w
 pX6xFaV5Y9q5jACBUWva3LnjHfz0Rq0UIuAPmh7U0tEFW2sHm+JAXSHKVDlFw/uQ7c/nUdHi6Gu
 EXYQS1voiLKCEQg/J6BgxjgpkNOvuOzZ5ztF71XUCAcJ1AENU9FB9sQ42zq63aQrA0sgWRlOES9
 +hKUrfOhwyu+TeRzSruyGtBIuhGGc226sggB+lUE2Y4PhEphf8onsRn3S2+Cj0GdRCl3TXZSAkS
 bt3EOg4YW4z9SLms6nbudTMNKwzEc3F5L/22pjW5Ahc0J9owKJpYJEwS2Zxpdv9DwrS2F+FMV50
 L87l1zgzU3n83C4XWnuzwVcgdBEyNlfFht2OrOxWlS2tpRv50Hu+vbab/ZrnHp5XYqD4jCLWS6o
 OVux0TMc7HCKArRrwSWRcTeYeHCxqJWjnBcElNqQdp0+QuPeuzIJhFxeQYLIc1x+hL5BmcGZ8e4
 Afw/zQa5DW7UlQK3JDenw==
X-Received: by 2002:a05:6000:2010:b0:43b:3e34:7fe with SMTP id
 ffacd0b85a97d-43b3e3408a2mr8116354f8f.21.1773649528522; 
 Mon, 16 Mar 2026 01:25:28 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a72cdsm43151174f8f.9.2026.03.16.01.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:25:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon, 16 Mar 2026 09:24:51 +0100
Message-ID: <20260316082455.1392636-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
References: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773649528; x=1774254328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XT/VSSukFLbZ04/02jtqbpnsMatY5qFxYupdek9oWI=;
 b=ynoVWPXNacrBxom13/6NzdV2lCKMjhrLQcHgD8K4Sz4OiI5CCfMoWacxs+c0fAidTJ
 0QvwESyCciv7Y/+3OSXwJKpQoLttXIXfF3qmoZqjHqyafYb7huzWMRO1yrSu1UA3uOt/
 8Tc1ggFFfd04lJB1I9njhKvfvx5GwmMcNO/hQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ynoVWPXN
Subject: [Buildroot] [PATCH v3 2/6] package/rust-bin: add Rust sources
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rust-for-Linux requires the Rust standard library sources (e.g. core/lib.rs)
to enable CONFIG_RUST.

Download HOST_RUST_BIN_SOURCE_TARBALL and extract it.
rustc-<ver>-src.tar.xz is unpacked to rust-src then only the 'library/'
subtree from the source tarball is installed $(HOST_DIR)src/rust/.

The utils/update-rust script is also extended to generate the sha256 line for
rustc-<ver>-src.tar.xz in package/rust-bin/rust-bin.hash.

see
https://github.com/torvalds/linux/blob/master/Documentation/rust/quick-start.rst

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.hash |  2 ++
 package/rust-bin/rust-bin.mk   | 14 +++++++++++++-
 utils/update-rust              |  9 +++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7f9d2f6339..b49edb7580 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,6 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
+# From https://static.rust-lang.org/dist/rustc-1.88.0-src.tar.xz.sha256
+sha256  0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a6bf581cafb5414df4193e  rustc-1.88.0-src.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
 sha256  d5decc46123eb888f809f2ee3b118d13586a37ffad38afaefe56aa7139481d34  rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 37df1db566..d3d9e6a572 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -14,12 +14,13 @@ RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 HOST_RUST_BIN_PROVIDES = host-rustc
 
 HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
+HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(RUST_BIN_VERSION)-src.tar.xz
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
 HOST_RUST_BIN_STD_TARBALLS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
 endif
 
-HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL)
+HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL) $(HOST_RUST_BIN_STD_TARBALLS)
 HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUSTC_HOST_NAME)
 
 define HOST_RUST_BIN_LIBSTD_EXTRACT
@@ -62,4 +63,15 @@ endef
 
 HOST_RUST_BIN_POST_INSTALL_HOOKS += HOST_RUST_INSTALL_CARGO_CONFIG
 
+define HOST_RUST_BIN_EXTRACT_SRC_LIBRARY
+	mkdir -p $(@D)/rust-src
+	$(call suitable-extractor,$(HOST_RUST_BIN_SOURCE_TARBALL)) \
+		$(HOST_RUST_BIN_DL_DIR)/$(HOST_RUST_BIN_SOURCE_TARBALL) | \
+		$(TAR) -C $(@D)/rust-src --strip-components=1 $(TAR_OPTIONS) -
+	mkdir -p $(HOST_DIR)/src/rust
+	cp -a $(@D)/rust-src/library $(HOST_DIR)/src/rust
+endef
+
+HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_EXTRACT_SRC_LIBRARY
+
 $(eval $(host-generic-package))
diff --git a/utils/update-rust b/utils/update-rust
index 7db3feff9c..a1164db0d0 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -100,6 +100,15 @@ def gen_hash_file_src(hash_file, new_version):
 def gen_hash_file_bin(hash_file, new_version):
     with hash_file.open("w") as fd:
         fd.write("# Generated with utils/update-rust\n# Do not edit manually\n\n")
+        f_name = f"rustc-{new_version}-src.tar.xz"
+        print(f"\r\033[KUpdating {f_name}", end="")
+        h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
+        with urllib.request.urlopen(h_url) as r:
+            if r.status != 200:
+                raise RuntimeError(f"No hash for {f_name}. Has source been removed?")
+            # rstrip() content, and explicitly add the \n, in case
+            # a hash file does not have a trailing \n.
+            fd.write(f"# From {h_url}\nsha256  {r.read().decode().rstrip()}\n")
         for host in RUST_HOSTS:
             f_name = f"rust-{new_version}-{host}.tar.xz"
             print(f"\r\033[KUpdating {f_name}", end="")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
