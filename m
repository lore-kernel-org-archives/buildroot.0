Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A3BCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 18:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5686340A3F;
	Mon, 17 Nov 2025 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIoAynHkqN0f; Mon, 17 Nov 2025 18:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E61F540A22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E61F540A22;
	Mon, 17 Nov 2025 18:57:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF23F158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B13E881B72
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yy77mbs9AjqB for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 18:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 363D981A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 363D981A99
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 363D981A99
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:57:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28D2EA4C6DE0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:57:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41560)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL4PP-000000006II-3jvb
 for buildroot@buildroot.org; Mon, 17 Nov 2025 18:57:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 19:57:03 +0100
Message-ID: <20251117185703.4082205-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763405825;
 bh=Xg4oZ46S+50sAI3vgYHJ4lGzWSQLKCGmHipjLiBy+yw=;
 h=From:To:Subject:Date:From;
 b=k8md2yFVDwxEPoAsNFiAB79mgrxb21swagV/OVxfO+PzkIq9/q+LXZCP0GF0HsPkr
 T1bMOqVa9kryQyjI97nURiRNNidZQQSgNmd9SmuA19NtVro9E2U0zzE9rwfO5HMk9V
 m8Y73KqTMigUmrIInTOiqXl3EzFFrbcjE5UZfP30cwDfoyGNSNQQHlb5HNLhMfRW/J
 VVdp/gG0jT2buJOwlOA12PREIJu3khQEwsTu26eAaoL0g/KNe0YADAR3yBsUp79yG5
 Ru5QNeFpvSKtossYzYM6Ql8xP0MUYk4nZlKTbxq09sE4khg8fBxaUJg70V6wL0GJ1o
 e0Z0T2mDOtJNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=k8md2yFV
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.129
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

Release notes:
https://lists.x.org/archives/xorg-announce/2025-November/003642.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 357f7d1366..e2dbbf18ee 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-November/003639.html
-sha256  3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac  libdrm-2.4.128.tar.xz
-sha512  b80e6be1c9d0427e1c3ffd018213d7230333f037498cf98819a8a6c50d923ad3472002044e010ca9dc646ef79dbca241bd47eaa992014cb7063b31cdb84037c7  libdrm-2.4.128.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-November/003642.html
+sha256  5978183f978d697e26a50ba066174964efb0ab97caa1ecaa1b861fbe5ddf77dc  libdrm-2.4.129.tar.xz
+sha512  3ee702cc4a578e9ab231caf8a84700e4dff6f3da70731610121ac2c3390f42e42ad144ea61c53582e3a8adfb1d6bf8254993c5c6eaf85a51421e26d51d341cd4  libdrm-2.4.129.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index ae0129fa48..c499632f6c 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.128
+LIBDRM_VERSION = 2.4.129
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
