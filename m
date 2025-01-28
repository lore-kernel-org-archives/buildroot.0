Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FB5C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 23:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A3281239;
	Tue, 28 Jan 2025 23:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRLLLMWk0VX4; Tue, 28 Jan 2025 23:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FAF811F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78FAF811F3;
	Tue, 28 Jan 2025 23:59:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88EE6AF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6604181217
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emGVJ6eks9N8 for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 23:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13334811F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13334811F3
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13334811F3
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:59:44 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3cfdf302014so25367815ab.3
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 15:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738108784; x=1738713584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3nDtYpCQrFT2SsI0zg3ZB4uttb55NvxjjNZ5A/12z8=;
 b=AaseClTZE4agdhGE7WahXdcjcNGIF4WOKF1jPK97tQDI4HuC/EqT2Nn17sZ+RzIA6c
 aNZedGUWaDr+7c/XFTvNgU/Zwt0JZntROW89Ew1NSHIo2neQC3c1rwCub2GPfAQxk0fD
 reFOpsvB7c95VKZruwgkX4HekCegNv9V5IXz0WduvhTSja0pxGKUj9Iqr88AIESZ3oB0
 xYY0PpElnOQBYAq4pg7A+B7FzJ7fTKeb9F3D0g/iWOdF9BdJbF377xhzIEODPwzyGVu2
 QWN4s6YOGdWqzCZpF9Ruz6sZo3DrPOiXpvkimRoHPtpk8ii13mcOIXheoLGx+a2Bqvio
 qIYA==
X-Gm-Message-State: AOJu0YyaiMRtxv/lDnk0wsGuEasaEFZXtonyGEHbbxE0lvejoUFVhS4m
 AUFF0CUjSudGiTZB0LXL+J7GQrC4A7kcGTnkIXAog40bNosWkphMNPtrQRZB
X-Gm-Gg: ASbGncv/QPkSf8PbgPSM3qUn17nk+ehnjlivWIKHFCAo1uE60E65HjVNHqJSBAoemKZ
 ivizXQkiLjqkx39lbK59cVTHGXO7aLvQjlm7mjUpFRcRngo5GzsOKzdJ6H5oqJJijQHaPW8Eo6S
 4PLbLh/nTFgjPPwU39iJY0emgbGXeZRdNh9yxam87bK37uqZLmK2z8l6DUgD9hj9B7Y4Vcj42z0
 zyehCl5XMWhA2yolTGOfmlOrGlIfEPSl35djFee7AR5cBs7Fo+ZxjkQQRYZ1fDIvFi1s5lOCFLy
 hEHl1VsKBmBNbfEtylbz4WB755WY1585W47yRV1S4XgtGj+SxCcJPZ3jC8PPtyfn/Q==
X-Google-Smtp-Source: AGHT+IGK9lDfxphTDZjPZGL2AZHYqcKAk2tmt4yD6d1E+oyjSsEjvyR8s7zPT5S5QsIxf7BoBXDc1Q==
X-Received: by 2002:a05:6e02:98:b0:3cf:b2b0:5d35 with SMTP id
 e9e14a558f8ab-3cffe3e5d8emr11165385ab.7.1738108783311; 
 Tue, 28 Jan 2025 15:59:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec5dfee265sm373118173.87.2025.01.28.15.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 15:59:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 16:59:38 -0700
Message-Id: <20250128235938.1190236-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738108784; x=1738713584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n3nDtYpCQrFT2SsI0zg3ZB4uttb55NvxjjNZ5A/12z8=;
 b=buHhtGvqUIunudx2vrmTgovpxEQthc8tWZw45+ZZc1f3sbEDa8CvcCYlKdHqqVXZin
 C1567JLCwQWE/k31PZ+MNpew9YEhdHoMK1oG0R3v13MPbhg8xmDE0SZnXGWbXc0OxB6j
 hA+UtYuL3SXxHVeG7Hel0Jkyi/WLsDKz1HqJNGmqveaIMF7fFWGOkhNG525cCRZt7s+V
 +GnD/kblq9qLzbCPnGCjSrtpvH1KISx/FyMQceR/H/LAZcxJuJZp/+Z7U5Saz4WGLMOz
 cMT5r9IRs883kdgrc8v8+Bjvgr9xd0D/R7NDxgP7YYSCJL6TlsSJteHqJpHgxT/inOwO
 7rSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=buHhtGvq
