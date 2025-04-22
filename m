Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F014C369CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98904403D2;
	Tue, 22 Apr 2025 07:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9ajSMYkTUvz; Tue, 22 Apr 2025 07:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501A440912
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501A440912;
	Tue, 22 Apr 2025 07:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E236168
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D18B06067F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4AXXp1FL2du for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2039F60C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2039F60C1C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2039F60C1C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso40465535e9.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308088; x=1745912888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13tAzOUuJP/4dQkk3Dym6bZLyxqeRZ1+IuZ/IrPrNow=;
 b=Ol8n1tKrI/vJrXAo9xIGLvVFWtC5wzIv6pE6CkwxKEfQ22FQEZK8F8E1AMCi2EeFQv
 ga86OgVkXdLLskIHxmik8AMqz2P2cw7PFWegTn8MnQM3HIiHXkwRiIZWW0H+PCF3f0pz
 WRF9tp2JnDDTOGODf7udy2q+vQSGXWRiPxhhhHaH5PWrJSZHKSeJS++2dtvtPM3xwrMg
 4ltga7OEpjK+c9+C5cC5J9ke9JQBwDI79J/wBhh0sWis90nM5+TW39D4b/WfEs6+74TV
 ej6pmv3QC/Hm6jXjAiu9Zhk1evv/YoFXSsGJenMejLUO5ynWMtIXb4xhT9Ryef3xO+05
 EaeQ==
X-Gm-Message-State: AOJu0YwQ6lTUA63WscMrY/5FSGqPdVTmKT12596dWBiZ0n5yfA0gcd4y
 HqkM75Dh/vxhf5SX0nF0EhwQ69fVsx9DZv291uLx2HA64aTck/iCGXBDWxctE7kR5p/DeQxrecE
 6tv8=
X-Gm-Gg: ASbGncvnBuNxJKK77JcHjuWJJNziCHj668u9bNcCdIzoTSuHxxWPRuUx9O1A10GERtl
 qPtX7MO0ttmm9ttjmBQac6Ty4wdJD7q6tcJeUw3mMzfSHuMANnueY7VZa/tez6x39z6E0OFXC6q
 ADwIEX7hXT5Be1f3wTToAQNWR3FYFA4USy6u1PFom4Cf6xKmhu0h38YC5PDAjY5wu4i6BQYxqwO
 ZQvrPAHyqRHlVeJSxXBpMxNIzsXtC9x17noi9zNdyqHxW1yEPIMJD2cNBPXLB2rwrdZLtBC1Vwb
 4Nbc0s4QDuiS+1Op4PDVdp7X60HuydiMiLKf+ACJRsu6eJIwsJRonyEAMe7T00DOZpmDisS72t5
 2bPKhguEC5ftIaW81pxPKE/FtJ6knIxmHq6A=
X-Google-Smtp-Source: AGHT+IFOfNopok3EzhIRIDpOfzGkytLPZlMwpfY/xAYd1tPmu51GtTkQRR1R+jRc4mlPSTQeVyOHtg==
X-Received: by 2002:a05:600c:3c8d:b0:43c:e9d0:9ee5 with SMTP id
 5b1f17b1804b1-4406abb0ca5mr133075895e9.18.1745308088511; 
 Tue, 22 Apr 2025 00:48:08 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbd8asm162913405e9.23.2025.04.22.00.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:48:08 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 09:47:38 +0200
Message-ID: <20250422074738.821755-5-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422074738.821755-1-elmehdi.younes@smile.fr>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745308088; x=1745912888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=13tAzOUuJP/4dQkk3Dym6bZLyxqeRZ1+IuZ/IrPrNow=;
 b=HBA8mYlkkrqaaN/x66OyhmCi43gC5uX7q/rSazqTpkWtTS7WEI8ZLy6SUS3iFy9/pD
 K1rlp/HIADLjLtiMXg48B1UHIgJquRCXmRXpXBR2j7EaBl3UX2fKoO2SdXQYIIuRvACg
 hqYuMHv03IIUKgZcaBsqI+Ytv/talxJ9wD0Es=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=HBA8mYlk
Subject: [Buildroot] [PATCH 4/4] package: update all hashes after cargo3
 switch
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This updates all SHA256 hashes for Rust packages that previously used
cargo2.tar.gz archives, following the switch to cargo3 naming in my last
patch.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/aardvark-dns/aardvark-dns.hash                 | 2 +-
 package/bat/bat.hash                                   | 2 +-
 package/dust/dust.hash                                 | 2 +-
 package/espflash/espflash.hash                         | 2 +-
 package/eza/eza.hash                                   | 2 +-
 package/fd/fd.hash                                     | 2 +-
 package/hyperfine/hyperfine.hash                       | 2 +-
 package/kmon/kmon.hash                                 | 2 +-
 package/libzenoh-c/libzenoh-c.hash                     | 2 +-
 package/netavark/netavark.hash                         | 2 +-
 package/nushell/nushell.hash                           | 2 +-
 package/parsec-tool/parsec-tool.hash                   | 2 +-
 package/parsec/parsec.hash                             | 2 +-
 package/procs/procs.hash                               | 2 +-
 package/python-bcrypt/python-bcrypt.hash               | 2 +-
 package/python-cryptography/python-cryptography.hash   | 2 +-
 package/python-maturin/python-maturin.hash             | 2 +-
 package/python-orjson/python-orjson.hash               | 2 +-
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-rpds-py/python-rpds-py.hash             | 2 +-
 package/python-rtoml/python-rtoml.hash                 | 2 +-
 package/python-selenium/python-selenium.hash           | 2 +-
 package/ripgrep/ripgrep.hash                           | 2 +-
 package/rust-bindgen/rust-bindgen.hash                 | 2 +-
 package/sentry-cli/sentry-cli.hash                     | 2 +-
 package/tbtools/tbtools.hash                           | 2 +-
 package/tealdeer/tealdeer.hash                         | 2 +-
 package/uefisettings/uefisettings.hash                 | 2 +-
 package/zoxide/zoxide.hash                             | 2 +-
 29 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index 5327a38b7e..ff0d5aad20 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbd4a0b0bdf6788c09266f1f944d5c5397b6db4f1da0735a1d42738a6e074249  aardvark-dns-v1.14.0-git4-cargo2.tar.gz
