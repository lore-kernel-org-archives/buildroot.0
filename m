Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E99EF45A0F
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 22:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BA140BDD;
	Fri, 10 Apr 2026 22:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUh0vn9_ERCL; Fri, 10 Apr 2026 22:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8452341260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775860956;
	bh=OxLeJnA+oGYIoRa59lYmG/Bg2iJYnH4sDzH7/ZrXh6w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NVon/tK0dhYjWROXTk56uvnKrziDMgcBzsy1RqQykJogvMX/aOz+mxoxiknrPYGMc
	 z54Dwg81jZj/GW3NIBhnwX5KwvQzDgWUwXmHQYqb80cQSCHILq6t/I2M7m8V5o2pYN
	 mA2rm6VeMPzKVbuXNWvXEruRZbcb6GrRuls43Bhg1Onx9P+oEWVW5LTeXOrx9YrQ55
	 SkfPze24KmzsSKVH6CqNF4c4kRZw+lwNrEnp4tNK41bpsXHJ+YZYmtGOmvZjggZsw8
	 9Uol2mZ8d42mouk5+RVOjynZXB+r8YgylvR5gXLhDl83pw4y9tfBYL1GON0cFHQ9px
	 TAAZPMe5GWr8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8452341260;
	Fri, 10 Apr 2026 22:42:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED316EC
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF1096114A
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6a5hDMmSEQd7 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 22:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=nicolas.serafini@flyability.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C31A3607AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C31A3607AC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C31A3607AC
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43d17bb1c1dso1975083f8f.2
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775860948; x=1776465748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YNlfgdJc0GAEu5ZprAHEzN++ZAKu7Mnayv3KIzAusRQ=;
 b=YffVi9JFiGQ/FNkp+n1e5d9POZr+cfCLwmnbMRnDrvd3GkZRaXWDExA28OcPDRu9qu
 fvlrD9BZzasybTYgYKqut/g+5iR5vSy/6G8+JIlP4eePzqiz+bB5IUwx10naH0QYbB6f
 Tse7holzx+I2HCKe7c6r71VQCWobYUfzfUvEdqVd4MIN1VM05lvvipZcShjcbJy6eXuv
 S+ADc8rpbGOKrx4pZgNMJTBCmN2kITsWgwRLNlceY0oDUIkWy4AwSbv6BhN0qfQukAbw
 FXx9hfRlRkbXiuH9o7YsQBbtI0OK8SzybdVRjc21zYfcdLeD6/jccyY+Jif8JSLEalbl
 js6w==
X-Gm-Message-State: AOJu0YyWJeDB46G0NhGwKg4HfhpuJZ6pHYcqL7IN77xyYihWY84v4MiS
 qa4dUT/A0rnX/NqIny+6yK0qEl1yzlvboLWygJ7X3ZvYQOJDm4MLfo017PZSOsTje1956zTtJ8a
 RCPiZlrJZEA==
X-Gm-Gg: AeBDietGbaTMyrWsfVX3f3SSsSr1ssTpPH3QvCd0d4B+eJKxgw/T36UmvZCkTAAqiq0
 qpZejgnbZqySTzZgZktjxqXHPCRCpwYNbV1sX3IvbEalAjjdxBmPEm60ddD0LKnXZnQk1C8xnIR
 J6xIbjul2I9oAmgYWEDIpLqYqC+PUwqEbUPB38vef9oIB3ci5w+jYE3jz+gKFbWfIxlS1zvRgho
 UJxJiCAmKbQAQIbcejd/3V8w0xh77Fcj3gVqVV3C1hqlgu5vPkrykjHBg1+ehy4PzXGohVS27XD
 JsZSeK3o0oWydc/51J7vP7Ul7TmxhHBIlVyUEHYJa/Hb6MG1bScjZEkXHLrNMXTI/miPgvvS4pY
 1hNSSkdlKY2eSllbZ6Wu6IVf2d6A8Tq5GwL7A05DZWdPjeJ8/1rys8WvEXEznCojr5DBwDi3hXj
 hBZgg6lKW5nOl/089cZE7rQdcWetKIqeaKd7tRPfDuuAFLWVIhQEJCwCvP9GNCyw==
X-Received: by 2002:a05:6000:2906:b0:43d:6e0:9447 with SMTP id
 ffacd0b85a97d-43d642c4f4dmr7032284f8f.28.1775860948468; 
 Fri, 10 Apr 2026 15:42:28 -0700 (PDT)
