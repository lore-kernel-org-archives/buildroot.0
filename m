Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A1E107BCCB
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E534095B;
	Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ee1nbFxpzPGM; Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADB440944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773418750;
	bh=k4hQ/BP738/oMUIBy+itvYLbQcNZfq/tQg+t5DqiNlQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nk4/Ki9rNT012vsGTnkahcYMJ8X4PJuc8uhlB48r1JcYGpfjJbQUCSXAfetCXYhWZ
	 KO3zhTMQ6+ISlCKmKM3dZ1dRso41D8/ci9Spn2gYLWcvh8owjc4FhLzSIZtxlFJMBg
	 6QLuXvo8SPlQ0Y1aDcOYtDxzjQs1R68/hdUqs7uK6gxsSxYmG3oHVfK54CKOEmwSxy
	 AiiNqeMXygo6a7AkkWrQsm1y0PEav3V9NwIJRi4pRlptPqf2S81pOUKqSFF1hbyeGK
	 hw1CkJ+FN5wBnP8U6NLS5BqUN84KopYkyCUuJkDD+hp4fiQF1JNCHUvi8VstF9Lh0G
	 D2snAyb3y8D+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADB440944;
	Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E585201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FDB340941
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJT09nb2DG9x for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 16:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E4654093C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4654093C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E4654093C
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48534237460so25798055e9.3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 09:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418745; x=1774023545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7XT/VSSukFLbZ04/02jtqbpnsMatY5qFxYupdek9oWI=;
 b=khwhqhs0qndiVsCQ3rwP3JZkxSNE+OAVSf+1eUeCUShp14oyEsslBBmQ4GYukkuwdU
 qx2tuekTLqy4gbko3PDH6kGfqTrns9gfxzu/nZQbBts7K/v4/Y3nKZxtQfQvTfYbzfZT
 3I9oTOl7x88kbXGDcNSFBfhFOrPKNGHDzJ0spYBQN0dLuODnAOQ4XxqDoFNfozbdAPle
 NgYeluuzoC9d5ElFh14fHWCnTRNdLX28/aajjsH15fjE3CoeCHkZ4C3/JZ50yK24+DdA
 LdkGBE8scoeKQoarvhP/8aBygbPeXWUDBVBCYRDHnXcnABe47fY8axk3xznOypKzTLjU
 5SWg==
X-Gm-Message-State: AOJu0YxCB/PRAHslSuix9lRiuOWWWG2buv/0+qsOD/3QmdDHr0vGM+CZ
 NaG9f/a19hLkjBk1ztIBX19KT9ttepOWBeRZZS0X2S34710MLUuvUcOf5ruu0zmGAuFCe95vVIK
 4SYjj
X-Gm-Gg: ATEYQzykhoG7r68r9WO1KIJXTn2omv8gcIDcWHs2dMgvYtCqKnA8f7sObphxel2C6uM
 6ZIjzw5MNVun1TohUVFHz1I44toXkXi/OaCFp+lFOOt4tLdv2kYj6dNsco0C4I7qBqM/duxepqY
 1j1vOD3mM7DR5dgXPPEZdHaCtud7HVmDPZveSZwJvLq1NGmuMv9MBvnmyRsdq6eJLw/fL6WgXXG
 46BGr+QdrcwfFzZ1RxCIWTxjpKBfA7VnfpyEWZzdnkA9q4z55oMR6TpWcVZ+i7Qpaxykr/CF0/T
 Hv2ONLVmJsuQOHSHDHQVNC4Q9ljpXmbYci7Ol51IXcoM1RXbXZpEKdJuL9h3krbbjKroZyLeTMu
 ctje9TA752A2lLrf0iVE7ZqgXk7R79uJ+VzM3w18hkzgoup+F+6KC2LCv2T3TfxqHO2z5FxU3yB
 w/Pzs0PYHCwh8NvIM9tM/6RjdLEOy7b2/9ROdncdPv7B9X8xNeeqF1G3Fgi/c9hgMuvVSMykBza
 38cpacELQj5Ruv4fCJaAw==
X-Received: by 2002:a05:600c:5395:b0:485:2fe9:3375 with SMTP id
 5b1f17b1804b1-485566d656cmr60124255e9.15.1773418744606; 
 Fri, 13 Mar 2026 09:19:04 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm215503345e9.4.2026.03.13.09.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:19:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 13 Mar 2026 17:18:21 +0100
Message-ID: <20260313161825.1224877-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773418745; x=1774023545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XT/VSSukFLbZ04/02jtqbpnsMatY5qFxYupdek9oWI=;
 b=I4PJ0T2ymWL4e1WwhVsSnEKh0md868HngP7M9im4wUaw4nlwtbSeYZ6J0xqb1PselB
 FuGfVoX1tPvHhonr7I4io1ZSKrTd4Z3RRmil7gC/EyPpvAOCgqAWLjpvH6wmUPzp7lFt
 UqlUbGQCzKFY2x2y7Y9Xp9a2mNMWYjyCIG3Ks=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=I4PJ0T2y
Subject: [Buildroot] [PATCH v2 2/6] package/rust-bin: add Rust sources
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
