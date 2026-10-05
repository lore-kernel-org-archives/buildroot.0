Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9EFCA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 09:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5741B4062B;
	Mon,  5 Oct 2026 09:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS5vhfe0JLOP; Mon,  5 Oct 2026 09:57:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CB21640575
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791194244;
	b=OTaH+fbZ/D0gBGsSlEwWerG4sJIyB15X4zCCymAs0F6mTLVLompm8fj995p3e6dTOuul
	 2BXqyBfK4V/fhZZzK5Xm4ArJa8dzm3XNrUIxSSZCL6kNaE6XQYGzfWTNX6wlv4n6oP57O
	 hm0l3VQigDW3xX78AWSA+00pCcSztgfUBGdr8Eq1z2CzPSnRdGZd8DIWmOlLHjqSyG+zR
	 /ciYNs1DM6qvyMmipsv3bysExW9dH+H0XnmHNiUECcwaAjR1tEjJh1QrmEqnKySCR/gSr
	 6x6ICDOhOQ2JX43mXLhgWKqE2H7qvO+dg6/vE1LgBM1+NNAumYTMvUaS6ek/uoTnkxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791194244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IICuk/G63B2JgaJDXpKkq7HXz6LbwKmpt0RpUZYj3e8=;
	b=MbqI4+QFcYE0jXfWcb636pbaJ4vwEUFr+qjTCcJZz8I8Nbi8nBZWGIBlWC1aI/XKmTWN
	 50nWSWsBxpdHBSwrDkOB5hJn9J567K/VLDF2t8ZjRoadaZeDYBjGWqgguF6ygtZ4YQZec
	 cmy2ed8oL5gg92Eb8v0HwSYVtziuI9jw04ik4rH60PfXz7HTG3GSDBU516HWVWW1RUY4y
	 n9zEsCuKAmVlz/lUb0L2NeDTmoteT8pskRMx5IaPCLeGLNkFYRUlRW2UXy/inYwwJ0CdQ
	 3WszttR9m5ZnNU514IuzbBia4ro95WYCWN3YVgX8InEe+iWO7Bowhuav2q8nl2IWoJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791194244;
	bh=IICuk/G63B2JgaJDXpKkq7HXz6LbwKmpt0RpUZYj3e8=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EiWEdWcZuWz743hFoL4LfAnkhnE0fqZjgMNdWTjdFjZBHGRZuoNDrFaY+KpLg5v2x
	 5WW9UgYC3zImOvmPTqxqIDHxTHAYEs/9akd+OvPLcjF2KS1fm660X61VbGr4iP/iHp
	 tAtDDN4Zd/RfjTP88qscbQvbPbtJ+BjVR/ASXtuMiZ5DNOuAvzDkLs1E9xx+XJP5Mv
	 Lifkn02OgcQTyDGAi4Vgut3AUn2lm+IieDnnNiH+R6qM6OBuqcFp8ZRBVChcs3hn9D
	 Z337R5oWXBf1DUPbVhEFUtdaC0v17U3tilvhVaQ73SX3nxexrryCjJ0I0CGBfucAVF
	 akRmexz7ezD/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB21640575;
	Mon,  5 Oct 2026 09:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8163575
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E29D60611
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmpJm_9ImjnI for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 09:49:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8B20460603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791193746;
 b=Em8Y2Y09kpbO8Uvc7sTbwP+Sr1YL3eQ7xoiRens2P9pk/vgz6N5NPWKs+ItVQLGeCPA1
 UCSSw0TVlkyEk7uqh4tI5Iz8xVDS5PFA8mDPKLqpRB4H8rsSCgW9oHZPz7QBtT0cXAoqF
 cXxwLXkwbY2UlQIxQl358BVMa9fQxOOd50rdlWf9uusVinWB8b01X+vUPS9J1X02bYlNS
 2aCUQi4rxeWSxumaAs3niuCEHvpNrA2oWubsKuVyIAHG4x2/5qNjTxWTvis4uVdX+i+3Z
 A/Ucjv9/oSTA+0Lhe5r9/Wh8PPS2dfRujv5sZEA3QOUwAm34OBu6ofSorECCAkBm8Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791193746;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
 X-Last-TLS-Session-Version;
 bh=Sm+h9KXGjut9Qv8s9MPFTjZ0N2Upd7sR98ory78hN88=;
 b=FegWfdJf5t8pMqtZq0lIE+tbRYKoEBugUfclKTKg+TkVTlUqfcRQpMWC5cX0YFO6SPtQ
 FHB5LdQjOiwhxn9pXwRersOpYJ4QhTeVcrO3GCLgitPUyKsHGcz2rkBEtr1xAeNoIm+Po
 FEzdn7MJD7wKsESD7yJVw4P03gEO57l03VLexg35FiSk94QjDLNOH5Yyu59Dt0LyokHba
 Cw54FsagOeWpnFmyx3vXGqkseCfLS/Xt1mlJ7HRm88Jspw1v2ezA1975un3lf8lWbieGO
 Sg0YLIlGp2vJ9M/AivT+eIpRBOMHGCmhcBvs+WaOL7r2dt53WZJTaOGjYBt9rmsUEKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eWLrJfH2; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B20460603
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:49:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D2BEC4E411A5
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:48:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A19A4604FE;
 Mon,  5 Oct 2026 09:48:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9B691033073A; 
 Mon,  5 Oct 2026 11:48:44 +0200 (CEST)
