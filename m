Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FDC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 11:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597C240153;
	Fri, 16 Dec 2022 11:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 597C240153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_pUaXIRosWY; Fri, 16 Dec 2022 11:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ED9C403E5;
	Fri, 16 Dec 2022 11:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED9C403E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA9681BF2EC
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 11:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A515D41B73
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 11:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A515D41B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L50GoqADGOr8 for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 11:43:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B05DD41B46
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B05DD41B46
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 11:43:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A4FEAC1530
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 11:29:57 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BFB11BF207;
 Fri, 16 Dec 2022 11:29:50 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: peter@korsgaard.com
Date: Fri, 16 Dec 2022 12:29:08 +0100
Message-Id: <20221216112908.3824372-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2022.02.x] package/wayland: fix CVE-2021-3782
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Add an upstream patch to fix CVE-2021-3782:
An internal reference count is held on the buffer pool, incremented
every time a new buffer is created from the pool. The reference count is
maintained as an int; on LP64 systems this can cause the reference count
to overflow if the client creates a large number of wl_shm buffer
objects, or if it can coerce the server to create a large number of
external references to the buffer storage. With the reference count
overflowing, a use-after-free can be constructed on the wl_shm_pool
tracking structure, where values may be incremented or decremented; it
may also be possible to construct a limited oracle to leak 4 bytes of
server-side memory to the attacking client at a time.

The first patch (0003-util-set-errno-in-wl_map_reserve_new.patch) comes
from upstream and its sole purpose is to allow the patch fixing
CVE-2021-3782 to be cleanly applied without any modification.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 ...util-set-errno-in-wl_map_reserve_new.patch |  92 +++++++++++++++
 .../0004-util-Limit-size-of-wl_map.patch      | 106 ++++++++++++++++++
 package/wayland/wayland.mk                    |   4 +
 3 files changed, 202 insertions(+)
 create mode 100644 package/wayland/0003-util-set-errno-in-wl_map_reserve_new.patch
 create mode 100644 package/wayland/0004-util-Limit-size-of-wl_map.patch

