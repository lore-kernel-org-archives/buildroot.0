Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E2CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 15:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E624E40436;
	Wed,  8 Oct 2025 15:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oj9fBSsg-K2; Wed,  8 Oct 2025 15:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C6140C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C6140C6B;
	Wed,  8 Oct 2025 15:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F7EF226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DCA40A12
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGw_X1EJFZXc for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 15:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 152D5409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 152D5409F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 152D5409F2
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:17:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b31b.dip0.t-ipconnect.de [84.161.179.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE51EA4C638D
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:16:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58778)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6VuT-000000006Vr-2JCa
 for buildroot@buildroot.org; Wed, 08 Oct 2025 15:16:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 17:16:57 +0200
Message-ID: <20251008151657.20386-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759936617;
 bh=6WrP3YMtXsL6RetqmX/rrwJAoOAGJi+H9U2LeyzPP1M=;
 h=From:To:Subject:Date:From;
 b=VNBrd0BKcFbwfyWUrsP785iGSU00iTemny0boKXiYxFUuGhaglBA6Kll0Lu79J1S8
 Mfo2Nc5ZkNEEjov1bis+eoJCzPwwrWkpXljJsRnyiBwO2N9OFnUDCLak5NWr9hsFMx
 WrkBEJnzc4D8xuubGcILCZOWjVt//q56gkfjM4xZ7im+0JwPod8Nm4K8KSuz/CWyRQ
 evH5pHkaJqwcSZZLNq4jCQdQe9c4K07SKT6mywe6hJV8S2R54Y2B0F2TqZT7xjkqHv
 CgigOjpmnoyg6z9MIUHQAdrMifPFzOaex/NCz+cmRfCm7FtM4sG4xXOH/UwE29wM0J
 6oTWQ5dziZLLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=VNBrd0BK
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to 3.6.0
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

Release notes:
https://openssl-library.org/post/2025-10-01-3.6-release-announcement/

Removed patch 0004 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...l-process-to-avoid-multiple-make-dep.patch | 44 -------------------
 package/libopenssl/libopenssl.hash            |  4 +-
 package/libopenssl/libopenssl.mk              |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch

diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
deleted file mode 100644
index 344b8d07b7..0000000000
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4562b002366535b3d387fae7fa1dbd8e315ae142 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@openssl.org>
-Date: Mon, 14 Apr 2025 12:23:15 -0400
-Subject: [PATCH] Serialize install process to avoid multiple make depend
- operations
-
-If make install is run with a large -j value (make install -j N , where
-N > 1)
-
-We can run into a situation in which the install fails because multiple
-make depend operations are running in parallel, which will fail due to
-makefile rewriting.
-
-Serialize the install process to guarantee that those operations don't
-step on one another
-
-Fixes # 27074
-
-Upstream: https://github.com/openssl/openssl/pull/27388
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Configurations/unix-Makefile.tmpl | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index e85763ccf8..b671723813 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -661,7 +661,11 @@ depend: Makefile
- # Install helper targets #############################################
- ##@ Installation
- 
--install: install_sw install_ssldirs {- "install_docs" if !$disabled{docs}; -} {- $disabled{fips} ? "" : "install_fips" -} ## Install software and documentation, create OpenSSL directories
-+install: Makefile ## Install software and documentation, create OpenSSL directories
-+	$(MAKE) install_sw
-+	$(MAKE) install_ssldirs
-+	{- "\$(MAKE) install_docs" if !$disabled{docs} -}
-+	{- "\$(MAKE) install_fips" if !$disabled{fips} -}
- 
- uninstall: {- "uninstall_docs" if !$disabled{docs}; -} uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -} ## Uninstall software and documentation
- 
--- 
-2.39.5
-
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index e78b664aa5..9322a56e76 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
-sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.0/openssl-3.6.0.tar.gz.sha256
+sha256  b6a5f44b7eb69e3fa35dbf15524405b44837a481d43d81daddde3ff21fcbb8e9  openssl-3.6.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 2f844fd44a..28dcb9dfc2 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.4
+LIBOPENSSL_VERSION = 3.6.0
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
