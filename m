Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD72D58CB1
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 06:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A55C140D28;
	Mon, 23 Mar 2026 06:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVHAkhf06khL; Mon, 23 Mar 2026 06:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA8D40AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774247651;
	bh=b4b0oaScZ7oytHOZU32UVMWapXzR2wLkUAShdVWMvL4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jcL6mE6XaMlvj/as3U+KMl4F3c1mAi73c3D99uEAoiedW9LcX5m/Td/7R4++kV2+3
	 HpNejr3RcgTY3gzQKZ1FZvPKR1Kj2nwpsyyJGP/zNuKGbnY8iUCPa29LmE3z2OFATy
	 2VD5h5I5boCbnKSKC4khSZGxeHIQIbhu0uc4sd2cQWfeQnObInko58zUhAXZ3HVt9w
	 ZaIrPVg1dvyYZQRohnzpBb4I8npqx1Yq/i1zISluZsWJxSgx915OT8GUBAF8TJOJjz
	 LdK/fwdNCm5CftheX0pu7+amUzYLjblxXGqNl8FBaNqccTs2hroz3k9c83+q12U6lr
	 l7uZ8QGaoQusA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA8D40AD4;
	Mon, 23 Mar 2026 06:34:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B590B353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 06:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 977FF40AD4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 06:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neobGs1cm5w7 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 06:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7845E40AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7845E40AC8
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7845E40AC8
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 06:34:08 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7528E31E0CAF; Mon, 23 Mar 2026 07:34:05 +0100 (CET)
Date: Mon, 23 Mar 2026 07:34:05 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <acDe3WDkqsQZlkOK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1774247645; bh=1evz3mvDINqCImsiy3okXweWdD0/g5/7773pOL3dRoo=;
 h=Date:From:To:Subject:From;
 b=cz1GC1KwvjBtKgr0YhoDUBdcFABxywDdKwcO5maUeOIoy4ppAlNMM0zsDAqcpzSth
 3IIx05WjnQAhMbOubVq5C9B75mF75eDxJqtO7L7yDn5ESGwgHgZAEtcuFtdAFzphhP
 Qn/O7rMoGOMSN6CQCidAKI/cAPCe9t9b5Nty7PCvsWMskOL+SydcIDwIPEomnyoYvK
 WDOkQ0vENKQ8nOJK+bWKLxLs6HcrmLPyqa+J5wzjr7ZjPZxsEpS9JdWU5VFtthF2w0
 Sd0R39KiLXI7UKWLtivikjqINAJGB+B8ej3IIoRB/nHdSi6yL+7IBUg3IvALW8Pptc
 +KJa2bWx98iTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/ruby: bump to 4.0.2
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

See here for news in the release:
https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index bd64f97339..9908fe8d4f 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2026/01/13/ruby-4-0-1-released/
-sha256  0531fe57dfdb56bf591620d2450642ea0e0964f3512a6ebee7dc9305de69395f  ruby-4.0.1.tar.xz
+# https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
+sha256  4618db85bb9ec04d8152d0099db488694a3d3c4f52106625e4ad547f1318db87  ruby-4.0.2.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 5e8b40a556..6bd8ad43c5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
