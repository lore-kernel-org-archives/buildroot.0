Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096D0EDF054
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 08:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8104E41D2B;
	Thu, 12 Feb 2026 08:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SJWKqbPJuN2; Thu, 12 Feb 2026 08:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC5E41D2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770883577;
	bh=J/kaiLKEn56V4fwTjvWrOKZKBs/v8t/goHRnTtAf9Sc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=PAJmRa3krDnC1PKdzPferKXB1xcLtL13AZx+rG2NYvEisDrrwPFe1q/NK9UZ5I6wF
	 I5KdEhtwkzPuatJH/l/Mxx30Qh3cdx6Zg7BDAhrLmmlMIiEgfG/u5vxu8caLQJoV5t
	 FNZSB4FP7gXgI2ajAQrODCani9kB6WCYi1LY3oh8cMs4vPLuo+M9vxxRzh4kyQnXxv
	 NRPA5JXC06l/Q8MGRsc+fQUM4xuPbdzx2eRyuscAigLJyC3fe4cBWjuUQgC0MPqU1/
	 7LFckvxJ7X/U5s9lBqC2ihOdGjVMQYgy2VyZcgAiXIV439p0yyQh0zVS6IwYN+m/NE
	 rfrh9YKbFPD6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC5E41D2D;
	Thu, 12 Feb 2026 08:06:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E909F23D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 08:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9DAF41019
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 08:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9p0wktF5NFyJ for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 08:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03CB641014
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CB641014
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03CB641014
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 08:06:13 +0000 (UTC)
Received: from framework-OT (p4fc5197e.dip0.t-ipconnect.de [79.197.25.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1B6932C831BE;
 Thu, 12 Feb 2026 09:06:11 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 09:06:24 +0100
Message-ID: <20260212080625.2408593-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770883571; bh=0DFJ6vQyweDap0yOFCFt29ylz3+k4aXs1xAvxUCK+NA=;
 h=From:To:Cc:Subject:Date;
 b=d2JoQCsbjuBIFHghQ9CKvnb5ZnW8uzqeZNMRLI930Je5aLDcmFmGbFJBbsWHaZVYE
 VqoHjNHtYONH7wwUyJr0Za5Dh+6Bsn9sfXspAj7J1w2pS9ghYpPGkBb/j1AcE+Oicx
 svN9dSiwUhyypIBTiNRpc45ePJJIGMMVm64jm+GhspeVsNhuQ2VdXWFxIe/68L2uS8
 FYfzL0kmkdCz3yfNvtq93GlW171cgJ4pZ4aBwhLkN0+WY1PpR0ufBOuOEJILNcbzvE
 rG+dgVZkoKJT5q4f6z8BsBosJkMOq0mr7l/7GSBpBHuyh7ZcbIzNS19/YAl8lwWdPj
 LCfgm+1CGz1ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=d2JoQCsb
Subject: [Buildroot] [2025.08.x] package/python3: security bump to 3.13.12
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
