Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48FBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44CD860BD3;
	Sun, 24 Jul 2022 23:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44CD860BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT1Epw1YroDv; Sun, 24 Jul 2022 23:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F196101F;
	Sun, 24 Jul 2022 23:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85F196101F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E53761BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B96786101F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96786101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1irmDjYGf4O for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE1860BD3
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DE1860BD3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:47:22 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id b9so8963921pfp.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5JRdANp9FwP8niE2iALO6CmJeuYO17+VRrMxEx5RWvg=;
 b=C1pDUjEXEJVdqaE9ZbB9NCST3DWhWO3pv6fQdgGtzO0tQ6kW3qq84qngMPmkzz6hqJ
 lE3xul5o+CL7L2B18tmdSsAQgQ1LT+PPKsAJqs+yv1DCgSR6wi/vqtYAh/51L/J84zq4
 OF9M6h8fvFXTHHYbrXmNgNhpM0JoSejAPRKAzTx84KrSN94KKHJVst+1PSvkKeCUgO1j
 A5Ehgvx3YxoP104Lq9kzXNsAOH4FTXFRIYSIM5XW50j5qw9UQy3O+QWrB1j9pAkkBbpS
 U3HeD1x9xtLn/VOswwYmU8feOQlC1Ko77PYLuMTi+fubcLICyTJl4gceFcx5Rjpa2w8i
 0/Ig==
X-Gm-Message-State: AJIora+GZfNagUsEYGuXxN9iG0V8LLhBfI/HGh9UQst2vOZzdNxS4Tml
 +BlNiKU5j5qT2Hf+UfizoAHWaXj71iYWsg==
X-Google-Smtp-Source: AGRyM1sJ/j94buL6zuXqyqWImDF3/PL0/HBNXfXi1tfPFQWJ1YR1mjzNj6P6wOkU1Kevc9WW1GbT/g==
X-Received: by 2002:a05:6a00:855:b0:52b:213d:fc03 with SMTP id
 q21-20020a056a00085500b0052b213dfc03mr10315802pfk.31.1658706441156; 
 Sun, 24 Jul 2022 16:47:21 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y17-20020a63ce11000000b00419acadde52sm7022690pgf.46.2022.07.24.16.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:47:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:47:18 -0700
Message-Id: <20220724234718.676572-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 1/1] package/android-tools: update to
 version 5.1.1.r38
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest 5.1.1.r38 from 4.2.2.

Dropped old patches and added several compat patches.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...-Fix-makefiles-for-out-of-tree-build.patch | 162 -----------
 .../0001-Use-pkgconfig-to-find-libs.patch     | 221 +++++++++++++++
 ...0002-Fix-adbd-for-non-Ubuntu-systems.patch | 264 ------------------
 ...ix-build-failure-missing-major-minor.patch |  25 ++
 .../0003-Fix-build-issue-with-uclibc.patch    |  36 +--
 .../0004-Fix-build-issue-with-musl.patch      |  54 ----
 .../0004-Remove-dependency-on-libbsd.patch    | 157 +++++++++++
 .../0005-Use-pkgconf-to-get-libs-deps.patch   |  35 ---
 package/android-tools/0005-bsd-fixups.patch   |  40 +++
 .../0006-fix-big-endian-build.patch           |  61 ----
 .../0007-include-cdefs-h-when-needed.patch    |  41 ---
 ...smacros.h-to-compile-with-glibc-2.28.patch |  42 ---
 ...les-for-out-of-tree-ext4_utils-build.patch |  48 ----
 ...atch-for-openssl-1.1.0-compatibility.patch |  47 ----
 package/android-tools/Config.in               |  32 +--
 package/android-tools/Config.in.host          |   1 +
 package/android-tools/android-tools.hash      |   4 +-
 package/android-tools/android-tools.mk        |  47 +++-
 18 files changed, 505 insertions(+), 812 deletions(-)
 delete mode 100644 package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
 create mode 100644 package/android-tools/0001-Use-pkgconfig-to-find-libs.patch
 delete mode 100644 package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
 create mode 100644 package/android-tools/0002-Fix-build-failure-missing-major-minor.patch
 delete mode 100644 package/android-tools/0004-Fix-build-issue-with-musl.patch
 create mode 100644 package/android-tools/0004-Remove-dependency-on-libbsd.patch
 delete mode 100644 package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
 create mode 100644 package/android-tools/0005-bsd-fixups.patch
 delete mode 100644 package/android-tools/0006-fix-big-endian-build.patch
 delete mode 100644 package/android-tools/0007-include-cdefs-h-when-needed.patch
 delete mode 100644 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
 delete mode 100644 package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
 delete mode 100644 package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch

diff --git a/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
deleted file mode 100644
index af0723620f..0000000000
--- a/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-[PATCH] Fix makefiles for out-of-tree build
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- debian/makefiles/adb.mk      | 10 +++++-----
- debian/makefiles/adbd.mk     | 33 ++++++++++++++++-----------------
- debian/makefiles/fastboot.mk | 17 +++++++++--------
- 3 files changed, 30 insertions(+), 30 deletions(-)
-
-diff --git a/debian/makefiles/adb.mk b/debian/makefiles/adb.mk
-index d9d4feb..654b9f1 100644
---- a/debian/makefiles/adb.mk
-+++ b/debian/makefiles/adb.mk
-@@ -1,5 +1,6 @@
- # Makefile for adb; from https://heiher.info/2227.html
- 
-+VPATH+= $(SRCDIR)/core/adb
- SRCS+= adb.c
- SRCS+= adb_client.c
- SRCS+= adb_auth_host.c
-@@ -17,7 +18,7 @@ SRCS+= usb_linux.c
- SRCS+= usb_vendors.c
- SRCS+= utils.c
- 
--VPATH+= ../libcutils
-+VPATH+= $(SRCDIR)/core/libcutils
- SRCS+= abort_socket.c
- SRCS+= socket_inaddr_any_server.c
- SRCS+= socket_local_client.c
-@@ -28,7 +29,7 @@ SRCS+= socket_network_client.c
- SRCS+= list.c
- SRCS+= load_file.c
- 
--VPATH+= ../libzipfile
-+VPATH+= $(SRCDIR)/core/libzipfile
- SRCS+= centraldir.c
- SRCS+= zipfile.c
- 
-@@ -37,9 +38,8 @@ CPPFLAGS+= -DADB_HOST=1
- CPPFLAGS+= -DHAVE_FORKEXEC=1
- CPPFLAGS+= -DHAVE_SYMLINKS
- CPPFLAGS+= -DHAVE_TERMIO_H
--CPPFLAGS+= -I.
--CPPFLAGS+= -I../include
--CPPFLAGS+= -I../../../external/zlib
-+CPPFLAGS+= -I$(SRCDIR)/core/adb
-+CPPFLAGS+= -I$(SRCDIR)/core/include
- 
- LIBS+= -lc -lpthread -lz -lcrypto
- 
-diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
-index 94d3a90..49dab8c 100644
---- a/debian/makefiles/adbd.mk
-+++ b/debian/makefiles/adbd.mk
-@@ -1,18 +1,6 @@
- # Makefile for adbd
- 
--VPATH+= ../libcutils
--SRCS+= abort_socket.c
--SRCS+= socket_inaddr_any_server.c
--SRCS+= socket_local_client.c
--SRCS+= socket_local_server.c
--SRCS+= socket_loopback_client.c
--SRCS+= socket_loopback_server.c
--SRCS+= socket_network_client.c
--SRCS+= list.c
--SRCS+= load_file.c
--SRCS+= android_reboot.c
--
--#VPATH+= ../adb
-+VPATH+= $(SRCDIR)/core/adbd
- SRCS+=  adb.c
- SRCS+=	backup_service.c
- SRCS+=	fdevent.c
-@@ -31,7 +19,19 @@ SRCS+=	log_service.c
- SRCS+=	utils.c
- SRCS+=	base64.c
- 
--VPATH+= ../libzipfile
-+VPATH+= $(SRCDIR)/core/libcutils
-+SRCS+= abort_socket.c
-+SRCS+= socket_inaddr_any_server.c
-+SRCS+= socket_local_client.c
-+SRCS+= socket_local_server.c
-+SRCS+= socket_loopback_client.c
-+SRCS+= socket_loopback_server.c
-+SRCS+= socket_network_client.c
-+SRCS+= list.c
-+SRCS+= load_file.c
-+SRCS+= android_reboot.c
-+
-+VPATH+= $(SRCDIR)/core/libzipfile
- SRCS+= centraldir.c
- SRCS+= zipfile.c
- 
-@@ -40,10 +40,9 @@ CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
- CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
- CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
- CPPFLAGS+= -DHAVE_TERMIO_H
--CPPFLAGS+= -I.
--CPPFLAGS+= -I../include
--CPPFLAGS+= -I../../../external/zlib
- CPPFLAGS+= `pkg-config --cflags glib-2.0 gio-2.0`
-+CPPFLAGS+= -I$(SRCDIR)/core/adbd
-+CPPFLAGS+= -I$(SRCDIR)/core/include
- 
- LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
- 
-diff --git a/debian/makefiles/fastboot.mk b/debian/makefiles/fastboot.mk
-index 9e8b751..94a069b 100644
---- a/debian/makefiles/fastboot.mk
-+++ b/debian/makefiles/fastboot.mk
-@@ -1,5 +1,6 @@
- # Makefile for fastboot; from https://heiher.info/2227.html
- 
-+VPATH+= $(SRCDIR)/core/fastboot
- SRCS+= bootimg.c
- SRCS+= engine.c
- SRCS+= fastboot.c
-@@ -7,11 +8,11 @@ SRCS+= protocol.c
- SRCS+= usb_linux.c
- SRCS+= util_linux.c
- 
--VPATH+= ../libzipfile
-+VPATH+= $(SRCDIR)/core/libzipfile
- SRCS+= centraldir.c
- SRCS+= zipfile.c
- 
--VPATH+= ../libsparse
-+VPATH+= $(SRCDIR)/core/libsparse
- SRCS+= backed_block.c
- SRCS+= sparse_crc32.c
- SRCS+= sparse.c
-@@ -19,7 +20,7 @@ SRCS+= sparse_read.c
- SRCS+= sparse_err.c
- SRCS+= output_file.c
- 
--VPATH+= ../../extras/ext4_utils/
-+VPATH+= $(SRCDIR)/extras/ext4_utils/
- SRCS+= make_ext4fs.c
- SRCS+= crc16.c
- SRCS+= ext4_utils.c
-@@ -31,11 +32,11 @@ SRCS+= extent.c
- SRCS+= wipe.c
- SRCS+= sha1.c
- 
--CPPFLAGS+= -I.
--CPPFLAGS+= -I../include
--CPPFLAGS+= -I../mkbootimg
--CPPFLAGS+= -I../../extras/ext4_utils/
--CPPFLAGS+= -I../libsparse/include/
-+CPPFLAGS+= -I$(SRCDIR)/core/fastboot
-+CPPFLAGS+= -I$(SRCDIR)/core/include
-+CPPFLAGS+= -I$(SRCDIR)/core/mkbootimg
-+CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils/
-+CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
- 
- LIBS+= -lz -lselinux
- 
--- 
-2.5.1
-
diff --git a/package/android-tools/0001-Use-pkgconfig-to-find-libs.patch b/package/android-tools/0001-Use-pkgconfig-to-find-libs.patch
new file mode 100644
index 0000000000..46f770d989
--- /dev/null
+++ b/package/android-tools/0001-Use-pkgconfig-to-find-libs.patch
@@ -0,0 +1,221 @@
+From 247ef2711dbc9f9d8ee18c3d53b1745be45a8767 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Mon, 11 Jul 2022 06:20:03 -0700
+Subject: [PATCH] Use pkgconfig to find libs
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ debian/makefiles/adb.mk        |  4 +--
+ debian/makefiles/adbd.mk       | 48 ++--------------------------------
+ debian/makefiles/ext4_utils.mk | 42 ++++++++++-------------------
+ debian/makefiles/fastboot.mk   | 11 +++-----
+ 4 files changed, 22 insertions(+), 83 deletions(-)
+
+diff --git a/debian/makefiles/adb.mk b/debian/makefiles/adb.mk
+index 89cd51d..b2e2a60 100644
+--- a/debian/makefiles/adb.mk
++++ b/debian/makefiles/adb.mk
+@@ -59,12 +59,12 @@ CFLAGS += -I$(SRCDIR)/system/core/adb
+ CFLAGS += -I$(SRCDIR)/system/core/include
+ CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+ 
+-LIBS += libcutils.a -lpthread -lcrypto
++LIBS += -lpthread `pkg-config --libs libcrypto libselinux`
+ 
+ all: adb
+ 
+ adb: libcutils.a $(adb_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
++	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) libcutils.a $(LIBS)
+ 
+ libcutils.a: $(libcutils_OBJS)
+ 	$(AR) rcs $@ $(libcutils_OBJS)
+diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
+index 5882d43..682fc06 100644
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
+@@ -62,45 +62,6 @@ libcutils_SRC_FILES += klog.c
+ libcutils_SRC_FILES += properties.c
+ libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
+ 
+-VPATH += $(SRCDIR)/external/libselinux/src
+-libselinux_SRC_FILES += booleans.c
+-libselinux_SRC_FILES += canonicalize_context.c
+-libselinux_SRC_FILES += disable.c
+-libselinux_SRC_FILES += enabled.c
+-libselinux_SRC_FILES += fgetfilecon.c
+-libselinux_SRC_FILES += fsetfilecon.c
+-libselinux_SRC_FILES += getenforce.c
+-libselinux_SRC_FILES += getfilecon.c
+-libselinux_SRC_FILES += getpeercon.c
+-libselinux_SRC_FILES += lgetfilecon.c
+-libselinux_SRC_FILES += load_policy.c
+-libselinux_SRC_FILES += lsetfilecon.c
+-libselinux_SRC_FILES += policyvers.c
+-libselinux_SRC_FILES += procattr.c
+-libselinux_SRC_FILES += setenforce.c
+-libselinux_SRC_FILES += setfilecon.c
+-libselinux_SRC_FILES += context.c
+-libselinux_SRC_FILES += mapping.c
+-libselinux_SRC_FILES += stringrep.c
+-libselinux_SRC_FILES += compute_create.c
+-libselinux_SRC_FILES += compute_av.c
+-libselinux_SRC_FILES += avc.c
+-libselinux_SRC_FILES += avc_internal.c
+-libselinux_SRC_FILES += avc_sidtab.c
+-libselinux_SRC_FILES += get_initial_context.c
+-libselinux_SRC_FILES += checkAccess.c
+-libselinux_SRC_FILES += sestatus.c
+-libselinux_SRC_FILES += deny_unknown.c
+-
+-libselinux_SRC_FILES += callbacks.c
+-libselinux_SRC_FILES += check_context.c
+-libselinux_SRC_FILES += freecon.c
+-libselinux_SRC_FILES += init.c
+-libselinux_SRC_FILES += label.c
+-libselinux_SRC_FILES += label_file.c
+-libselinux_SRC_FILES += label_android_property.c
+-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+-
+ VPATH += $(SRCDIR)/system/extras/ext4_utils
+ libext4_utils_SRC_FILES += make_ext4fs.c
+ libext4_utils_SRC_FILES += ext4fixup.c
+@@ -133,14 +94,13 @@ CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+ CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+ CFLAGS += -I$(SRCDIR)/system/core/fs_mgr/include
+ CFLAGS += -I$(SRCDIR)/hardware/libhardware/include
+-CFLAGS += -I$(SRCDIR)/external/libselinux/include
+ CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+ 
+-LIBS += liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto
++LIBS += liblog.a libfs_mgr.a libcutils.a libext4_utils.a -lpthread -lresolv `pkg-config --libs libcrypto libselinux libpcre`
+ 
+ all: adbd
+ 
+-adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $(adbd_OBJS)
++adbd: liblog.a libfs_mgr.a libcutils.a libext4_utils.a $(adbd_OBJS)
+ 	$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
+ 
+ liblog.a: $(liblog_OBJS)
+@@ -152,10 +112,6 @@ libfs_mgr.a: $(fs_mgr_OBJS)
+ libcutils.a: $(libcutils_OBJS)
+ 	$(AR) rcs $@ $(libcutils_OBJS)
+ 
+-libselinux.a: $(libselinux_OBJS)
+-	export CFLAGS="-DANDROID -DHOST"
+-	$(AR) rcs $@ $(libselinux_OBJS)
+-
+ libext4_utils.a: $(libext4_utils_OBJS)
+ 	$(AR) rcs $@ $(libext4_utils_OBJS)
+ 
+diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_utils.mk
+index cc713a3..2848b89 100644
+--- a/debian/makefiles/ext4_utils.mk
++++ b/debian/makefiles/ext4_utils.mk
+@@ -47,46 +47,35 @@ libsparse_SRC_FILES += sparse_err.c
+ libsparse_SRC_FILES += sparse_read.c
+ libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
+ 
+-VPATH += $(SRCDIR)/external/libselinux/src
+-libselinux_SRC_FILES += callbacks.c
+-libselinux_SRC_FILES += check_context.c
+-libselinux_SRC_FILES += freecon.c
+-libselinux_SRC_FILES += init.c
+-libselinux_SRC_FILES += label.c
+-libselinux_SRC_FILES += label_file.c
+-libselinux_SRC_FILES += label_android_property.c
+-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+-
+ CFLAGS += -std=gnu11
+ CFLAGS += -DANDROID
+ CFLAGS += -DHOST
+ CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+ CFLAGS += -I$(SRCDIR)/system/core/include
+ CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+-CFLAGS += -I$(SRCDIR)/external/libselinux/include
+ CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+ 
++LIBS += libext4_utils.a libsparse.a `pkg-config --libs libselinux libpcre zlib`
++
+ all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
+ 
+-make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
+-		libext4_utils.a libsparse.a libselinux.a -lz -lpcre
++make_ext4fs: libext4_utils.a libsparse.a $(make_ext4fs_OBJS)
++	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) $(LIBS)
+ 
+-ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
+-		libext4_utils.a libselinux.a libsparse.a -lz -lpcre
++ext2simg: libext4_utils.a libsparse.a $(ext2simg_OBJS)
++	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) $(LIBS)
+ 
+ ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a libsparse.a -lz
++	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) $(LIBS)
+ 
+-simg2img: libsparse.a $(simg2img_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
++simg2img: libext4_utils.a libsparse.a $(simg2img_OBJS)
++	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) $(LIBS)
+ 
+-img2simg: libsparse.a $(img2simg_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
++img2simg: libext4_utils.a libsparse.a $(img2simg_OBJS)
++	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) $(LIBS)
+ 
+-simg2simg: libsparse.a $(simg2simg_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
++simg2simg: libext4_utils.a libsparse.a $(simg2simg_OBJS)
++	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) $(LIBS)
+ 
+ libext4_utils.a: $(libext4_utils_OBJS)
+ 	$(AR) rcs $@ $(libext4_utils_OBJS)
+@@ -94,11 +83,8 @@ libext4_utils.a: $(libext4_utils_OBJS)
+ libsparse.a: $(libsparse_OBJS)
+ 	$(AR) rcs $@ $(libsparse_OBJS)
+ 
+-libselinux.a: $(libselinux_OBJS)
+-	$(AR) rcs $@ $(libselinux_OBJS)
+-
+ clean:
+ 	$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
+ 		$(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
+-		$(libext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \
++		$(libext4_utils_OBJS) $(libsparse_OBJS) \
+ 		make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a
+diff --git a/debian/makefiles/fastboot.mk b/debian/makefiles/fastboot.mk
+index 2c1d481..7319b7f 100644
+--- a/debian/makefiles/fastboot.mk
++++ b/debian/makefiles/fastboot.mk
+@@ -65,12 +65,12 @@ CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+ CFLAGS += -I$(SRCDIR)/external/libselinux/include
+ CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+ 
+-LIBS += libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -lpcre
++LIBS += `pkg-config --libs libselinux libpcre zlib`
+ 
+ all: fastboot
+ 
+-fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a $(fastboot_OBJS)
+-	$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
++fastboot: libzipfile.a libext4_utils.a libsparse.a $(fastboot_OBJS)
++	$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) libzipfile.a libext4_utils.a libsparse.a $(LIBS)
+ 
+ libzipfile.a: $(libzipfile_OBJS)
+ 	$(AR) rcs $@ $(libzipfile_OBJS)
+@@ -81,9 +81,6 @@ libext4_utils.a: $(libext4_utils_OBJS)
+ libsparse.a: $(libsparse_OBJS)
+ 	$(AR) rcs $@ $(libsparse_OBJS)
+ 
+-libselinux.a: $(libselinux_OBJS)
+-	$(AR) rcs $@ $(libselinux_OBJS)
+-
+ clean:
+ 	$(RM) $(fastboot_OBJS) $(libzipfile_OBJS) $(libext4_utils_OBJS) \
+-		$(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
++		$(libsparse_OBJS) fastboot *.a
+-- 
+2.35.1
+
diff --git a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
deleted file mode 100644
index 35f6c8a3be..0000000000
--- a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
+++ /dev/null
@@ -1,264 +0,0 @@
-[PATCH] Fix adbd for non-Ubuntu systems
-
-Remove glib/dbus dependencies and partially restore services.c to be
-closer to the original source code in order to run on systems without
-sudo.
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- core/adbd/adb.c          |   1 -
- core/adbd/services.c     | 160 ++++-------------------------------------------
- debian/makefiles/adbd.mk |   4 +-
- 3 files changed, 14 insertions(+), 151 deletions(-)
-
-diff --git a/core/adbd/adb.c b/core/adbd/adb.c
-index d90e6b8..7fe6445 100644
---- a/core/adbd/adb.c
-+++ b/core/adbd/adb.c
-@@ -1165,7 +1165,6 @@ void build_local_name(char* target_str, size_t target_size, int server_port)
- 
- #if !ADB_HOST
- static int should_drop_privileges() {
--    return 1;
- #ifndef ALLOW_ADBD_ROOT
-     return 1;
- #else /* ALLOW_ADBD_ROOT */
-diff --git a/core/adbd/services.c b/core/adbd/services.c
-index 05bd0d0..5adcefe 100644
---- a/core/adbd/services.c
-+++ b/core/adbd/services.c
-@@ -20,15 +20,6 @@
- #include <string.h>
- #include <errno.h>
- #include <pwd.h>
--#include <glib.h>
--#include <gio/gio.h>
--
--#define UNITY_SERVICE "com.canonical.UnityGreeter"
--#define GREETER_OBJ "/"
--#define GREETER_INTERFACE "com.canonical.UnityGreeter"
--#define PROPERTIES_INTERFACE "org.freedesktop.DBus.Properties"
--#define ACTIVE_PROPERTY "IsActive"
--#define UNLOCK_PATH "/userdata/.adb_onlock"
- 
- #include "sysdeps.h"
- 
-@@ -268,11 +259,11 @@ static int create_service_thread(void (*func)(int, void *), void *cookie)
- }
- 
- #if !ADB_HOST
--static int create_subprocess(const char *cmd, const char *arg0, const char *arg1, const char *arg2, const char *arg3,  const char *arg4, pid_t *pid)
-+static int create_subprocess(const char *cmd, const char *arg0, const char *arg1, pid_t *pid)
- {
- #ifdef HAVE_WIN32_PROC
--    D("create_subprocess(cmd=%s, arg0=%s, arg1=%s, arg2=%s, arg3=%, arg4=%ss)\n", cmd, arg0, arg1, arg2, arg3, arg4);
--    fprintf(stderr, "error: create_subprocess not implemented on Win32 (%s %s %s %s %s %s)\n", cmd, arg0, arg1, arg2, arg3, arg4);
-+    D("create_subprocess(cmd=%s, arg0=%s, arg1=%s)\n", cmd, arg0, arg1);
-+    fprintf(stderr, "error: create_subprocess not implemented on Win32 (%s %s %s)\n", cmd, arg0, arg1);
-     return -1;
- #else /* !HAVE_WIN32_PROC */
-     char *devname;
-@@ -327,7 +318,7 @@ static int create_subprocess(const char *cmd, const char *arg0, const char *arg1
-         } else {
-            D("adb: unable to open %s\n", text);
-         }
--	execl(cmd, cmd, arg0, arg1, arg2, arg3, arg4, NULL);
-+        execl(cmd, cmd, arg0, arg1, NULL);
-         fprintf(stderr, "- exec '%s' failed: %s (%d) -\n",
-                 cmd, strerror(errno), errno);
-         exit(-1);
-@@ -342,7 +333,7 @@ static int create_subprocess(const char *cmd, const char *arg0, const char *arg1
- }
- #endif  /* !ABD_HOST */
- 
--#if ADB_HOST
-+#if ADB_HOST || ADBD_NON_ANDROID
- #define SHELL_COMMAND "/bin/sh"
- #else
- #define SHELL_COMMAND "/system/bin/sh"
-@@ -380,139 +371,16 @@ static void subproc_waiter_service(int fd, void *cookie)
-     }
- }
- 
--int is_phone_locked() {
--    GError *error = NULL;
--    GVariant *variant = NULL;
--    GDBusConnection *connection = NULL;
--
--    if (g_file_test(UNLOCK_PATH, G_FILE_TEST_EXISTS)) {
--        D("unlock path present.");
--        return 0;
--    }
--
--    // check if the environment variable is present, if not we grab it from
--    // the phablet user
--    if (g_getenv("DBUS_SESSION_BUS_ADDRESS") == NULL) {
--        D("DBUS_SESSION_BUS_ADDRESS missing.\n");
--        struct passwd *pw = getpwuid(AID_SHELL);
--        char user_id[15];
--        gchar *path = NULL;
--        gchar *contents = NULL;
--        gchar *session_path = NULL;
--
--        snprintf(user_id, sizeof user_id, "%d", pw->pw_uid);
--
--        path = g_build_filename("/run", "user", user_id, "dbus-session", NULL);
--
--        g_file_get_contents(path, &contents, NULL, &error);
--        session_path = g_strstrip(g_strsplit(contents, "DBUS_SESSION_BUS_ADDRESS=", -1)[1]);
--        D("Session bus is %s\n", session_path);
--
--        // path is not longer used
--        g_free(path);
--
--        if (error != NULL) {
--            g_clear_error(&error);
--            D("Couldn't set session bus\n");
--            return 1;
--        }
--
--        g_setenv("DBUS_SESSION_BUS_ADDRESS", session_path, TRUE);
--        g_free(contents);
--    }
--
--    // set the uid to be able to connect to the phablet user session bus
--    setuid(AID_SHELL);
--    connection =  g_dbus_connection_new_for_address_sync(g_getenv("DBUS_SESSION_BUS_ADDRESS"),
--                                                         G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT | G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
--                                                         NULL,
--                                                         NULL,
--                                                         &error);
--    if (connection == NULL) {
--        D("session bus not available: %s", error->message);
--        g_error_free (error);
--        return 1;
--    }
--
--    variant = g_dbus_connection_call_sync(connection,
--                                          UNITY_SERVICE,
--                                          GREETER_OBJ,
--                                          PROPERTIES_INTERFACE,
--                                          "Get",
--                                          g_variant_new("(ss)", GREETER_INTERFACE, ACTIVE_PROPERTY),
--                                          g_variant_type_new("(v)"),
--                                          G_DBUS_CALL_FLAGS_NONE,
--                                          -1,
--                                          NULL,
--                                          &error);
--
--    if (error != NULL) {
--        D("Could not get property: %s", error->message);
--        g_object_unref(connection);
--        g_error_free(error);
--        return 1;
--    }
--
--    if (variant == NULL) {
--        D("Failed to get property '%s': %s", "IsActive", error->message);
--        g_object_unref(connection);
--        g_error_free(error);
--        return 1;
--    }
--
--    variant = g_variant_get_variant(g_variant_get_child_value(variant, 0));
--
--    int active = 1;
--    if (!g_variant_get_boolean(variant)) {
--        active = 0;
--    }
--
--    // get back to be root and return the value
--    g_object_unref(connection);
--    g_variant_unref(variant);
--    setuid(0);
--    return active;
--}
--
- static int create_subproc_thread(const char *name)
- {
--    if (is_phone_locked() ) {
--        fprintf(stderr, "device is locked\n");
--        return -1;
--    }
--
-     stinfo *sti;
-     adb_thread_t t;
-     int ret_fd;
-     pid_t pid;
--
--    struct passwd *user = getpwuid(getuid());
--    char *shell;
--    char *shellopts = "-c";
--    char *home;
--    char *sudo = "/usr/bin/sudo";
--    char useropt[256] = "-u";
--
--    if (user->pw_name)
--        strcat(useropt, user->pw_name);
--
--    if (user && user->pw_shell) {
--        shell = user->pw_shell;
--        shellopts = "-cl";
--    } else {
--        shell = SHELL_COMMAND;
--    }
--
--    if (user->pw_dir)
--        home = user->pw_dir;
--        if(chdir(home) < 0 )
--            return 1;
--
-     if(name) {
--	ret_fd = create_subprocess(sudo, useropt, "-i", shell, shellopts, name, &pid);
-+        ret_fd = create_subprocess(SHELL_COMMAND, "-c", name, &pid);
-     } else {
--	shellopts = "-l";
--	ret_fd = create_subprocess(sudo, useropt, "-i", shell, shellopts, 0, &pid);
-+        ret_fd = create_subprocess(SHELL_COMMAND, "-", 0, &pid);
-     }
-     D("create_subprocess() ret_fd=%d pid=%d\n", ret_fd, pid);
- 
-@@ -585,17 +453,13 @@ int service_to_fd(const char *name)
-     } else if (!strncmp(name, "log:", 4)) {
-         ret = create_service_thread(log_service, get_log_file_path(name + 4));
-     } else if(!HOST && !strncmp(name, "shell:", 6)) {
--        if (!is_phone_locked() ) {
--            if(name[6]) {
--                ret = create_subproc_thread(name + 6);
--            } else {
--                ret = create_subproc_thread(0);
--            }
-+        if(name[6]) {
-+            ret = create_subproc_thread(name + 6);
-+        } else {
-+            ret = create_subproc_thread(0);
-         }
-     } else if(!strncmp(name, "sync:", 5)) {
--        if (!is_phone_locked() ) {
--            ret = create_service_thread(file_sync_service, NULL);
--        }
-+        ret = create_service_thread(file_sync_service, NULL);
-     } else if(!strncmp(name, "remount:", 8)) {
-         ret = create_service_thread(remount_service, NULL);
-     } else if(!strncmp(name, "reboot:", 7)) {
-diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
-index 49dab8c..22c1816 100644
---- a/debian/makefiles/adbd.mk
-+++ b/debian/makefiles/adbd.mk
-@@ -40,11 +40,11 @@ CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
- CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
- CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
- CPPFLAGS+= -DHAVE_TERMIO_H
--CPPFLAGS+= `pkg-config --cflags glib-2.0 gio-2.0`
-+CPPFLAGS+= -DADBD_NON_ANDROID
- CPPFLAGS+= -I$(SRCDIR)/core/adbd
- CPPFLAGS+= -I$(SRCDIR)/core/include
- 
--LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
-+LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
- 
- OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
- 
--- 
-2.5.1
-
diff --git a/package/android-tools/0002-Fix-build-failure-missing-major-minor.patch b/package/android-tools/0002-Fix-build-failure-missing-major-minor.patch
new file mode 100644
index 0000000000..1208e077f7
--- /dev/null
+++ b/package/android-tools/0002-Fix-build-failure-missing-major-minor.patch
@@ -0,0 +1,25 @@
+From 83ac616fa836d8ffd9f41ab8f3400c6c87ee58d5 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Mon, 11 Jul 2022 06:13:50 -0700
+Subject: [PATCH] Fix build failure: missing major minor
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ system/core/adb/usb_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/system/core/adb/usb_linux.c b/system/core/adb/usb_linux.c
+index f16bdd0..c8a7732 100644
+--- a/system/core/adb/usb_linux.c
++++ b/system/core/adb/usb_linux.c
+@@ -22,6 +22,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
++#include <sys/sysmacros.h>
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <errno.h>
+-- 
+2.35.1
+
diff --git a/package/android-tools/0003-Fix-build-issue-with-uclibc.patch b/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
index 95517c307b..ffecb8d095 100644
--- a/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
+++ b/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
@@ -1,28 +1,18 @@
-[PATCH] Fix build issue with uclibc
+From cb74249cf88a5bc2bab05016824e9fedfabdf7e4 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Mon, 11 Jul 2022 06:08:34 -0700
+Subject: [PATCH] Fix build issue with uclibc
 
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+Signed-off-by: Christian Stewart <christian@paral.in>
 ---
- core/adbd/adb_auth_client.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ system/core/adb/adb_auth_client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/core/adb/adb_auth_client.c b/core/adb/adb_auth_client.c
-index 0b4913e..068d837 100644
---- a/core/adb/adb_auth_client.c
-+++ b/core/adb/adb_auth_client.c
-@@ -72,7 +72,7 @@ static void read_keys(const char *file, struct listnode *list)
-         if (sep)
-             *sep = '\0';
- 
--        ret = __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-+        ret = b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-         if (ret != sizeof(key->key)) {
-             D("%s: Invalid base64 data ret=%d\n", file, ret);
-             free(key);
-diff --git a/core/adbd/adb_auth_client.c b/core/adbd/adb_auth_client.c
-index 0b4913e..068d837 100644
---- a/core/adbd/adb_auth_client.c
-+++ b/core/adbd/adb_auth_client.c
-@@ -72,7 +72,7 @@ static void read_keys(const char *file, struct listnode *list)
+diff --git a/system/core/adb/adb_auth_client.c b/system/core/adb/adb_auth_client.c
+index 55e9dca..104b413 100644
+--- a/system/core/adb/adb_auth_client.c
++++ b/system/core/adb/adb_auth_client.c
+@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct listnode *list)
          if (sep)
              *sep = '\0';
  
@@ -32,5 +22,5 @@ index 0b4913e..068d837 100644
              D("%s: Invalid base64 data ret=%d\n", file, ret);
              free(key);
 -- 
-2.6.1
+2.35.1
 
diff --git a/package/android-tools/0004-Fix-build-issue-with-musl.patch b/package/android-tools/0004-Fix-build-issue-with-musl.patch
deleted file mode 100644
index 964eb87a6d..0000000000
--- a/package/android-tools/0004-Fix-build-issue-with-musl.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-[PATCH] Fix build issue with musl
-
-arpa/nameser.h doesn't use the same macro name to avoid several
-inclusions.
-
-Finally had an issue with framebuffer_service.c since it was missing the
-TEMP_FAILURE_RETRY macro.
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- core/adbd/arpa_nameser.h              | 12 +++++++++---
- core/adbd/base64.c                    |  1 -
- core/adbd/framebuffer_service.c       |  1 +
- core/adbd/qemu_pipe.h                 |  1 -
- core/include/cutils/android_reboot.h  |  8 ++++++--
- core/include/cutils/bitops.h          | 10 ++++++----
- core/include/cutils/partition_utils.h |  8 ++++++--
- extras/ext4_utils/sha1.c              |  3 ---
- extras/ext4_utils/sha1.h              | 13 ++++++-------
- 9 files changed, 34 insertions(+), 23 deletions(-)
-
-diff --git a/core/adbd/arpa_nameser.h b/core/adbd/arpa_nameser.h
-index 438dc04..b2a28d6 100644
---- a/core/adbd/arpa_nameser.h
-+++ b/core/adbd/arpa_nameser.h
-@@ -52,6 +52,8 @@
- 
- #ifndef _ARPA_NAMESER_H_
- #define _ARPA_NAMESER_H_
-+#ifndef _ARPA_NAMESER_H
-+#define _ARPA_NAMESER_H
- 
- #define BIND_4_COMPAT
- 
-@@ -574,4 +579,5 @@ __END_DECLS
- #define  XLOG(...)   do {} while (0)
- #endif
- 
-+#endif /* !_ARPA_NAMESER_H */
- #endif /* !_ARPA_NAMESER_H_ */
-diff --git a/core/adbd/framebuffer_service.c b/core/adbd/framebuffer_service.c
-index 20c08d2..48e0241 100644
---- a/core/adbd/framebuffer_service.c
-+++ b/core/adbd/framebuffer_service.c
-@@ -26,6 +26,7 @@
- #include "fdevent.h"
- #include "adb.h"
- 
-+#include <cutils/fs.h>
- #include <linux/fb.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
--- 
-2.6.1
diff --git a/package/android-tools/0004-Remove-dependency-on-libbsd.patch b/package/android-tools/0004-Remove-dependency-on-libbsd.patch
new file mode 100644
index 0000000000..eb83084d9e
--- /dev/null
+++ b/package/android-tools/0004-Remove-dependency-on-libbsd.patch
@@ -0,0 +1,157 @@
+From 4223bdea657c2539e36084cfcc7fea554fad9080 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Mon, 11 Jul 2022 06:04:33 -0700
+Subject: [PATCH] Remove dependency on libbsd
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ .../include/arch/linux-arm/AndroidConfig.h    |  2 +-
+ .../include/arch/linux-arm64/AndroidConfig.h  |  2 +-
+ .../include/arch/linux-mips/AndroidConfig.h   |  2 +-
+ .../include/arch/linux-mips64/AndroidConfig.h |  2 +-
+ .../fix-implicit-declaration-function.patch   | 26 +------------
+ system/core/fs_mgr/fs_mgr_fstab.c             | 38 +++++++++++++++++++
+ 6 files changed, 43 insertions(+), 29 deletions(-)
+
+diff --git a/build/core/combo/include/arch/linux-arm/AndroidConfig.h b/build/core/combo/include/arch/linux-arm/AndroidConfig.h
+index c06c8bc..b55df9e 100644
+--- a/build/core/combo/include/arch/linux-arm/AndroidConfig.h
++++ b/build/core/combo/include/arch/linux-arm/AndroidConfig.h
+@@ -273,7 +273,7 @@
+ /*
+  * Define if the strlcpy() function exists on the system.
+  */
+-#define HAVE_STRLCPY 1
++#define HAVE_STRLCPY 0
+ 
+ /*
+  * Define if the open_memstream() function exists on the system.
+diff --git a/build/core/combo/include/arch/linux-arm64/AndroidConfig.h b/build/core/combo/include/arch/linux-arm64/AndroidConfig.h
+index bcbda8f..afc1d1c 100644
+--- a/build/core/combo/include/arch/linux-arm64/AndroidConfig.h
++++ b/build/core/combo/include/arch/linux-arm64/AndroidConfig.h
+@@ -275,7 +275,7 @@
+ /*
+  * Define if the strlcpy() function exists on the system.
+  */
+-#define HAVE_STRLCPY 1
++#define HAVE_STRLCPY 0
+ 
+ /*
+  * Define if the open_memstream() function exists on the system.
+diff --git a/build/core/combo/include/arch/linux-mips/AndroidConfig.h b/build/core/combo/include/arch/linux-mips/AndroidConfig.h
+index bb3dc95..a1227fe 100644
+--- a/build/core/combo/include/arch/linux-mips/AndroidConfig.h
++++ b/build/core/combo/include/arch/linux-mips/AndroidConfig.h
+@@ -290,7 +290,7 @@
+ /*
+  * Define if the strlcpy() function exists on the system.
+  */
+-#define HAVE_STRLCPY 1
++#define HAVE_STRLCPY 0
+ 
+ /*
+  * Define if the open_memstream() function exists on the system.
+diff --git a/build/core/combo/include/arch/linux-mips64/AndroidConfig.h b/build/core/combo/include/arch/linux-mips64/AndroidConfig.h
+index 7ded3ce..56e5c6d 100644
+--- a/build/core/combo/include/arch/linux-mips64/AndroidConfig.h
++++ b/build/core/combo/include/arch/linux-mips64/AndroidConfig.h
+@@ -287,7 +287,7 @@
+ /*
+  * Define if the strlcpy() function exists on the system.
+  */
+-#define HAVE_STRLCPY 1
++#define HAVE_STRLCPY 0
+ 
+ /*
+  * Define if the open_memstream() function exists on the system.
+diff --git a/debian/patches/fix-implicit-declaration-function.patch b/debian/patches/fix-implicit-declaration-function.patch
+index d6e03c0..1d6caa6 100644
+--- a/debian/patches/fix-implicit-declaration-function.patch
++++ b/debian/patches/fix-implicit-declaration-function.patch
+@@ -3,32 +3,8 @@ Author: Fathi Boudra <fabo@debian.org>
+ 
+ ---
+  system/core/adb/adb.c                |    1 +
+- system/core/fs_mgr/fs_mgr_fstab.c    |    2 +-
+- system/core/include/cutils/sockets.h |    2 +-
+- 3 files changed, 3 insertions(+), 2 deletions(-)
++ 1 files changed, 1 insertions(+), 0 deletions(-)
+ 
+---- a/system/core/fs_mgr/fs_mgr_fstab.c
+-+++ b/system/core/fs_mgr/fs_mgr_fstab.c
+-@@ -17,7 +17,7 @@
+- #include <ctype.h>
+- #include <stdio.h>
+- #include <stdlib.h>
+--#include <string.h>
+-+#include <bsd/string.h>
+- #include <sys/mount.h>
+- 
+- #include "fs_mgr_priv.h"
+---- a/system/core/include/cutils/sockets.h
+-+++ b/system/core/include/cutils/sockets.h
+-@@ -19,7 +19,7 @@
+- 
+- #include <errno.h>
+- #include <stdlib.h>
+--#include <string.h>
+-+#include <bsd/string.h>
+- #include <stdbool.h>
+- 
+- #ifdef HAVE_WINSOCK
+ --- a/system/core/adb/adb.c
+ +++ b/system/core/adb/adb.c
+ @@ -41,6 +41,7 @@
+diff --git a/system/core/fs_mgr/fs_mgr_fstab.c b/system/core/fs_mgr/fs_mgr_fstab.c
+index 9ddb464..b133db6 100644
+--- a/system/core/fs_mgr/fs_mgr_fstab.c
++++ b/system/core/fs_mgr/fs_mgr_fstab.c
+@@ -73,6 +73,44 @@ static struct flag_list fs_mgr_flags[] = {
+     { 0,             0 },
+ };
+ 
++/*
++ * Appends src to string dst of size siz (unlike strncat, siz is the
++ * full size of dst, not space left).  At most siz-1 characters
++ * will be copied.  Always NUL terminates (unless siz <= strlen(dst)).
++ * Returns strlen(src) + MIN(siz, strlen(initial dst)).
++ * If retval >= siz, truncation occurred.
++ */
++size_t
++strlcat(dst, src, siz)
++	char *dst;
++	const char *src;
++	size_t siz;
++{
++	char *d = dst;
++	const char *s = src;
++	size_t n = siz;
++	size_t dlen;
++
++	/* Find the end of dst and adjust bytes left but don't go past end */
++	while (n-- != 0 && *d != '\0')
++		d++;
++	dlen = d - dst;
++	n = siz - dlen;
++
++	if (n == 0)
++		return(dlen + strlen(s));
++	while (*s != '\0') {
++		if (n != 1) {
++			*d++ = *s;
++			n--;
++		}
++		s++;
++	}
++	*d = '\0';
++
++	return(dlen + (s - src));	/* count does not include NUL */
++}
++
+ static int parse_flags(char *flags, struct flag_list *fl,
+                        struct fs_mgr_flag_values *flag_vals,
+                        char *fs_options, int fs_options_len)
+-- 
+2.35.1
+
diff --git a/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch b/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
deleted file mode 100644
index 63ea1fb6a4..0000000000
--- a/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-makefiles: use pkgconf to get libs deps
-
-LIBS lists library dependencies without taking into account static linking
-that need ordered listing and more libraries listed since differently from
-shared linking dependency is not transparent(i.e. -lcrypto could need
--latomic etc.).
-
-Replace -lcrypto with `pkg-config --libs libcrypto` command to be sure all
-needed libraries are listed during linking.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
-diff -urpN android-tools-4.2.2+git20130218.orig/debian/makefiles/adbd.mk android-tools-4.2.2+git20130218/debian/makefiles/adbd.mk
---- android-tools-4.2.2+git20130218.orig/debian/makefiles/adbd.mk	2019-04-08 16:05:02.967710428 +0200
-+++ android-tools-4.2.2+git20130218/debian/makefiles/adbd.mk	2019-04-08 16:30:42.463084426 +0200
-@@ -44,7 +44,7 @@ CPPFLAGS+= -DADBD_NON_ANDROID
- CPPFLAGS+= -I$(SRCDIR)/core/adbd
- CPPFLAGS+= -I$(SRCDIR)/core/include
-
--LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
-+LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto` -lcrypt
-
- OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
-
-diff -urpN android-tools-4.2.2+git20130218.orig/debian/makefiles/adb.mk android-tools-4.2.2+git20130218/debian/makefiles/adb.mk
---- android-tools-4.2.2+git20130218.orig/debian/makefiles/adb.mk	2019-04-08 16:05:02.959701400 +0200
-+++ android-tools-4.2.2+git20130218/debian/makefiles/adb.mk	2019-04-08 16:31:06.529426250 +0200
-@@ -41,7 +41,7 @@ CPPFLAGS+= -DHAVE_TERMIO_H
- CPPFLAGS+= -I$(SRCDIR)/core/adb
- CPPFLAGS+= -I$(SRCDIR)/core/include
-
--LIBS+= -lc -lpthread -lz -lcrypto
-+LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto`
-
- OBJS= $(SRCS:.c=.o)
diff --git a/package/android-tools/0005-bsd-fixups.patch b/package/android-tools/0005-bsd-fixups.patch
new file mode 100644
index 0000000000..7a47984c2c
--- /dev/null
+++ b/package/android-tools/0005-bsd-fixups.patch
@@ -0,0 +1,40 @@
+From 287e1181c3b75686bc412bad12be3b491b90133e Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 14 Jul 2022 18:32:44 -0700
+Subject: [PATCH] bsd fixups
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ system/core/fs_mgr/fs_mgr_fstab.c    | 2 +-
+ system/core/include/cutils/sockets.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/system/core/fs_mgr/fs_mgr_fstab.c b/system/core/fs_mgr/fs_mgr_fstab.c
+index b133db6..68aadd4 100644
+--- a/system/core/fs_mgr/fs_mgr_fstab.c
++++ b/system/core/fs_mgr/fs_mgr_fstab.c
+@@ -17,7 +17,7 @@
+ #include <ctype.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <bsd/string.h>
++#include <string.h>
+ #include <sys/mount.h>
+ 
+ #include "fs_mgr_priv.h"
+diff --git a/system/core/include/cutils/sockets.h b/system/core/include/cutils/sockets.h
+index d3270c6..daf43ec 100644
+--- a/system/core/include/cutils/sockets.h
++++ b/system/core/include/cutils/sockets.h
+@@ -19,7 +19,7 @@
+ 
+ #include <errno.h>
+ #include <stdlib.h>
+-#include <bsd/string.h>
++#include <string.h>
+ #include <stdbool.h>
+ 
+ #ifdef HAVE_WINSOCK
+-- 
+2.35.1
+
diff --git a/package/android-tools/0006-fix-big-endian-build.patch b/package/android-tools/0006-fix-big-endian-build.patch
deleted file mode 100644
index c35fdcb8c4..0000000000
--- a/package/android-tools/0006-fix-big-endian-build.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Fix build on big endian systems
-
-The usb_linux_client.c file defines cpu_to_le16/32 by using the C
-library htole16/32 function calls. However, cpu_to_le16/32 are used
-when initializing structures, i.e in a context where a function call
-is not allowed.
-
-It works fine on little endian systems because htole16/32 are defined
-by the C library as no-ops. But on big-endian systems, they are
-actually doing something, which might involve calling a function,
-causing build failures.
-
-To solve this, we simply open-code cpu_to_le16/32 in a way that allows
-them to be used when initializing structures.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/core/adb/usb_linux_client.c
-===================================================================
---- a/core/adb/usb_linux_client.c
-+++ b/core/adb/usb_linux_client.c
-@@ -34,8 +34,15 @@
- #define MAX_PACKET_SIZE_FS	64
- #define MAX_PACKET_SIZE_HS	512
- 
--#define cpu_to_le16(x)  htole16(x)
--#define cpu_to_le32(x)  htole32(x)
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+# define cpu_to_le16(x) (x)
-+# define cpu_to_le32(x) (x)
-+#else
-+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
-+# define cpu_to_le32(x) \
-+	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
-+	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
-+#endif
- 
- struct usb_handle
- {
-Index: b/core/adbd/usb_linux_client.c
-===================================================================
---- a/core/adbd/usb_linux_client.c
-+++ b/core/adbd/usb_linux_client.c
-@@ -34,8 +34,15 @@
- #define MAX_PACKET_SIZE_FS	64
- #define MAX_PACKET_SIZE_HS	512
- 
--#define cpu_to_le16(x)  htole16(x)
--#define cpu_to_le32(x)  htole32(x)
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+# define cpu_to_le16(x) (x)
-+# define cpu_to_le32(x) (x)
-+#else
-+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
-+# define cpu_to_le32(x) \
-+	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
-+	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
-+#endif
- 
- struct usb_handle
- {
diff --git a/package/android-tools/0007-include-cdefs-h-when-needed.patch b/package/android-tools/0007-include-cdefs-h-when-needed.patch
deleted file mode 100644
index da4ee13a17..0000000000
--- a/package/android-tools/0007-include-cdefs-h-when-needed.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Include cdefs.h wherever it is needed
-
-cdefs.h is included from within a lot of glibc headers, so it almost
-invariably and automagically gets pulled in with glibc.
-
-However, this might not be the case with other C libraries. musl does
-not provide cdefs.h so it does not include it from its own headers
-(cdefs.h must be provided separately).
-
-So we must include it when we are going to use macros it provides.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- core/adbd/services.c                  |  1 +
- core/libcutils/android_reboot.c       |  1 +
- 2 files changed, 2 insertions(+), 0 deletion(-)
-
-diff --git a/core/adbd/services.c b/core/adbd/services.c
-index 20c08d2..48e0241 100644
---- a/core/adbd/services.c
-+++ b/core/adbd/services.c
-@@ -20,6 +20,7 @@
- #include <string.h>
- #include <errno.h>
- #include <pwd.h>
-+#include <sys/cdefs.h>
- 
- #include "sysdeps.h"
- 
-diff --git a/core/libcutils/android_reboot.c b/core/libcutils/android_reboot.c
-index 20c08d2..48e0241 100644
---- a/core/libcutils/android_reboot.c
-+++ b/core/libcutils/android_reboot.c
-@@ -23,6 +23,7 @@
- #include <string.h>
- #include <linux/reboot.h>
- #include <sys/syscall.h>
-+#include <sys/cdefs.h>
- 
- #include <cutils/android_reboot.h>
- 
diff --git a/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch b/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
deleted file mode 100644
index 77b457f604..0000000000
--- a/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-usb_linux.c: fix minor()/major() build failure due to glibc 2.28
-
-glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
-and therefore <sys/sysmacros.h> must be included explicitly when
-major()/minor() are used.
-
-This commit adds a patch to directly include <sys/sysmacros.h> into
-all usb_linux.c files where minor() and major() macros are used.
-
-diff -urpN host-android-tools-4.2.2+git20130218.orig/core/adb/usb_linux.c host-android-tools-4.2.2+git20130218/core/adb/usb_linux.c
---- host-android-tools-4.2.2+git20130218.orig/core/adb/usb_linux.c	2013-02-18 15:49:03.000000000 +0100
-+++ host-android-tools-4.2.2+git20130218/core/adb/usb_linux.c	2018-09-09 11:47:16.476292546 +0200
-@@ -20,6 +20,7 @@
- #include <string.h>
- 
- #include <sys/ioctl.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <dirent.h>
-diff -urpN host-android-tools-4.2.2+git20130218.orig/core/adbd/usb_linux.c host-android-tools-4.2.2+git20130218/core/adbd/usb_linux.c
---- host-android-tools-4.2.2+git20130218.orig/core/adbd/usb_linux.c	2018-09-09 02:32:57.154503866 +0200
-+++ host-android-tools-4.2.2+git20130218/core/adbd/usb_linux.c	2018-09-09 11:47:28.148353880 +0200
-@@ -20,6 +20,7 @@
- #include <string.h>
- 
- #include <sys/ioctl.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <dirent.h>
-diff -urpN host-android-tools-4.2.2+git20130218.orig/core/fastboot/usb_linux.c host-android-tools-4.2.2+git20130218/core/fastboot/usb_linux.c
---- host-android-tools-4.2.2+git20130218.orig/core/fastboot/usb_linux.c	2013-02-18 15:49:03.000000000 +0100
-+++ host-android-tools-4.2.2+git20130218/core/fastboot/usb_linux.c	2018-09-09 11:46:53.028169154 +0200
-@@ -33,6 +33,7 @@
- 
- #include <sys/ioctl.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <dirent.h>
- #include <fcntl.h>
diff --git a/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
deleted file mode 100644
index 80ea1ec1fe..0000000000
--- a/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d24abbec201975a5eb7f8589614cfb424b8c80b6 Mon Sep 17 00:00:00 2001
-From: Alex Kaplan <kaplan2539@gmail.com>
-Date: Sat, 10 Nov 2018 19:50:51 -0800
-Subject: [PATCH] Fix makefiles for out-of-tree ext4_utils build
-
-Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>
----
- debian/makefiles/ext4_utils.mk | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_utils.mk
-index cb64916..c5904bf 100644
---- a/debian/makefiles/ext4_utils.mk
-+++ b/debian/makefiles/ext4_utils.mk
-@@ -1,6 +1,7 @@
- # Makefile for ext4_utils; based on https://heiher.info/2227.html
- # Author: Dmitrijs Ledkovs <xnox@ubuntu.com>
- 
-+VPATH+=$(SRCDIR)/extras/ext4_utils
- SRCS+=make_ext4fs.c
- SRCS+=ext4fixup.c
- SRCS+=ext4_utils.c
-@@ -13,7 +14,7 @@ SRCS+=sha1.c
- SRCS+=wipe.c
- SRCS+=crc16.c
- 
--VPATH+=../../core/libsparse
-+VPATH+=$(SRCDIR)/core/libsparse
- SRCS+= backed_block.c
- SRCS+= sparse_crc32.c
- SRCS+= sparse.c
-@@ -31,10 +32,9 @@ SRCS+=img2simg.c
- SRCS+=simg2img.c
- SRCS+=simg2simg.c
- 
--CPPFLAGS+= -I.
--CPPFLAGS+= -I/usr/include
--CPPFLAGS+= -I../../core/include
--CPPFLAGS+= -I../../core/libsparse/include/
-+CPPFLAGS+= -I$(SRCDIR)
-+CPPFLAGS+= -I$(SRCDIR)/core/include
-+CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
- 
- LIBS+= -lz -lselinux
- 
--- 
-2.7.4
-
diff --git a/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch b/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
deleted file mode 100644
index 2de338368f..0000000000
--- a/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From bb3da0e32be4f2260940edf3ee0f88103dfd0dcc Mon Sep 17 00:00:00 2001
-From: Eneas U de Queiroz <cote2004-github@yahoo.com>
-Date: Tue, 5 Feb 2019 01:12:19 +0200
-Subject: [PATCH] adb: added patch for openssl 1.1.0 compatibility
-
-Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
-
-[Vadim: took only adb related part from
-https://github.com/lede-project/source/commit/f63f20fb93c7e67775cb01d97fc88b5b29452b81]
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- core/adb/adb_auth_host.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/core/adb/adb_auth_host.c b/core/adb/adb_auth_host.c
-index 9039d42..debd2ef 100644
---- a/core/adb/adb_auth_host.c
-+++ b/core/adb/adb_auth_host.c
-@@ -79,7 +79,13 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
-     }
- 
-     BN_set_bit(r32, 32);
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    const BIGNUM *rsa_n, *rsa_e;
-+    RSA_get0_key(rsa, &rsa_n, &rsa_e, NULL);
-+    BN_copy(n, rsa_n);
-+#else
-     BN_copy(n, rsa->n);
-+#endif
-     BN_set_bit(r, RSANUMWORDS * 32);
-     BN_mod_sqr(rr, r, n, ctx);
-     BN_div(NULL, rem, n, r32, ctx);
-@@ -93,7 +99,11 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
-         BN_div(n, rem, n, r32, ctx);
-         pkey->n[i] = BN_get_word(rem);
-     }
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    pkey->exponent = BN_get_word(rsa_e);
-+#else
-     pkey->exponent = BN_get_word(rsa->e);
-+#endif
- 
- out:
-     BN_free(n0inv);
--- 
-2.14.1
-
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index bc76d545c1..4a5ec8ab98 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -5,11 +5,18 @@ config BR2_PACKAGE_ANDROID_TOOLS
 	# and adb/adbd can't be built on noMMU systems, and fastboot
 	# has some complicated dependencies, we simply make the whole
 	# package not available on noMMU platforms.
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
+	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
 	      !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
 	      !BR2_PACKAGE_ANDROID_TOOLS_ADB
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
 	help
 	  This package contains the fastboot and adb utilities, that
 	  can be used to interact with target devices using of these
@@ -36,30 +43,18 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 
 config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
-	depends on !BR2_STATIC_LIBS # libselinux
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the fastboot utility for
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
-comment "fastboot needs a toolchain w/ threads, dynamic library, gcc >= 5"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
 comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 	depends on !BR2_arc
 	depends on !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
-	depends on BR2_USE_MMU # uses fork()
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the adb utility for the
 	  target, which can be used to interact with other target
@@ -67,9 +62,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	bool "adbd"
-	depends on BR2_USE_MMU # uses fork()
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the adbd utility for the
 	  target, which can be used to interact with a host machine
@@ -77,6 +69,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 
 endif
 
-comment "android-tools needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "android-tools needs a toolchain w/ threads, dynamic library, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 898ddb2199..c3be568627 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS
 	bool "host android-tools"
 	select BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB if \
 		!BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
+	select BR2_PACKAGE_HOST_PKGCONF
 	help
 	  This package contains the fastboot and adb utilities, that
 	  can be used to interact with target devices using of these
diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
index 27602fb2f7..e087b2dd79 100644
--- a/package/android-tools/android-tools.hash
+++ b/package/android-tools/android-tools.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256	9bfba987e1351b12aa983787b9ae4424ab752e9e646d8e93771538dc1e5d932f  android-tools_4.2.2+git20130218.orig.tar.xz
-sha256	73c3078de3e44d8a3cadf7a360863c63155d9d558c2f0933cf38ad901a3f5998  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
+sha256  fbd859d0457a414dc82244745fa110a5d4cf998a4a8c95f835477a89fca61ccc  android-tools_5.1.1.r38.orig.tar.xz
+sha256  ac45a1ed9003bf23a2fddde7b48efdb46fca910c1228f3f3c265de25b9305aa7  android-tools_5.1.1.r38-1.1.debian.tar.xz
 sha256  170c5939bf8c8eed1db8f66f2d6155e8c1a3e799e390b55e7aad253195b1ebf5  debian/copyright
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 3d5c76a322..a558141f7a 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -5,14 +5,39 @@
 ################################################################################
 
 ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
-ANDROID_TOOLS_VERSION = 4.2.2+git20130218
+ANDROID_TOOLS_VERSION = 5.1.1.r38
 ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
-ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
+ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-1.1.debian.tar.xz
 HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
-ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
-HOST_ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
+ANDROID_TOOLS_DEPENDENCIES = host-pkgconf libcap libselinux openssl pcre zlib
+HOST_ANDROID_TOOLS_DEPENDENCIES = host-openssl host-pkgconf host-zlib
+
+# Target android_arch selection
+ifeq ($(BR2_arm),y)
+ifeq ($(BR2_ARCH_IS_64),y)
+ANDROID_TOOLS_ANDROID_ARCH = arm64
+else
+ANDROID_TOOLS_ANDROID_ARCH = arm
+endif
+else ifeq ($(BR2_mips),y)
+ANDROID_TOOLS_ANDROID_ARCH = mips
+else ifeq ($(BR2_mips64),y)
+ANDROID_TOOLS_ANDROID_ARCH = mips64
+else
+ANDROID_TOOLS_ANDROID_ARCH = x86
+endif
+
+ANDROID_TOOLS_TARGET_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	android_arch=linux-$(ANDROID_TOOLS_ANDROID_ARCH)
+
+# Host android_arch: use generic x86 AndroidConfig.h
+# The AndroidConfig.h not contain any arch-specific code
+ANDROID_TOOLS_HOST_MAKE_ENV = \
+	$(HOST_MAKE_ENV) \
+	android_arch=linux-x86
 
 # Extract the Debian tarball inside the sources
 define ANDROID_TOOLS_DEBIAN_EXTRACT
@@ -35,13 +60,12 @@ ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
 HOST_ANDROID_TOOLS_BUILD_TARGETS += fastboot
 HOST_ANDROID_TOOLS_INSTALL_TARGETS += build-fastboot/fastboot
-HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-libselinux
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
 HOST_ANDROID_TOOLS_BUILD_TARGETS += adb
 HOST_ANDROID_TOOLS_INSTALL_TARGETS += build-adb/adb
-HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS),y)
@@ -53,17 +77,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT),y)
 ANDROID_TOOLS_TARGETS += fastboot
-ANDROID_TOOLS_DEPENDENCIES += zlib libselinux
 endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADB),y)
 ANDROID_TOOLS_TARGETS += adb
-ANDROID_TOOLS_DEPENDENCIES += zlib openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
 ANDROID_TOOLS_TARGETS += adbd
-ANDROID_TOOLS_DEPENDENCIES += zlib openssl
 endif
 
 # Build each tool in its own directory not to share object files
@@ -71,15 +92,15 @@ endif
 define HOST_ANDROID_TOOLS_BUILD_CMDS
 	$(foreach t,$(HOST_ANDROID_TOOLS_BUILD_TARGETS),\
 		mkdir -p $(@D)/build-$(t) && \
-		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
-			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
+		$(ANDROID_TOOLS_HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+			SRCDIR=$(@D) -C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
 endef
 
 define ANDROID_TOOLS_BUILD_CMDS
 	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
 		mkdir -p $(@D)/build-$(t) && \
-		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
-			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
+		$(ANDROID_TOOLS_TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+			SRCDIR=$(@D) -C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
 endef
 
 define HOST_ANDROID_TOOLS_INSTALL_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
