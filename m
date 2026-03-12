Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F701106ACCF
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2B9F84DF8;
	Thu, 12 Mar 2026 16:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nxm3EklepAn; Thu, 12 Mar 2026 16:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B9A84DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333913;
	bh=F6Jcz6JK8qoGjdJy6AgDXBrVCxhzSJ3cV/eDTZ5tvz4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E+ks0z52pjhySHfa3Tq/9dnfR4JGUgXMmbedb5uEnPAZw3T+iZnIPxNBCdgNkl9ob
	 Zjlri3emDGssY3JUxnSLg5kZ6evUu446g/9B6LoG1S7Liq4BCEBEhpQslc4+jmU5CY
	 mIkQLEPejR6HeQbTDyBei7arunTWr3Rkz7SC4S6d/9meTEz3c02SVT723LcCDBm0N0
	 msz03NLhF0UWMjbwcNyubngYLmFIUS0vdOFZ/iiAHj5GQbRg8WX6XAN9y7iMFx86JX
	 Va2SlLicdq2jrA0FsaZn5T6fQ7cOvrHetOntaV0eePKjj4N2e8eF1UvNrGlMyepmJE
	 Gm/XHf7Z2nzIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B9A84DF0;
	Thu, 12 Mar 2026 16:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9380282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AFF741D61
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNVj0OP0eXZt for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9440141BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9440141BD4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9440141BD4
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:45:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 770E9A4C0ED9;
 Thu, 12 Mar 2026 17:44:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j9c-000000004Fx-24cY;
 Thu, 12 Mar 2026 16:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 17:44:56 +0100
Message-ID: <20260312164456.3185719-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312164456.3185719-1-bernd@kuhls.net>
References: <20260312164456.3185719-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333896;
 bh=yBrXnfGRg3v0ildF3WBM/6z/0t6IsiT5qZSZdCev04g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RQWMG7o1clOTkLzfhLwUcCGELKDGUvLuoKB0u2dEr3FhdvjBh8n9Px7S18/LhcNva
 20hnpGdraK2x+6ewwRwnYLoWzEdJK1gnZYAXGcX6hDjsX/fl0P92OzLVj3ukx9q6iS
 MqLodwHW9zz62p5Zc7oGx+sUQieq9WFLASDcA6KgHzycWNFG2qjK2moF2WPQNTAWY0
 ezG0dCpxSuRtXzNE5+7VhkRl3huVMVujLrSsArnhU2C9MqvUwyfv1s12F7xAdT2Ib9
 UVQ20zGfadbxOAOtsWjUDy11d87Rxf0/GMWyYvT1Vb6+8uf2pW7atzpoic+5SY20R2
 5WHeB8rir7Gtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RQWMG7o1
Subject: [Buildroot] [PATCH 2/2] package/libcurl: security bump to version
 8.19.0
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
Cc: Andreas Ziegler <br025@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://curl.se/ch/8.19.0.html
https://curl.se/docs/security.html

Fixes the following CVEs:

CVE-2026-3805: use after free in SMB connection reuse
CVE-2026-3784: wrong proxy connection reuse with credentials
CVE-2026-3783: token leak with redirect and netrc
CVE-2026-1965: bad reuse of HTTP Negotiate connection

Switch to sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/curl/curl/commit/e83c82f05f9b714086e62db9fe2ea9be522239bc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 9 ++++-----
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index de3f2402e9..5aec080ef9 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,4 @@
-# Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.18.0.tar.xz.asc
-# signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
-sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
+# From https://github.com/curl/curl/releases/tag/curl-8_19_0
+sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
+# Locally computed
+sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 7ebf26c3b1..3d00a4a33a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.18.0
+LIBCURL_VERSION = 8.19.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