Date: Mon, 05 Oct 2026 11:48:43 +0200
MIME-Version: 1.0
Message-Id: <20261005-update-rasdaemon-v1-1-dc40986b5952@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1haqoJa5yuAiNVEjWKVREcS7T
 0eXb/H/BcpRWOGTXRD5EJUlJBR5Bt2IYWAjlAylLevC2srsK+HGJqIS8rwEg+Sdc9Q0de8hZWv
 kXs5n+W1f6+4n7rb/B+77Bx5pqpd0AAAA
X-Change-ID: 20261005-update-rasdaemon-adb888d776fb
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/rasdaemon: bump version to v1.0.0
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of v1.0.0, rasdaemon is using meson. Swith the buildroot pacakge to
meson.
The patch added here by Bastien was applied as:
b62e70c ("rasdaemon: fix build when sqlite isn't enabled")
Drop the patch.
However, some includes are still missing in rasdaemon to build using
musl.
Fix missing includes.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 ...1-rasdaemon-add-missing-include-of-time.h.patch | 31 +++++++++++++++
 ...aemon-fix-build-when-sqlite-isn-t-enabled.patch | 46 ----------------------
 ...sdaemon-fix-implicit-function-declaration.patch | 29 ++++++++++++++
 package/rasdaemon/rasdaemon.hash                   |  2 +-
 package/rasdaemon/rasdaemon.mk                     | 15 ++++---
 5 files changed, 68 insertions(+), 55 deletions(-)

