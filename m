Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAB2CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64B0260A6E;
	Fri,  5 Jun 2026 12:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS0xWzu_vU4R; Fri,  5 Jun 2026 12:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 651A560A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663063;
	bh=UStei+fv5LiYIlrTt+vUOvN0X56OBQb14m9jinVohhg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i5P6AgofEUnHb7opWridzqnMqjyWXWxZ99ijQdJy6Pfl6ZKxO9iZiBcJX/+Qv9mqT
	 zAMFvq7y/x28m+5W0M0ImQ+ymS/P2r6O9zU7VOY3/HsHcR8ttqRv6K+YS/ueypF55E
	 wXakFmAOPbuLrKc5XKn11PCVfH6FrhzYbFFZPVChRcxjEoVXoYuf8qeLeb3kLW6HWf
	 sNTDGUitZhkV0HOiUWEl53W5RhjPA62514UA+dw56njLgruJVjbI6QcpUATCab6M1k
	 CpODk9WqE3MBeMmdd3clcc/BsEh5xMdBNNNNJ0kgGzBdnFhp3g5SoOziZa9lcZG8PV
	 aQNPSg3pqjkMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651A560A52;
	Fri,  5 Jun 2026 12:37:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6C9388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7181581EA9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FHbWQwjS372 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7798281E4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7798281E4D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A225187B41; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:44:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 14bfd4c3cf7b2b02d7dee357fb76502860d98aa7
X-Git-Newrev: 670eafbddb23455da264c05ecb2f2d67141d5814
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.A225187B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/asterisk: fix
 build caused by libjwt bump
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/670eafbddb23455da264c05ecb2f2d67141d5814
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61271a6c5589baffb0df9c245e4026c281afdf7e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 6343b0bdf2..3a8274b458 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -3,6 +3,8 @@ sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asteri
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
+sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
+
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
 sha1  721c512feaea102700d5bdce952fdc0bb29dc640  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b09df98494..e2fdb189fa 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
