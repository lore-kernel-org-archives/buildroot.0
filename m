Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB75C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 20:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C896084F;
	Fri, 28 Jun 2024 20:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIXyNMX9jWb2; Fri, 28 Jun 2024 20:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4987060D95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4987060D95;
	Fri, 28 Jun 2024 20:46:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B327C1BF3BA
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD0E24055E
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXV1_hjBoPpD for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 20:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D377340180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D377340180
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D377340180
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 20:46:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4255fc43f1cso7310595e9.0
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 13:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719607579; x=1720212379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMQAqhR6MenJkBzCD6br205TXwitYLPb55hpPCbzW/Q=;
 b=m3s2fGvorN55lUScv3gr8zMlfkwmjXk9gFaEUAA+Zl2+b2GQp/EGwQFNuWeXuzpb+T
 j3mRY8uWjmtpF1F/DskZ5lZSm7qteXB9lmlBrS9GtufGlSii9cFVH1WB6/87dS5LZ/5H
 RljyafUF4jDSjudrR5SzMN+LXHG+XA6ZCLI1evd6ACJXxtIjViWfJ8Wte/PwZX4KcbGU
 Zld2dveA0lW9tfy43UV/9hZFvF+17bFFOQjW4ZPhHIYXOmBJY9YfuWwvSoxekGyXCldu
 HivznfOOKYuZGHHzpF9/fYHvzHlx6sH1Dt2gdquKwf7+JAb9j7QwhgIff3/+GaG9jNyR
 8mFg==
X-Gm-Message-State: AOJu0YzwCkRk49KfSB3JsN+lZxwnj8v43BzkLnVD4UCQR3MVd+Yz0Ti2
 ZDybNFiiEH18DxRugnF4SymwOXiHkIU1hiBYYz5VvGF/RWGOj+MXbwIY+w==
X-Google-Smtp-Source: AGHT+IGALUGntkP7vD3dSFUwQHLjlNz7RK5eBR8TFLRgFZwtApoADYIJgvrNC6JNOPer8SBsqGeWXQ==
X-Received: by 2002:a05:600c:3b9c:b0:425:6bc4:977b with SMTP id
 5b1f17b1804b1-4256bc49bf0mr28977915e9.26.1719607578359; 
 Fri, 28 Jun 2024 13:46:18 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c172csm50047665e9.41.2024.06.28.13.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:46:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 22:46:17 +0200
Message-ID: <20240628204617.37898-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719607579; x=1720212379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMQAqhR6MenJkBzCD6br205TXwitYLPb55hpPCbzW/Q=;
 b=AQ8eYO5pWRX3TRW2XA0MLo3iW5QiPmx4Luy4m0sU25qj9k2+6JEBGY7G4p5BbuY+Gc
 4AX24w//7yQQVQ7l/Ps+TQjPZwXsPeB8izlAGYism8skvSZpObx7dTjhlBhF5YJxdwhM
 8HEh7XwPgMjNhgkV5y5NlqsE0n7lr7+uE7+L6a86jOx18sOCFp/6Pzu+IQdlnBQr976s
 kRehsb1zp12GQj1n/qRlbevjNEf0EMMxJIlhXSyy7Pme8zjtcTRAWoUtQY2ZWA/CGQKP
 tvGx5V6Ixp1cyZUj1hwu9KcFlBjrwtQWLM9s3mFIW4AgMClTG8EHpnIogylDszuzZaf9
 38hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AQ8eYO5p
Subject: [Buildroot] [PATCH] package/cgic: drop package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 David Bender <codehero@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream site for cgic is now a parking/phishing site, so we can't
download cgic anymore.

The last version was 2.07, released 7 years ago, and nothing uses cgic
in Buildroot.

