Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1749CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:03:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A0B60F58
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82A0B60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEE9607D3;
	Tue, 14 Sep 2021 13:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUs4LMNLeVV9; Tue, 14 Sep 2021 13:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFED60AE4;
	Tue, 14 Sep 2021 13:03:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA7BD1BF2F6
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D95CC40328
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6CHdW8a-xVe for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:01:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41CCE40326
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From;
 bh=zTHT7h/Z0qe98e0uWhAjPrrj4sQc5c9iz1RvNwMR0Cc=; 
 b=OKswnbPIS+dQuZpcjlzbaN3NN3N4fG0VfGXoRSGCk0U0zaN3V97ITG4Pd+qsjt3k2VnhYzmN6OasDn0dPdhzmcTKIEalJiCU9ReuJIkK3y3lizkoc2cd86iAzcl2yOI+Q02M44z1T6x8wB7TgCibdZ5gO82jcJFckFeh819JIWsjMiuMDG2PBbPTwYGvSMSd9TXXU/6Nk738HVvNVTvbXb5PN3KTOQc2vum5U4KzmilXvuG7UhTUaeOc/o+sX4mYgau8qbj3wxCen6Rpz9rFT25iD1i6po5B+2eESpo6GbNdJceelfF8aMak/Fb7/MJKKJ7Ey8obA2TQnS5f0UMvsw==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQ84H-0006g3-5t
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 15:01:45 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 078e91ce
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:01:33 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 16:01:33 +0300
Message-Id: <20210914130133.2405250-1-aperez@igalia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912092128.2286771-1-aperez@igalia.com>
References: <20210912092128.2286771-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/seatd: bump to version 0.6.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update seatd to version 0.6.1, which makes the patches unnecessary and
fixes a number of bugs. Some Meson build options have been renamed, so
the build recipe is updated accordingly, too.

Release notes: https://git.sr.ht/~kennylevinsen/seatd/refs/0.6.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Changed version 0.6.0 to 0.6.1
---
 ...pport-building-builtin-without-seatd.patch |  37 ---
 package/seatd/0002-Add-no-op-session.patch    | 223 ------------------
 ...003-meson.build-fix-build-with-gcc-7.patch |  48 ----
 package/seatd/seatd.hash                      |   2 +-
 package/seatd/seatd.mk                        |  14 +-
 5 files changed, 8 insertions(+), 316 deletions(-)
 delete mode 100644 package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
 delete mode 100644 package/seatd/0002-Add-no-op-session.patch
 delete mode 100644 package/seatd/0003-meson.build-fix-build-with-gcc-7.patch

