Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EBBCAC587
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 13:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA872411D2;
	Tue,  9 Sep 2025 13:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MP_ifxi-IjU; Tue,  9 Sep 2025 13:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 517E641216
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517E641216;
	Tue,  9 Sep 2025 13:00:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2A3CA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F3B411D1
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlZGMkKUByJz for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A248411AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A248411AB
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A248411AB
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2BFF14E40C70
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 062A860630;
 Tue,  9 Sep 2025 12:59:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 573C0102F2896; 
 Tue,  9 Sep 2025 14:59:58 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 14:08:13 +0200
Message-ID: <20250909120822.1069595-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422798; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=FEPTYJfHLLhVBhbYTeHGJNpqp1hYET93oO+RsnL+oDk=;
 b=DLgxqCXtV77uqHnPpea+Q2w+0hDWN0jp6UjM9f1fH6FbUZl8QeB/WjIKKuZNApxPjEnfEZ
 fcmzrd9y/awenjb5RhHSGeisMLjGF5/FQip5IfMi89cu2KYg41ak3Tr+yjpQGtAKlEI8YX
 /Dww4qF7T2kJCA9OiRANrVRhlyKCLufYl/1z3Qez2HOpAeAWH/aEPHKCLwZo/LW81CoKRs
 to5GImk3fgRvgUJHJSXMbCBbVxBxTqoybgo2w0W0C/2iPZBsn1kB0SUP7wgNXJdfHQXGrX
 q9j/7FD0dj+527961JZ4pAQcKu+vmC2GvEmuW6PL5mOzsTZSvd7npE2VoLO7wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=DLgxqCXt
Subject: [Buildroot] [PATCH 08/11] package/policycoreutils: bump to version
 3.9
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

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

Notable changes related to policycoreutils: none.

However, in terms of packaging, there's a change: the top-level
Makefile of policycoreutils now uses pkg-config to find libselinux and
libsemanage. So building directly the subdirs no longer works because
the variables defined by the top-level Makefile are no longer set. So
we simplify the whole packaging by building from the top-level
Makefile. In order for this pkg-config to work for the host variant,
we need to pass $(HOST_MAKE_ENV) in the environment of make, so we
also did the same for consistency with $(TARGET_MAKE_ENV).

In terms of dependencies: policycoreutils directly links with
libselinux, libsemanage and libsepol, so all three are needed for both
the target and host variants. And host-pkgconf is now needed for the
host variant, as it's used to detect the dependent libraries.

The patches also need to be refreshed, except 0003 that is dropped
since it was a backport from upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

merge policycoreutils
---
 ...-all-paths-that-use-an-absolute-path.patch |  2 +-
 .../0002-Add-PREFIX-to-host-paths.patch       |  2 +-
 ...oreutils-run_init-define-_GNU_SOURCE.patch | 37 -------------------
 package/policycoreutils/Config.in             |  5 ++-
 package/policycoreutils/policycoreutils.hash  |  2 +-
 package/policycoreutils/policycoreutils.mk    | 37 +++++--------------
 6 files changed, 15 insertions(+), 70 deletions(-)
 delete mode 100644 package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch

diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index 18f0001aef..e894987f49 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -32,7 +32,7 @@ index a3bbbe1..df675cf 100644
 +AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  
  CFLAGS ?= -g -Werror -Wall -W
- override LDLIBS += -lselinux -lsepol -lpthread
+ override CFLAGS += -I../../libselinux/include
 -- 
 2.13.6
 
diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
index 2daed57c97..6f838e8d54 100644
--- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
+++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
@@ -48,7 +48,7 @@ index e86364a..20a64d4 100644
 +AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  
  CFLAGS ?= -Werror -Wall -W
- override CFLAGS += -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
+ override CFLAGS += -I../../libselinux/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
 -- 
 2.31.1
 