diff --git a/package/rasdaemon/0001-rasdaemon-add-missing-include-of-time.h.patch b/package/rasdaemon/0001-rasdaemon-add-missing-include-of-time.h.patch
new file mode 100644
index 0000000000..035ec8ebdb
--- /dev/null
+++ b/package/rasdaemon/0001-rasdaemon-add-missing-include-of-time.h.patch
@@ -0,0 +1,31 @@
+From cbb184d43d73ff7f58080634893407c06c0cd378 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Mon, 5 Oct 2026 10:24:51 +0200
+Subject: [PATCH] rasdaemon: add missing include of time.h
+
+queue.c uses time_t, even though glibc define time_t in bits/types.h
+which is included by a lot of headers, musl and uclibc rely on time.h.
+This causes a build error with "unknown type name 'time_t'".
+Fixes build error with musl and uclibc.
+
+Upstream: https://github.com/mchehab/rasdaemon/pull/268
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ core/queue.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/core/queue.c b/core/queue.c
+index 214bda1..16c96e5 100644
+--- a/core/queue.c
++++ b/core/queue.c
+@@ -6,6 +6,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <time.h>
+ 
+ #include "core/queue.h"
+ #include "core/ras-logger.h"
+-- 
+2.55.0
+
diff --git a/package/rasdaemon/0001-rasdaemon-fix-build-when-sqlite-isn-t-enabled.patch b/package/rasdaemon/0001-rasdaemon-fix-build-when-sqlite-isn-t-enabled.patch
deleted file mode 100644
index 2dccbec55f..0000000000
--- a/package/rasdaemon/0001-rasdaemon-fix-build-when-sqlite-isn-t-enabled.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8eaf25c30554c7cc457406ce5895b8087904cb2b Mon Sep 17 00:00:00 2001
-From: Bastien Curutchet <bastien.curutchet@bootlin.com>
-Date: Wed, 17 Dec 2025 11:38:52 +0100
-Subject: [PATCH] rasdaemon: fix build when sqlite isn't enabled
-
-Build without SQLite enabled through --enable-sqlite3 still fails if
-sqlite isn't available:
->   CC       rasdaemon-rasdaemon.o
-> In file included from rasdaemon.c:17:
-> ras-record.h:11:10: fatal error: sqlite3.h: No such file or directory
->    11 | #include <sqlite3.h>
->       |          ^~~~~~~~~~~
-> compilation terminated.
-
-Include the sqlite header only if the SQLite feature is enabled.
-
-Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
-Upstream: https://github.com/mchehab/rasdaemon/pull/234
----
- ras-record.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/ras-record.h b/ras-record.h
-index 21edcd6..cb03f4e 100644
---- a/ras-record.h
-+++ b/ras-record.h
-@@ -8,7 +8,6 @@
- #ifndef __RAS_RECORD_H
- #define __RAS_RECORD_H
- 
--#include <sqlite3.h>
- #include <fcntl.h>
- #include <stdbool.h>
- #include <stdint.h>
-@@ -320,6 +319,8 @@ struct ras_cxl_memory_sparing_event;
- 
- #ifdef HAVE_SQLITE3
- 
-+#include <sqlite3.h>
-+
- struct sqlite3_priv {
- 	sqlite3		*db;
- 	sqlite3_stmt	*stmt_mc_event;
--- 
-2.52.0
-
diff --git a/package/rasdaemon/0002-rasdaemon-fix-implicit-function-declaration.patch b/package/rasdaemon/0002-rasdaemon-fix-implicit-function-declaration.patch
new file mode 100644
index 0000000000..037d3c853d
--- /dev/null
+++ b/package/rasdaemon/0002-rasdaemon-fix-implicit-function-declaration.patch
@@ -0,0 +1,29 @@
+From b7e708c375244e50ec2206200899042aa8a0e3a2 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Mon, 5 Oct 2026 10:38:51 +0200
+Subject: [PATCH] rasdaemon: fix implicit function declaration
+
+usleep is declared in unistd.h. Using musl, this issue appears.
+Fix implicit function declaration.
+
+Upstream: https://github.com/mchehab/rasdaemon/pull/268
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ events/ras-signal-handler.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/events/ras-signal-handler.c b/events/ras-signal-handler.c
+index 6fc73ed..5693bcf 100644
+--- a/events/ras-signal-handler.c
++++ b/events/ras-signal-handler.c
+@@ -20,6 +20,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ #include "core/modules.h"
+ #include "core/ras-logger.h"
+-- 
+2.55.0
+
diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
index e1b600a489..9ca7b3fda6 100644
--- a/package/rasdaemon/rasdaemon.hash
+++ b/package/rasdaemon/rasdaemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz
+sha256  3a1d70bef371e42c1b8f779791ee0a3492070ba4ba7d48450167e075570d5f4e  rasdaemon-1.0.0.tar.gz
 sha256  39bc367cd7cd291d217447632b28a74be414a52b142b1875ac8789184aeca7b2  COPYING
diff --git a/package/rasdaemon/rasdaemon.mk b/package/rasdaemon/rasdaemon.mk
index a6f53a7b6a..2bb9b81037 100644
--- a/package/rasdaemon/rasdaemon.mk
+++ b/package/rasdaemon/rasdaemon.mk
@@ -4,32 +4,31 @@
 #
 ################################################################################
 
-RASDAEMON_VERSION = 0.8.4
+RASDAEMON_VERSION = 1.0.0
 RASDAEMON_SITE = $(call github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
 RASDAEMON_LICENSE = GPL-2.0+
 RASDAEMON_LICENSE_FILES = COPYING
-RASDAEMON_AUTORECONF = YES
 
 RASDAEMON_DEPENDENCIES = libtraceevent
 # rasdaemon uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 RASDAEMON_DEPENDENCIES += argp-standalone
-RASDAEMON_CONF_ENV += LIBS="-largp"
+RASDAEMON_LDFLAGS = $(TARGET_LDFLAGS) -largp
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-RASDAEMON_CONF_OPTS += --enable-sqlite3
+RASDAEMON_CONF_OPTS += -Dsqlite3=enabled
 RASDAEMON_DEPENDENCIES += sqlite
 else
-RASDAEMON_CONF_OPTS += --disable-sqlite3
+RASDAEMON_CONF_OPTS += -Dsqlite3=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_RASDAEMON_AER),y)
 RASDAEMON_DEPENDENCIES += pciutils
-RASDAEMON_CONF_OPTS += --enable-aer
+RASDAEMON_CONF_OPTS += -Daer=enabled
 else
-RASDAEMON_CONF_OPTS += --disable-aer
+RASDAEMON_CONF_OPTS += -Daer=disabled
 endif
 
 define RASDAEMON_INSTALL_INIT_SYSV
@@ -37,4 +36,4 @@ define RASDAEMON_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S95rasdaemon
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))

---
base-commit: c29ff5b9b38e87af3df0c95c7e3d6f51c0c0688b
change-id: 20261005-update-rasdaemon-adb888d776fb

Best regards,
--  
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
