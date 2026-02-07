Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882DCEE20BD
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 09:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072EE40AF5;
	Sat,  7 Feb 2026 09:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DilBeL9VbH7K; Sat,  7 Feb 2026 09:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E12340AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770457199;
	bh=DJElS6VuTq82hhc45cBW3umtcVYNri2GgIE7IOZt1o4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EKkLvWjmSXyUpBchjnnkf4BBj6MlhxZgXSQppCt9FdwJ3JyXGZ9U6WAep6tfKgsyC
	 ntHICZaVWexXWN+pFhL+mXB8XM2Co0EhhzbgEVjb2bnMpMidL4Hspi1KMoc8r7mCaQ
	 3PEhYbyVj76aHOLqcZl1zt+rFenmbqZVUlJFRgHkGy1hhyl7JRplKp3NfYQyUV5shS
	 2ERtahsziD4VSR1sh/R8cxgkxYk2csWeKOe6hgJCj3+QyI9KkwhRyh2ugA3qGDIaa7
	 ZrRDKyemOZRwqOOv8Zz7UlARjqL6yDOj+6pxa8wqMnuyDA7Fq6/Gecm8YYZjcDBgtd
	 KsKL+pvN5L4/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E12340AE3;
	Sat,  7 Feb 2026 09:39:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CC81219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 09:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEFB980FB5
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 09:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Twl4PYRCd2WW for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 09:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 763E880FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763E880FB2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 763E880FB2
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 09:39:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b14a.dip0.t-ipconnect.de [84.161.177.74])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9AE25A4C0273;
 Sat,  7 Feb 2026 10:39:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57486)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1voen9-000000006eO-0Vvj;
 Sat, 07 Feb 2026 09:39:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Sat,  7 Feb 2026 10:39:49 +0100
Message-ID: <20260207093949.2339591-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770457192;
 bh=ZvAtx/oLTJrc5PeUTdBkBq6oZpBqf0tuKJBAlWc8yNc=;
 h=From:To:Cc:Subject:Date:From;
 b=oiKIAdKYYrKWgJoBDaJUhbMGAJ25aHtYbKg9tOLXfNTt22oBGhNSk0y1yxLRn7mDl
 /QIRp1+42ichW0FbvEs3kVke4LhbOJTMADEV5Gn86eDnY3zDsf/5/NlphFEIX1EXxu
 UZAXf16YM0wYetJnyoaWpQAw9cEoH6nVVfBA1IYgNnm4yeX/rmo7NGxg5X9MR1oZcc
 RWdD/02lDziMDM4D/xUgUaKDCVgTrM4Yaq1bJRx2XglJSmqKxO2svW2cEQB3J3GrLa
 hGRlhjFcwsFQ2ymx/2XOCluJ5SQ0DaxpqDAkupm7eAc/vR/6PNV3xlsHpwORvBtfFT
 yOwr5y0kSiLDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=oiKIAdKY
Subject: [Buildroot] [PATCH v2 1/1] package/{rust, rust-bin}: install rustfmt
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

From: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Rust-for-Linux expects rustfmt to be available; otherwise the kernel
emits a "rustfmt not found" warning and the generated bindings are not
correct. Provide rustfmt from rust-bin by adding it to the installed
components.

Note: the dist tarball exposes the component as "rustfmt-preview"
(as listed in 'components' file), so we use that name.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Bernd: added rustfmt-preview to rust package
 Fixes mesa3d warning:
 Failed to run rustfmt: No such file or directory (os error 2)
 (non-fatal, continuing)]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Added rustfmt-preview to rust package as well (Thomas)

 package/rust-bin/rust-bin.mk | 2 +-
 package/rust/rust.mk         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index db7d4a1cae..fd72bef8fc 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -40,7 +40,7 @@ HOST_RUST_BIN_INSTALL_COMMON_OPTS = \
 
 HOST_RUST_BIN_INSTALL_OPTS = \
 	$(HOST_RUST_BIN_INSTALL_COMMON_OPTS) \
-	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
+	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME),rustfmt-preview
 
 define HOST_RUST_BIN_INSTALL_RUSTC
 	(cd $(@D); \
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index f9889e3931..bffbe63d6f 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -66,7 +66,7 @@ HOST_RUST_INSTALL_OPTS = \
 
 define HOST_RUST_INSTALL_RUSTC
 	cd $(@D)/build/tmp/tarball/rust/$(RUSTC_HOST_NAME)/rust-$(RUST_VERSION)-$(RUSTC_HOST_NAME); \
-		./install.sh $(HOST_RUST_INSTALL_OPTS) --components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
+		./install.sh $(HOST_RUST_INSTALL_OPTS) --components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME),rustfmt-preview
 endef
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
