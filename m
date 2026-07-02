Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6DEC43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 06:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1804141216;
	Thu,  2 Jul 2026 06:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkRC_J8fTlDc; Thu,  2 Jul 2026 06:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBD640F5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782974886;
	bh=3le2n0shtiSyjKyaFdDxsz70kzsTuUURPCMo1JVtzVY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oig+a1IbLAN/KdE3RdSoQxSXh04pi/5z7CtwqrNWFSh+1JeWIye8niG6c9t87uOcK
	 tt/al8gYA4fwWPW9AxEoqNuh+tkLKpKmfMhLD78Ow/hPKERsRRYMIchgVMAqKsDCCs
	 BbM7sTN+Yqb2Nbg7glbb7b5TCUqG2SwCzZ99ohV5BF/7nFeFPAvzwopKA3ArBjfOdp
	 83dmZFrXPPO+DB0/PJRUbPsovFKwXlZFmwBQVHhTkxcl/CGeLOFiMyfn1AB+jEGB+M
	 lfuiRtqMV5qoh7auNbowDmzyrmrWzbgS0ZxC1gtYwB4TPrbORbOjbj33XF3Yb8SlPE
	 /Yid3j2mu2PvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBD640F5D;
	Thu,  2 Jul 2026 06:48:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C645316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E82583299
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKZbKi5Jbi52 for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 06:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32CD382865
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CD382865
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32CD382865
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:48:04 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2B87331E0AFD; Thu, 02 Jul 2026 08:48:02 +0200 (CEST)
Date: Thu, 2 Jul 2026 08:48:02 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <akYJoolzlfi9uuQW@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1782974882; bh=q2Gc17dcZDJpO0W7h5aPP5eH4gao3ZeNfLS7LpxGwrQ=;
 h=Date:From:To:Subject:From;
 b=JgRmV+Mt11eOlyRYG9QKqhlMU1UXfXcObr2qDt8k7UcvMqXSbMxxh9OjirNVzJdQu
 ea+z89liqbjnA3/tRYIDUK6tIMDYWh3Qjosi5LAza5M5OhAjRWuRaM5QAC8t1uqGz2
 R6oaaqhDFoUMQArtPnZ2mHDVA0wkWQOemuqIzecYnkFLYm+ywCGFz14EMMLwqVuYM4
 wJ8e36D/B30ezb1HnLyjgr0aAXXJPh//jgKjlilbMkoivi1wkMF90klP6Omok8S9tR
 IP6ObfGg4jDNLTOHye1sJmDR1Wr3vD+3pvOal604k3hIG+3j5Eg2p52s0hR+ydt1kR
 kr58ubnEgpWeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/ruby: security bump to 4.0.5
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

See changes here:
https://github.com/ruby/ruby/releases/tag/v4.0.5
https://github.com/ruby/ruby/releases/tag/v4.0.4

Security fix for:
CVE-2026-46727: Use-after-free in pthread-based getaddrinfo timeout handler

See here for details:
https://www.ruby-lang.org/en/news/2026/05/20/getaddrinfo-cve-2026-46727/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 7512d1153b..453c028d22 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
-sha256  22cf6005d25bbe496b5ebe9224d63a1aaabfbfe02591bb5d612517c5a7836f29  ruby-4.0.3.tar.xz
-sha512  5816fb264ce76df59f4bfe0cadceb45025fada2e61f2c14024d6b03f63d304820cddf94afcf82a4951fd12f3b0d9148683f856f3f2245d56042fc8407b6cbff5  ruby-4.0.3.tar.xz
+# https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
+sha256  5dc5521ea54c726e6cc10b1b5a0f4004b27b482e61c04c99aed79315e30895e5  ruby-4.0.5.tar.xz
+sha512  379d78a6d1af0455df60da46551f43438ad3ee81f83787554fc34cb1c8febb1bd363e3dc1a057b34a69f96526efc308d3dccc4b87d368897c2d1ccf179096463  ruby-4.0.5.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 7e6f6d8146..eae9db2156 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
