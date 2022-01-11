Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF096C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 23:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73ACA41621;
	Tue, 11 Jan 2022 23:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nv9ymncdqKzu; Tue, 11 Jan 2022 23:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEEA41626;
	Tue, 11 Jan 2022 23:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9A1F1BF489
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B685D6FB50
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZA_qnikT1Ut8 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FE226FB29
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 84BDC82650; Tue, 11 Jan 2022 23:28:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 00:29:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef5d311a84a71e52e4163c3df7277bd70286fca4
X-Git-Newrev: d1e8f787e97e4576509143d5c65f02bdf4ffcea4
X-Patchwork-Hint: ignore
Message-Id: <20220111232835.84BDC82650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libshdata: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1e8f787e97e4576509143d5c65f02bdf4ffcea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libshdata library provides lock free shared-memory tools.

https://github.com/Parrot-Developers/libshdata

libshdata-stress utility does not compile using static libs
only (BR2_STATIC_LIBS=y). The issue was raised upstream:
  https://github.com/Parrot-Developers/libshdata/issues/2
For now, libshdata-stress simply depends on !BR2_STATIC_LIBS.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr:
  - do not macro-ify headers install
  - do not parameterise static libs install dest
  - do not parameterise binaries install dest
  - reorder macros decaration and use
  - remove spurious comma between module dependencies
  - implicit module name
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-backend-Add-missing-include-files.patch   | 47 +++++++++++++++
 ...ples-stress_test-Fix-build-with-musl-libc.patch | 37 ++++++++++++
 package/libshdata/Config.in                        | 30 ++++++++++
 package/libshdata/libshdata.hash                   |  3 +
 package/libshdata/libshdata.mk                     | 68 ++++++++++++++++++++++
 7 files changed, 187 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e0385c7b81..b5be1d6352 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1195,6 +1195,7 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/libfutils/
+F:	package/libshdata/
 F:	package/lua-augeas/
 F:	package/modsecurity2/
 F:	package/php-apcu/
diff --git a/package/Config.in b/package/Config.in
index 163fd53e12..59297c3f3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2008,6 +2008,7 @@ menu "Other"
 	source "package/libpwquality/Config.in"
 	source "package/libqb/Config.in"
 	source "package/libseccomp/Config.in"
