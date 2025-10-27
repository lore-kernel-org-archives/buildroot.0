Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E05CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 18:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2491241201;
	Mon, 27 Oct 2025 18:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqoNlPiGs_AM; Mon, 27 Oct 2025 18:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F4F341498
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F4F341498;
	Mon, 27 Oct 2025 18:26:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8D543F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2378241201
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ctBECGvcN8F for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 18:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 154C941498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154C941498
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 154C941498
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62B52A4C508F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 19:26:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36978)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vDRv5-000000008Kr-1EFD
 for buildroot@buildroot.org; Mon, 27 Oct 2025 18:26:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 19:26:14 +0100
Message-ID: <20251027182614.719429-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027182614.719429-1-bernd@kuhls.net>
References: <20251027182614.719429-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761589575;
 bh=cHFCel3yVCdZgmltqdTWA8x5c1XSSlnWv8DXqLWbYaw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=1DiWx21CsXQXpw0xY+FgphZZYZ+ZvHJKwhxf+txYLnpxWDkQNBMAnJG3DoSqykq9M
 n1iwnmn24ziPqjXUK73HJsxSbJ+9iD4Ey+eiNVzDpjFyxoRC9zB03+iotbE/q0u2wj
 usP5wOjWYQmr2bMtOgxZTrPGYN9vcbnEokoOHXY/EX/uXc89ykHGPiDoyg9E/AACwz
 BSXpYW3kdhkwE/ZGATWI14bC7S9rW9GVghRe0uTYpMGBAOIHbSjdnZ+jxaVhu8z8sU
 LJ3Ds0KP88KBrnhf+piycEwTXeEPgsRrzzxCGfeMXeBK/Kokc0H1bhPuPYBX3HMD/d
 oLfEHaisJXogw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=1DiWx21C
Subject: [Buildroot] [PATCH 2/2] package/ntpsec: bump version to 1.2.4
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
https://gitlab.com/NTPsec/ntpsec/-/blob/NTPsec_1_2_4/NEWS.adoc?ref_type=tags

Move env variable declarations from _CONF_OPTS to _CONF_ENV to fix a
configure error caused by updated waf scripts included in this release.

Added build fix for gcc >= 14.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...lock_gpsd-add-build-fix-for-gcc-14.x.patch | 32 +++++++++++++++++++
 package/ntpsec/ntpsec.hash                    |  2 +-
 package/ntpsec/ntpsec.mk                      | 10 +++---
 3 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch

diff --git a/package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch b/package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
new file mode 100644
index 0000000000..a0ab783d00
--- /dev/null
+++ b/package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
@@ -0,0 +1,32 @@
+From 328ff13ec573fc53dcdfa9845b17290992f8e7fc Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 27 Oct 2025 19:18:13 +0100
+Subject: [PATCH] refclock_gpsd: add build fix for gcc => 14.x
+
+../../ntpd/refclock_gpsd.c:2076:14: error: implicit declaration of
+ function 'strptime'; did you mean 'strftime'?
+ [-Wimplicit-function-declaration]
+
+Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1484
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ntpd/refclock_gpsd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ntpd/refclock_gpsd.c b/ntpd/refclock_gpsd.c
+index 9ea969ed6..1dfec3103 100644
+--- a/ntpd/refclock_gpsd.c
++++ b/ntpd/refclock_gpsd.c
+@@ -59,6 +59,8 @@
+  */
+ 
+ 
++#define _XOPEN_SOURCE 700
++#define _BSD_SOURCE
+ #include "config.h"
+ #include "ntp.h"
+ #include "ntp_types.h"
+-- 
+2.47.3
+
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index a3802c11ba..40c06d6926 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a9ec4416688a1c1c88833f3f6acc35518e3d63409af372eec010455002b33050  ntpsec-NTPsec_1_2_3.tar.bz2
+sha256  3abc1b057a252d214ef2e76aa375fe0d81432c626e75304b17850d68eee0c54f  ntpsec-NTPsec_1_2_4.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 3acf7745cf..d48bc5baa9 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.3
+NTPSEC_VERSION = 1.2.4
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \
@@ -37,13 +37,15 @@ NTPSEC_DEPENDENCIES = \
 	libcap \
 	openssl
 
+NTPSEC_CONF_ENV = \
+	CC="$(HOSTCC)" \
+	CFLAGS="$(HOST_CFLAGS)" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+
 # CC="$(HOSTCC)" is strange but needed to build some host tools, the
 # cross-compiler will properly be used to build target code thanks to
 # --cross-compiler
 NTPSEC_CONF_OPTS = \
-	CC="$(HOSTCC)" \
-	CFLAGS="$(HOST_CFLAGS)" \
-	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
 	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
 	--cross-compiler="$(TARGET_CC)" \
 	--cross-cflags="$(TARGET_CFLAGS) -std=gnu99" \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
