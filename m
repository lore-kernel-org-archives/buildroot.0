Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9840FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA51407A2;
	Thu, 26 Feb 2026 21:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8ynLc1LZ4d1; Thu, 26 Feb 2026 21:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B8F40762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772140500;
	bh=zYAC5TNB7e67sbwEJJDoLTmt+Dht3X7bP2gP/oRFr6c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rNsy6uFINn+RTiRjLk0wyQ/6Aib0ur5iU1hTuIXsPtDTtcPom3S81UZPG/f1nU9JJ
	 ffpwGLpdLwKptP5zHj7c3nQAk/ppYCc+JNB2dGeCPLtLTaFMpmc2petHIfqphzOBWr
	 1hRqIk4/tMcziKYDXwUfmX9nS11saJMA5TIvVRpuGnSiwpBcDv/wVg/upZ1ein8Uah
	 024AII5GaGeNhvQ4+AKdaYUllPE0dc0de7+kbsq8FR33puljNDkx4lL8dxh3GCHtEZ
	 ybbgcrHs8yzyEKJ5JPxGEA44sltWM7fmrHqf0iMrK2vdfaekkk/WJe1Mcvwm2f9b2q
	 4nNTGwQ0OX3cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B8F40762;
	Thu, 26 Feb 2026 21:15:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B61F51F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BEB76062A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGz6q7buTU04 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 21:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC13B60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC13B60621
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC13B60621
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:14:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF24FA4C23AB
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:14:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48446)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvihD-000000006I3-3BYg
 for buildroot@buildroot.org; Thu, 26 Feb 2026 21:14:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 22:14:55 +0100
Message-ID: <20260226211455.3980585-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772140495;
 bh=pWPNmHEQYSvuoMYER79UabqAhzgruLZN5glleeiupQ4=;
 h=From:To:Subject:Date:From;
 b=TZxXGWzSdDqH3pfglqQoFqWo8FDr4tEpnwt7q17pIGMzDDiy91gdwIvQCYpCF5O/z
 uwxU4CBFRoKHvLg9YClu0k4LZyj72FRkRBz24LfebaVhkAqLxe6JPIwSZqmw78TthH
 VMV7K9Q5mbfkAkNrBu0XVettO0Kb0XDKiES2gYnJszXWry7behPk4JpCgyBgXyz8Mt
 HRlZvLkBfHje/l0b+zv9IeLN7QarTh22bEqU8TbuYKo39xp89YUXWL0sR2BkogvKYx
 VoaKBdBskgVDB+R9ghNOL7i9mwMUhe9h6JHa8gPLHhA17tOI3jUFUVcoWMTvhIWWL4
 9PVIBqdi84h+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TZxXGWzS
Subject: [Buildroot] [PATCH/next 1/1] package/rust-bindgen: bump version to
 0.72.1
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

We need to use the tree hash as version number due to a download error:

$ wget -q https://github.com/rust-lang/rust-bindgen/archive/v0.72.1/rust-bindgen-0.72.1-cargo4.tar.gz -O -
the given path has multiple possibilities: #<Git::Ref:0x00007d64db1eed90>, #<Git::Ref:0x00007d64db1e7c70>

Fixes a build error with mesa3d 26.x and the upcoming llvm 22 bump:
https://github.com/rust-lang/rust-bindgen/issues/3264#issuecomment-3218111176

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index dc79a62ddd..dd2c622297 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
+sha256  b547d29438450601b32a343a936f3c7366a1bcee99b27c0cd841afe758d1eae2  rust-bindgen-d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 8c02db557f..0a26a1a9d6 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.72.0
-RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_VERSION = d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