Received: from nse-t16 (adsl-84-227-54-58.adslplus.ch. [84.227.54.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm11668479f8f.27.2026.04.10.15.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 15:42:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 Apr 2026 00:42:20 +0200
Message-ID: <20260410224221.1185631-4-nicolas.serafini@flyability.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
References: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flyability.com; s=google; t=1775860948; x=1776465748; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YNlfgdJc0GAEu5ZprAHEzN++ZAKu7Mnayv3KIzAusRQ=;
 b=ijTmk68ocrKTIVOEYHEXnNcBTxxmVhCdSb4w0npPgQ4UPtOVnxiGvJacmQ1Ucsz9Dy
 GGByZtm/nHWlNBedul8VhKXNYhw7U2NcgNwO0fid2RGE7qpUy7a9UvCu/RY/77HzqboN
 LVbaEab6+x79nCx+FvyNgsF/vVmqAoJe0V4ostNbn2BIRg8qKyMzfoGfS4vifyv7jduP
 e8oXVszcIXPbJUOUfoT/By6orQf1+e5oqyBdHzF0T2g7HNILiMXMnL9+d1fWCA9xyqmo
 9r2MYlYpApDOgMm2Y+p8jDkjoZqeBowV6HYsCHRuR2+Oe+lTTawvEbeSsgSjvqCvaOEa
 m+aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=flyability.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=flyability.com header.i=@flyability.com
 header.a=rsa-sha256 header.s=google header.b=ijTmk68o
Subject: [Buildroot] [PATCH 3/4] package: update cargo suffix to -cargo5 and
 fix hashes
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
From: Nicolas Serafini via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Serafini <nicolas.serafini@flyability.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Simon Richter <simon@sinic.eu>,
 David Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Bernd Kuhls <bernd@kuhls.net>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 Julien Olivain <ju.o@free.fr>, Torben Voltmer <mail@t-voltmer.net>,
 Nicolas Serafini <nicolas.serafini@flyability.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the bump of Rust to 1.94.1, three changes in Cargo's
vendoring logic produce different vendor directory contents:

- cargo vendor now does direct extraction from .crate tarballs
  instead of heuristic file listing, adding previously excluded
  files like .cargo_vcs_info.json and hidden directories:
  https://github.com/rust-lang/cargo/pull/15514

- Files with .rej/.orig suffixes (e.g. Cargo.toml.orig) are no
  longer excluded from vendoring:
  https://github.com/rust-lang/cargo/pull/15569

- Git-specific files (.gitattributes, .gitignore) are now
  recursively filtered in subdirectories, not just at the top
  level:
  https://github.com/rust-lang/cargo/pull/16439

Therefore the hashes of all Cargo-fetched packages need to be
updated. This commit changes the suffix of Cargo packages from
-cargo4 to -cargo5, and updates all hashes.

Signed-off-by: Nicolas Serafini <nicolas.serafini@flyability.com>
---
 package/aardvark-dns/aardvark-dns.hash                 | 2 +-
 package/aichat/aichat.hash                             | 2 +-
 package/bat/bat.hash                                   | 2 +-
 package/broot/broot.hash                               | 2 +-
 package/dust/dust.hash                                 | 2 +-
 package/espflash/espflash.hash                         | 2 +-
 package/eza/eza.hash                                   | 2 +-
 package/fd/fd.hash                                     | 2 +-
 package/hyperfine/hyperfine.hash                       | 2 +-
 package/kibi/kibi.hash                                 | 2 +-
 package/kmon/kmon.hash                                 | 2 +-
 package/libzenoh-c/libzenoh-c.hash                     | 2 +-
 package/netavark/netavark.hash                         | 2 +-
 package/nushell/nushell.hash                           | 2 +-
 package/parsec-tool/parsec-tool.hash                   | 2 +-
 package/parsec/parsec.hash                             | 2 +-
 package/pkg-download.mk                                | 2 +-
 package/procs/procs.hash                               | 2 +-
 package/python-bcrypt/python-bcrypt.hash               | 2 +-
 package/python-cryptography/python-cryptography.hash   | 2 +-
 package/python-logbook/python-logbook.hash             | 2 +-
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
 package/zellij/zellij.hash                             | 2 +-
 package/zoxide/zoxide.hash                             | 2 +-
 35 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index 134dd34a1b..b3b742089a 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aeb5fc77455b01916b28f7c306834446f3f6e184c02d38b177c578bb4f01939e  aardvark-dns-v1.17.0-git4-cargo4.tar.gz
+sha256  bf046c3bc7bc9f1f04220a89393b9189bcab1c61c204f247b3a5415d0ac27117  aardvark-dns-v1.17.0-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aichat/aichat.hash b/package/aichat/aichat.hash
index 43e96381ed..09291a070f 100644
--- a/package/aichat/aichat.hash
+++ b/package/aichat/aichat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  214af28357dd2b7543120fd23b81614c986ea62d69fade6d80259cb7a42eafdd  aichat-0.30.0-cargo4.tar.gz
+sha256  1e8643532ec5ad25aa227c36dd5fd3dee31afd1d2dc51acf25a68d12c3fd3980  aichat-0.30.0-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79  LICENSE-MIT
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 532ccd98a4..78bd1de394 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  e62f9f1b14090044db860727a3c6bcb0d5b840f866ccaea4298518eeeb807a72  bat-0.26.0-cargo4.tar.gz
+sha256  e23db7a34f860d425cf0bb6f13505606024ab81035327262963d8395b4a6f3b5  bat-0.26.0-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index ec72063928..56168b5a38 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  46fc9c18ac0bb7a23eb752aab853b2484dba5b168052d380b1d8b902bf4a6fbf  broot-1.56.2-cargo4.tar.gz
+sha256  dde0da41fe9ee0f03c7f2895134360a4d2e003ed1ebc726c7394009dd9ad0f07  broot-1.56.2-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 83b01447b6..edb865fc0a 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  275c2d7bd06205588b7e20e4b478e0df7213f426a1441923e3f2dfaa80cf4828  dust-1.2.3-cargo4.tar.gz
+sha256  2ce1847c74a9ee1512c8ceca68c648b8dee1f7996cd5750ffbbd79a932edd129  dust-1.2.3-cargo5.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index 0be30f0442..317c84e56e 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5edf94cd55daceffd08278f7789ea58b24de2051f0e15d8b7ba441bc94337d87  espflash-4.0.1-cargo4.tar.gz
+sha256  3d750c05de3a44acaca67219a70360fc1d0e79776027fcc3a2298a7d2edb108f  espflash-4.0.1-cargo5.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 0bc5061ab1..a8e670527a 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d31a17b4733589da761ad79bc9faf4271b358a0ef9fea19dabb5f38827ba7cf4  eza-0.23.3-cargo4.tar.gz
+sha256  921ea63ca5281c496a1a370f703de3f68e6147d22da21789c4bf44d222195148  eza-0.23.3-cargo5.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 991be349b8..0dde7218ed 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4a32dbd98dab4faf307954bf854d0c0c5719816e1cd28fe49385b6925cc8c515  fd-10.3.0-cargo4.tar.gz
+sha256  adc1e51c35259f6ee393ae28df84faa02c5c320b4c391eabda6391d555f40bbf  fd-10.3.0-cargo5.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index e0408ee79d..13420dc0d0 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  64644b26342ebd44ad455ee7750809e424aff084bad403d04d713d729b020934  hyperfine-1.20.0-cargo4.tar.gz
+sha256  c119d7d85ea9d3141cc894ae9d0530e83f3456e220fb23c7642e7c8f73bc978b  hyperfine-1.20.0-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
index a805f75f91..3ab58428cd 100644
--- a/package/kibi/kibi.hash
+++ b/package/kibi/kibi.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  0a2cdd264fadf455ed919e5d4c12ab25614735dfe0b30895004ce4f3919d7eff  kibi-0.3.1-cargo4.tar.gz
+sha256  c65ab03df3c2f1b83b41c2074032edc6c0bc7ff616ff9116cee49ee36c462521  kibi-0.3.1-cargo5.tar.gz
 sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index c9c129648b..1877e9ab31 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7b66ef3d20951dfdbe6a62c82ee6de4bb6db23135e65cf535df5d934a7d462d4  kmon-1.7.1-cargo4.tar.gz
+sha256  cd2ce6dec4d47b5ab1c4656be32d8eca71944731471b82a4e365d1312d70e578  kmon-1.7.1-cargo5.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 9a1cbca0ff..ed9013c3b8 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b1cc424771338f28ed16bce23a442856ed5b7f7f3ba1ff2aeb7373d68b484dd  libzenoh-c-1.2.1-cargo4.tar.gz
+sha256  c0c1c0b97a36ec189f70562927326fb68ae4e49c368003cb3194dbff5d94fda3  libzenoh-c-1.2.1-cargo5.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index 79fcb2eab1..f7ab17de3e 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c696e3e61b425270762f8d9d97705358de15de80e06fac7142cf65011d1dc0c  netavark-v1.17.0-git4-cargo4.tar.gz
+sha256  9ff98fe9bcb6478ef558ae277b32aad67dbd7e7b72cac66df24084cb4f9038d9  netavark-v1.17.0-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 45047a82ed..d70882e2ec 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  59b3af5d873d0ce21ddd10358bc4d54753c01c7245caae7a3d8a72782d3f626e  nushell-0.108.0-cargo4.tar.gz
+sha256  a26769088250b7af721db9c27c3c8982923b6f0a0ef1cb1eb507669de472c0b7  nushell-0.108.0-cargo5.tar.gz
 sha256  ff5dcaaba6140ec57cafdd4f707cd0d329e727477cf7d5b9ba7a244ec2678b79  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index f84c64802d..8ce1e1e123 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ddb379cf9ab309a64c869cd64870d4e58414398f00fdb0ed1524f1e684db226  parsec-tool-0.7.0-cargo4.tar.gz
+sha256  0ad62590274ba72bd1e02e5df234c33f7a24ee77f8d3316887e12d04b01469ea  parsec-tool-0.7.0-cargo5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index c6d9ad8d01..66ef007c8c 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d12fc9718a8690790974348e8ac170bcee433c074c06ba5db7c0a15c372b30e  parsec-1.4.1-cargo4.tar.gz
+sha256  4c5f760f1f9c1c28ed93341c0e1416e8a229180eca4df32dd9f743d0f035531b  parsec-1.4.1-cargo5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ef268f5c83..ce63ce9658 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,7 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo4
+BR_FMT_VERSION_cargo = -cargo5
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 35f1f6d2f4..516bc7e950 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  09f2faee76bad885af50bf2977ea34b64810645a0b781699f8c822311211575e  procs-0.14.10-cargo4.tar.gz
+sha256  31337ff0a89d13b26d94971ae12b2ee92cf1a188491711e700d0bf03ecf7ba6a  procs-0.14.10-cargo5.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index a30e716df0..272bdbcf66 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c209e01bb77628213eecb2152cf143c95e4147e3ef54aada6cf69803fafdc67d  python-bcrypt-5.0.0-cargo4.tar.gz
+sha256  c423e043342548dbe409b15e6cded27dba3a70376f36f6d91e1ed01d01ae116a  python-bcrypt-5.0.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 25d987a321..8e3b797272 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  18ecafb2c1f2de6d02d1b848f0f80736f0f93e8708afaf3df3064e8722077291  python-cryptography-46.0.5-cargo4.tar.gz
+sha256  ecb4559a7bb579198761a996404b96fe3e9a0f79b1ef0a1a8c9d8d1b7d7dcfd7  python-cryptography-46.0.5-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index de75a97e72..c630a82a42 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  1533f03ef76a4d646b14dd00e9982d6ef5d5dc86f134c9bbc1cd98b55fbf566f  python-logbook-1.9.2-cargo4.tar.gz
+sha256  c4abf52044e756f64ed2beba8e7a10e0bf941de9946eb7a82b71abf90f109bc0  python-logbook-1.9.2-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index a92307d53b..f255ba8261 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  f4d2f9955b1b1d1ca71558ce969b65345056ef8db643cea33bc4aa124fb248df  python-maturin-1.11.2-cargo4.tar.gz
+sha256  b7e5d7303140b6b67a11a40c11b61127d61b6d02d6e727f0a133e73bd78963c5  python-maturin-1.11.2-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f55aab62ef..3f2cd0ad4c 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  ab71a5f3d6efb4a3dd0cacad24e62d774907be42ba2e01be8a3ddeecf46d078b  python-orjson-3.11.5-cargo4.tar.gz
+sha256  da89615d51a086912e7f6444027c14f1edd943aa0910ed498c6f3febdcfae271  python-orjson-3.11.5-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 6ab537ad67..61775e5522 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  8919dc76250449ed22d47e94f53929cb44eb982cd4ad80dc0607f8018868e549  python-pydantic-core-2.41.5-cargo4.tar.gz
+sha256  cc643029337df7a2e90799cedbd75fef0636c6a467e74d22f4dfec4c1959359e  python-pydantic-core-2.41.5-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 9c72c1e7ab..4ce45941b8 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9f8d17fa01176f0f0f5b20675d4c1759f9f8b02d667ae085bd70236b3681ae4f  python-rpds-py-0.30.0-cargo4.tar.gz
+sha256  5a1adf51bde76b4865ead196427d5d3ad74eb677186f0eed6b22a89578084822  python-rpds-py-0.30.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 54aba0c849..506d3b93ac 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9174c3af184cbd94e67ac99f63a54c5f8ecea95421b36f15204f6eab762af047  python-rtoml-0.10.0-cargo4.tar.gz
+sha256  8a489442beeb69a9a8bf24d7ccb6cee81afd287e0e45237c9d43aa16517500d1  python-rtoml-0.10.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 97978c0995..3b22e5c5a1 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c2518c75784290095739e386b4deb9f192b11dab3dce152452e6763918dd6c18  python-selenium-4.39.0-cargo4.tar.gz
+sha256  6a614eb2cc8fff809f9cb10dae089eebad3af996dda49f9787bfed071fb5ac0c  python-selenium-4.39.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index c6cfa63ea3..6ab8264605 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cb56abf62d2e9924a873af5dba4ecc87964a5144459d240a83e42c26ea6f9d7f  ripgrep-14.1.1-cargo4.tar.gz
+sha256  755b1ea52374d7a067a70ded10be04ddfc083d9333c6bb4f2c1e9a2493cd98c1  ripgrep-14.1.1-cargo5.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 72ff0401ce..09f4b91f96 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9dd2f0f7bae7c84b1d79fb848d17335b8ebc37c27cd5ecb6e0da3ec0dba87d71  rust-bindgen-0.72.1-cargo4.tar.gz
+sha256  c4dc8c1a1414f139cf0625e538d861fe59802c86e615afef144165f236cdb9dc  rust-bindgen-0.72.1-cargo5.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 88f3fdf46d..de5982dfcb 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5072542aad76e1cad27ef643c50b2d959bd5d49e742d887fbad83391d9ce61e2  sentry-cli-2.20.3-cargo4.tar.gz
+sha256  1f03892772a944ff9fbe208ff92e15ec2a966337f1739a5162f3af7dc252b574  sentry-cli-2.20.3-cargo5.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index a66ae15e63..60056f1fd2 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  114c0dfb3f30cc491c9fcb583adf0f8b356268d8207bfc8c73a5bffe990e0c6a  tbtools-0.8.0-cargo4.tar.gz
+sha256  a45d11a0beca595c9e10cfa30f78945876ef4bd3ac0651d903f9f2bc14d05197  tbtools-0.8.0-cargo5.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index acfaad0271..f9fba9b610 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  40952b9921d750bd6a84a7624b7b19558a9bbf1be6433b70db5ec2ccd840e33d  tealdeer-1.6.1-cargo4.tar.gz
+sha256  233d220f1f917efccae0f7591ae619cb637862d959596a16afd1390a3203d44c  tealdeer-1.6.1-cargo5.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index b9b5222d4b..0523d7b9b9 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c199e92e9dde29d5a1be33994cef27eb9450f1dbc006eb5e09856e2be7f172b  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo4.tar.gz
+sha256  d614106b2f9093dfdd24367a5fc131b1537580a0a1e563a82da294539e10ca4a  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo5.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 6a8c5a5857..e0aaceeee2 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  248cb15f4853079dbc02962f2d41db8e1108c5b7b369bbf6feb484d8b1a5be5d  zellij-0.43.1-cargo4.tar.gz
+sha256  ee8fb9d36f07f00a3f21e65aadcb85911132a1de1666c18c0c5afe23f63c49d7  zellij-0.43.1-cargo5.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 64c1efd277..da04d48e9f 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  728fbe4e44cb9b4b8bb0753e962e2889619cccdc354ac141d6e26eb2ca8ee9b9  zoxide-0.9.8-cargo4.tar.gz
+sha256  c86fb903f941d0470712f2e5b37121957a75bdd7e593980ddd8c14a05ec86b5c  zoxide-0.9.8-cargo5.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