Subject: [Buildroot] [PATCH v2 1/1] package/rust: bump to version 1.84.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set profile to dist since we are building from a dist archive.

Due to cargo vendoring differences we need to update hashes and
use a cargo3 suffix.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update hashes for cargo packages
---
 package/bat/bat.hash                          |   2 +-
 package/dust/dust.hash                        |   2 +-
 package/espflash/espflash.hash                |   2 +-
 package/eza/eza.hash                          |   2 +-
 package/fd/fd.hash                            |   2 +-
 package/hyperfine/hyperfine.hash              |   2 +-
 package/kmon/kmon.hash                        |   2 +-
 package/libzenoh-c/libzenoh-c.hash            |   2 +-
 package/nushell/nushell.hash                  |   2 +-
 package/parsec-tool/parsec-tool.hash          |   2 +-
 package/parsec/parsec.hash                    |   2 +-
 package/pkg-download.mk                       |   2 +-
 package/procs/procs.hash                      |   2 +-
 package/python-bcrypt/python-bcrypt.hash      |   2 +-
 .../python-cryptography.hash                  |   2 +-
 package/python-maturin/python-maturin.hash    |   2 +-
 package/python-orjson/python-orjson.hash      |   2 +-
 .../python-pydantic-core.hash                 |   2 +-
 package/python-rpds-py/python-rpds-py.hash    |   2 +-
 package/python-rtoml/python-rtoml.hash        |   2 +-
 package/python-selenium/python-selenium.hash  |   2 +-
 package/ripgrep/ripgrep.hash                  |   2 +-
 package/rust-bin/rust-bin.hash                | 128 +++++++++---------
 package/rust-bin/rust-bin.mk                  |   2 +-
 package/rust-bindgen/rust-bindgen.hash        |   2 +-
 package/rust/rust.hash                        |   4 +-
 package/rust/rust.mk                          |   3 +-
 package/sentry-cli/sentry-cli.hash            |   2 +-
 package/tbtools/tbtools.hash                  |   2 +-
 package/tealdeer/tealdeer.hash                |   2 +-
 package/uefisettings/uefisettings.hash        |   2 +-
 package/zoxide/zoxide.hash                    |   2 +-
 32 files changed, 97 insertions(+), 96 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index e80301ff49..2ca8e94ab6 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  45fcdd6076dc1b45698a7b6c0f4d1f5d9ae676f3ca3b155402ad24680d5b4df6  bat-0.24.0-cargo2.tar.gz
+sha256  28b302b1aa325221796d4ebb25bacab19a8927ef32f4d56a965b32a7b1c102fc  bat-0.24.0-cargo3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 975ec9664d..756acd0d15 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ace29e85647e7079f9eaa066da9b1368c7200233eb0814442499948b5adeb028  dust-0.9.0-cargo2.tar.gz
+sha256  662b3910ff23f8f9ead3c810d1643af4b08408781d64dce8229807f14a6f03c7  dust-0.9.0-cargo3.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index e079fdf322..cf9bfa7be0 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  de65d1d9efa0561aae1a0fe476860402139f8a7ebbf28948d2ef7e4b68b21373  espflash-3.2.0-cargo2.tar.gz
+sha256  7081a0adf4134527af866d2741c4040d6e0aa0aac9cea65e41a43aefeb7cda80  espflash-3.2.0-cargo3.tar.gz
 sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
 sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 408099e231..5f1d2828e7 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65a0dc76c1976d7af72a628196022de71c787092da5c6d961a3fcee21f5d1d6f  eza-0.18.24-cargo2.tar.gz
