Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837E4C87FD2
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD7E40930;
	Fri,  8 Aug 2025 13:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBASM3jW-4DK; Fri,  8 Aug 2025 13:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC9994087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC9994087B;
	Fri,  8 Aug 2025 13:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE39110A
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBF84405BB
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxVwi43u_OC8 for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 13:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86D9C4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86D9C4020C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86D9C4020C
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso14187305e9.2
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 06:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754659887; x=1755264687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5z3j9/jhNOIVcbEZ7QLk9aLRWzris+sNi156MbXM+k=;
 b=HJ75cEguNA8w4UDvb7hq+nZZUE5PUgmO1j9apEJl6y2NU6m+mUpnC9v4EK2H1esbfQ
 21pOnCWgvj6s28X+2/8Os9ak3nbqfATKqsKtP2QLBLBUAAZl2XiYnMwCN8lwOh1hjlPj
 2pUofSVbSvHT2foQK00p1sSptX6kgSAZO97UsBhvu4bsta/cYm6zEUBTqbEdNVnLB4lk
 BKraTlj5OaXX312/Wgvn/UXKGJQ8ZpFVObqf52APWMPM2ktzkPKNJXtShyOV9xAwP0I1
 fcTWTCyp2mDVW1kFruom795bCV7IKg1z4/+KbIOrQQnBnoxqEDTPujNcLEHZ00Vetz3/
 U49w==
X-Gm-Message-State: AOJu0YzmLc0whbUOiuZDUaU6oO/eRzYeR7JY6ardTCgbOGDBkjwlqWHA
 yuFrPzKjTGRhgBqe4iBE9Kp9Fm4PZcT9SCfNnWfrpQzQoSURDKXs4fT7KFWpg/iTGUVKG3qXmJ6
 2X7y4
X-Gm-Gg: ASbGncscRlf+fer2Biv4HmtDqnfREZeXLZAauQvpuZXJYjH/gSF4p3x/07vdfAeHn8+
 ZwVvfmogGgzPUnRgydM3TTOcEDOdaWSrCstlQHEMeh2pX7njYiYJOPVVlnFkxccdVXnA5pB3g6K
 J/xR6nRJK/JMw07b7d8yn/GM4X4GokaKKy1r43oiypQVL89fzGVU9+pb2z8IT6UXq5r0KQsBUbS
 gEd352D4TYYdS/jU8TLjl7suSiYcpjIVDkMomXdkoNlWlTS+TIkVfHGFQp9IQAV7UQVyyQr6PHB
 uhjnV+o3h0zBf9AnxizrMgeYLLlmSNVFFDKsHKZ1eQduif6IYYMfoa+8chlrd3jGNjoiheHFdAZ
 kRjIp7jxYWRZK9uVW178i6lvIHfmETMAYiNf9SA2pLmDsie9Gn+5X4lV9j7U3Hbra8jlfYhXGcl
 lFvYq2ADYcBNP2qWoS
X-Google-Smtp-Source: AGHT+IELRPjvsbjagIlkjMe9A4PU4Nyvw/jgFMRtlJEvSHsvY5C8BQtUJCUejvzFEjagapTxj+Tv8Q==
X-Received: by 2002:a05:600c:354d:b0:458:a7b6:c683 with SMTP id
 5b1f17b1804b1-459f4ea20d9mr24350295e9.1.1754659887179; 
 Fri, 08 Aug 2025 06:31:27 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm149053965e9.22.2025.08.08.06.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 06:31:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  8 Aug 2025 15:31:09 +0200
Message-ID: <20250808133112.3212687-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754659887; x=1755264687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5z3j9/jhNOIVcbEZ7QLk9aLRWzris+sNi156MbXM+k=;
 b=W8XhyS0uwcQRKzaDkoGzzgDttd2/7M8sai0tEYAxPrLVO5KtluP9Ule7//l1Vej5UT
 L7jlGTqHTGEhh4Dzb85nM1DKAY9v67+RekQKBAqqYhKNZcCG5MqqnZ88afDA6Dh/lEkT
 fYw0lir1epFaPd0ExxrW3NaXBu4315Xp4CEDM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=W8XhyS0u
Subject: [Buildroot] [RFC PATCH 2/5] package/rust-bin: add Rust sources
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
to enable CONFIG_RUST. This patch provides them in rust-bin while keeping the
prebuilt compiler tarball unchanged.

It adds HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(VER)-src.tar.xz to
HOST_RUST_BIN_EXTRA_DOWNLOADS, and splits extra downloads into
HOST_RUST_BIN_STD_TARBALLS (rust-std-*) and HOST_RUST_BIN_SOURCE_TARBALL so
extraction is controlled separately: rust-std-* are unpacked under $(@D)/std,
and rustc-<ver>-src.tar.xz is unpacked to rust-src then only the 'library/'
subtree from the source tarball is installed $(HOST_DIR)/lib/rustlib/src/rust/.

The utils/update-rust script is also extended to generate the sha256 line for
rustc-<ver>-src.tar.xz in package/rust-bin/rust-bin.hash.

see
https://github.com/torvalds/linux/blob/master/Documentation/rust/quick-start.rst

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.hash |  2 ++
 package/rust-bin/rust-bin.mk   | 18 ++++++++++++++++--
 utils/update-rust              |  9 +++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

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
index 215bd84ad3..2195584f8f 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -14,16 +14,19 @@ RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 HOST_RUST_BIN_PROVIDES = host-rustc
 
 HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
+HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(RUST_BIN_VERSION)-src.tar.xz
+HOST_RUST_BIN_STD_TARBALLS =
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+HOST_RUST_BIN_STD_TARBALLS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
 endif
 
+HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL) $(HOST_RUST_BIN_STD_TARBALLS)
 HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUSTC_HOST_NAME)
 
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
-	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
+	$(foreach f,$(HOST_RUST_BIN_STD_TARBALLS), \
 		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
@@ -61,4 +64,15 @@ endef
 
 HOST_RUST_BIN_POST_INSTALL_HOOKS += HOST_RUST_INSTALL_CARGO_CONFIG
 
+define HOST_RUST_BIN_EXTRACT_SRC_LIBRARY
+	mkdir -p $(@D)/rust-src
+	$(call suitable-extractor,$(HOST_RUST_BIN_SOURCE_TARBALL)) \
+	$(HOST_RUST_BIN_DL_DIR)/$(HOST_RUST_BIN_SOURCE_TARBALL) | \
+	$(TAR) -C $(@D)/rust-src --strip-components=1 $(TAR_OPTIONS) -
+	mkdir -p $(HOST_DIR)/lib/rustlib/src/rust
+	cp -a $(@D)/rust-src/library $(HOST_DIR)/lib/rustlib/src/rust/
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
