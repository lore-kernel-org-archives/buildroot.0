Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96553C87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 18:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 277D383E12;
	Fri, 25 Jul 2025 18:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG_iXX7_ZTXA; Fri, 25 Jul 2025 18:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5852D83E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5852D83E11;
	Fri, 25 Jul 2025 18:27:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B75177
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 18:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0319641D62
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 18:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymnLxgrNGzn7 for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 18:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3203941D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3203941D31
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3203941D31
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 18:27:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48B16A4C013E
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:27:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48154)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ufN8x-000000004r1-2rcP
 for buildroot@buildroot.org; Fri, 25 Jul 2025 18:27:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 20:27:43 +0200
Message-Id: <20250725182743.3599859-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753468064;
 bh=uXRJeNe/lYoeBmYaANYI/AuHoKGHDvxroFd/R1dqN4o=;
 h=From:To:Subject:Date:From;
 b=wR/QcdWpdB7ksWnzE31qbiQKuUFyS/7Hp3txLvOjKvDySy0lQxnbd/ZMFm/rcCLpZ
 y7mtgSwjVy1/lQit9NZ63kWXBRWjKss9OD14HkUcfBLyf6P0GDkDqyL2Ptb60ujdZR
 0lPQNnuKNfjLwlVdUvFH76sn/qh+/Fjmn8JY6EFZSxyBkhRxd+6yhPxyrUfiwKaa1H
 mxJvxKfEn5zltXcN3ntIxclq7tPK1UjrFnAWHwsLZfdbNx/3fN3DZnD1V6/VCMxGB2
 SmYsadQuGs+YO04pmeHTDBQdBqQ1TAY6fRS0ipUZbHlSqrOwFWvvgNZgMSmVBbKK62
 pBeR1JecZ9KzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=wR/QcdWp
Subject: [Buildroot] [PATCH 1/1] package/rust-bindgen: bump version to 0.72.0
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

Changelog:
https://github.com/rust-lang/rust-bindgen/blob/main/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 0718bdc696..dc79a62ddd 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20d32e8e182ef49694a65a4a18d624cac7caa30b03422212d503a7edc0d04f6a  rust-bindgen-0.65.1-cargo4.tar.gz
+sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index aa0d7d44a4..349d4c3670 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.65.1
+RUST_BINDGEN_VERSION = 0.72.0
 RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
