Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A748CD37B7
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 06:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78C860859;
	Mon, 11 May 2026 06:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ihrfAGfGEtQ; Mon, 11 May 2026 06:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FAEF6084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778480671;
	bh=zlF+TBNcNy0OZMGcxOLErZ7mZWudxLhfwXN9mJiOo+c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GHdYezEIydvyt91Vlix1FJNwDb5z36ofuN1uLhKaGWzXh5ww+EHw92OmUkeE5dIq6
	 gH7IcbNe5eSin9s9hGktNsWiOp+4RaRSzEwj5VTkKFV4oP9XzzKDLJdyXgc3Jkk7SM
	 VmiLG3aNipNOXRa74HdSDa/ZaPdbp+zQB970SY1kyH11Le0DMyw8NiDBBLBwHr36gd
	 oKnNzBZNsybdtPs7jXUjBBalBqW6w0iqvzZMm7V6SO+7Gfo/gVmz7a9o+MzpJv/r/Q
	 akMFDmmHcsQZblMFUzR2/F3dXTshTZAYdHHhDp1bi0Gmec8Z6fcXS4LgmGpDsUXX0J
	 CbKuHHUiHubEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FAEF6084C;
	Mon, 11 May 2026 06:24:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 005EF272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 06:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE198841B0
 for <buildroot@buildroot.org>; Mon, 11 May 2026 06:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeeW9P9plCfN for <buildroot@buildroot.org>;
 Mon, 11 May 2026 06:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C48A7841AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C48A7841AB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C48A7841AB
 for <buildroot@buildroot.org>; Mon, 11 May 2026 06:24:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39D38A4C16B5;
 Mon, 11 May 2026 08:24:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57726)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMK41-000000005qG-1x6o;
 Mon, 11 May 2026 06:24:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 08:24:25 +0200
Message-ID: <20260511062425.1243680-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778480666;
 bh=lmwBwQil6P8yShDn0wnyCUKPdYNAFaNzjyc1NDkLtA8=;
 h=From:To:Cc:Subject:Date:From;
 b=buGGSYp9h+QJSnIynCBBoYCySKDJ6Gl7MX8yZpd3PKwrtNdUbCWK1gNzbrPhuaXsH
 ugoRIlCwz5kKQLnUY4GXB5wdHd8WkBxMs2IVl8ywv6cZ6RvKmgBwyLTxGo8cmSAg11
 ScYDog23Oz3l0FTA4B977MVDICif3iaK8x8OHjlHG30vXzD28sM+1FTW6poS3GElKe
 7cI/AW2Blojzy1yphQal/O2zR1rvAgoM53deSdLVr8ktFJH4vwbXm0Pdeejvuh+00t
 R6puQhfGF0SK1e7j3z0MdvhWHu4DMLZVik6pUdn2NpTxEpsm7hitWLiSFT3GO6PeIy
 WIyQstgkXcl+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=buGGSYp9
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.14.5
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

https://www.python.org/downloads/release/python-3145/
https://docs.python.org/release/3.14.5/whatsnew/changelog.html

This release includes various security fixes:

gh-148178: Hardened _remote_debugging by validating remote debug offset
 tables before using them to size memory reads or interpret remote
 layouts.
gh-149254: Update Android and iOS installer to use OpenSSL 3.0.20.
gh-149017: Update bundled libexpat to version 2.8.0.
gh-90309: Base64-encode values when embedding cookies to JavaScript
 using the http.cookies.BaseCookie.js_output() method to avoid injection
 and escaping.
gh-148395: Fix a dangling input pointer in lzma.LZMADecompressor,
 bz2.BZ2Decompressor, and internal zlib._ZlibDecompressor when memory
 allocation fails with MemoryError, which could let a subsequent
 decompress() call read or write through a stale pointer to the already-
released caller buffer.
gh-148169: A bypass in webbrowser allowed URLs prefixed with %action to
 pass the dash-prefix safety check.
gh-146333: Fix quadratic backtracking in configparser.RawConfigParser
 option parsing regexes (OPTCRE and OPTCRE_NV). A crafted configuration
 line with many whitespace characters could cause excessive CPU usage.
gh-146211: Reject CR/LF characters in tunnel request headers for the
 HTTPConnection.set_tunnel() method.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 13e2b94336..2217f688d3 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3144/
-sha256  d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8  Python-3.14.4.tar.xz
+# From https://www.python.org/downloads/release/python-3145/
+sha256  7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6  Python-3.14.5.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c71cb0b05b..eeeb1c7e2a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