+sha256  464cda13744f328cdd821747925062c41979aebe2da00a35355c9735a1ad15af  eza-0.18.24-cargo3.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 90d2c38694..daac8f2edf 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  91da5cc2b99d4754fa5096cda1eeac98f312f712bfca6a41f9972b2287a4c4f9  fd-9.0.0-cargo2.tar.gz
+sha256  b1180025b4a790c1b93f98c047d8ea3fefeae844051072cba3799ace853e37ff  fd-9.0.0-cargo3.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 88b8710125..1156d7ccf7 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6cbe5673729ba7fd7a1b0b19a54630f93f4fcc29ea7878845f17931d31cd16fb  hyperfine-1.18.0-cargo2.tar.gz
+sha256  978bce6fba7f135635081ff867e24698541f7061e53f1b6eb61a2cf7aa0edd46  hyperfine-1.18.0-cargo3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index 96400977b8..9743991b07 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4723d733a2b6ad5f318a6bea77f973f3a9dbfdb727ba00352a13b9db0522194  kmon-1.6.5-cargo2.tar.gz
+sha256  e4723d733a2b6ad5f318a6bea77f973f3a9dbfdb727ba00352a13b9db0522194  kmon-1.6.5-cargo3.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index f83e23eed4..de4591f7e4 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e7a2bf47edaa5c73bb6dd44558eb2b1367a9e0a0bbbddead463df45c400cb54  libzenoh-c-1.1.0-cargo2.tar.gz
+sha256  3131d82612e49ab09e3cef029bc73f0dbb0ef4f2fbb134c465e6cbcfc5891163  libzenoh-c-1.1.0-cargo3.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 8336054455..acbcd0f69f 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  592f3b74156be0e65f8ef01fbc2e947480b91407190f93761d7c9531f381bfac  nushell-0.96.1-cargo2.tar.gz
+sha256  86075c78ce86f14dded275d7e80948743faec630e7392754b6134d2de46a9f83  nushell-0.96.1-cargo3.tar.gz
 sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index bd01bc4980..b9ff580329 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b994e10305a682c22fb6f566b57874a22ed8b9120d9fd253f5fa17c40ff759a  parsec-tool-0.7.0-cargo2.tar.gz
