Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA1E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18B880C00;
	Sun, 28 Dec 2025 21:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3t88WgocCmj; Sun, 28 Dec 2025 21:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 046DD80C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766956269;
	bh=W5gNZPZBFfctMSrvSfFvbeukDhGsYPiREX7X24T2cwY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Un0NBP9Rr6azYblxmrvitBh1mIo3o1bnl+xiwW2y8KjYQXwaN4sA1oxroBDe5NsGx
	 62BIyaWsVHJOdYq2HxyJSmk8AlTJcY+lfkzyxwNpvTYIDZduG8QCe4AKQEewjz6o5t
	 eW4mMIcQuesfK7hM8N3IRCPr25G7ue7cgexgIu313l/tPYXI+uCjRGzI5thQ0CYNjY
	 46RN3RNhrJwTeEl4f0CB3a7eQLAzt6zt5MPuIzpyAvVC3uukqsSZmzaLUQrKYMH1bj
	 vTUG+Sh3Tt2UguIcZ0JINeCvscTlGJLSyfzRBsP7dEsfMRlpMttgSmSOaCrsZZcYmL
	 EmsmK7JMZcLPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 046DD80C40;
	Sun, 28 Dec 2025 21:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1680D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C32CF80B37
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bluaQzFrdz2z for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B209580B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B209580B54
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B209580B54
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7A3374E41E0D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4F4D060725;
 Sun, 28 Dec 2025 21:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1949119792CA; Sun, 28 Dec 2025 22:11:00 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 22:10:42 +0100
Message-ID: <20251228211045.3059593-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766956260; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5k+de1YvwD012mk7iKUX6vs04ozxeThuaaA48Jk8OoQ=;
 b=LLkzNGbjbYZ3Gvj1dg43kOTP/R4XgDxJ3ln27hGD7J/8BYGnE0Eq14mM4GxvAM0V//zvKz
 YEEW2QB57tZyiDiAazU+V62FW3wH8PM1Bn1fczo8QtpJ67YZr5I2zknf/M46mAXcge9FR9
 nkpezPMTsrEgd7X2clch6cXp0mtNma1ChuZ9rOiOhX8gblTw8HiwC44FA7s+vz6GENeWKx
 xz5DIBoRa1m6o7F7BSeT41e3XgcHByb7S3sYHSiSBS7l0EFbcKJVyM7shsqDQhTSEFG9he
 8WV3PMtn0kL1SOZ3GCUnpsXRMsGYGHRJ6TlRz3ZHwU6OPxYocVLri8cyEZ3ZRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=LLkzNGbj
Subject: [Buildroot] [PATCH 4/5] package/qt5/qt5webkit: fix gcc >= 14.x
 build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add another patch from Fedora, also used in Arch Linux to fix a gcc >=
14.x build issue:

build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
condition for static assertion
 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...age-csp-ContentSecurityPolicy.cpp-fi.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch

diff --git a/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
new file mode 100644
index 0000000000..ab6137dd28
--- /dev/null
+++ b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
@@ -0,0 +1,45 @@
+From 286e0280a55949d62b2163d68c827539c141d487 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 18:35:45 +0100
+Subject: [PATCH] Source/WebCore/page/csp/ContentSecurityPolicy.cpp: fix build
+ with gcc >= 14.x
+
+Fixes:
+
+/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
+  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
+      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
+/home/thomas/buildroot/br/output-all/host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
+condition for static assertion
+ 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
+      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
+
+Patch used in Fedora and Arch Linux:
+
+  https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-fix-build-gcc14.patch
+  https://aur.archlinux.org/packages/qt5-webkit
+
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/WebCore/page/csp/ContentSecurityPolicy.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
+index 9e726d5fe10c..989a59a6122f 100644
+--- a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
++++ b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
+@@ -231,8 +231,9 @@ bool isAllowedByAllWithHashFromContent(const CSPDirectiveListVector& policies, c
+         auto cryptoDigest = CryptoDigest::create(toCryptoDigestAlgorithm(algorithm));
+         cryptoDigest->addBytes(contentCString.data(), contentCString.length());
+         Vector<uint8_t> digest = cryptoDigest->computeHash();
++        ContentSecurityPolicyHash hash = std::make_pair(algorithm, digest);
+         for (auto& policy : policies) {
+-            if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
++            if ((policy.get()->*allowed)(hash))
+                 return true;
+         }
+     }
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
