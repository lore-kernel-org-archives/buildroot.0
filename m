Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB47BCCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DC8410B6;
	Thu,  6 Nov 2025 20:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGW6C4FPzAeI; Thu,  6 Nov 2025 20:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60BF1410CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60BF1410CA;
	Thu,  6 Nov 2025 20:45:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD6793E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E89607FC
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQy0aJfnGjnH for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 20:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFB89607EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB89607EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFB89607EA
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:45:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51F1DA4C1ECE;
 Thu,  6 Nov 2025 21:45:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH6rF-0000000007X-3w6T;
 Thu, 06 Nov 2025 20:45:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Nov 2025 21:45:08 +0100
Message-ID: <20251106204522.3273683-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106204522.3273683-1-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762461926;
 bh=jo4Nbb/NOvPYzcgi6gHs02n9cfjtoMfODBiRem2anhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QkjdzOlOQqEmbmsrgZD23l2F2gWJf/+pksbqIF4lHjn2siptPd8zMLXleYTGqd3O8
 7uUlfcZmn1Od05x4jrR4+kWeBNIorOd7TlYDAphWpoU22FeToe8HJD1pMOhvUFKBpW
 xJPQk4fDGoQW/K0IMjfxg8SskmmCp2rl9gXnC7PUgTPo/ZHLe/L6Sf+m1z37CgfeGV
 0tw/CCrw/wsevOOdVjv52wtfx6Gp58q1ZPO4bWlM3eoirzbWSuyZzs1izzf/ac412X
 xmSCGAH5pe7P8EdkYIba9FaKqjZRJxbkQvLM5sAFxEPPk4y6a3Rgx/YMHqYkHvuCXH
 OlHKAauF/4J2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=QkjdzOlO
Subject: [Buildroot] [PATCH v3 01/14] package/asterisk: fix build caused by
 libjwt bump
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>, Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

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
[Bernd: Added libopenssl dependency needed by bundled libjwt]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/Config.in     | 3 ++-
 package/asterisk/asterisk.hash | 2 ++
 package/asterisk/asterisk.mk   | 7 ++++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index 71c741acfd..3db6e5375a 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -10,10 +10,11 @@ config BR2_PACKAGE_ASTERISK
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBILBC
-	select BR2_PACKAGE_LIBJWT
 	select BR2_PACKAGE_LIBPJSIP
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_OPENSSL # bundled libjwt
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # bundled libjwt
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
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
index 18af217129..e7e802aa45 100644
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
@@ -39,7 +41,6 @@ ASTERISK_DEPENDENCIES = \
 	jansson \
 	libcurl \
 	libedit \
-	libjwt \
 	libpjsip \
 	libxml2 \
 	sqlite \
@@ -94,7 +95,7 @@ ASTERISK_CONF_OPTS = \
 	--with-jansson \
 	--with-libcurl \
 	--with-ilbc \
-	--with-libjwt="$(STAGING_DIR)/usr" \
+	--with-libjwt-bundled \
 	--with-libxml2 \
 	--with-libedit="$(STAGING_DIR)/usr" \
 	--with-pjproject-bundled \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