diff --git a/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
deleted file mode 100644
index bef6909b0a..0000000000
--- a/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f338b2e7d2bbf70cb811eb1331162e33deb4ce6c Mon Sep 17 00:00:00 2001
-From: Robert Marko <robimarko@gmail.com>
-Date: Thu, 1 May 2025 21:59:13 +0200
-Subject: [PATCH] policycoreutils: run_init: define _GNU_SOURCE
-
-Trying to compile run_init with musl will fail with:
-run_init.c: In function 'authenticate_via_shadow_passwd':
-run_init.c:206:40: error: implicit declaration of function 'getpass' [-Wimplicit-function-declaration]
-  206 |         if (!(unencrypted_password_s = getpass(PASSWORD_PROMPT))) {
-
-This is because getpass in musl is guarded only for _GNU_SOURCE, so
-define _GNU_SOURCE for run_init.
-
-Signed-off-by: Robert Marko <robimarko@gmail.com>
-Acked-by: James Carter <jwcart2@gmail.com>
-Upstream: 50bafc3d9c08cf26c3b0f61e29157a0ea8efbf4a
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- policycoreutils/run_init/run_init.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/policycoreutils/run_init/run_init.c b/policycoreutils/run_init/run_init.c
-index ce499781..4531a8ba 100644
---- a/policycoreutils/run_init/run_init.c
-+++ b/policycoreutils/run_init/run_init.c
-@@ -37,6 +37,8 @@
-  *
-  *************************************************************************/
- 
-+#define _GNU_SOURCE
-+
- #include <stdio.h>
- #include <stdlib.h>		/* for malloc(), realloc(), free() */
- #include <pwd.h>		/* for getpwuid() */
--- 
-2.51.0
-
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 07e171a53f..db9eb9f6b5 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -6,9 +6,10 @@ comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage, libsepol
-	depends on !BR2_STATIC_LIBS # libsemanage, libsepol
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux, libsemanage, libsepol
+	depends on !BR2_STATIC_LIBS # libselinux, libsemanage, libsepol
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
+	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_LIBCAP_NG
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 4884c55770..7664be0b35 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  eef23196b501d141cb95f5fc52ef1a7289f459b65e4415ea0fe9aeedc5d80ef2  policycoreutils-3.8.1.tar.gz
+sha256  44a294139876cf4c7969cb6a75d1932cb42543d74a7661760ded44a20bf7ebe8  policycoreutils-3.9.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 3265986bff..d0e1aae312 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.8.1
+POLICYCOREUTILS_VERSION = 3.9
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
-POLICYCOREUTILS_DEPENDENCIES = libsemanage libsepol libcap-ng $(TARGET_NLS_DEPENDENCIES)
+POLICYCOREUTILS_DEPENDENCIES = libselinux libsemanage libsepol libcap-ng host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
@@ -32,28 +32,19 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
 POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
 endif
 
-POLICYCOREUTILS_MAKE_DIRS = \
-	load_policy newrole run_init \
-	secon semodule sestatus setfiles \
-	setsebool scripts
-
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.
 define POLICYCOREUTILS_BUILD_CMDS
-	$(foreach d,$(POLICYCOREUTILS_MAKE_DIRS),
-		$(MAKE) -C $(@D)/$(d) $(POLICYCOREUTILS_MAKE_OPTS) \
-			DESTDIR=$(STAGING_DIR) all
-	)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(STAGING_DIR) all
 endef
 
 define POLICYCOREUTILS_INSTALL_TARGET_CMDS
-	$(foreach d,$(POLICYCOREUTILS_MAKE_DIRS),
-		$(MAKE) -C $(@D)/$(d) $(POLICYCOREUTILS_MAKE_OPTS) \
-			DESTDIR=$(TARGET_DIR) install
-	)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
-HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
+HOST_POLICYCOREUTILS_DEPENDENCIES = host-libselinux host-libsemanage host-libsepol host-pkgconf
 
 # We need to pass PREFIX because it defaults to $(DESTDIR)/usr
 HOST_POLICYCOREUTILS_MAKE_OPTS = \
@@ -62,22 +53,12 @@ HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	ETCDIR=$(HOST_DIR)/etc \
 	SBINDIR=$(HOST_DIR)/sbin
 
-# Note: We are only building the programs required by the refpolicy build
-HOST_POLICYCOREUTILS_MAKE_DIRS = \
-	load_policy newrole run_init \
-	secon semodule sestatus setfiles \
-	setsebool
-
 define HOST_POLICYCOREUTILS_BUILD_CMDS
-	$(foreach d,$(HOST_POLICYCOREUTILS_MAKE_DIRS),
-		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) all
-	)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_POLICYCOREUTILS_MAKE_OPTS) all
 endef
 
 define HOST_POLICYCOREUTILS_INSTALL_CMDS
-	$(foreach d,$(HOST_POLICYCOREUTILS_MAKE_DIRS),
-		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) install
-	)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_POLICYCOREUTILS_MAKE_OPTS) install
 endef
 
 $(eval $(generic-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