diff --git a/package/wayland/0003-util-set-errno-in-wl_map_reserve_new.patch b/package/wayland/0003-util-set-errno-in-wl_map_reserve_new.patch
new file mode 100644
index 0000000000..b3b7b5809e
--- /dev/null
+++ b/package/wayland/0003-util-set-errno-in-wl_map_reserve_new.patch
@@ -0,0 +1,92 @@
+From ddf558b9a269f24bf1a47043b942065e8f28fed0 Mon Sep 17 00:00:00 2001
+From: Aleksandr Mezin <mezin.alexander@gmail.com>
+Date: Wed, 9 Feb 2022 04:10:42 +0600
+Subject: [PATCH] util: set errno in wl_map_reserve_new()
+
+And also fix wl_connection_demarshal() to pass through that errno.
+
+Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
+[Retrieved (only for clean application of next patch) from
+https://gitlab.freedesktop.org/wayland/wayland/-/commit/03e8a1f84b6a15c9531db1ca8d0a25f9fcffaf25]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/connection.c   | 10 ++++++----
+ src/wayland-util.c | 14 +++++++++++---
+ 2 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/src/connection.c b/src/connection.c
+index d0c7d9f..6a116ad 100644
+--- a/src/connection.c
++++ b/src/connection.c
+@@ -803,10 +803,12 @@ wl_connection_demarshal(struct wl_connection *connection,
+ 			}
+ 
+ 			if (wl_map_reserve_new(objects, id) < 0) {
+-				wl_log("not a valid new object id (%u), "
+-				       "message %s(%s)\n",
+-				       id, message->name, message->signature);
+-				errno = EINVAL;
++				if (errno == EINVAL) {
++					wl_log("not a valid new object id (%u), "
++					       "message %s(%s)\n", id,
++					       message->name,
++					       message->signature);
++				}
+ 				goto err;
+ 			}
+ 
+diff --git a/src/wayland-util.c b/src/wayland-util.c
+index d5973bf..5d28531 100644
+--- a/src/wayland-util.c
++++ b/src/wayland-util.c
+@@ -24,6 +24,7 @@
+  * SOFTWARE.
+  */
+ 
++#include <errno.h>
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <stdio.h>
+@@ -257,13 +258,17 @@ wl_map_reserve_new(struct wl_map *map, uint32_t i)
+ 	struct wl_array *entries;
+ 
+ 	if (i < WL_SERVER_ID_START) {
+-		if (map->side == WL_MAP_CLIENT_SIDE)
++		if (map->side == WL_MAP_CLIENT_SIDE) {
++			errno = EINVAL;
+ 			return -1;
++		}
+ 
+ 		entries = &map->client_entries;
+ 	} else {
+-		if (map->side == WL_MAP_SERVER_SIDE)
++		if (map->side == WL_MAP_SERVER_SIDE) {
++			errno = EINVAL;
+ 			return -1;
++		}
+ 
+ 		entries = &map->server_entries;
+ 		i -= WL_SERVER_ID_START;
+@@ -271,8 +276,10 @@ wl_map_reserve_new(struct wl_map *map, uint32_t i)
+ 
+ 	count = entries->size / sizeof *start;
+ 
+-	if (count < i)
++	if (count < i) {
++		errno = EINVAL;
+ 		return -1;
++	}
+ 
+ 	if (count == i) {
+ 		wl_array_add(entries, sizeof *start);
+@@ -281,6 +288,7 @@ wl_map_reserve_new(struct wl_map *map, uint32_t i)
+ 	} else {
+ 		start = entries->data;
+ 		if (start[i].data != NULL) {
++			errno = EINVAL;
+ 			return -1;
+ 		}
+ 	}
+-- 
+2.38.1
+
diff --git a/package/wayland/0004-util-Limit-size-of-wl_map.patch b/package/wayland/0004-util-Limit-size-of-wl_map.patch
new file mode 100644
index 0000000000..c2940c5168
--- /dev/null
+++ b/package/wayland/0004-util-Limit-size-of-wl_map.patch
@@ -0,0 +1,106 @@
+From 62b9b6f86421ac7afc7cfe7b1627a8ec2a3c4874 Mon Sep 17 00:00:00 2001
+From: Derek Foreman <derek.foreman@collabora.com>
+Date: Fri, 28 Jan 2022 13:18:37 -0600
+Subject: [PATCH] util: Limit size of wl_map
+
+Since server IDs are basically indistinguishable from really big client
+IDs at many points in the source, it's theoretically possible to overflow
+a map and either overflow server IDs into the client ID space, or grow
+client IDs into the server ID space. This would currently take a massive
+amount of RAM, but the definition of massive changes yearly.
+
+Prevent this by placing a ridiculous but arbitrary upper bound on the
+number of items we can put in a map: 0xF00000, somewhere over 15 million.
+This should satisfy pathological clients without restriction, but stays
+well clear of the 0xFF000000 transition point between server and client
+IDs. It will still take an improbable amount of RAM to hit this, and a
+client could still exhaust all RAM in this way, but our goal is to prevent
+overflow and undefined behaviour.
+
+Fixes #224
+
+Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
+[Retrieved from
+https://gitlab.freedesktop.org/wayland/wayland/-/commit/b19488c7154b902354cb26a27f11415d7799b0b2]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/wayland-private.h |  1 +
+ src/wayland-util.c    | 25 +++++++++++++++++++++++--
+ 2 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/wayland-private.h b/src/wayland-private.h
+index 9bf8cb7..35dc40e 100644
+--- a/src/wayland-private.h
++++ b/src/wayland-private.h
+@@ -45,6 +45,7 @@
+ #define WL_MAP_SERVER_SIDE 0
+ #define WL_MAP_CLIENT_SIDE 1
+ #define WL_SERVER_ID_START 0xff000000
++#define WL_MAP_MAX_OBJECTS 0x00f00000
+ #define WL_CLOSURE_MAX_ARGS 20
+ 
+ struct wl_object {
+diff --git a/src/wayland-util.c b/src/wayland-util.c
+index 5d28531..c712f03 100644
+--- a/src/wayland-util.c
++++ b/src/wayland-util.c
+@@ -196,6 +196,7 @@ wl_map_insert_new(struct wl_map *map, uint32_t flags, void *data)
+ 	union map_entry *start, *entry;
+ 	struct wl_array *entries;
+ 	uint32_t base;
++	uint32_t count;
+ 
+ 	if (map->side == WL_MAP_CLIENT_SIDE) {
+ 		entries = &map->client_entries;
+@@ -216,10 +217,25 @@ wl_map_insert_new(struct wl_map *map, uint32_t flags, void *data)
+ 		start = entries->data;
+ 	}
+ 
++	/* wl_array only grows, so if we have too many objects at
++	 * this point there's no way to clean up. We could be more
++	 * pro-active about trying to avoid this allocation, but
++	 * it doesn't really matter because at this point there is
++	 * nothing to be done but disconnect the client and delete
++	 * the whole array either way.
++	 */
++	count = entry - start;
++	if (count > WL_MAP_MAX_OBJECTS) {
++		/* entry->data is freshly malloced garbage, so we'd
++		 * better make it a NULL so wl_map_for_each doesn't
++		 * dereference it later. */
++		entry->data = NULL;
++		return 0;
++	}
+ 	entry->data = data;
+ 	entry->next |= (flags & 0x1) << 1;
+ 
+-	return (entry - start) + base;
++	return count + base;
+ }
+ 
+ int
+@@ -236,6 +252,9 @@ wl_map_insert_at(struct wl_map *map, uint32_t flags, uint32_t i, void *data)
+ 		i -= WL_SERVER_ID_START;
+ 	}
+ 
++	if (i > WL_MAP_MAX_OBJECTS)
++		return -1;
++
+ 	count = entries->size / sizeof *start;
+ 	if (count < i)
+ 		return -1;
+@@ -274,8 +293,10 @@ wl_map_reserve_new(struct wl_map *map, uint32_t i)
+ 		i -= WL_SERVER_ID_START;
+ 	}
+ 
+-	count = entries->size / sizeof *start;
++	if (i > WL_MAP_MAX_OBJECTS)
++		return -1;
+ 
++	count = entries->size / sizeof *start;
+ 	if (count < i) {
+ 		errno = EINVAL;
+ 		return -1;
+-- 
+2.38.1
+
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index ecfe95d68a..fc26de9f52 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -14,6 +14,10 @@ WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
 HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
 
+# 0003-util-set-errno-in-wl_map_reserve_new.patch
+# 0004-util-Limit-size-of-wl_map.patch
+WAYLAND_IGNORE_CVES += CVE-2021-3782
+
 WAYLAND_CONF_OPTS = -Dtests=false -Ddocumentation=false
 HOST_WAYLAND_CONF_OPTS = -Dtests=false -Ddocumentation=false
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
