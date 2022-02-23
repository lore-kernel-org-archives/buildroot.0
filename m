Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C59C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4051415CE;
	Wed, 23 Feb 2022 20:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WsY_sFv293W; Wed, 23 Feb 2022 20:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D1B415A0;
	Wed, 23 Feb 2022 20:14:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E71BD1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E379480CD0
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ethxRKBZ7GK for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:13:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B954E80C83
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:13:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3BB998389E; Wed, 23 Feb 2022 20:06:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:12:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1636f604bd61aa9ddd804ce174a51ee41db7e9d6
X-Git-Newrev: 6fc5c8e92c1d7997e48b207187d2d3c7ad42819c
X-Patchwork-Hint: ignore
Message-Id: <20220223200600.3BB998389E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix build with glibc
 < 2.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fc5c8e92c1d7997e48b207187d2d3c7ad42819c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with glibc < 2.25 raised since bump to
version 5.63 in commit d4c6cf4b1fc0f34e72ff047e76de53d3634f5184:

plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0005-build-Fix-errors-with-glibc-2-25.patch    | 312 +++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |   2 +-
 2 files changed, 313 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch b/package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch
new file mode 100644
index 0000000000..13033da7b2
--- /dev/null
+++ b/package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch
@@ -0,0 +1,312 @@
+From fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 14 Feb 2022 21:17:39 +0100
+Subject: build: Fix errors with glibc < 2.25
+
+getrandom and sys/random.h are only available since glibc 2.25:
+https://www.gnu.org/software/gnulib/manual/html_node/sys_002frandom_002eh.html
+resulting in the following build failures since version 5.63 and
+https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom:
+
+plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
+ #include <sys/random.h>
+                        ^
+
+To fix this build failure, add util_getrandom and a fallback (borrowed
+from pipewire and licensed under MIT):
+https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/src/pipewire/utils.c
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac           |  4 +++-
+ emulator/le.c          |  3 +--
+ emulator/phy.c         |  3 +--
+ peripheral/main.c      |  4 ++--
+ plugins/autopair.c     |  4 ++--
+ profiles/health/hdp.c  |  4 ++--
+ profiles/health/mcap.c |  6 +++---
+ src/shared/util.c      | 25 +++++++++++++++++++++++++
+ src/shared/util.h      |  2 ++
+ tools/btgatt-server.c  |  3 +--
+ 10 files changed, 42 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 07d068a4d..441bd5f29 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,8 @@ AC_ARG_ENABLE(threads, AS_HELP_STRING([--enable-threads],
+ 
+ AC_CHECK_FUNCS(explicit_bzero)
+ 
++AC_CHECK_FUNCS(getrandom)
++
+ AC_CHECK_FUNCS(rawmemchr)
+ 
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+@@ -68,7 +70,7 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
+ AC_CHECK_LIB(dl, dlopen, dummy=yes,
+ 			AC_MSG_ERROR(dynamic linking loader is required))
+ 
+-AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h)
++AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
+ 
+ PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28, dummy=yes,
+ 				AC_MSG_ERROR(GLib >= 2.28 is required))
+diff --git a/emulator/le.c b/emulator/le.c
+index f8f313f2c..7656a657c 100644
+--- a/emulator/le.c
++++ b/emulator/le.c
+@@ -20,7 +20,6 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+-#include <sys/random.h>
+ #include <time.h>
+ 
+ #include "lib/bluetooth.h"
+@@ -509,7 +508,7 @@ static unsigned int get_adv_delay(void)
+ 	/* The advertising delay is a pseudo-random value with a range
+ 	 * of 0 ms to 10 ms generated for each advertising event.
+ 	 */
+-	if (getrandom(&val, sizeof(val), 0) < 0) {
++	if (util_getrandom(&val, sizeof(val), 0) < 0) {
+ 		/* If it fails to get the random number, use a static value */
+ 		val = 5;
+ 	}
+diff --git a/emulator/phy.c b/emulator/phy.c
+index 44cace438..7de85fb05 100644
+--- a/emulator/phy.c
++++ b/emulator/phy.c
+@@ -19,7 +19,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/socket.h>
+-#include <sys/random.h>
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
+ #include <time.h>
+@@ -174,7 +173,7 @@ struct bt_phy *bt_phy_new(void)
+ 	mainloop_add_fd(phy->rx_fd, EPOLLIN, phy_rx_callback, phy, NULL);
+ 
+ 	if (!get_random_bytes(&phy->id, sizeof(phy->id))) {
+-		if (getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
++		if (util_getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
+ 			mainloop_remove_fd(phy->rx_fd);
+ 			close(phy->tx_fd);
+ 			close(phy->rx_fd);
+diff --git a/peripheral/main.c b/peripheral/main.c
+index 91adb45fc..b82d7caf6 100644
+--- a/peripheral/main.c
++++ b/peripheral/main.c
+@@ -25,13 +25,13 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
+-#include <sys/random.h>
+ 
+ #ifndef WAIT_ANY
+ #define WAIT_ANY (-1)
+ #endif
+ 
+ #include "src/shared/mainloop.h"
++#include "src/shared/util.h"
+ #include "peripheral/efivars.h"
+ #include "peripheral/attach.h"
+ #include "peripheral/gap.h"
+@@ -192,7 +192,7 @@ int main(int argc, char *argv[])
+ 							addr, 6) < 0) {
+ 			printf("Generating new persistent static address\n");
+ 
+-			if (getrandom(addr, sizeof(addr), 0) < 0) {
++			if (util_getrandom(addr, sizeof(addr), 0) < 0) {
+ 				perror("Failed to get random static address");
+ 				return EXIT_FAILURE;
+ 			}
+diff --git a/plugins/autopair.c b/plugins/autopair.c
+index a75ecebe4..0b09e893f 100644
+--- a/plugins/autopair.c
++++ b/plugins/autopair.c
+@@ -17,7 +17,6 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <errno.h>
+-#include <sys/random.h>
+ 
+ #include <glib.h>
+ 
+@@ -29,6 +28,7 @@
+ #include "src/device.h"
+ #include "src/log.h"
+ #include "src/storage.h"
++#include "src/shared/util.h"
+ 
+ /*
+  * Plugin to handle automatic pairing of devices with reduced user
+@@ -131,7 +131,7 @@ static ssize_t autopair_pincb(struct btd_adapter *adapter,
+ 			if (attempt >= 4)
+ 				return 0;
+ 
+-			if (getrandom(&val, sizeof(val), 0) < 0) {
++			if (util_getrandom(&val, sizeof(val), 0) < 0) {
+ 				error("Failed to get a random pincode");
+ 				return 0;
+ 			}
+diff --git a/profiles/health/hdp.c b/profiles/health/hdp.c
+index 9d9d1e824..b6590cd3a 100644
+--- a/profiles/health/hdp.c
++++ b/profiles/health/hdp.c
+@@ -16,7 +16,6 @@
+ #include <stdint.h>
+ #include <stdbool.h>
+ #include <unistd.h>
+-#include <sys/random.h>
+ 
+ #include <glib.h>
+ 
+@@ -33,6 +32,7 @@
+ #include "src/device.h"
+ #include "src/sdpd.h"
+ #include "src/shared/timeout.h"
++#include "src/shared/util.h"
+ #include "btio/btio.h"
+ 
+ #include "hdp_types.h"
+@@ -1490,7 +1490,7 @@ static void *generate_echo_packet(void)
+ 	if (!buf)
+ 		return NULL;
+ 
+-	if (getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
++	if (util_getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
+ 		g_free(buf);
+ 		return NULL;
+ 	}
+diff --git a/profiles/health/mcap.c b/profiles/health/mcap.c
+index aad0a08a3..5d2bac3d9 100644
+--- a/profiles/health/mcap.c
++++ b/profiles/health/mcap.c
+@@ -19,7 +19,6 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <time.h>
+-#include <sys/random.h>
+ 
+ #include <glib.h>
+ 
+@@ -28,6 +27,7 @@
+ #include "btio/btio.h"
+ #include "src/log.h"
+ #include "src/shared/timeout.h"
++#include "src/shared/util.h"
+ 
+ #include "mcap.h"
+ 
+@@ -1905,7 +1905,7 @@ gboolean mcap_create_mcl(struct mcap_instance *mi,
+ 		mcl->state = MCL_IDLE;
+ 		bacpy(&mcl->addr, addr);
+ 		set_default_cb(mcl);
+-		if (getrandom(&val, sizeof(val), 0) < 0) {
++		if (util_getrandom(&val, sizeof(val), 0) < 0) {
+ 			mcap_instance_unref(mcl->mi);
+ 			g_free(mcl);
+ 			return FALSE;
+@@ -2049,7 +2049,7 @@ static void connect_mcl_event_cb(GIOChannel *chan, GError *gerr,
+ 		mcl->mi = mcap_instance_ref(mi);
+ 		bacpy(&mcl->addr, &dst);
+ 		set_default_cb(mcl);
+-		if (getrandom(&val, sizeof(val), 0) < 0) {
++		if (util_getrandom(&val, sizeof(val), 0) < 0) {
+ 			mcap_instance_unref(mcl->mi);
+ 			g_free(mcl);
+ 			goto drop;
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 6e1c83057..33196bf8b 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -13,6 +13,7 @@
+ #endif
+ 
+ #define _GNU_SOURCE
++#include <fcntl.h>
+ #include <stdio.h>
+ #include <ctype.h>
+ #include <stdbool.h>
+@@ -23,6 +24,10 @@
+ #include <limits.h>
+ #include <string.h>
+ 
++#ifdef HAVE_SYS_RANDOM_H
++#include <sys/random.h>
++#endif
++
+ #include "src/shared/util.h"
+ 
+ void *util_malloc(size_t size)
+@@ -138,6 +143,26 @@ unsigned char util_get_dt(const char *parent, const char *name)
+ 	return DT_UNKNOWN;
+ }
+ 
++/* Helper for getting a random in case getrandom unavailable (glibc < 2.25) */
++ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags)
++{
++#ifdef HAVE_GETRANDOM
++	return getrandom(buf, buflen, flags);
++#else
++	int fd;
++	ssize_t bytes;
++
++	fd = open("/dev/urandom", O_CLOEXEC);
++	if (fd < 0)
++		return -1;
++
++	bytes = read(fd, buf, buflen);
++	close(fd);
++
++	return bytes;
++#endif
++}
++
+ /* Helpers for bitfield operations */
+ 
+ /* Find unique id in range from 1 to max but no bigger than 64. */
+diff --git a/src/shared/util.h b/src/shared/util.h
+index 8ef6132c4..c01eccf8a 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -103,6 +103,8 @@ void util_hexdump(const char dir, const unsigned char *buf, size_t len,
+ 
+ unsigned char util_get_dt(const char *parent, const char *name);
+ 
++ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
++
+ uint8_t util_get_uid(uint64_t *bitmap, uint8_t max);
+ void util_clear_uid(uint64_t *bitmap, uint8_t id);
+ 
+diff --git a/tools/btgatt-server.c b/tools/btgatt-server.c
+index 15d49a464..4a5d2b720 100644
+--- a/tools/btgatt-server.c
++++ b/tools/btgatt-server.c
+@@ -20,7 +20,6 @@
+ #include <getopt.h>
+ #include <unistd.h>
+ #include <errno.h>
+-#include <sys/random.h>
+ 
+ #include "lib/bluetooth.h"
+ #include "lib/hci.h"
+@@ -287,7 +286,7 @@ static bool hr_msrmt_cb(void *user_data)
+ 	uint32_t cur_ee;
+ 	uint32_t val;
+ 
+-	if (getrandom(&val, sizeof(val), 0) < 0)
++	if (util_getrandom(&val, sizeof(val), 0) < 0)
+ 		return false;
+ 
+ 	pdu[0] = 0x06;
+-- 
+cgit 
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7c2561b864..3d76cfb7dc 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -13,7 +13,7 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
 BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
-# We're patching Makefile.am
+# We're patching Makefile.am and configure.ac
 BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