Drop the package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: David Bender <codehero@gmail.com>
---
 .checkpackageignore                           |  3 -
 Config.in.legacy                              |  6 ++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 package/cgic/0001-prepare_makefile.patch      | 44 ---------------
 package/cgic/0002-file_enhancements.patch     | 56 -------------------
 ...3-restore-cgiFormFileGetTempfileName.patch | 43 --------------
 package/cgic/Config.in                        |  6 --
 package/cgic/cgic.hash                        |  3 -
 package/cgic/cgic.mk                          | 25 ---------
 10 files changed, 6 insertions(+), 182 deletions(-)
 delete mode 100644 package/cgic/0001-prepare_makefile.patch
 delete mode 100644 package/cgic/0002-file_enhancements.patch
 delete mode 100644 package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
 delete mode 100644 package/cgic/Config.in
 delete mode 100644 package/cgic/cgic.hash
 delete mode 100644 package/cgic/cgic.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index ae3fbe8fb0..63171b0c35 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -454,9 +454,6 @@ package/cdrkit/0001-no-rcmd.patch lib_patch.Upstream
 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch lib_patch.Upstream
 package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch lib_patch.Upstream
 package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
-package/cgic/0001-prepare_makefile.patch lib_patch.Upstream
-package/cgic/0002-file_enhancements.patch lib_patch.Upstream
-package/cgic/0003-restore-cgiFormFileGetTempfileName.patch lib_patch.Upstream
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 29c386bec4..9dd5bdd2eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_CGIC
+	bool "cgic has been removed"
+	select BR2_LEGACY
+	help
+	  the cgic upstream no longer exists.
+
 config BR2_PACKAGE_VERSAL_FIRMWARE
 	bool "versal-firmware has been replaced by xilinx-prebuilt"
 	select BR2_TARGET_XILINX_PREBUILT
diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78..6d9fcd97df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -788,7 +788,6 @@ F:	package/libmnl/
 
 N:	David Bender <codehero@gmail.com>
 F:	package/benejson/
-F:	package/cgic/
 F:	package/freeradius-client/
 F:	package/openldap/
 
diff --git a/package/Config.in b/package/Config.in
index 785d00dbfd..fc1650619b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1949,7 +1949,6 @@ menu "Networking"
 	source "package/belle-sip/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
-	source "package/cgic/Config.in"
 	source "package/cni-plugins/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
