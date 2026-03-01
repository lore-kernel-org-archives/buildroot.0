Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40623FD006D
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 16:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA0760BF0;
	Sun,  1 Mar 2026 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqbEuuQdhddK; Sun,  1 Mar 2026 16:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42076090C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772382600;
	bh=qz4ek2HhKqcMenZZmdeZYIBf7vC+mbnNJWEtLOQG5EY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bg/jn+Gq6xmXy5BSgtM1b3AAxZZ0uJc2ismPxO82gVhoKuveL1FvXBjAe8AWVYjBt
	 n8jr2g44ORNs2r1dpk89I52rJmXOdCO7UcR/Ghx2G/tB6ARraQtc1qkeugB8l9mzIf
	 dD4o3o0hs6toGwaAurTp855I6jtLpMg7H3uCHGhQrdgHDT/QyqzYhs926u8EluenHm
	 Z/mQWHyD39rV8JAyxi7nfXuHpBy+aitCaNBcgaDT/8MYq9SoHf6d1ws0mk1RHsdWiH
	 jEcMcsCklVCO32T4CwAuxdvZRZYrm851ce9FafNESold54OT6GS6Q//iHs30wahSsZ
	 OcThh7Z1VzqeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42076090C;
	Sun,  1 Mar 2026 16:30:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34F98231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 16:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16F4640629
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an6OpUUxzrLJ for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 16:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E692403E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E692403E3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E692403E3
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 16:29:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D8D3A4C3001;
 Sun,  1 Mar 2026 17:29:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwjg3-000000004ZT-1a5u;
 Sun, 01 Mar 2026 16:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  1 Mar 2026 17:29:54 +0100
Message-ID: <20260301162954.2893222-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772382595;
 bh=J7bmNkG0LIoPi24R1/lJBbyNfGBitTTnC8nX8rrJES0=;
 h=From:To:Cc:Subject:Date:From;
 b=tpDBWr/9W917e7q6m6IQvlxU8vj7CSwj5XlUFQYhGfF+L16zYypwdtggu2S5+Zhtm
 ktPANjOCxapQ7KeHKQ2aKhAfzgv+SqweVcDmLIwkGA+TMrwhf70/Zt/TxTpWAOPbq7
 iHoQhNtHSK9xPiUKOIY4PxkklMDM+36duGfru+MjZOFYP2SY2zhMq/vwvQlbYoB37q
 J0LgbUA8jym2mekghNWzM1ROw7lgHufIW0DOXubqGHOpMxnXuV8u0m+GTeY14Y6uTS
 vVTC0jg+cweXPCJlAqNkIS77nKVQwDMAhK6FEn3mqpVBJgoTTRsYB58Syad/SEKvNE
 m+vgnF1t3LQeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tpDBWr/9
Subject: [Buildroot] [PATCH/next v2 1/1] package/rust-bindgen: bump version
 to 0.72.1
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

https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1

We need to add "refs/tags/" to RUST_BINDGEN_SITE because the github
repo contains a tag and a branch with the same name:

$ wget -q https://github.com/rust-lang/rust-bindgen/archive/v0.72.1/rust-bindgen-0.72.1-cargo4.tar.gz -O -
the given path has multiple possibilities: #<Git::Ref:0x00007d64db1eed90>, #<Git::Ref:0x00007d64db1e7c70>

Fixes a build error with mesa3d 26.x and the upcoming llvm 22 bump:
https://github.com/rust-lang/rust-bindgen/issues/3264#issuecomment-3218111176

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Julien Olivain <ju.o@free.fr>
---
v2: updated _SITE (Julien)

 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index dc79a62ddd..72ff0401ce 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
+sha256  9dd2f0f7bae7c84b1d79fb848d17335b8ebc37c27cd5ecb6e0da3ec0dba87d71  rust-bindgen-0.72.1-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 8c02db557f..55f3b4d5b7 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.72.0
-RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_VERSION = 0.72.1
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,refs/tags/v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
