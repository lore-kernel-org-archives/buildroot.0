Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CBCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DDD60FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9DDD60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B46BE60A35;
	Tue,  3 Aug 2021 23:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAEcFPT1EAHA; Tue,  3 Aug 2021 23:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE76C60724;
	Tue,  3 Aug 2021 23:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C486D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB5B540F03
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mT8qEY2JdgIm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84AE140E8E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DC73F83FEF; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:25:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 49e436f4823ed982a9a4fadeb00e1159d55f7939
X-Git-Newrev: 1cf3c394c7c40b1b093e4a77d5512d52ca3006e2
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.DC73F83FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/seatd: fix uclibc build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1cf3c394c7c40b1b093e4a77d5512d52ca3006e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix uclibc build which is broken since addition of the package in commit
daae31149017cbf8b03634cfc56da132f7e1ad83

We backport an upstream feature patch, because it includes the actual
fix as a side-effect (including stdarg.h at the proper location).

Fixes:
 - http://autobuild.buildroot.org/results/ad5020c5c1a7730f1ae82bf8215ed63df83421fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/seatd/0002-Add-no-op-session.patch | 223 +++++++++++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/package/seatd/0002-Add-no-op-session.patch b/package/seatd/0002-Add-no-op-session.patch
new file mode 100644
index 0000000000..44798126d9
--- /dev/null
+++ b/package/seatd/0002-Add-no-op-session.patch
@@ -0,0 +1,223 @@
+From 9a7824b7c3ff5c957632671e91454fc84fbcdda8 Mon Sep 17 00:00:00 2001
+From: Simon Ser <contact@emersion.fr>
+Date: Fri, 26 Mar 2021 10:05:12 +0100
+Subject: [PATCH] Add no-op session
+
+This is useful for headless testing, for instance with VKMS:
+
+    modprobe vkms
+    export WLR_DRM_DEVICES=/dev/dri/card1
+    export WLR_BACKENDS=drm
+    export LIBSEAT_BACKEND=noop
+    sway
+
+We don't need any of the VT handling in this case.
+
+[Retrieved from:
+https://github.com/kennylevinsen/seatd/commit/9a7824b7c3ff5c957632671e91454fc84fbcdda8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libseat.h      |   2 +
+ libseat/backend/noop.c | 135 +++++++++++++++++++++++++++++++++++++++++
+ libseat/libseat.c      |   5 ++
+ meson.build            |   2 +-
+ 4 files changed, 143 insertions(+), 1 deletion(-)
+ create mode 100644 libseat/backend/noop.c
+
+diff --git a/include/libseat.h b/include/libseat.h
+index 5375cd6..82098ea 100644
+--- a/include/libseat.h
++++ b/include/libseat.h
+@@ -1,6 +1,8 @@
+ #ifndef _LIBSEAT_H
+ #define _LIBSEAT_H
+ 
++#include <stdarg.h>
++
+ /*
+  * An opaque struct containing an opened seat, created by libseat_open_seat and
+  * destroyed by libseat_close_seat.
+diff --git a/libseat/backend/noop.c b/libseat/backend/noop.c
+new file mode 100644
+index 0000000..71d0224
+--- /dev/null
++++ b/libseat/backend/noop.c
+@@ -0,0 +1,135 @@
++#include <assert.h>
++#include <errno.h>
++#include <fcntl.h>
++#include <poll.h>
++#include <stdbool.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/socket.h>
++#include <unistd.h>
++
++#include "backend.h"
++#include "log.h"
++
++struct backend_noop {
++	struct libseat base;
++	struct libseat_seat_listener *seat_listener;
++	void *seat_listener_data;
++
++	bool initial_setup;
++	int sockets[2];
++};
++
++extern const struct seat_impl noop_impl;
++
++static struct backend_noop *backend_noop_from_libseat_backend(struct libseat *base) {
++	assert(base->impl == &noop_impl);
++	return (struct backend_noop *)base;
++}
++
++static void destroy(struct backend_noop *backend) {
++	close(backend->sockets[0]);
++	close(backend->sockets[1]);
++	free(backend);
++}
++
++static int close_seat(struct libseat *base) {
++	struct backend_noop *backend = backend_noop_from_libseat_backend(base);
++	destroy(backend);
++	return 0;
++}
++
++static int disable_seat(struct libseat *base) {
++	(void)base;
++	return 0;
++}
++
++static const char *seat_name(struct libseat *base) {
++	(void)base;
++	return "noop";
++}
++
++static int open_device(struct libseat *base, const char *path, int *fd) {
++	(void)base;
++
++	int tmpfd = open(path, O_RDWR | O_CLOEXEC);
++	if (tmpfd < 0) {
++		log_errorf("Failed to open device: %s", strerror(errno));
++		return -1;
++	}
++
++	*fd = tmpfd;
++	return tmpfd;
++}
++
++static int close_device(struct libseat *base, int device_id) {
++	(void)base;
++	(void)device_id;
++	return 0;
++}
++
++static int switch_session(struct libseat *base, int s) {
++	(void)base;
++	(void)s;
++	log_errorf("No-op backend cannot switch to session %d", s);
++	return -1;
++}
++
++static int get_fd(struct libseat *base) {
++	struct backend_noop *backend = backend_noop_from_libseat_backend(base);
++	return backend->sockets[0];
++}
++
++static int dispatch_background(struct libseat *base, int timeout) {
++	struct backend_noop *backend = backend_noop_from_libseat_backend(base);
++
++	if (backend->initial_setup) {
++		backend->initial_setup = false;
++		backend->seat_listener->enable_seat(&backend->base, backend->seat_listener_data);
++	}
++
++	struct pollfd fd = {
++		.fd = backend->sockets[0],
++		.events = POLLIN,
++	};
++	if (poll(&fd, 1, timeout) < 0) {
++		if (errno == EAGAIN || errno == EINTR) {
++			return 0;
++		} else {
++			return -1;
++		}
++	}
++
++	return 0;
++}
++
++static struct libseat *noop_open_seat(struct libseat_seat_listener *listener, void *data) {
++	struct backend_noop *backend = calloc(1, sizeof(struct backend_noop));
++	if (backend == NULL) {
++		return NULL;
++	}
++
++	if (socketpair(AF_UNIX, SOCK_STREAM, 0, backend->sockets) != 0) {
++		log_errorf("socketpair() failed: %s", strerror(errno));
++		free(backend);
++		return NULL;
++	}
++
++	backend->seat_listener = listener;
++	backend->seat_listener_data = data;
++	backend->base.impl = &noop_impl;
++
++	return &backend->base;
++}
++
++const struct seat_impl noop_impl = {
++	.open_seat = noop_open_seat,
++	.disable_seat = disable_seat,
++	.close_seat = close_seat,
++	.seat_name = seat_name,
++	.open_device = open_device,
++	.close_device = close_device,
++	.switch_session = switch_session,
++	.get_fd = get_fd,
++	.dispatch = dispatch_background,
++};
+diff --git a/libseat/libseat.c b/libseat/libseat.c
+index b1e8bb2..a7e079c 100644
+--- a/libseat/libseat.c
++++ b/libseat/libseat.c
+@@ -13,6 +13,7 @@
+ extern const struct seat_impl seatd_impl;
+ extern const struct seat_impl logind_impl;
+ extern const struct seat_impl builtin_impl;
++extern const struct seat_impl noop_impl;
+ 
+ static const struct named_backend impls[] = {
+ #ifdef SEATD_ENABLED
+@@ -24,6 +25,7 @@ static const struct named_backend impls[] = {
+ #ifdef BUILTIN_ENABLED
+ 	{"builtin", &builtin_impl},
+ #endif
++	{"noop", &noop_impl},
+ 	{NULL, NULL},
+ };
+ 
+@@ -62,6 +64,9 @@ struct libseat *libseat_open_seat(struct libseat_seat_listener *listener, void *
+ 
+ 	struct libseat *backend = NULL;
+ 	for (const struct named_backend *iter = impls; iter->backend != NULL; iter++) {
++		if (iter->backend == &noop_impl) {
++			continue;
++		}
+ 		backend = iter->backend->open_seat(listener, data);
+ 		if (backend != NULL) {
+ 			log_infof("Seat opened with backend '%s'", iter->name);
+diff --git a/meson.build b/meson.build
+index f41b621..c3800ae 100644
+--- a/meson.build
++++ b/meson.build
+@@ -145,7 +145,7 @@ symbols_file = 'libseat/libseat.syms'
+ symbols_flag = '-Wl,--version-script,@0@/@1@'.format(meson.current_source_dir(), symbols_file)
+ lib = library(
+ 	'seat', # This results in the library being called 'libseat'
+-	[ 'libseat/libseat.c' ],
++	[ 'libseat/libseat.c', 'libseat/backend/noop.c' ],
+ 	soversion: libseat_soversion,
+ 	link_with: private_lib,
+ 	include_directories: [include_directories('.', 'include')],
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