+sha256  12f0f729ebcd18894083802b4a53c04923a12223c00836376a31705afb702236  aardvark-dns-v1.14.0-git4-cargo3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
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
index 0cd422ccf0..7bd8bd49ff 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  685b22eec7ec8c24137b4af5f97ceea7d262e31fee324d5b4ed66fce24c23476  eza-0.20.19-cargo2.tar.gz
+sha256  17895d9de55241b4c011bf27ab676235a2344f2661e19987c78c870e7a22f471  eza-0.20.19-cargo3.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 04345b8884..17ddcc6f17 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6d177b06123419edf2abe2daa82b29fec667a4e775cf877094ca5f6ae759dc34  fd-10.2.0-cargo2.tar.gz
+sha256  593c1c9433c049fad66653d5d0e9243f8b192e92be40bd9a25c1b99d086e06ae  fd-10.2.0-cargo3.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 3590d91133..2c6ab44c45 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  805a1be8dc1667591988ac6ca1ac4fc37408a46a077b4e2332e0a81cc4a3d2e1  hyperfine-1.19.0-cargo2.tar.gz
+sha256  933cd0efea1e9ec9da8ffff4aef1167eb79e161d4f961a9a8e67e64f03f2b8b8  hyperfine-1.19.0-cargo3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index 1bf3830243..2f61e8ffdb 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  54fc677b6ef9617802132d862f41a6d93bd473d119b888b454d223f0d307fd27  kmon-1.7.1-cargo2.tar.gz
+sha256  5cc30c03e8e2cba665d777343c27ab02dce03a350404002b7b3acfd94645acdf  kmon-1.7.1-cargo3.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index e460392bfa..c8788e612b 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  71c27b1f715d184d842bc007bfcbbbec6c2af775ff3b607ad90d7bd4c3c91b6c  libzenoh-c-1.2.1-cargo2.tar.gz
+sha256  3de86adf74c02c3d111b733205fb3a691790dd91afaacc42c40571bbbaf70b05  libzenoh-c-1.2.1-cargo3.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index 585763be42..d4e03c239b 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  09471bd116fdebfd3f7a8100b37809e3a306d0f18e5feee8445ed1e01a22e0aa  netavark-v1.14.0-git4-cargo2.tar.gz
+sha256  ab9eade60540f83466da61872b4dfa09d110b3bf274ca3e5b4f6aa77ce775b7d  netavark-v1.14.0-git4-cargo3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
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
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index e795834358..015ebd6b74 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac3306ea16d3def828b085678da114d49f2272bcc1362755c98b0958514910fe  procs-0.14.9-cargo2.tar.gz
+sha256  29459186e5acaf105fed558acbf5c5242e7b3e3e4606e810298c5415cdee26d6  procs-0.14.9-cargo3.tar.gz
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
index 909b702d16..35020cb299 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  85cb9d02cf5237881d0b62abab086acd1149d972f6f8c5aece4f8e10a37c944c  python-cryptography-44.0.1-cargo2.tar.gz
+sha256  9fc861ee2c464558dc0a122ebb60734f4c032d690c5c7e4bf5d753a952385d48  python-cryptography-44.0.1-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 16d0c79af6..307783ce74 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  91da291029b8d62103044a91d8b9cf0220c73e282de096c20d1a38c55aa82dd1  python-maturin-1.8.3-cargo2.tar.gz
+sha256  09c15e4d5fc5a46f6d730e1860f2c46a2bf4bedf53e0508e605b856637a66ff9  python-maturin-1.8.3-cargo3.tar.gz
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
index d310e8ae02..aca95d2c13 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  94ebefcb84127e3a950129dc2485e046ece91d3a7f0959c6de124eca5573389d  python-pydantic-core-2.29.0-cargo2.tar.gz
+sha256  b3e332ffb9193d9fb08bdd8690ceb1ed787d03e1e7c4a00b069715bb3def1424  python-pydantic-core-2.29.0-cargo3.tar.gz
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
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 7b222e577f..06b1185ff8 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  618a92ac5e0e855a4e5cb16fb71258c4859679f3f7d7d95c7150e8b09cbbfbde  rust-bindgen-0.65.1-cargo2.tar.gz
+sha256  3d5c56c023d14a043670f65ad087f2b056b04a64a3b85132c0b1c4ed9ed1cd32  rust-bindgen-0.65.1-cargo3.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
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
index 53d4130f22..c4dde33021 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a9d7bbde2acbd63bdd0f73715314500322d58cfb845559259c4edb111ab161a  zoxide-0.9.6-cargo2.tar.gz
+sha256  835edde458c330e7733c30ec07fd3b5f362d9a64eda14c3348a88263da93230e  zoxide-0.9.6-cargo3.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
