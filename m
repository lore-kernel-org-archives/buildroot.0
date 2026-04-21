Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B803EF94CA8
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 18:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A42441FEC;
	Tue, 21 Apr 2026 18:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y03vy3YlWd8; Tue, 21 Apr 2026 18:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E4841FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776797990;
	bh=pQixD7SIr+bExjIaSLzOb98prRxGMh7+DHExTjOLnyw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sJHq4n5GUGeD0oAEs1eryn0xbVfH9qd1oYw0FvnfC/5C7niKA9aqiXTNumpFylfBR
	 Yj4+k1SDn2uN9RckrnnArRfbs1vHFOJqrSDSIdfSOWlheSO166LZE13WW4uACAqXth
	 PwMrRIG8SyA5mONCMT2isxvS3B5jtt/T8SFapjR/oG1ZVJFpbrGF64jK4m2ML9vCli
	 4AlNkA0iB9tBex0228fofvKM0Kb9DA4WWqiFiUzbtMgZqMJJKWZPZmaHcOvoS2jp1u
	 buPV5jS7d9J7I11rbb2E/BB2gRKaYcL51PjACK3IrI2+jqC0VJplAmInrkwTwC5r4o
	 f46iXlqoSZOVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E4841FDD;
	Tue, 21 Apr 2026 18:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4127C183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222DC60878
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkzs6Rp8-CIM for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 18:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18A2760879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A2760879
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18A2760879
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:59:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C319A4C0602;
 Tue, 21 Apr 2026 20:59:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46154)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGJx-000000003B1-3gKc;
 Tue, 21 Apr 2026 18:59:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 20:59:41 +0200
Message-ID: <20260421185941.2721885-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776797982;
 bh=2kExGDZ1SoT5PgvIGafK1zfYRXaYJTvN4KrD1Zm90yM=;
 h=From:To:Cc:Subject:Date:From;
 b=p5htoxwBwKdMDCzIbCq22JNPmB8P06q5LQUCalaIuBgnscWBrAq1C/MSo0VmT9sG/
 PihPaFO3tK+0Bg5Kff/DG9q+MPcdQy3rf2njW7g8snCRkvqz1ONvUXn6faz2E6UyGH
 UeKVAgYUy/3FmULIl/RrZGtoMGFgM+0GvS80xes24ReNEgONowEYT3uVcpr9CE3lcE
 HouDiFtDVwgkV7WG9Dj44Rw7NEdZ5rLq3UJ2ztSh9d3Sr/PtvpViFSkvxOqpNqqTUS
 NLNYYC3oAUz5zlXF2lerGt5O0ZsFdgeLBxA5s8rdo8ahFfe3CYIQEsHAFoDOu4kVcI
 TmQvGVm9wKKWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=p5htoxwB
Subject: [Buildroot] [PATCH 1/1] package/ruby: security bump version to 4.0.3
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

https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/

Added sha512 tarball hash provided by upstream.

Fixes CVE-2026-41316:
https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ruby/ruby.hash | 5 +++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 9908fe8d4f..7512d1153b 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,6 @@
-# https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
-sha256  4618db85bb9ec04d8152d0099db488694a3d3c4f52106625e4ad547f1318db87  ruby-4.0.2.tar.xz
+# https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
+sha256  22cf6005d25bbe496b5ebe9224d63a1aaabfbfe02591bb5d612517c5a7836f29  ruby-4.0.3.tar.xz
+sha512  5816fb264ce76df59f4bfe0cadceb45025fada2e61f2c14024d6b03f63d304820cddf94afcf82a4951fd12f3b0d9148683f856f3f2245d56042fc8407b6cbff5  ruby-4.0.3.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 6bd8ad43c5..7e6f6d8146 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