+sha256  22c35cb194e8f76eb7f700ff451662e3cc5109d9f297c4b7e8c19ff5d01f89e8  parsec-tool-0.7.0-cargo3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index e1d7b4fbc9..79f86b9c7d 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0b69c30c7e40c65e3c74450e0baf1e3f821ffa624a6dc7aa49f5aa976c42fda0  parsec-1.4.1-cargo2.tar.gz
+sha256  a772c6d0a3e4e8532aa0d53841035258f0bb960af7cc82886792e6e3661708e6  parsec-1.4.1-cargo3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ca01ff67a5..71ce76a66e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -24,7 +24,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo2
+BR_FMT_VERSION_cargo = -cargo3
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index da6b4377e2..ec761388fe 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  86715967bd378a4c0330708e11714bda2c8ce9f757fb3006073238d77e83e6e1  procs-0.14.5-cargo2.tar.gz
+sha256  b9bed7b48452ec47a1b0c8b0a31708e1c62f930655e63905ab8dc0653f78f9e6  procs-0.14.5-cargo3.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index c17ae6da50..660f5b688c 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  cf7284c3284e619553116ec98036d05bdd20d44cab71f907b7cd15137a3f2ec9  python-bcrypt-4.2.1-cargo2.tar.gz
+sha256  2a4be8c8ae6d3b39e40d313eb16c06f9c9873282d214e11d655e7ab5e8c7095a  python-bcrypt-4.2.1-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index aa7e16a043..4b90658524 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  09a765af8da172785de52631fe6c626508fdc8e451b7fb01d52f58b7841a813b  python-cryptography-44.0.0-cargo2.tar.gz
+sha256  04825825402f88b18a8d1597236af6e17e79b4c1c31f47d157a4dd038eceada8  python-cryptography-44.0.0-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 1b295127f6..45efa732e8 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  da4ab5a84c35d0ab00c0fb63975f25c497d6570dcdeaae0ec0f7d9f70f1d5382  python-maturin-1.8.1-cargo2.tar.gz
+sha256  18becf6e0200f76c697c3cce2f8e65e7060fd66eb4a7df81bf5de37c6fbae938  python-maturin-1.8.1-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index d11892b4b1..f4616812a2 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  a7ca27f4e0ea702b1d71d4e2749718e79aa35c0047f07d3e8681707c2d2aeecb  python-orjson-3.10.15-cargo2.tar.gz
+sha256  fcb1240544e33db0dff7daa1e68b53e6a09bcd48cdb3f74a526c41232815bb31  python-orjson-3.10.15-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index d908d5cddc..696d8995fb 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d7e62e6331eb4e712b83dad434926440c7c94989e20d693cfae119b8777ce777  python-pydantic-core-2.27.2-cargo2.tar.gz
+sha256  8c7d2d27ad0c4b0beeeaca92967262bc824cd5fde36201c49b688492dfb8ce6b  python-pydantic-core-2.27.2-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index df9da1f9b5..240b317c06 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  e8422d1a1734de76d460e944b2b760785c88948d1f85640930d3fcf66b553fbe  python-rpds-py-0.22.3-cargo2.tar.gz
+sha256  040c2401a9f4a950e6c7303ed565698fdf28247c6b216d5d895afbff9490dc7a  python-rpds-py-0.22.3-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index dae1badcf3..314c9e01ae 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  624cc1ff2b3fdea42aeee3a4d1537d37431ec001870dfee1e04a12bd3076a2d3  python-rtoml-0.10.0-cargo2.tar.gz
+sha256  624cc1ff2b3fdea42aeee3a4d1537d37431ec001870dfee1e04a12bd3076a2d3  python-rtoml-0.10.0-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 8fb00b3dac..528b1a9246 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  80364e62eb8ff463df8a4bf9858e6ee0769f4ff1bcf7952cd64d0407a6a3e8ff  python-selenium-4.27.1-cargo2.tar.gz
+sha256  ab027a51928d013acfd2449d07fe0b667060d66b4ea223c9fe5e67888da4c6e2  python-selenium-4.27.1-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 39165770dc..583f46d47b 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e1e66e2e9a7290a0a9445a82886a678ee8b2583b296fb851e1472c7403a681a  ripgrep-14.1.0-cargo2.tar.gz
+sha256  7e1e66e2e9a7290a0a9445a82886a678ee8b2583b296fb851e1472c7403a681a  ripgrep-14.1.0-cargo3.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 070a0b9779..178c06c658 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  99acf175be33bd96ac82d644125d0e2acc6962d61ee64851edc7d8ba3bd23ca4  rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  34669e600d6ee7744e59f5d4542e2a539a9b13f099a4533f19a46e32a0868053  rust-1.82.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  a32342217fb82167fffcaf0c7e44ac6e32ce5fa63dc3beb42439ab05f561a882  rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  0608a560ce266e8aafecc2b9908e3094f5ef1e135460b1f88aa614e5bf65aae4  rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  048f637a547522ba0081c5772fd3196dfcc2d0d24f442424f168b5d55f961537  rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  532190c3cdbdee9249bcde648b1c61b092bdd8885266ba9edd6df6824a454958  rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  71428fab3cf18cfe4b4486a11d292ec157fe8b0c904fb4fae34db6539144c286  rust-1.82.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  8a6bf24ca1fee2bd861590431c7954674191a0c0dfa0af4169731bc1459cf58a  rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  1359ac1f3a123ae5da0ee9e47b98bb9e799578eefd9f347ff9bafd57a1d74a7f  rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  a364a4b506865fbd56aac67e2b540a824cd9abda621bb38a8b678166d33b8ec2  rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  bec0b04e6e1e183fc21521e9cc2dc89be41c3ccacff3fb5ca48419b47af94fe1  rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  fa379cc69b23782cbaddf66025889bf5ca9c32ddb60766fe158b43cfe49a2b2b  rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  cd5e1577c1772ba309d003c49a2df2f06ccbc1cd1bf3ee9c1cfada210979f26e  rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  86f2242347c1cbae354cd0ff66c9bfe735f1b371c189aaf0157a3b55004590cb  rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  e3c74773cf6f09a3cda1b64c3058f5a88abea0a98f172de895c0ecf7b7b760b2  rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  df0a3be0e71ca8aa8be4915f7142661af32411949a75c1729a314e6ab5c78b0b  rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  4d692c1696ad49285a45bc5f636ce9c13ccb32b99ed14be428eaaf1e0cae6b33  rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  34d258a07c9051803786405731c05fb19f7980e13308acf4b16e8c836bd73ac8  rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  1e318fcff01379cf4459f02526309b1f086530004be4fb5e00988ce7b1d821f5  rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  bf93c79abc56bfcc3d48f2defcb0ca720405d01a50ba08d6d24830ae034bbc2d  rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  f56585c55664898c7484f4b7bd139770c99d7b4da6e56e4016f71cb053b1aee2  rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  711c03ffb5bb53fcc97278b015d1ea9f503ce826ba390855f576c0e3b77c4bdb  rust-std-1.82.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  c7ebb02b6ca349999b3b7dce768efaca5e0d9060f55397523e11a64cd10a9405  rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  3c5ee32afc4b83313832c7a78175c05a5e568e6053fde7e65e2a9b19ce104c10  rust-std-1.82.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  827989a42526206199025f764d08d7cd319fee58bf2e08dcaf75df9ead6f094e  rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  cdfadb39f1325319de8152504413f34671ac09fa7ecb97f967c25ece3645bc5e  rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  4954a44305622b8f68ca088138b9a69432e350336da1a415a282ce148beb340d  rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  5649f9b4e107d6c5f72fb7f82cfe15370b80b8d983670602e02e0b615bc6dc88  rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  454b83668b57bdef28fc49aca8fd4c38e395b49011e653afdf3f9bb2dae8aa63  rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  87db52d782131a8817b76f65eefcae2c24a49b2a6f19ed9bd4699167305c22aa  rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  2eca3d36f7928f877c334909f35fe202fbcecce109ccf3b439284c2cb7849594  rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  1c99a4c81f51b687ba55746c7d3f19b5b860fe4eff604d3c7d803e08c9cc89bb  rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  c535d4eb461a361fcaaad98ce578b5846e1a0bd3ff6939874a3e9cbe72cfae17  rust-1.84.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  12b46802eb72268bd55d1bd69a2eaa13871f89b0c38c73418d8eeea6fae869d7  rust-1.84.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  85845028b4587d829165fdfed31d3e39b227f158c5238a369919e6130cf4a3f9  rust-1.84.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  b7752678a17e3b398d8c609effcc7ae602925f280896feb20b7668a190afda7b  rust-1.84.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  7cdb3b2a4a374c868cb156a6e10591d0d3e40c987d3ec363bf18349a0143843b  rust-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  74e0a75cb6d48975c75cf49b5434c921d6bed16937e1f6091eaffb524761c6e1  rust-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  410e5422036b6195bd79e6aad328335e99b4ef7a82b72248cbac71dfd61d6b18  rust-1.84.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  73aca7e08720b7bf28beee8f2370c6aef961aa87e9674989f5ce62ec2f95dcfd  rust-1.84.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  023f0b6153b23ac0e9686c2ab95bc393ee3e295b166bb36de3b4dfb53e3913e0  rust-std-1.84.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  2fcc03bf72c6759d6a1778b6592062a2e69349239f7ba9f21a62a7529e4fdf8b  rust-std-1.84.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  5ad4a321ca84fa18811923765031d31d037bbe2e86debda7922d820313ae3926  rust-std-1.84.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  b2a92aa3b5116e2f48cd1a854da5dc308cffad989bb68b9d12e983ed72dcc7a7  rust-std-1.84.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  469fec94070e8efd38663e1ae6b51a2639e2885e6cc4a7b3c48c2907ccd083fa  rust-std-1.84.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  0fadfac3379bc1acfb44ba6d52ea6269449560b883802b2567005fd351606360  rust-std-1.84.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  e9c6e1b5f91ee78f052cb1d6017c33a33d0f3fa9481e1906d9ef2d674f957be7  rust-std-1.84.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  7ae93ecec3da72d7053bb3fa8e6c7cd89f9869efd2934be5e29a4381db4cc682  rust-std-1.84.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  dd80b1d9982d8339ae72d2f985e81d7d528ecf60f7a2eeecd9b6dfdd5431d480  rust-std-1.84.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  5b1bc0298dae734ca1d3a66b457cb1ef5c3265dcd0cfd586790c4d45d9826d5f  rust-std-1.84.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  00fc66cc41c2352f6ea3c36ae97d4c96b92f9a038a101176c3b709f409ce9f2f  rust-std-1.84.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  e5caef0eae65f66e15fc16c26a86efa6d177a56ed28ef2285de0e4bbb9d4c904  rust-std-1.84.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  a877622fbbfa58304c34372d369e95db106cc35758ca59053144bf7d86fbf3fc  rust-std-1.84.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  f0f911935c3915ca53f3e2eb51007bbafa1863cda69cb35077bfed38871b83be  rust-std-1.84.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  e710100be26e742733d445722a37227381f1ec2010664ece85489bc598d70456  rust-std-1.84.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  1c8f12e789b64fade8a449ec12039656aa9f5cbc2bc60b720562f1286fbea4fa  rust-std-1.84.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  fdbb75060e59ad59273a8ef11fc2ad61837539686df0e8dfe46107e1b15ab90a  rust-std-1.84.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  f2819f8ce1ae41c2c2bcf40fc90d6b1a5d340d3e9558267d464730a797122bf5  rust-std-1.84.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  db731e894cce9973ab2b41109c9097d0fc6a49c0d45a0d333bd1547d2c7485a1  rust-std-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  451580f9cdc47eef4efb0986b1960a8f9c4fb0959f81b77eb6292e6bcff9fc64  rust-std-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  5208f45cec5f3600f2cbc11d1796bc217f09e9c922689c8e4f0cc3f2b83ebb74  rust-std-1.84.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  ecd1662d6cbbb62984ab31ae787442f1ab32caf6bc17260d407b3a94b434ad32  rust-std-1.84.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  770237080b9310d126350c3bd70820bd91064c2e96c29ab5f2e002b31b5bd067  rust-std-1.84.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  5f976818603468384bd78fde6c4e12f2b0a996d55f4985a33a68b5af54974ac0  rust-std-1.84.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index c14ca7f88e..588fcda525 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.82.0
+RUST_BIN_VERSION = 1.84.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 7b222e577f..06b1185ff8 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  618a92ac5e0e855a4e5cb16fb71258c4859679f3f7d7d95c7150e8b09cbbfbde  rust-bindgen-0.65.1-cargo2.tar.gz
+sha256  3d5c56c023d14a043670f65ad087f2b056b04a64a3b85132c0b1c4ed9ed1cd32  rust-bindgen-0.65.1-cargo3.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 19af66e2d6..e0f9133a6d 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz.sha256
-sha256  1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210  rustc-1.82.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.84.0-src.tar.xz.sha256
+sha256  bc2c1639f26814c7b17a323992f1e08c3b01fe88cdff9a27d951987d886e00b3  rustc-1.84.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 29c03594d2..d4a95241e8 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.82.0
+RUST_VERSION = 1.84.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
@@ -27,6 +27,7 @@ HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
 define HOST_RUST_CONFIGURE_CMDS
 	( \
+		echo 'profile = "dist"'; \
 		echo '[build]'; \
 		echo 'target = ["$(RUSTC_TARGET_NAME)"]'; \
 		echo 'cargo = "$(HOST_RUST_BIN_DIR)/cargo/bin/cargo"'; \
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 0335c57cb3..a247010de8 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  997581bca5bdb6f7540ea9d6e1d25f0e9df06fcc338d26ed75fc81f9401d65d4  sentry-cli-2.20.3-cargo2.tar.gz
+sha256  1242c2c08a9aa9da415b3ddf4ada1eff04a2edf7ea087385be74e7b090589f09  sentry-cli-2.20.3-cargo3.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 58793dee0c..108b83a51c 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  377d2fab96cf78d24dfd1b16b737afb4e47f0b712e13abb7ac1443fc2aa0931a  tbtools-0.5.0-cargo2.tar.gz
+sha256  1643ea1b29f816658c454851fa06e73c3183296b7b66f143b95fc4c18cef3442  tbtools-0.5.0-cargo3.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index f5493ec8eb..6ad7485d2b 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  f0be09eed89d25e44f954e9c25476176d9e4acc15171ae93b5977d7f244851ba  tealdeer-1.6.1-cargo2.tar.gz
+sha256  260a054a737364bca4fb3c333042576f92284afe4cac82dbc420ee86656d846b  tealdeer-1.6.1-cargo3.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index 505b5de566..e5cbd8a1bd 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5d4d6f771e615df9fee3d531c85dad9946ed793fc0a0e636dee1d342780f7863  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo2.tar.gz
+sha256  a7306d3e268f9c95fb627f9b428c8880ac616d60fa38ddfe8c209d13a9d422a0  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo3.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 1a3a066af9..6a91525098 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f2d9b9448516919f6d5cf32a5f154c2dc3a90d9fdf0addab9cd6a7824020befc  zoxide-0.9.4-cargo2.tar.gz
+sha256  a4457323090fbf3acac3d46b636a40abc6a26179a4387ed3b15c074a91d85876  zoxide-0.9.4-cargo3.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
