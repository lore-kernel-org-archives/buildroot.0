Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63439EB48EC
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 09:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FEE81022;
	Thu, 12 Feb 2026 09:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBIabDT6M4ZG; Thu, 12 Feb 2026 09:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7918108B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770888289;
	bh=J/kaiLKEn56V4fwTjvWrOKZKBs/v8t/goHRnTtAf9Sc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gFJP4uWv6vd9q5D1yYDsN9A1ttwG5/2DMhkAWksdVjEosmniAmqBDw/xvIeRLWNu4
	 bYTVO3IWYIdxyQEgJZLaNOgwZVtNJUDyaEWNlpAAt8DXIKo84hFS2iPRrKcHVWtS9i
	 7jPbXqHzzGTS6F3f2DcAfnPR4Ct19Xau5FPHnZ13qn6o91jL/JbtNhE149wX59DXzP
	 FOobj+C0VJFke2cEdFIikVOqpHh9WQpv6q+C0pEwwxjnwbgTYcuH5W44k8JGgP8Rqr
	 ji+8qyjz2Fj8H2f5ZWK7yYZQOmotin0vvhr/RxD+40trpOtki4P36fj21JnuwgWiBb
	 OPJj7TBuhtXpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C7918108B;
	Thu, 12 Feb 2026 09:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CC4A23D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B97403C2
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nU8gEfI2eTv for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 09:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F6F940012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F6F940012
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F6F940012
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:24:46 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 47E922C831BE;
 Thu, 12 Feb 2026 10:24:43 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 10:24:56 +0100
Message-ID: <20260212092456.2410238-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770888283; bh=0DFJ6vQyweDap0yOFCFt29ylz3+k4aXs1xAvxUCK+NA=;
 h=From:To:Cc:Subject:Date;
 b=RUpF9PiagechvyjUO2UVW8Ypf3rnYERVn1aMdpkGOBjGU0AS8m5O/sI5cdEhDianm
 tLt2VGPD6qFOQIASZlJe7oqMNxroEiYXwg8pq+1h6XtbM7XcKUi+iBJWuVtzoulUks
 VoNGifD36qQyAhj2APKSvLCFSRtc+/hNZtc5a8Y9e94O983za71tnudrvWL/DIWKwq
 tmetREOMqyd6NOWrxwqDJ1xkFCUXLV6ASd/MJd0+NaKoq6QpoRVGS1AckRKq2vNym2
 ct5b1Obc5bSBRxKvVD6VdxJn4UoP9e5Atc1tzZQwnf168EZpedLGIhpSjR4WfAVAX3
 AZknS61cZ3VRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=RUpF9Pia
Subject: [Buildroot] [2025.11.x] package/python3: security bump to 3.13.12
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release fixes the following security related issues:

* gh-144125: BytesGenerator will now refuse to serialize (write) headers that
  are unsafely folded or delimited; see verify_generated_headers.
* gh-143935: Fixed a bug in the folding of comments when flattening an
  email message using a modern email policy. Comments consisting of a
  very long sequence of non-foldable characters could trigger a forced
  line wrap that omitted the required leading space on the continuation
  line, causing the remainder of the comment to be interpreted as a new
  header field. This enabled header injection with carefully crafted
  inputs.
* gh-143925: Reject control characters in data: URL media types.
* gh-143919: Reject control characters in http.cookies.Morsel fields and values.
* gh-143916: Reject C0 control characters within wsgiref.headers.Headers
  fields, values, and parameters.

Full release notes:
https://docs.python.org/release/3.13.12/whatsnew/changelog.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python3/python3.hash | 5 ++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index fddfcc1a4d..89282fb41b 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,4 @@
-# From https://www.python.org/downloads/release/python-31311/
-md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
+# From https://www.python.org/downloads/release/python-31312/
+sha256  2a84cd31dd8d8ea8aaff75de66fc1b4b0127dd5799aa50a64ae9a313885b4593  Python-3.13.12.tar.xz
 # Locally computed
-sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0189a505b4..d81a3a27c4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