diff --git a/package/cgic/0001-prepare_makefile.patch b/package/cgic/0001-prepare_makefile.patch
deleted file mode 100644
index 15adc4cda2..0000000000
--- a/package/cgic/0001-prepare_makefile.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Makefile: fix for cross-compilation
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-diff -rupN cgic206/Makefile cgic206-br/Makefile
---- cgic206/Makefile	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206-br/Makefile	2015-01-16 11:18:03.714874000 -0500
-@@ -1,15 +1,14 @@
--CFLAGS=-g -Wall
--CC=gcc
--AR=ar
--RANLIB=ranlib
- LIBS=-L./ -lcgic
- 
- all: libcgic.a cgictest.cgi capture
- 
- install: libcgic.a
--	cp libcgic.a /usr/local/lib
--	cp cgic.h /usr/local/include
--	@echo libcgic.a is in /usr/local/lib. cgic.h is in /usr/local/include.
-+	cp libcgic.a $(PREFIX)/usr/lib
-+	cp cgic.h $(PREFIX)/usr/include
-+	@echo libcgic.a is in $(PREFIX)/usr/lib. cgic.h is in $(PREFIX)/usr/include.
-+
-+cgi.o: cgic.c cgic.h
-+	$(CC) $(CFLAGS) cgic.c -o cgic.o
- 
- libcgic.a: cgic.o cgic.h
- 	rm -f libcgic.a
-@@ -19,10 +18,10 @@ libcgic.a: cgic.o cgic.h
- #mingw32 and cygwin users: replace .cgi with .exe
- 
- cgictest.cgi: cgictest.o libcgic.a
--	gcc cgictest.o -o cgictest.cgi ${LIBS}
-+	$(CC) cgictest.o -o cgictest.cgi ${LIBS}
- 
- capture: capture.o libcgic.a
--	gcc capture.o -o capture ${LIBS}
-+	$(CC) capture.o -o capture ${LIBS}
- 
- clean:
- 	rm -f *.o *.a cgictest.cgi capture
diff --git a/package/cgic/0002-file_enhancements.patch b/package/cgic/0002-file_enhancements.patch
deleted file mode 100644
index a6f82fce33..0000000000
--- a/package/cgic/0002-file_enhancements.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Create better temporary files.
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it; split the patch in two
-  independent fixes]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
---- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
-@@ -22,6 +22,8 @@
- #define CGICDEBUGEND
- #endif /* CGICDEBUG */
- 
-+#define _GNU_SOURCE
-+
- #include <stdio.h>
- #include <string.h>
- #include <ctype.h>
-@@ -34,11 +36,11 @@
- #include <io.h>
- 
- /* cgic 2.01 */
--#include <fcntl.h>
- 
- #else
- #include <unistd.h>
- #endif /* WIN32 */
-+#include <fcntl.h>
- #include "cgic.h"
- 
- #define cgiStrEq(a, b) (!strcmp((a), (b)))
-@@ -636,16 +638,17 @@ static cgiParseResultType getTempFileNam
- 		window between the file's creation and the
- 		chmod call (glibc 2.0.6 and lower might
- 		otherwise have allowed this). */
-+	mode_t umode;
- 	int outfd; 
-+	umode = umask(0600);
- 	strcpy(tfileName, cgicTempDir "/cgicXXXXXX");
--	outfd = mkstemp(tfileName);
-+	outfd = mkostemp(tfileName, O_CLOEXEC | O_NOATIME);
-+	umask(umode);
- 	if (outfd == -1) {
- 		return cgiParseIO;
- 	}
--	close(outfd);
--	/* Fix the permissions */
--	if (chmod(tfileName, 0600) != 0) {
--		unlink(tfileName);
-+
-+	if (close(outfd)) {
- 		return cgiParseIO;
- 	}
- #else
diff --git a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch b/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
deleted file mode 100644
index f66227b6a6..0000000000
--- a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Restore lost functionality
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
---- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
-@@ -1278,6 +1278,20 @@ cgiFormResultType cgiFormFileContentType
- 	}
- }
- 
-+const char* cgiFormFileGetTempfileName(
-+	char* name)
-+{
-+	cgiFormEntry *e;
-+	e = cgiFormEntryFindFirst(name);
-+	if (!e) {
-+		return NULL;
-+	} else if (!strlen(e->tfileName)) {
-+		return NULL;
-+	} else {
-+		return e->tfileName;
-+	}
-+}
-+
- cgiFormResultType cgiFormFileSize(
- 	char *name, int *sizeP)
- {
-diff -rupN cgic206/cgic.h cgic206_tempfile/cgic.h
---- cgic206/cgic.h	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206_tempfile/cgic.h	2015-01-21 11:53:02.915148026 -0500
-@@ -141,6 +141,8 @@ extern cgiFormResultType cgiFormRadio(
- 	char *name, char **valuesText, int valuesTotal, 
- 	int *result, int defaultV);	
- 
-+extern const char* cgiFormFileGetTempfileName(char* name);
-+
- /* The paths returned by this function are the original names of files
- 	as reported by the uploading web browser and shoult NOT be
- 	blindly assumed to be "safe" names for server-side use! */
diff --git a/package/cgic/Config.in b/package/cgic/Config.in
deleted file mode 100644
index 402460d039..0000000000
--- a/package/cgic/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_CGIC
-	bool "cgic"
-	help
-	  C CGI library
-
-	  http://www.boutell.com/cgic/
diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
deleted file mode 100644
index 2c68067128..0000000000
--- a/package/cgic/cgic.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
-sha256  6a7de92593d64dbf7630d8f66f97e04a899769bef1e055f2434bc06b87b9de62  license.txt
diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
deleted file mode 100644
index cd0841302d..0000000000
--- a/package/cgic/cgic.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# cgic
-#
-################################################################################
-
-CGIC_VERSION = 2.07
-CGIC_SOURCE = cgic207.tar.gz
-CGIC_SITE = http://boutell.com/cgic
-CGIC_LICENSE = Custom
-CGIC_LICENSE_FILES = license.txt
-
-# Installs only a static library and a header file
-CGIC_INSTALL_STAGING = YES
-CGIC_INSTALL_TARGET = NO
-
-define CGIC_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) libcgic.a
-endef
-
-define CGIC_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=$(STAGING_DIR) -C $(@D) install
-endef
-
-$(eval $(generic-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
