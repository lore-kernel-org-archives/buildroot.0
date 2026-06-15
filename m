Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DADCD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC1968460A;
	Mon, 15 Jun 2026 21:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Id94q8dxysN; Mon, 15 Jun 2026 21:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CCFD8460B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781558181;
	bh=6PP492TyzMZSMlnRByq0P7iVLOa9n8Aaw/QMZLGiVHc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dXwgtujd5L7sd1ApF/kAULXYDwFUzi/z65Pf1dFnCnMTFxU1ifxvsNwkf8ksGeRDm
	 sedqRvxdFVqzXSoQysdhKRk3IHYBr1hcbr9ov+SznuEnDPeZ83jgtJUrYGvTWDc+n6
	 rwZ12pT+h8LfsgpRVaUOokUe61NzGT60T6iVhv5ADHwN5s42zgZwiXZ6wzkL8QEuWM
	 vxh5tR+SSC0Ni9PEUV4cfGaWzVNr0RssQb6mRTVNX3W+zJwidgvjImu6upIly9fNME
	 LmQ+gkEP1D9LMvb1bnrjAo0K93TIIrILn4fch8BYhqqdUdmtWyVtWm/BDaNZ4wl6OI
	 2Qun18yHoPBUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CCFD8460B;
	Mon, 15 Jun 2026 21:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C809A2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC1841B3E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ICSl0oKjjFW for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3DA941B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3DA941B3C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3DA941B3C
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:16:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b12b.dip0.t-ipconnect.de [84.161.177.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13E7DA4C0E3F
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 23:16:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55018)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZEfB-000000001YO-05ZE
 for buildroot@buildroot.org; Mon, 15 Jun 2026 21:16:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 23:16:07 +0200
Message-ID: <20260615211608.372629-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781558174;
 bh=0xJa50cHiBl6bc2t6VXTi0xaV4TPXyKbjg4TAGgtEqo=;
 h=From:To:Subject:Date:From;
 b=cUmSFIJsN71Dxykly+bGJ9cjZX72Xp1vjMODJPaftxFRP79Ts1GhBRerfxxmtsUKm
 vGJWS7/2e0kb8wb6qaNIRaaT5fCRurJIEaIIR9s4XWEwof0pVhiThrzODEUBXjRUlI
 DqIA3C5Cm1Z89NE6tLh/gWrj+MYMdkOYOb/BE4gAgT1i4upKjh7u4jMZEkq11G/alh
 yXaYBgMxbBVbLdIaKQbesAUWn0wiqe6IoMX/Qwpk0fGHG2YzDTOA9b7XTFaVNHfWAV
 E+BX5ijUBiUcy2mbm0oozpOoac7dl8qp+bq1Iozt/UKoVUB3jJH1epaXK1WrjqWHnq
 rqqX/Z3GIg1cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cUmSFIJs
Subject: [Buildroot] [PATCH 1/2] package/libudev-zero: bump version to 1.0.4
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

https://github.com/illiliti/libudev-zero/releases/tag/1.0.4

Removed patch which is included in this release.

Added buildroot-specific PREFIX to _BUILD_CMDS to override default
'/usr/local' in upstream Makefile to be compatible with the install
location of usb.ids provided by the hwdata package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/787f089f803e70db0e0a91dd6cb4ed5f319cb280

 ...01-Avoidable-OOM-on-small-systems-62.patch | 176 ------------------
 package/libudev-zero/libudev-zero.hash        |   2 +-
 package/libudev-zero/libudev-zero.mk          |   5 +-
 3 files changed, 4 insertions(+), 179 deletions(-)
 delete mode 100644 package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch

