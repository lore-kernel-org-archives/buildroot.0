Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC99CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BDB83C9A;
	Fri, 29 Aug 2025 17:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzR_fDtKmKiu; Fri, 29 Aug 2025 17:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99BA583CA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99BA583CA8;
	Fri, 29 Aug 2025 17:05:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E54569
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3FF461641
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7LBwVdLuovml for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4A3D61624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A3D61624
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A3D61624
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:05:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A1A26C8F473
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:05:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 291D3605F1;
 Fri, 29 Aug 2025 17:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE84C1C22C719; 
 Fri, 29 Aug 2025 19:05:32 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:05:21 +0200
Message-ID: <20250829170522.2436314-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756487134; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=nuw32d1f35xnGArxabTXChaFXIvLvhh4/nzV0CLzx/o=;
 b=BDP/itzZqibrryZaZHGCWJOm+2oTknllOPbYF0/q3E2kSDyMgd6RTcUT+xAw8Kvcr8QTRU
 c7eEaUvLv1RzUv/gAoM2HxtY6HdCna/zPq2vcV3UTG8ZiHvLridBwyZ5BPwrG8EwJN8665
 RsZv4hm6jJlz+DIgwaKLMZWZGSbTZ85UIyJC4GwiG68sh1FTQMk1/3HwHy1Ue8lUScq5mP
 +jXJSo8EoXQI10T84+QsirTr+yDssayCiynk67ECm0J80UmMWw9r/nJu6pzgGau6FD9g+0
 wy5H1dxk3t9S5Bu0A5vVE2QHTAOxSS8/659wb5WgVoMAaR1A3VVJ3pfNcDbQzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BDP/itzZ
Subject: [Buildroot] [PATCH] package/asterisk: fix build caused by libjwt
 bump
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
states "Version 3 of LibJWT is a complete overhaul of the code. Please
see documentation for usage."

And indeed, this version bump breaks the build of Asterisk:

res_stir_shaken/attestation.c: In function 'pack_payload':
res_stir_shaken/attestation.c:357:9: error: implicit declaration of function 'jwt_add_grants_json' [-Wimplicit-function-declaration]
  357 |         jwt_add_grants_json(jwt, payload_str);
      |         ^~~~~~~~~~~~~~~~~~~
In file included from /home/autobuild/autobuild/instance-11/output-1/build/asterisk-22.3.0/include/asterisk/module.h:39,
                 from res_stir_shaken/attestation.c:24:
res_stir_shaken/attestation.c: In function '_dtor_jwt':
res_stir_shaken/attestation.c:367:38: error: implicit declaration of function 'jwt_free'; did you mean 'jwks_free'? [-Wimplicit-function-declaration]
  367 |         RAII_VAR(jwt_t *, jwt, NULL, jwt_free);
      |                                      ^~~~~~~~

To fix this, let's use the bundled version of libjwt in Asterisk,
since even Asterisk master hasn't been fixed to be compatible with
libjwt 3.x.

Of course, this raises the question of whether the separate libjwt
package should be removed, as it is anyway only used by Asterisk.

Fixes:

  http://autobuild.buildroot.net/results/2d39791c65c5b71b0533d4b2bce5f073f5919552/

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Waldemar: you did the bump of libjwt. Are you using this library?
Independently of Asterisk?
---
 package/asterisk/Config.in     | 1 -
 package/asterisk/asterisk.hash | 2 ++
 package/asterisk/asterisk.mk   | 7 ++++---
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index 71c741acfd..c7101d70f4 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_ASTERISK
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBILBC
-	select BR2_PACKAGE_LIBJWT
 	select BR2_PACKAGE_LIBPJSIP
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 7b28624921..f11ed08ef4 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -3,6 +3,8 @@ sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asteri
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
+sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
+
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
 sha1  721c512feaea102700d5bdce952fdc0bb29dc640  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 6d682f161d..ce8e5823ce 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -13,11 +13,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 # segfaults. The reason behind this is unclear.
 # https://github.com/asterisk/asterisk/issues/671
 ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
+ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
 ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
 ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
-	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2
+	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2 \
+	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
 
 ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
 ASTERISK_LICENSE_FILES = \
@@ -40,7 +42,6 @@ ASTERISK_DEPENDENCIES = \
 	jansson \
 	libcurl \
 	libedit \
-	libjwt \
 	libpjsip \
 	libxml2 \
 	sqlite \
@@ -95,7 +96,7 @@ ASTERISK_CONF_OPTS = \
 	--with-jansson \
 	--with-libcurl \
 	--with-ilbc \
-	--with-libjwt="$(STAGING_DIR)/usr" \
+	--with-libjwt-bundled \
 	--with-libxml2 \
 	--with-libedit="$(STAGING_DIR)/usr" \
 	--with-pjproject-bundled \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
