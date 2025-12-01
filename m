Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CDDD116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 18:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD28F6110D;
	Mon,  1 Dec 2025 18:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH9O7byxbj-P; Mon,  1 Dec 2025 18:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A8D610FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A8D610FF;
	Mon,  1 Dec 2025 18:02:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE6731A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 18:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C070A407CD
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 18:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hs1B9eWvOTNN for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 18:02:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EA544096D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA544096D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EA544096D
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 18:02:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF170A4C77B7
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:02:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45794)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQ8Dv-000000007eH-28JA
 for buildroot@buildroot.org; Mon, 01 Dec 2025 18:02:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  1 Dec 2025 19:02:07 +0100
Message-ID: <20251201180207.3466845-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764612128;
 bh=5EE5V2yJHDKV9VcaVopBJnSIedfd5eCHUtdxBrqmBqg=;
 h=From:To:Subject:Date:From;
 b=T1ZQIusDqoYDvqlP/z4o3rCG++xve3EC9yoxBmhd9PGk/t8q+d/zQrJhi9kht9FGd
 Cqqf6APRV3xrAk5W028C2lppCYWlQDrDT4DMzhuzfEO60yClepBqrPJc1U3grm+IX+
 8Hq2o4FH5Qc4RISJXbI4zPHlqkQhIwhm1GkuAfqNvgazmPBq1zGLdIwU+1MiIrIE1B
 1+S+vC9O02oh+gg79jL3iEqdw3jo6ndADHUIjPiso1Ahojuc72P6yxZ50LyKogdC7+
 DWVo/diHClHf/yWY8LAQ28GFrvlhZuvCD7Kq11ph3RwWLjsWGvNJQYJZBfDQJ7bQLB
 xZKfa+J84pBbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=T1ZQIusD
Subject: [Buildroot] [PATCH/next 1/1] package/ccache: bump version to 4.12.2
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

Release notes: https://ccache.dev/releasenotes.html#_ccache_4_12_2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 88377109db..cd8a95f7a2 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  42e6c4b260cffd92dfa755e26390f45f5842e8c1a5f64f2b2e68adfbe82d1542  ccache-4.12.1.tar.xz
+sha256  96ad53c76ecdb9c7a78e28a9bfdf2c95d7eece28546510fde7e16e5a13e2f7f8  ccache-4.12.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  fc33d985529cdb5ea484ee46d6df4de6a6bca25ebdd3f3211c9d15f1c59dc75a  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 75ef404d27..4f6a6bdece 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.12.1
+CCACHE_VERSION = 4.12.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
