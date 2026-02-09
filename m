Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB638E94603
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 20:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6647083DEC;
	Mon,  9 Feb 2026 20:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxeroRrgGUjF; Mon,  9 Feb 2026 20:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1213183D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770669138;
	bh=Rrjdcp0f6C65QLXeDn5KKCzxAczBVaru/swLLs2Bqek=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hkZX4aI2KnK4sf1DZR2JV6W16IagzR0/sf1Yf//WcDTWfZ50WkbPlbF3S6MnVxg0p
	 F9kTQJqSwOx5Tj9gdkBqkRMGUBY1dpYHvlr0yRoSCW2ElnSDHIUPCjdm4AmDF+1PEj
	 x6as7ku9lVMzmWjqaFvqbWcFANcJdmI7eHbnKyAliQ5Zxtd2uAn4xFIa1YWqcAPBvK
	 JrFrfITr1ORzHIxr/viugXo2Rd1IURb/GcDPKwopDgz9eBpTFCUZVVHngWmBLHpgY0
	 6LEirF7xXnJKgNExKb4lpnv/srLnxKNr4T5+dKM8URFXpwPe0c/1ZbexKR7HdGsujd
	 uQHvIdQno59Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1213183D3E;
	Mon,  9 Feb 2026 20:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21D6FF2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F124400CE
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Thaooy7E4W-Q for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 20:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E9CB400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9CB400BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E9CB400BD
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b67.dip0.t-ipconnect.de [91.58.11.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6238A4C0860
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 21:32:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXuh-000000001Rf-3adZ
 for buildroot@buildroot.org; Mon, 09 Feb 2026 20:31:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  9 Feb 2026 21:31:20 +0100
Message-ID: <20260209203120.3837030-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770669121;
 bh=tWZzpFr52vdLlj7jp6ymQMsk/yPukJTcFkgqdyzioNo=;
 h=From:To:Subject:Date:From;
 b=hDQIpwIaZMvVhV7ftSr3vMkRvvJyipwup0esRn3ArcOKAitFleG/TyxFMRD+nkt91
 CzLLkFd1Rv+WitrFznnv2uUgY/VsGcVcnWUiiNkGXIawMlo6otpVuBUJoEvXcPhWKO
 4NMg6/lBWB0wZK40kGr/buGstMHqcrwfVV7td3HNC0zHVk0ZKDRWgczQDgrmJ5b3XY
 TNKrgcG0Y6aNN1ehR3SYsP528iMjfBb6utnpRF76X6t4ltF7Nz4olR4/0oMkrukNGH
 N8fa6UyS45lXRa0AsxSnOIMEXghxypIuB7RRBjT0PXbImDg3gd/dizZI6kFlJHQiIG
 k1jGlRt9eb8MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hDQIpwIa
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.12.3
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

https://ccache.dev/releasenotes.html#_ccache_4_12_3

Use sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/ccache/ccache/commit/ec039169a4d93f7bae3f3f99762bd0248c9d3bd5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 5 +++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index cd8a95f7a2..1c666c9293 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,5 @@
+# From https://github.com/ccache/ccache/releases/tag/v4.12.3
+sha256  c8e3ef79531966ecfa05bd1666c483b473df9af00896935cc468cb5ed573c16e  ccache-4.12.3.tar.xz
 # sha256 computed locally
-sha256  96ad53c76ecdb9c7a78e28a9bfdf2c95d7eece28546510fde7e16e5a13e2f7f8  ccache-4.12.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  fc33d985529cdb5ea484ee46d6df4de6a6bca25ebdd3f3211c9d15f1c59dc75a  LICENSE.adoc
+sha256  afe4bea7c75355e3a1c7bf6eec6f95fab01f2e8116d8e495e5af4c3a45513ae9  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 4f6a6bdece..30f87f7d90 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.12.2
+CCACHE_VERSION = 4.12.3
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