diff --git a/package/seatd/0001-meson-Support-building-builtin-without-seatd.patch b/package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
deleted file mode 100644
index fcaa355dc4..0000000000
--- a/package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 11bf7d5d11424749d549239540e5db06b8754bb5 Mon Sep 17 00:00:00 2001
-From: Kenny Levinsen <kl@kl.wtf>
-Date: Sun, 25 Apr 2021 20:16:19 +0200
-Subject: [PATCH] meson: Support building builtin without seatd
-
-The builtin backend relies on the seatd backend implementation. When
-builtin was enabled without seatd, compilation would fail due to the
-implementation not being included.
-
-Include the implementation if either seatd or builtin is enabled.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream-Status: backport [with adaptations]
----
- meson.build | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index ff56845..8cb4fc6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -105,8 +105,11 @@ server_files = [
- 	'seatd/server.c',
- ]
- 
--if get_option('seatd').enabled()
-+if get_option('seatd').enabled() or get_option('builtin').enabled()
- 	private_files += 'libseat/backend/seatd.c'
-+endif
-+
-+if get_option('seatd').enabled()
- 	add_project_arguments('-DSEATD_ENABLED=1', language: 'c')
- endif
- 
--- 
-2.31.1
-
diff --git a/package/seatd/0002-Add-no-op-session.patch b/package/seatd/0002-Add-no-op-session.patch
deleted file mode 100644
index 44798126d9..0000000000
--- a/package/seatd/0002-Add-no-op-session.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From 9a7824b7c3ff5c957632671e91454fc84fbcdda8 Mon Sep 17 00:00:00 2001
-From: Simon Ser <contact@emersion.fr>
-Date: Fri, 26 Mar 2021 10:05:12 +0100
-Subject: [PATCH] Add no-op session
-
-This is useful for headless testing, for instance with VKMS:
-
-    modprobe vkms
-    export WLR_DRM_DEVICES=/dev/dri/card1
-    export WLR_BACKENDS=drm
-    export LIBSEAT_BACKEND=noop
-    sway
-
-We don't need any of the VT handling in this case.
-
-[Retrieved from:
-https://github.com/kennylevinsen/seatd/commit/9a7824b7c3ff5c957632671e91454fc84fbcdda8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/libseat.h      |   2 +
- libseat/backend/noop.c | 135 +++++++++++++++++++++++++++++++++++++++++
- libseat/libseat.c      |   5 ++
- meson.build            |   2 +-
- 4 files changed, 143 insertions(+), 1 deletion(-)
- create mode 100644 libseat/backend/noop.c
-
-diff --git a/include/libseat.h b/include/libseat.h
-index 5375cd6..82098ea 100644
---- a/include/libseat.h
-+++ b/include/libseat.h
-@@ -1,6 +1,8 @@
- #ifndef _LIBSEAT_H
- #define _LIBSEAT_H
- 
-+#include <stdarg.h>
-+
- /*
-  * An opaque struct containing an opened seat, created by libseat_open_seat and
-  * destroyed by libseat_close_seat.
-diff --git a/libseat/backend/noop.c b/libseat/backend/noop.c
-new file mode 100644
-index 0000000..71d0224
---- /dev/null
-+++ b/libseat/backend/noop.c
-@@ -0,0 +1,135 @@
-+#include <assert.h>
-+#include <errno.h>
-+#include <fcntl.h>
-+#include <poll.h>
-+#include <stdbool.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <sys/socket.h>
-+#include <unistd.h>
-+
-+#include "backend.h"
-+#include "log.h"
-+
-+struct backend_noop {
-+	struct libseat base;
-+	struct libseat_seat_listener *seat_listener;
-+	void *seat_listener_data;
-+
-+	bool initial_setup;
-+	int sockets[2];
-+};
-+
-+extern const struct seat_impl noop_impl;
-+
-+static struct backend_noop *backend_noop_from_libseat_backend(struct libseat *base) {
-+	assert(base->impl == &noop_impl);
-+	return (struct backend_noop *)base;
-+}
-+
-+static void destroy(struct backend_noop *backend) {
-+	close(backend->sockets[0]);
-+	close(backend->sockets[1]);
-+	free(backend);
-+}
-+
-+static int close_seat(struct libseat *base) {
-+	struct backend_noop *backend = backend_noop_from_libseat_backend(base);
-+	destroy(backend);
-+	return 0;
-+}
-+
-+static int disable_seat(struct libseat *base) {
-+	(void)base;
-+	return 0;
-+}
-+
-+static const char *seat_name(struct libseat *base) {
-+	(void)base;
-+	return "noop";
-+}
-+
-+static int open_device(struct libseat *base, const char *path, int *fd) {
-+	(void)base;
-+
-+	int tmpfd = open(path, O_RDWR | O_CLOEXEC);
-+	if (tmpfd < 0) {
-+		log_errorf("Failed to open device: %s", strerror(errno));
-+		return -1;
-+	}
-+
-+	*fd = tmpfd;
-+	return tmpfd;
-+}
-+
-+static int close_device(struct libseat *base, int device_id) {
-+	(void)base;
-+	(void)device_id;
-+	return 0;
-+}
-+
-+static int switch_session(struct libseat *base, int s) {
-+	(void)base;
-+	(void)s;
-+	log_errorf("No-op backend cannot switch to session %d", s);
-+	return -1;
-+}
-+
-+static int get_fd(struct libseat *base) {
-+	struct backend_noop *backend = backend_noop_from_libseat_backend(base);
-+	return backend->sockets[0];
-+}
-+
-+static int dispatch_background(struct libseat *base, int timeout) {
-+	struct backend_noop *backend = backend_noop_from_libseat_backend(base);
-+
-+	if (backend->initial_setup) {
-+		backend->initial_setup = false;
-+		backend->seat_listener->enable_seat(&backend->base, backend->seat_listener_data);
-+	}
-+
-+	struct pollfd fd = {
-+		.fd = backend->sockets[0],
-+		.events = POLLIN,
-+	};
-+	if (poll(&fd, 1, timeout) < 0) {
-+		if (errno == EAGAIN || errno == EINTR) {
-+			return 0;
-+		} else {
-+			return -1;
-+		}
-+	}
-+
-+	return 0;
-+}
-+
-+static struct libseat *noop_open_seat(struct libseat_seat_listener *listener, void *data) {
-+	struct backend_noop *backend = calloc(1, sizeof(struct backend_noop));
-+	if (backend == NULL) {
-+		return NULL;
-+	}
-+
-+	if (socketpair(AF_UNIX, SOCK_STREAM, 0, backend->sockets) != 0) {
-+		log_errorf("socketpair() failed: %s", strerror(errno));
-+		free(backend);
-+		return NULL;
-+	}
-+
-+	backend->seat_listener = listener;
-+	backend->seat_listener_data = data;
-+	backend->base.impl = &noop_impl;
-+
-+	return &backend->base;
-+}
-+
-+const struct seat_impl noop_impl = {
-+	.open_seat = noop_open_seat,
-+	.disable_seat = disable_seat,
-+	.close_seat = close_seat,
-+	.seat_name = seat_name,
-+	.open_device = open_device,
-+	.close_device = close_device,
-+	.switch_session = switch_session,
-+	.get_fd = get_fd,
-+	.dispatch = dispatch_background,
-+};
-diff --git a/libseat/libseat.c b/libseat/libseat.c
-index b1e8bb2..a7e079c 100644
---- a/libseat/libseat.c
-+++ b/libseat/libseat.c
-@@ -13,6 +13,7 @@
- extern const struct seat_impl seatd_impl;
- extern const struct seat_impl logind_impl;
- extern const struct seat_impl builtin_impl;
-+extern const struct seat_impl noop_impl;
- 
- static const struct named_backend impls[] = {
- #ifdef SEATD_ENABLED
-@@ -24,6 +25,7 @@ static const struct named_backend impls[] = {
- #ifdef BUILTIN_ENABLED
- 	{"builtin", &builtin_impl},
- #endif
-+	{"noop", &noop_impl},
- 	{NULL, NULL},
- };
- 
-@@ -62,6 +64,9 @@ struct libseat *libseat_open_seat(struct libseat_seat_listener *listener, void *
- 
- 	struct libseat *backend = NULL;
- 	for (const struct named_backend *iter = impls; iter->backend != NULL; iter++) {
-+		if (iter->backend == &noop_impl) {
-+			continue;
-+		}
- 		backend = iter->backend->open_seat(listener, data);
- 		if (backend != NULL) {
- 			log_infof("Seat opened with backend '%s'", iter->name);
-diff --git a/meson.build b/meson.build
-index f41b621..c3800ae 100644
---- a/meson.build
-+++ b/meson.build
-@@ -145,7 +145,7 @@ symbols_file = 'libseat/libseat.syms'
- symbols_flag = '-Wl,--version-script,@0@/@1@'.format(meson.current_source_dir(), symbols_file)
- lib = library(
- 	'seat', # This results in the library being called 'libseat'
--	[ 'libseat/libseat.c' ],
-+	[ 'libseat/libseat.c', 'libseat/backend/noop.c' ],
- 	soversion: libseat_soversion,
- 	link_with: private_lib,
- 	include_directories: [include_directories('.', 'include')],
diff --git a/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch b/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch
deleted file mode 100644
index 0e9f437cc3..0000000000
--- a/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0b32c33978fbe8772df6d185c9b9d646c442dc5d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Aug 2021 19:00:35 +0200
-Subject: [PATCH] meson.build: fix build with gcc < 7
-
-Test if -Wimplicit-fallthrough is available before using it as it has
-been added only since gcc 7.1 and
-https://github.com/gcc-mirror/gcc/commit/81fea426da8c4687bb32e6894dc26f00ae211822
-and so it will raise the following build failure with gcc < 7:
-
-arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'
-
-Fixes:
- - http://autobuild.buildroot.org/results/0ee6816a7cceebdafd07612677a594bdf68e0790
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kennylevinsen/seatd/pull/1]
----
- meson.build | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1131b4b..c366a59 100644
---- a/meson.build
-+++ b/meson.build
-@@ -31,7 +31,6 @@ add_project_arguments(
- 		'-Wold-style-definition', # nop
- 		'-Wpointer-arith',
- 		'-Wstrict-prototypes',
--		'-Wimplicit-fallthrough',
- 		'-Wmissing-prototypes',
- 		'-Wno-unknown-warning-option',
- 		'-Wno-unused-command-line-argument',
-@@ -45,6 +44,11 @@ add_project_arguments(
- 	language: 'c',
- )
- 
-+cc = meson.get_compiler('c')
-+if cc.has_argument('-Wimplicit-fallthrough')
-+	add_project_arguments('-Wimplicit-fallthrough' , language : 'c')
-+endif
-+
- if ['debugoptimized', 'release', 'minsize'].contains(get_option('buildtype'))
- 	add_project_arguments('-D_FORTIFY_SOURCE=2', language: 'c')
- endif
--- 
-2.30.2
-
diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 342079e958..2ae0344382 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  274b56324fc81ca6002bc1cdd387668dee34a6e1063e5f3896805c3770948988  0.5.0.tar.gz
+sha256  f8f8d2d2a6c5f08714b2a784595e781a257df15d6086ec4e73701217ee5ec9e8  0.6.1.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index bf582f0d1d..100e134124 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.5.0
+SEATD_VERSION = 0.6.1
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
@@ -17,20 +17,20 @@ SEATD_CONF_OPTS += \
 	-Dwerror=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
-SEATD_CONF_OPTS += -Dlogind=enabled
+SEATD_CONF_OPTS += -Dlibseat-logind=enabled
 SEATD_DEPENDENCIES += systemd
 else
-SEATD_CONF_OPTS += -Dlogind=disabled
+SEATD_CONF_OPTS += -Dlibseat-logind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SEATD_BUILTIN),y)
-SEATD_CONF_OPTS += -Dbuiltin=enabled
+SEATD_CONF_OPTS += -Dlibseat-builtin=enabled
 else
-SEATD_CONF_OPTS += -Dbuiltin=disabled
+SEATD_CONF_OPTS += -Dlibseat-builtin=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SEATD_DAEMON),y)
-SEATD_CONF_OPTS += -Dseatd=enabled -Dserver=enabled
+SEATD_CONF_OPTS += -Dlibseat-seatd=enabled -Dserver=enabled
 
 define SEATD_USERS
 	- - video -1 - - - - -
@@ -47,7 +47,7 @@ define SEATD_INSTALL_INIT_SYSTEMD
 endef
 
 else
-SEATD_CONF_OPTS += -Dseatd=disabled -Dserver=disabled
+SEATD_CONF_OPTS += -Dlibseat-seatd=disabled -Dserver=disabled
 endif
 
 $(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
