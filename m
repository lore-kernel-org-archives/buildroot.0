Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BB5D1A63D
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8621E40757;
	Sat, 10 Jan 2026 18:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBBuXhpu3jMf; Sat, 10 Jan 2026 18:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6BAA40746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068456;
	bh=gDe+CGFmULPQG/6ddke1vZ4mAtEUEb6uoZpqDf5znmw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jS0Pqp6i+p1BCrBHNWr8pjQV9r07Aur4XtDVnJxHnGLrvXQlnbFiL6OzQtvSUY1Yj
	 1l/U/X1nQ6nDMMBR199/6m4AcPjnD+zJpFrdzvSm2yAMM186/1NKHWvrOReokmaW02
	 oQv1BsZI98A0oTj1Bl9q16UObYYI4HXfEtNPmQPl5Y7A/SSw/BVZFOXhSvHFt7d2P6
	 DeIzvAzekG4uaSefrT6paE9Vu2/au2GaBYcq52TKD6lHAGkEx02g69rHr6LjbDif40
	 3KJvIvZVehjZNwTGHM8Lk3aF7rz9OBpsIpPo3rBW4wau2HoLwySap3Y4tztEfdhAms
	 +AHm69yJg800A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6BAA40746;
	Sat, 10 Jan 2026 18:07:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CDD812E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CD8D40243
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIUZZrGh01W0 for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD4DA4006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD4DA4006B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD4DA4006B
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7FA1FA4C362F;
 Sat, 10 Jan 2026 19:07:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49430)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedN3-00000000859-0qsX;
 Sat, 10 Jan 2026 18:07:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 19:07:29 +0100
Message-ID: <20260110180729.2240224-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068449;
 bh=HcjLU46nJ7zJKVJFNCK3NxM9CNAKs6DUMRoC3vNpP8M=;
 h=From:To:Cc:Subject:Date:From;
 b=j3JSw6OUuXwUqLnSAWak8fm6ppHFm84Igwa6hQfs1nfPVlGGMFr4e5BjN8SjtOtVf
 RPVUUF+C/01avvW274IO0sdAB97XoUrNWJFXpS3740W8YPsYudGQ5rNUSlP5tFDph1
 tMaq/KVMS2CT6scsBtXBChnRW1MGJTm3ahbpGm996O2vaZMt3O1bF7LfbvIp/I9Ptb
 BCPyKQHW4SAMTPZ7+YMAuRiPqtvhcg54l5hQZ0FpSJRqJmI+MvMx3WM/HR9Nn62DPd
 acJDDZ6bmLtYRjYqtsrcmQC9JtPgR6W/3x3OZ80nl1Xtv01Y9L1qXYviuM48z6rObo
 9rKh9fcqWKs3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j3JSw6OU
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 8.18.0
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

https://curl.se/ch/8.18.0.html

Fixes CVE-2025-13034, CVE-2025-14017, CVE-2025-14524, CVE-2025-14819,
CVE-2025-15079 & CVE-2025-15224: https://curl.se/docs/vuln-8.17.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 786d030171..de3f2402e9 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.17.0.tar.xz.asc
+# https://curl.se/download/curl-8.18.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992  curl-8.17.0.tar.xz
+sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6924631735..e1e5a7facb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.17.0
+LIBCURL_VERSION = 8.18.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