diff --git a/package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch b/package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch
deleted file mode 100644
index 275581becf..0000000000
--- a/package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From 5eca08d71d51074bfe7b14fcf7d89318f4f6ff47 Mon Sep 17 00:00:00 2001
-From: liamHowatt <30486941+liamHowatt@users.noreply.github.com>
-Date: Tue, 5 Dec 2023 04:15:26 -0500
-Subject: [PATCH] Avoidable OOM on small systems (#62)
-
-* bandaid fix OOM
-
-* refactor fix OOM
-
-* Makefile: remove no longer needed -pthread option
-
-* libudev.pc.in: remove threads requirement
-
----------
-
-Co-authored-by: illiliti <illiliti@protonmail.com>
-
-Upstream: https://github.com/illiliti/libudev-zero/commit/5eca08d71d51074bfe7b14fcf7d89318f4f6ff47
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Makefile         |  2 +-
- libudev.pc.in    |  1 -
- udev_enumerate.c | 65 +++++++++++-------------------------------------
- 3 files changed, 15 insertions(+), 53 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4e970b8..1fc5a1f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,7 +5,7 @@ PREFIX = /usr/local
- LIBDIR = ${PREFIX}/lib
- INCLUDEDIR = ${PREFIX}/include
- PKGCONFIGDIR = ${LIBDIR}/pkgconfig
--XCFLAGS = ${CPPFLAGS} ${CFLAGS} -std=c99 -fPIC -pthread -D_XOPEN_SOURCE=700 \
-+XCFLAGS = ${CPPFLAGS} ${CFLAGS} -std=c99 -fPIC -D_XOPEN_SOURCE=700 \
- 		  -Wall -Wextra -Wpedantic -Wmissing-prototypes -Wstrict-prototypes \
- 		  -Wno-unused-parameter
- XLDFLAGS = ${LDFLAGS} -shared -Wl,-soname,libudev.so.1
-diff --git a/libudev.pc.in b/libudev.pc.in
-index 7e29d8c..2d3f0b0 100644
---- a/libudev.pc.in
-+++ b/libudev.pc.in
-@@ -9,5 +9,4 @@ Description: Daemonless replacement for libudev
- Version: @VERSION@
- URL: https://github.com/illiliti/libudev-zero
- Libs: -L${libdir} -ludev
--Libs.private: -pthread
- Cflags: -I${includedir}
-diff --git a/udev_enumerate.c b/udev_enumerate.c
-index c553269..6fd49c0 100644
---- a/udev_enumerate.c
-+++ b/udev_enumerate.c
-@@ -21,7 +21,6 @@
- #include <string.h>
- #include <limits.h>
- #include <fnmatch.h>
--#include <pthread.h>
- 
- #include "udev.h"
- #include "udev_list.h"
-@@ -38,13 +37,6 @@ struct udev_enumerate {
-     int refcount;
- };
- 
--struct udev_enumerate_thread {
--    struct udev_enumerate *udev_enumerate;
--    pthread_mutex_t *mutex;
--    char path[PATH_MAX];
--    pthread_t thread;
--};
--
- int udev_enumerate_add_match_subsystem(struct udev_enumerate *udev_enumerate, const char *subsystem)
- {
-     return udev_enumerate ? !!udev_list_entry_add(&udev_enumerate->subsystem_match, subsystem, NULL, 0) - 1 : -1;
-@@ -231,31 +223,27 @@ static int filter_sysattr(struct udev_enumerate *udev_enumerate, struct udev_dev
-     return 1;
- }
- 
--static void *add_device(void *ptr)
-+static void add_device(struct udev_enumerate *udev_enumerate, const char *path)
- {
--    struct udev_enumerate_thread *thread = ptr;
-     struct udev_device *udev_device;
- 
--    udev_device = udev_device_new_from_syspath(thread->udev_enumerate->udev, thread->path);
-+    udev_device = udev_device_new_from_syspath(udev_enumerate->udev, path);
- 
-     if (!udev_device) {
--        return NULL;
-+        return;
-     }
- 
--    if (!filter_subsystem(thread->udev_enumerate, udev_device) ||
--        !filter_sysname(thread->udev_enumerate, udev_device) ||
--        !filter_property(thread->udev_enumerate, udev_device) ||
--        !filter_sysattr(thread->udev_enumerate, udev_device)) {
-+    if (!filter_subsystem(udev_enumerate, udev_device) ||
-+        !filter_sysname(udev_enumerate, udev_device) ||
-+        !filter_property(udev_enumerate, udev_device) ||
-+        !filter_sysattr(udev_enumerate, udev_device)) {
-         udev_device_unref(udev_device);
--        return NULL;
-+        return;
-     }
- 
--    pthread_mutex_lock(thread->mutex);
--    udev_list_entry_add(&thread->udev_enumerate->devices, udev_device_get_syspath(udev_device), NULL, 0);
--    pthread_mutex_unlock(thread->mutex);
-+    udev_list_entry_add(&udev_enumerate->devices, udev_device_get_syspath(udev_device), NULL, 0);
- 
-     udev_device_unref(udev_device);
--    return NULL;
- }
- 
- static int filter_dot(const struct dirent *de)
-@@ -265,9 +253,7 @@ static int filter_dot(const struct dirent *de)
- 
- static int scan_devices(struct udev_enumerate *udev_enumerate, const char *path)
- {
--    struct udev_enumerate_thread *thread;
--    pthread_mutex_t mutex;
--    int i, cnt, ret = 1;
-+    int i, cnt;
-     struct dirent **de;
- 
-     cnt = scandir(path, &de, filter_dot, NULL);
-@@ -276,41 +262,18 @@ static int scan_devices(struct udev_enumerate *udev_enumerate, const char *path)
-         return 0;
-     }
- 
--    thread = calloc(cnt, sizeof(*thread));
--
--    if (!thread) {
--        ret = 0;
--        goto free_de;
--    }
--
--    pthread_mutex_init(&mutex, NULL);
--
-     for (i = 0; i < cnt; i++) {
--        thread[i].mutex = &mutex;
--        thread[i].udev_enumerate = udev_enumerate;
--
--        snprintf(thread[i].path, sizeof(thread[i].path), "%s/%s", path, de[i]->d_name);
--
--        if (pthread_create(&thread[i].thread, NULL, add_device, &thread[i]) != 0) {
--            ret = 0;
--            break;
--        }
-+        char device_path[PATH_MAX];
-+        snprintf(device_path, sizeof(device_path), "%s/%s", path, de[i]->d_name);
-+        add_device(udev_enumerate, device_path);
-     }
- 
--    for (i = 0; i < cnt; i++) {
--        pthread_join(thread[i].thread, NULL);
--    }
--
--    free(thread);
--    pthread_mutex_destroy(&mutex);
--
--free_de:
-     for (i = 0; i < cnt; i++) {
-         free(de[i]);
-     }
- 
-     free(de);
--    return ret;
-+    return 1;
- }
- 
- int udev_enumerate_scan_devices(struct udev_enumerate *udev_enumerate)
--- 
-2.47.3
-
diff --git a/package/libudev-zero/libudev-zero.hash b/package/libudev-zero/libudev-zero.hash
index 4d8e19148a..fbff8e65e3 100644
--- a/package/libudev-zero/libudev-zero.hash
+++ b/package/libudev-zero/libudev-zero.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0bd89b657d62d019598e6c7ed726ff8fed80e8ba092a83b484d66afb80b77da5  libudev-zero-1.0.3.tar.gz
+sha256  10148cfd6047d387bf71eca72cd19c177084224d96434a118d8def6e0a3d6316  libudev-zero-1.0.4.tar.gz
 sha256  9169cc15bda9e4597784ea29530d6754af6fb00adce5907bf0a794c575591d3f  LICENSE
diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
index 5361a81b0a..ba41fe09f3 100644
--- a/package/libudev-zero/libudev-zero.mk
+++ b/package/libudev-zero/libudev-zero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUDEV_ZERO_VERSION = 1.0.3
+LIBUDEV_ZERO_VERSION = 1.0.4
 LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
 LIBUDEV_ZERO_LICENSE = ISC
 LIBUDEV_ZERO_LICENSE_FILES = LICENSE
@@ -12,7 +12,8 @@ LIBUDEV_ZERO_INSTALL_STAGING = YES
 LIBUDEV_ZERO_PROVIDES = libudev
 
 define LIBUDEV_ZERO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX=/usr
 endef
 
 define LIBUDEV_ZERO_INSTALL_STAGING_CMDS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
