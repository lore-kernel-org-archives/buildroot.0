Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E952FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 14:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5681B429A6;
	Sun, 26 Apr 2026 14:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sWGtgfvdxKL; Sun, 26 Apr 2026 14:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681C8429A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777214305;
	bh=dSCM0gSdDxwEZTLs3EU+77+p5hjPTJ/PfagsGJQoYoU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AkYVVxQEZJVhWtDeFUTe626ZRpeDqyx/r4xyEG7nvMKd59aX3GvcMAAtd22VMRUHv
	 5JrQ/Od3Zu+NNgGmZzgYWNB2aBx5T0H81Gv5IJYHi3uZep3Dylt4/GWV+NjdlrxNOY
	 ipoStfbO3TgeC3itVrj9INqF4YVG+VX9uoKa0dLBZiaJ6hqJR/mq03Xg5qqT4ebZdj
	 vJ762esnlrnXsK7+HmipgvESv30GKGjRoaWrZjxgIk6FBnTEA4p7d7Jgn3nEUQ/soW
	 tFxEp5SGkWhN11p1yx+yDJ9klGJxCib8/ui1Gx/6XGcDJ/6wCNLhiHDfEgnZXZ20+K
	 YP+Tc6vs83nkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681C8429A8;
	Sun, 26 Apr 2026 14:38:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7548A231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66BF5429A8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWZ2EnddtBA3 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 14:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C23E1429A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23E1429A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C23E1429A6
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:38:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0685A4C0EB9;
 Sun, 26 Apr 2026 16:38:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52654)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wH0ck-000000007aN-0VBz;
 Sun, 26 Apr 2026 14:38:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 26 Apr 2026 16:38:18 +0200
Message-ID: <20260426143818.1517033-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777214298;
 bh=344FokAAINwZSWO10sNRI+0plS0Z6D2eZ87NiUU1+7g=;
 h=From:To:Cc:Subject:Date:From;
 b=hpj6I64Dc7Z2ed6pR3s67xaDFu6XYVZjlKmooIZJXAn7zTQukk1uqH/pPxX7Jv0/s
 j/eMdJeBvUKdjrvKNVWqMYOO2l0gh8hXAsBQ5pm2CH+Qw7tEyykf3FGci1lPZ6wMzD
 kQohgwyUNa6HetvLWtwG0eu/76LCNYv2ffnyywHnqVrmkMapQL49Atn+9AC3u6aMyg
 aB/weOXR1RQlM/4BgVEfmCgBHact1Nn589+uBrfymq48+SSgu2dGj5Uuu371ScAe65
 bwElsQmKMvCAjWdnNrMSW37mc+szS7vJMUC1qrwBU15oVPcSEz2+8rEn5w6CezXeMn
 xeRru/N1lUqvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hpj6I64D
Subject: [Buildroot] [PATCH 1/1] package/stunnel: bump version to 5.78
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

https://github.com/mtrojnar/stunnel/blob/stunnel-5.78/NEWS.md

Removed patch which is included in this commit:
https://github.com/mtrojnar/stunnel/commit/1c06022093a4eb60aa1754fecbc68b37610d4b4d#diff-0134ab37004b3e923ee2e697976e032c32b114839ca0a697b01111d1381e8d08

Updated license hash due to copyright year bump:
https://github.com/mtrojnar/stunnel/commit/4c8a77e374ae3326a52d2f90c1e5248079aee008

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch | 45 -------------------
 package/stunnel/stunnel.hash                  |  6 +--
 package/stunnel/stunnel.mk                    |  2 +-
 3 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch

diff --git a/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch b/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
deleted file mode 100644
index a8edc1d465..0000000000
--- a/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 93e5cdd68b13cc3161d9b0094b0f331bdaf07cbc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Jan 2024 17:28:20 +0100
-Subject: [PATCH] src/ocsp.c: fix build with OPENSSL_NO_PSK
-
-Fix the following build failure with OPENSSL_NO_PSK:
-
-ocsp.c: In function 'ocsp_init':
-ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
-  112 |         if(!section->psk_keys) {
-      |                    ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/mtrojnar/stunnel/pull/18
----
- src/ocsp.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/ocsp.c b/src/ocsp.c
-index 5073ded..12792af 100644
---- a/src/ocsp.c
-+++ b/src/ocsp.c
-@@ -109,12 +109,16 @@ int ocsp_init(SERVICE_OPTIONS *section) {
-         s_log(LOG_DEBUG, "OCSP: Client OCSP stapling enabled");
-     } else {
- #if OPENSSL_VERSION_NUMBER>=0x10002000L
-+#ifndef OPENSSL_NO_PSK
-         if(!section->psk_keys) {
-+#endif
-             if(SSL_CTX_set_tlsext_status_cb(section->ctx, ocsp_server_cb)==TLSEXT_STATUSTYPE_ocsp)
-                 s_log(LOG_DEBUG, "OCSP: Server OCSP stapling enabled");
-+#ifndef OPENSSL_NO_PSK
-         } else {
-             s_log(LOG_NOTICE, "OCSP: Server OCSP stapling is incompatible with PSK");
-         }
-+#endif
- #else /* OpenSSL version 1.0.2 or later */
-         s_log(LOG_NOTICE, "OCSP: Server OCSP stapling not supported");
- #endif /* OpenSSL version 1.0.2 or later */
--- 
-2.43.0
-
diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 6bfbc6d0b2..c06f1c0774 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.71.tar.gz.sha256
-sha256  f023aae837c2d32deb920831a5ee1081e11c78a5d57340f8e6f0829f031017f5  stunnel-5.71.tar.gz
+# From http://www.usenix.org.uk/mirrors/stunnel/stunnel-5.78.tar.gz.sha256
+sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
-sha256  c172514e95e387eb4c77cdfbb55b635bf96e2dfcb85d785d993f64c40c4f89c4  COPYING.md
+sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9e9cf35554..9c8b4b870e 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).71
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).78
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
