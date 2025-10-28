Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A25CCF9E0
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 09:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E527410DF;
	Tue, 28 Oct 2025 09:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zWUlLkNjKWe; Tue, 28 Oct 2025 09:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8BE4119D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8BE4119D;
	Tue, 28 Oct 2025 09:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CE943F
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 09:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DE0661562
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 09:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AX3zkGR_fwHP for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 09:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=5.252.110.31;
 helo=skyboo.net; envelope-from=manio@skyboo.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F51E61521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F51E61521
Received: from skyboo.net (skyboo.net [5.252.110.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F51E61521
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 09:36:37 +0000 (UTC)
Received: from manio by skyboo.net with local (Exim 4.96)
 (envelope-from <manio@skyboo.net>) id 1vDg82-00EuyF-1Q;
 Tue, 28 Oct 2025 10:36:34 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mariusz Bialonczyk <manio@skyboo.net>
Date: Tue, 28 Oct 2025 10:36:29 +0100
Message-Id: <20251028093629.3555204-1-manio@skyboo.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: buildroot@buildroot.org, eric.le.bihan.dev@free.fr,
 manio@skyboo.net
X-SA-Exim-Mail-From: manio@skyboo.net
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on skyboo.net)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=skyboo.net
Subject: [Buildroot] [PATCH v2 1/1] rust: add support for
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
From: Mariusz Bialonczyk via buildroot <buildroot@buildroot.org>
Reply-To: Mariusz Bialonczyk <manio@skyboo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Mariusz Bialonczyk <manio@skyboo.net>
---
 package/rust-bin/rust-bin.hash | 2 ++
 package/rustc/Config.in.host   | 2 ++
 utils/update-rust              | 1 +
 3 files changed, 5 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7f9d2f6339..0c7dd2180c 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -57,6 +57,8 @@ sha256  89cf8b30e0fae601e0603e41d5eaf58881729208cac83636eff89b94724b7112  rust-s
 sha256  1030e71f755692c3429bb16829cca776c1ac372abbce3001b04d4e46b1e4f32f  rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 sha256  d446fc0d8e4ce985c2d21aa2adb6ec9fce8f7ebde85655200abd71e142b9a981  rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  5ddf0fe9b406c210dd460c4740cf8f530299bc9ffcc869613ade096f8ecb7f7e  rust-std-1.88.0-riscv64gc-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
 sha256  df3144f87a22d606abea4dcfe88369fcd499ef2fc748724b47941308ae259a5d  rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz.sha256
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c3e9a13f39..248a23284d 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -92,6 +92,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
 	# i686-unknown-linux-musl
 	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
+	# riscv64gc-unknown-linux-musl
+	default y if BR2_RISCV_64 && BR2_TOOLCHAIN_USES_MUSL
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
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
