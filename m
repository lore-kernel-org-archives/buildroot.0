Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DEED711C8
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 22:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF0A412B8;
	Thu, 18 Dec 2025 22:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSuZ-wzMHf6R; Thu, 18 Dec 2025 22:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD18D412B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766096761;
	bh=/4Jsl2ki5z7lSoF+Cv/iYssC4zef39RBxFWTL6oRiWQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gXMp7ZXzp/e4zfaS49Nkl5W7XB2uwUQDS7dnJaXFWD23KC9VlrzDA5HHAIzCPgHRk
	 Bz53LgoFLw4dbgCi0cnFUYBkk0nOHr4K97+LeNUvuyhbiefQNwlJsN/Z7rci3vgg5B
	 36WwJIdHyGixW/diYjXuWorzBskuzmwCisQnG4qySRjPUcDxo9wldGATQzrQWaJKWB
	 n7M7qm7RtkgvAjRqWLPqkU00G+nKik7JZ8Il9NhuA/Y3sKsonlCVeL2Z3hCbJSJQho
	 N7lVo3pPWdWzuoWyPS/y41hRdndwCzZEh6QNoo3sOPPG2iOmn6dcnPQZt+pwpyczXH
	 NrPodLUyvx+DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD18D412B5;
	Thu, 18 Dec 2025 22:26:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE256293
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 22:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A050380BF4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 22:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJkOCxOXUewT for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 22:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E11380B44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E11380B44
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E11380B44
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 22:25:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E589FA4C490D;
 Thu, 18 Dec 2025 23:25:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35438)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vWMRA-000000003c8-0k5J;
 Thu, 18 Dec 2025 22:25:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 23:25:27 +0100
Message-ID: <20251218222527.3861751-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218222527.3861751-1-bernd@kuhls.net>
References: <20251218222527.3861751-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766096732;
 bh=Q7l+DErIwb2WtuBR17H6pZWLQOZT5aA6Y8QdanydUks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j7DBC8Smui0VWigdVZH/8Vwtt4XpgZrX4BZzcWNgN9/aXNCFxQl5u1pPQi/TwnjDo
 AYvEkCy/8+t2RNQc8s+jWUKfs+JJnWvbB90NFCMaRwf7kmOssmXEQZfqhCNFpYs1Yw
 PeB3p0wpz11dPiAMvnE/EsFD/p6iExUsF/YwlrNBKgbU0gldily2w03N6GCsQyub89
 LdIRzYN/gaFwerjCq4jENEfRCy88k1uqTxqlfA7y53+HzxMAzFDtmP7adn7AxtfPZ/
 WSMPbhqb8YwXZYJY417lEj2hJfFW8ZULYPOn1jBzvjNVz2XIUrnk+QryGS43Hm3Ury
 SZtiz4HPCmQhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j7DBC8Sm
Subject: [Buildroot] [PATCH v3 3/3] rust: add support for
 riscv64gc-unknown-linux-musl target
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
 Torben Voltmer <mail@t-voltmer.net>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Alexander Shirokov <shirokovalexs@gmail.com>,
 Mariusz Bialonczyk <manio@skyboo.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Mariusz Bialonczyk <manio@skyboo.net>

Signed-off-by: Mariusz Bialonczyk <manio@skyboo.net>
[Bernd: rebased for rust 1.92.0]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes
v2: rebased v3 of original patch
    https://patchwork.ozlabs.org/project/buildroot/patch/20251028101656.3662735-1-manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org/

 package/rust-bin/rust-bin.hash | 2 ++
 package/rustc/Config.in.host   | 6 ++++++
 utils/update-rust              | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index ea3bbab8b7..c17d5f22c8 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -57,6 +57,8 @@ sha256  2ce706afa4a46b6773340854de877fc63618a40e351298a4e3da8eb482619863  rust-s
 sha256  eba59766c2d9805c0a1fc82fd723acbb36569e1bec1088c037bba84d965f70ba  rust-std-1.92.0-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 sha256  8ee20dcf3b1063fa6069b3ce85e1fcf42794dfa783263314865cb53fff42d9e4  rust-std-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  f20d822309900fd6c7230688694baf91e900154e44e6247feca49b7b7a203a57  rust-std-1.92.0-riscv64gc-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.92.0-s390x-unknown-linux-gnu.tar.xz.sha256
 sha256  ebf944dc95015498d322504a54e4f9cdb28590f7790aa3a9eb86d6cf4b6c93ff  rust-std-1.92.0-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.92.0-sparc64-unknown-linux-gnu.tar.xz.sha256
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c3e9a13f39..b57eb1aece 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -92,6 +92,12 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
 	# i686-unknown-linux-musl
 	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
+	# riscv64gc-unknown-linux-musl
+	# "g" stands for imafd, and we also need "c".
+	default y if BR2_RISCV_64 && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
+			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
+			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
+			BR2_TOOLCHAIN_USES_MUSL
 	# sparc64-unknown-linux-gnu
 	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/utils/update-rust b/utils/update-rust
index 7db3feff9c..18d7b1d1f8 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -52,6 +52,7 @@ RUST_TARGETS = [
     "powerpc64-unknown-linux-gnu",
     "powerpc64le-unknown-linux-gnu",
     "riscv64gc-unknown-linux-gnu",
+    "riscv64gc-unknown-linux-musl",
     "s390x-unknown-linux-gnu",
     "sparc64-unknown-linux-gnu",
     "x86_64-unknown-linux-gnu",
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