+	source "package/libshdata/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libspatialindex/Config.in"
diff --git a/package/libshdata/0001-backend-Add-missing-include-files.patch b/package/libshdata/0001-backend-Add-missing-include-files.patch
new file mode 100644
index 0000000000..78c9e669c3
--- /dev/null
+++ b/package/libshdata/0001-backend-Add-missing-include-files.patch
@@ -0,0 +1,47 @@
+From 3eaf11bd957555674f5993435ef79dd4717ce890 Mon Sep 17 00:00:00 2001
+From: Herve Codina <herve.codina@bootlin.com>
+Date: Tue, 26 Oct 2021 08:45:10 +0200
+Subject: [PATCH] backend: Add missing include files
+
+With some libc library (musl), shd_dev_mem.c and shd_shm.c do not
+compile. Indeed, open() needs <fcntl.h> (Cf. man open).
+
+This patch fixes the compilation issue adding this
+include file.
+
+This patch was submitted upstream.
+https://github.com/Parrot-Developers/libshdata/issues/1
+
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ src/backend/shd_dev_mem.c | 1 +
+ src/backend/shd_shm.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/backend/shd_dev_mem.c b/src/backend/shd_dev_mem.c
+index 14573c1..a65f052 100644
+--- a/src/backend/shd_dev_mem.c
++++ b/src/backend/shd_dev_mem.c
+@@ -33,6 +33,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>		/* For ftruncate */
++#include <fcntl.h>		/* For open */
+ #include <sys/file.h>		/* for flock */
+ #include <sys/mman.h>		/* For shm and PROT flags */
+ #include <futils/fdutils.h>
+diff --git a/src/backend/shd_shm.c b/src/backend/shd_shm.c
+index 117bf01..1e5a38c 100644
+--- a/src/backend/shd_shm.c
++++ b/src/backend/shd_shm.c
+@@ -35,6 +35,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>		/* For ftruncate */
++#include <fcntl.h>		/* For open */
+ #include <limits.h>		/* For NAME_MAX macro */
+ #include <sys/file.h>		/* for flock */
+ #include <sys/mman.h>		/* For shm and PROT flags */
+-- 
+2.31.1
+
diff --git a/package/libshdata/0002-examples-stress_test-Fix-build-with-musl-libc.patch b/package/libshdata/0002-examples-stress_test-Fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..c2a8e5f240
--- /dev/null
+++ b/package/libshdata/0002-examples-stress_test-Fix-build-with-musl-libc.patch
@@ -0,0 +1,37 @@
+From ddded7337812a2797d31f276624da98932d8e17f Mon Sep 17 00:00:00 2001
+From: Herve Codina <herve.codina@bootlin.com>
+Date: Sun, 9 Jan 2022 14:59:27 +0100
+Subject: [PATCH] examples/stress_test: Fix build with musl libc
+
+The musl C library uses sched_priority instead of
+__sched_priority as GNU libc and uClibc do.
+Use sched_priority instead.
+
+This does not break compilation with GNU libc and uClibc
+because they both define in sched.h:
+  #define sched_priority         __sched_priority
+
+This patch was submitted upstream.
+https://github.com/Parrot-Developers/libshdata/issues/3
+
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ examples/stress_test.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/stress_test.c b/examples/stress_test.c
+index a859115..cfb5418 100644
+--- a/examples/stress_test.c
++++ b/examples/stress_test.c
+@@ -617,7 +617,7 @@ static void launch_test(int timer_fd, struct test_setup *setup)
+ 	if (ret < 0)
+ 		ULOGI("Error setting the timer : %s", strerror(errno));
+ 	struct sched_param sched_params;
+-	sched_params.__sched_priority = sched_get_priority_max(SCHED_RR);
++	sched_params.sched_priority = sched_get_priority_max(SCHED_RR);
+ 
+ 	pid_t pid = fork();
+ 
+-- 
+2.33.1
+
diff --git a/package/libshdata/Config.in b/package/libshdata/Config.in
new file mode 100644
index 0000000000..b2c24c94c5
--- /dev/null
+++ b/package/libshdata/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LIBSHDATA
+	bool "libshdata"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libfutils
+	depends on BR2_INSTALL_LIBSTDCPP # libfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfutils
+	select BR2_PACKAGE_LIBFUTILS
+	select BR2_PACKAGE_ULOG
+	help
+	  This library provides lock free shared-memory tools
+
+	  https://github.com/Parrot-Developers/libshdata
+
+if BR2_PACKAGE_LIBSHDATA
+
+config BR2_PACKAGE_LIBSHDATA_STRESS
+	bool "libshdata-stress binary"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Install libshdata-stress binary as well
+
+comment "libshdata-stress needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
+
+comment "libshdata needs a toolchain w/ C++, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libshdata/libshdata.hash b/package/libshdata/libshdata.hash
new file mode 100644
index 0000000000..880404cf52
--- /dev/null
+++ b/package/libshdata/libshdata.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  1ae83ac73c2b5b17c726067737b8d446b99f190e16fe6198eb464368796ecce3  libshdata-d9ec4bdba834d8f3daf6bf9aa6da374bc462961f.tar.gz
+sha256  eca11a1c62fae8d64a1247d93271375baecff8396141d7ff8d89671ee7e3ed0d  COPYING
diff --git a/package/libshdata/libshdata.mk b/package/libshdata/libshdata.mk
new file mode 100644
index 0000000000..2e600359c1
--- /dev/null
+++ b/package/libshdata/libshdata.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# libshdata
+#
+################################################################################
+
+LIBSHDATA_VERSION = d9ec4bdba834d8f3daf6bf9aa6da374bc462961f
+LIBSHDATA_SITE = $(call github,Parrot-Developers,libshdata,$(LIBSHDATA_VERSION))
+LIBSHDATA_LICENSE = BSD-3-Clause
+LIBSHDATA_LICENSE_FILES = COPYING
+LIBSHDATA_DEPENDENCIES = libfutils ulog host-alchemy
+LIBSHDATA_INSTALL_STAGING = YES
+
+LIBSHDATA_TARGETS = libshdata
+ifeq ($(BR2_PACKAGE_LIBSHDATA_STRESS),y)
+LIBSHDATA_TARGETS += libshdata-stress
+endif
+
+LIBSHDATA_TARGET_ENV = \
+	$(ALCHEMY_TARGET_ENV) \
+	ALCHEMY_TARGET_SDK_DIRS="$(ALCHEMY_SDK_BASEDIR)/libfutils $(ALCHEMY_SDK_BASEDIR)/ulog"
+
+define LIBSHDATA_BUILD_CMDS
+	$(LIBSHDATA_TARGET_ENV) $(ALCHEMY_MAKE) $(LIBSHDATA_TARGETS)
+endef
+
+ifeq ($(BR2_SHARED_LIBS),)
+define LIBSHDATA_INSTALL_STATIC_LIBS
+	$(INSTALL) -D -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata.a \
+		$(STAGING_DIR)/usr/lib/libshdata.a
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS),)
+# $(1): destination directory: target or staging
+define LIBSHDATA_INSTALL_SHARED_LIBS
+	mkdir -p $(1)/usr/lib/
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata.so* \
+		$(1)/usr/lib/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSHDATA_STRESS),y)
+define LIBSHDATA_INSTALL_BIN
+	$(INSTALL) -D -m 755 $(@D)/alchemy-out/staging/usr/bin/libshdata-stress \
+		$(TARGET_DIR)/usr/bin/libshdata-stress
+endef
+endif
+
+define LIBSHDATA_INSTALL_TARGET_CMDS
+	$(LIBSHDATA_INSTALL_BIN)
+	$(call LIBSHDATA_INSTALL_SHARED_LIBS, $(TARGET_DIR))
+endef
+
+# Even in dynamic libraries only, libshdata-section-lookup is only built as
+# a static lib (include $(BUILD_STATIC_LIBRARY) in atom.mk) and it is needed
+# for libshdata usage.
+define LIBSHDATA_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/
+	$(INSTALL) -m 644 $(@D)/include/* $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata-section-lookup.a \
+		$(STAGING_DIR)/usr/lib/libshdata-section-lookup.a
+	$(LIBSHDATA_INSTALL_STATIC_LIBS)
+	$(call LIBSHDATA_INSTALL_SHARED_LIBS, $(STAGING_DIR))
+	$(call ALCHEMY_INSTALL_LIB_SDK_FILE, libshdata, libshdata.so, libfutils libulog)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
