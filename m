Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F8EF9EDC5
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 12:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06DCB848A8;
	Wed, 22 Apr 2026 12:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAo4D4kgnjt4; Wed, 22 Apr 2026 12:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCEE4848BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776862674;
	bh=eI6SKD6ZMMzOtGaozT4T50sBGIZ0z8L6P06uj/aLq/4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ou7/3AIsGytNJrI3xuhRbxq+NFyf11kupgvh+n5vUdSA5pube6wjNow6bW454S0FS
	 XyWIyJeY6WNoJeQSHk0SOozl9TTleDvC0sYwAIoyjrrD6l9R9Be3sIXpIwFgTcXseV
	 are2e/SnPfJVKQMV7XuCLuF/p5Jjzo6mLcDzEyipuLlQzlnGsxwwyqRCw6gaVoCjKh
	 nPuzLTs7TnUtjJJUIDsqbomEWau3Le6CSM/FM4NfRlcaM2rZMg0eN7+qmDDUTwfG2u
	 S6YKuV5f32ielF4z9n+ZHwQTzJdtHdSqejR5XEIrXlkegvgF6uH1ouDu9GKB1qWkBp
	 w0wcYmC+Z9eXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCEE4848BE;
	Wed, 22 Apr 2026 12:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B56E4183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 12:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2CE342746
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 12:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu92rYfsHRyJ for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 12:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4FCD42745
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4FCD42745
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4FCD42745
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 12:57:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -530940237; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Apr 2026 12:57:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wFX9E-0000000DOj5-01pR;
 Wed, 22 Apr 2026 14:57:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 14:57:20 +0200
Message-ID: <20260422125721.3193186-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GRt22PDp+YD5Q8LYzLky5+YQBXoSAYknsrd4HVu4kK0cTK43DCbxfoCop+rQQwfEjIrUfG/0+vo4dhXXTiBbUyHsIxWgUUT6ZUBwy7iH68pIZDu6tpCmD9WsPlauGxr73VVzZNuavPIOCZKLcQqsef1pm88eML2okdq9XeoHpwFF0wJSvgE598iuxWJTtsvhWJTxc2T4eNMIQWCaiaK3dtJDUTgzEIHDMOlL6l5d6o71IsyQNH0i9QkAC4VmtuWkwylc9vnhNICEN1XPYLZpfgCVpVW81TVVtRRzmk8lUkSy0QdIUtFXC4NGYfdOormbXQmSBhIbH9pY3LdW7eiEkQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=EN/SG3zmfL8qHIFNoMFldCnEhS1wWm9SNa1/CFBEeB0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=GRt22PDp
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH-2025.02.x] package/python3: security bump to
 version 3.12.13
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a number of security issues:

Email and header-related:

gh-144125: email.generator.BytesGenerator now refuses to serialize headers
that are unsafely folded or delimited (see
email.policy.Policy.verify_generated_headers); addressing CVE-2024-6923.

gh-143935: Fixed comment folding in modern email policies to prevent header
injection when very long non-foldable comment text is wrapped.

gh-136063: email.message now ensures linear complexity for legacy HTTP
parameter parsing.

HTTP, cookies, and URL parsing-related:

gh-143916: wsgiref.headers.Headers now rejects C0 control characters in
fields, values, and parameters.

gh-143919: http.cookies.Morsel now rejects control characters in fields and
values.

gh-143925: data: URL media types now reject control characters.

XML-related:

gh-144363: Upgraded bundled libexpat to 2.7.4 to fix CVE-2026-24515 and
CVE-2026-25210.

gh-90949: Added Expat allocation-tracker APIs to xml.parsers.expat parser
objects to limit memory amplification from malicious XML input; includes
mitigation for CVE-2025-59375.

gh-142145: Removed quadratic behavior in xml.dom.minidom node ID cache
clearing.

Denial-of-service hardening:

gh-119342: Fixed a potential memory denial of service in plistlib.

gh-119451: Fixed a potential memory denial of service in http.client.

gh-119452: Fixed a potential memory denial of service in http.server (CGI
server on Windows).

gh-136065: Fixed quadratic complexity in os.path.expandvars().

HTML parsing-related:

gh-137836: Hardened html.parser.HTMLParser with support for additional
RAWTEXT/PLAINTEXT elements (plaintext, xmp, iframe, noembed, noframes,
optional noscript), improving robust handling of hostile markup.

SSL memory-safety fixes:

gh-144833: Fixed a use-after-free in ssl when SSL_new() fails.

For details, see the announcement:
https://www.python.org/downloads/release/python-31213/

Upstream now provides a sha256 hash, so use that instead of md5.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 5 ++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ed0d879f11..6964789262 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,4 @@
-# From https://www.python.org/downloads/release/python-31211/
-md5  04feb01316c7bb1b448001adbc63dd23  Python-3.12.12.tar.xz
+# From https://www.python.org/downloads/release/python-31213/
+sha256  c08bc65a81971c1dd5783182826503369466c7e67374d1646519adf05207b684  Python-3.12.13.tar.xz
 # Locally computed
-sha256  fb85a13414b028c49ba18bbd523c2d055a30b56b18b92ce454ea2c51edc656c4  Python-3.12.12.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4ace4d8573..60ab5b0cbc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).13
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
