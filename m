Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32555106ACCB
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF48241ECF;
	Thu, 12 Mar 2026 16:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FB71l87fmat8; Thu, 12 Mar 2026 16:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B8D41ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333543;
	bh=C2GuQHlyWwCWkvI0s8mPrHF4JHhrsiukBdNmHVLOByU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V6r5B9WwCoCcrM5LxnVTaAU6Udzgs8/zxhJg9KxPq2V1Ou0iBmuulm6h79sJ1ByAq
	 lfK7L7EvVZYkkwlCjwmYrMo06vbXsUWW1JjYQtH9y86ir/pXrmihLB1G3jjvQW87VB
	 ZZyAFl6I07bdh84kbMEDOFQO/w44GkdtiLR/lWDskLL3R1kyaCIq6ZxRCrUdVg9pcL
	 Ke0wro1r5h1WFUo3/ZNFgfZcWLlqp3mtVhk2y8XU+MoJNqs7hQfvC/KN0uoT0OFAQj
	 nfxeXMGaurn6AssVmqF+syhCbibeBEBiLqfl2BSPJ8+uwF4G+1eM6KoSLoMpFofew6
	 9f4mGoi27gskg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B8D41ED0;
	Thu, 12 Mar 2026 16:39:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1236D201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03EA7403AD
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GovVe_Zhb5Fz for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D7AE400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D7AE400E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D7AE400E4
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:38:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBB9CA4C066D;
 Thu, 12 Mar 2026 17:38:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34426)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j3p-000000003C0-3D7q;
 Thu, 12 Mar 2026 16:38:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 17:38:57 +0100
Message-ID: <20260312163857.3178450-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333537;
 bh=Kq2T2satbdzaKUIKMlx0Ws3gN/c6TFYiMf6Xi7euqXo=;
 h=From:To:Cc:Subject:Date:From;
 b=gdNC+vHvphoZa4W0/Tv42GGE/sYdL3Qmbp9Z4b51X7xSfcHJjH/9vuMjqkH8nOMNB
 FLRXS3e7IrR/DhigWL0hnKjhwxd8rNrViOx8gCxMIG1Ki+IpU8CgpGuNvWxpl1sdX7
 lWNKoeqvGG1r6+b6YZV7WnLWwgFuJbz9O8hpyXfIaozCOUafmMbxG3aXXVOSAz38MG
 QCTvXxiBzh7MBl475KJT5zBgIbMczxYQ/me8zhTpGQUCvzwr3Zy5R69nuM8qI7aLYe
 dj0RXfL9f7EKsYN5RZGHxbSSRt5snqkWve8OfSQzIx//6t9otohfgD1KubjaTz9L7K
 vqIfztZ+QQJDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gdNC+vHv
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
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

Switched to sha256 tarball hash provided by upstream.

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
