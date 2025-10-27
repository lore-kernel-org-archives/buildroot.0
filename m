Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599CCCCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C156141D;
	Mon, 27 Oct 2025 21:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VQl4TjebyLu; Mon, 27 Oct 2025 21:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8B761419
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB8B761419;
	Mon, 27 Oct 2025 21:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3108939
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A877E61419
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVJJxWRSwiR8 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA33F61418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA33F61418
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA33F61418
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:13:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8BF3A4C4776
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:13:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57326)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vDUWY-000000004AR-2uIS
 for buildroot@buildroot.org; Mon, 27 Oct 2025 21:13:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 22:13:06 +0100
Message-ID: <20251027211306.2888666-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761599586;
 bh=kqc2QBCRy6DnNrSRBy2PW2J60c9hBf13HgjjDhStNT8=;
 h=From:To:Subject:Date:From;
 b=k0Ypq9L19xA51FL9yqNuEQdq2h2tXz2VD8JEla0PwPvQKjctQiIzJ1RXgYYtyUxL1
 4gXnLg8DyeuzMEF+9aymvsQS85EyvAkfUzcgBNiXIF+fIILDEYWWeq2Pu9e2PU36jm
 WDq3bc829jRvjgGZ9dywxuLde7Fbw3noidhSnK7qjVsKcIhzp1VROpFH+Ujpv7b75l
 tr2wc4Cg8t8usLQpvr/W9WPydW5VSc24/CXykXVYAqjR0WkOasDcqbxrA/tkH5Ci6t
 JdaAudDn/YK6ReRk2cYGxw2z19cnaA/IxQ45B2SgK4FytEd0mQsY2GydVxbGdAyVw4
 +oBPnQHqbFacQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=k0Ypq9L1
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: bump version to 1.2.4
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

Buildroot commit a5327724686a1ba719d37caff5986f241993b500 added patch
0003 although it should have been 0002 => renumbered.

Added upstream commit as 0003 for partial build fix with gcc 14.x

Added another patch to fix build with gcc >= 14.x for
BR2_PACKAGE_NTPSEC_REFCLOCK_ALL=y

Move env variable declarations from _CONF_OPTS to _CONF_ENV to fix a
configure error caused by updated waf scripts included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t.patch => 0002-disable-PIE-support.patch} |  0
 ...psd.c-Add-missing-time.h-for-strptim.patch | 47 +++++++++++++++++++
 ...lock_gpsd-add-build-fix-for-gcc-14.x.patch | 32 +++++++++++++
 package/ntpsec/ntpsec.hash                    |  2 +-
 package/ntpsec/ntpsec.mk                      | 10 ++--
 5 files changed, 86 insertions(+), 5 deletions(-)
 rename package/ntpsec/{0003-disable-PIE-support.patch => 0002-disable-PIE-support.patch} (100%)
 create mode 100644 package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
 create mode 100644 package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch

diff --git a/package/ntpsec/0003-disable-PIE-support.patch b/package/ntpsec/0002-disable-PIE-support.patch
similarity index 100%
rename from package/ntpsec/0003-disable-PIE-support.patch
rename to package/ntpsec/0002-disable-PIE-support.patch
diff --git a/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch b/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
new file mode 100644
index 0000000000..0a2ae6a259
--- /dev/null
+++ b/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
@@ -0,0 +1,47 @@
+From 904983bf9465017753c6f5b602fc9c98458615f7 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Mon, 27 Oct 2025 12:35:35 -0700
+Subject: [PATCH] ntpd/refclock_gpsd.c: Add missing time.h for strptime()
+
+Upstream: https://gitlab.com/NTPsec/ntpsec/-/commit/5137c155d8895cfc50fb577ee720b3b23589c662
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ntpd/refclock_gpsd.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/ntpd/refclock_gpsd.c b/ntpd/refclock_gpsd.c
+index 1dfec3103..0a2987d84 100644
+--- a/ntpd/refclock_gpsd.c
++++ b/ntpd/refclock_gpsd.c
+@@ -100,20 +100,20 @@ typedef unsigned long int json_uint;
+  * header stuff we need
+  */
+ 
+-#include <netdb.h>
+-#include <unistd.h>
+-#include <fcntl.h>
+-#include <string.h>
+ #include <ctype.h>
++#include <fcntl.h>
+ #include <math.h>
++#include <netdb.h>
++#include <string.h>
++#include <time.h>         // for strptime()
++#include <unistd.h>
+ 
+-#include <sys/types.h>
++#include <sys/select.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <netinet/tcp.h>
+ 
+-#include <sys/select.h>
+-
+ #include "ntpd.h"
+ #include "ntp_io.h"
+ #include "ntp_refclock.h"
+-- 
+2.47.3
+
diff --git a/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch b/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
new file mode 100644
index 0000000000..821a34e966
--- /dev/null
+++ b/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
@@ -0,0 +1,32 @@
+From 55c230d61ece7213506f1dccac76c21aefbade9e Mon Sep 17 00:00:00 2001
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
+index a4a6f7095..a3995896a 100644
+--- a/ntpd/refclock_gpsd.c
++++ b/ntpd/refclock_gpsd.c
+@@ -59,6 +59,8 @@
+  */
+ 
+ 
++#define _XOPEN_SOURCE
++#define _DEFAULT_SOURCE
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
