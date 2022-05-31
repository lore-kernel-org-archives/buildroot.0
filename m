Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 07:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA62683F3F;
	Tue, 31 May 2022 07:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnTRw0FRJDSg; Tue, 31 May 2022 07:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C02E83EF3;
	Tue, 31 May 2022 07:42:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88BA11BF35F
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 07:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8556A60B8A
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 07:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ro9K613TsMLf for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 07:42:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58D3160B38
 for <buildroot@buildroot.org>; Tue, 31 May 2022 07:42:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 658788685B; Tue, 31 May 2022 07:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 09:03:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93f831bf5d90b689474671cc9bb790d2305fc07a
X-Git-Newrev: 74a4bb58fe45d6218655f81e7158ac6dc8c28271
X-Patchwork-Hint: ignore
Message-Id: <20220531073043.658788685B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix uclibc build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74a4bb58fe45d6218655f81e7158ac6dc8c28271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
/home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-detection-of-reallocarray.patch       | 287 +++++++++++++++++++++
 1 file changed, 287 insertions(+)

diff --git a/package/pipewire/0002-fix-detection-of-reallocarray.patch b/package/pipewire/0002-fix-detection-of-reallocarray.patch
new file mode 100644
index 0000000000..8cb80c8672
--- /dev/null
+++ b/package/pipewire/0002-fix-detection-of-reallocarray.patch
@@ -0,0 +1,287 @@
+From 85ca67b9275780cc40bee08f92954db9184cad56 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 May 2022 15:00:17 +0200
+Subject: [PATCH] fix detection of reallocarray
+
+Fix detection of reallocarray (e.g. on glibc) raised since commit
+0708a39b439cec2871cfe3b705191028397e5b8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/85ca67b9275780cc40bee08f92954db9184cad56]
+---
+ meson.build                                            |  1 +
+ pipewire-jack/src/metadata.c                           |  2 +-
+ spa/plugins/bluez5/bluez5-dbus.c                       |  5 +++++
+ src/modules/module-client-node/client-node.c           |  2 +-
+ src/modules/module-client-node/remote-node.c           |  4 ++--
+ src/modules/module-client-node/v0/client-node.c        |  4 ++--
+ .../client-endpoint/endpoint-stream.c                  |  4 ++--
+ .../module-session-manager/client-endpoint/endpoint.c  |  4 ++--
+ .../client-session/endpoint-link.c                     |  4 ++--
+ .../module-session-manager/client-session/session.c    |  4 ++--
+ src/pipewire/introspect.c                              |  6 +++---
+ src/pipewire/utils.c                                   | 10 ++++++++++
+ src/pipewire/utils.h                                   |  5 ++---
+ 13 files changed, 35 insertions(+), 20 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 314091779..e6bc29ba4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -375,6 +375,7 @@ check_functions = [
+   ['gettid', '#include <unistd.h>', ['-D_GNU_SOURCE'], []],
+   ['memfd_create', '#include <sys/mman.h>', ['-D_GNU_SOURCE'], []],
+   ['getrandom', '#include <stddef.h>\n#include <sys/random.h>', ['-D_GNU_SOURCE'], []],
++  ['reallocarray', '#include <stdlib.h>', ['-D_GNU_SOURCE'], []],
+   ['sigabbrev_np', '#include <string.h>', ['-D_GNU_SOURCE'], []],
+   ['XSetIOErrorExitHandler', '#include <X11/Xlib.h>', [], [x11_dep]],
+ ]
+diff --git a/pipewire-jack/src/metadata.c b/pipewire-jack/src/metadata.c
+index 8ccb5a348..d50948ff4 100644
+--- a/pipewire-jack/src/metadata.c
++++ b/pipewire-jack/src/metadata.c
+@@ -120,7 +120,7 @@ static jack_property_t *add_property(jack_description_t *desc, const char *key,
+ 
+ 	if (desc->property_cnt == desc->property_size) {
+ 		ns = desc->property_size > 0 ? desc->property_size * 2 : 8;
+-		np = reallocarray(desc->properties, ns, sizeof(*prop));
++		np = pw_reallocarray(desc->properties, ns, sizeof(*prop));
+ 		if (np == NULL)
+ 			return NULL;
+ 		desc->property_size = ns;
+diff --git a/spa/plugins/bluez5/bluez5-dbus.c b/spa/plugins/bluez5/bluez5-dbus.c
+index 98bf05df1..c2e4a7ba7 100644
+--- a/spa/plugins/bluez5/bluez5-dbus.c
++++ b/spa/plugins/bluez5/bluez5-dbus.c
+@@ -50,6 +50,7 @@
+ #include <spa/utils/string.h>
+ #include <spa/utils/json.h>
+ 
++#include "config.h"
+ #include "codec-loader.h"
+ #include "player.h"
+ #include "defs.h"
+@@ -1579,7 +1580,11 @@ const struct a2dp_codec **spa_bt_device_get_supported_a2dp_codecs(struct spa_bt_
+ 		if (j >= size) {
+ 			const struct a2dp_codec **p;
+ 			size = size * 2;
++#ifdef HAVE_REALLOCARRRAY
+ 			p = reallocarray(supported_codecs, size, sizeof(const struct a2dp_codec *));
++#else
++			p = realloc(supported_codecs, size * sizeof(const struct a2dp_codec *));
++#endif
+ 			if (p == NULL) {
+ 				free(supported_codecs);
+ 				return NULL;
+diff --git a/src/modules/module-client-node/client-node.c b/src/modules/module-client-node/client-node.c
+index 2533c360c..9357d03da 100644
+--- a/src/modules/module-client-node/client-node.c
++++ b/src/modules/module-client-node/client-node.c
+@@ -191,7 +191,7 @@ static int update_params(struct params *p, uint32_t n_params, const struct spa_p
+ 		p->params = NULL;
+ 	} else {
+ 		struct spa_pod **np;
+-		np = reallocarray(p->params, p->n_params, sizeof(struct spa_pod *));
++		np = pw_reallocarray(p->params, p->n_params, sizeof(struct spa_pod *));
+ 		if (np == NULL) {
+ 			pw_log_error("%p: can't realloc: %m", p);
+ 			free(p->params);
+diff --git a/src/modules/module-client-node/remote-node.c b/src/modules/module-client-node/remote-node.c
+index c04273e95..c0af9a21f 100644
+--- a/src/modules/module-client-node/remote-node.c
++++ b/src/modules/module-client-node/remote-node.c
+@@ -318,7 +318,7 @@ static int add_node_update(struct node_data *data, uint32_t change_mask, uint32_
+ 							id, &idx, NULL, &param, &b.b);
+ 				if (res == 1) {
+ 					void *p;
+-					p = reallocarray(params, n_params + 1, sizeof(struct spa_pod *));
++					p = pw_reallocarray(params, n_params + 1, sizeof(struct spa_pod *));
+ 					if (p == NULL) {
+ 						res = -errno;
+ 						pw_log_error("realloc failed: %m");
+@@ -384,7 +384,7 @@ static int add_port_update(struct node_data *data, struct pw_impl_port *port, ui
+ 							id, &idx, NULL, &param, &b.b);
+ 				if (res == 1) {
+ 					void *p;
+-					p = reallocarray(params, n_params + 1, sizeof(struct spa_pod*));
++					p = pw_reallocarray(params, n_params + 1, sizeof(struct spa_pod*));
+ 					if (p == NULL) {
+ 						res = -errno;
+ 						pw_log_error("realloc failed: %m");
+diff --git a/src/modules/module-client-node/v0/client-node.c b/src/modules/module-client-node/v0/client-node.c
+index e71abbb14..aeb5931c6 100644
+--- a/src/modules/module-client-node/v0/client-node.c
++++ b/src/modules/module-client-node/v0/client-node.c
+@@ -476,7 +476,7 @@ do_update_port(struct node *this,
+ 			port->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(port->params, port->n_params, sizeof(struct spa_pod *));
++			p = pw_reallocarray(port->params, port->n_params, sizeof(struct spa_pod *));
+ 			if (p == NULL) {
+ 				pw_log_error("%p: port %u can't realloc: %m", this, port_id);
+ 				free(port->params);
+@@ -1049,7 +1049,7 @@ client_node0_update(void *data,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, this->n_params, sizeof(struct spa_pod *));
++			p = pw_reallocarray(this->params, this->n_params, sizeof(struct spa_pod *));
+ 			if (p == NULL) {
+ 				pw_log_error("%p: can't realloc: %m", this);
+ 				free(this->params);
+diff --git a/src/modules/module-session-manager/client-endpoint/endpoint-stream.c b/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
+index 8d7f2da2b..8dde6f749 100644
+--- a/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
++++ b/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
+@@ -196,7 +196,7 @@ int endpoint_stream_update(struct endpoint_stream *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -227,7 +227,7 @@ int endpoint_stream_update(struct endpoint_stream *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/modules/module-session-manager/client-endpoint/endpoint.c b/src/modules/module-session-manager/client-endpoint/endpoint.c
+index 8a7863ee1..aa13989b6 100644
+--- a/src/modules/module-session-manager/client-endpoint/endpoint.c
++++ b/src/modules/module-session-manager/client-endpoint/endpoint.c
+@@ -213,7 +213,7 @@ int endpoint_update(struct endpoint *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -245,7 +245,7 @@ int endpoint_update(struct endpoint *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/modules/module-session-manager/client-session/endpoint-link.c b/src/modules/module-session-manager/client-session/endpoint-link.c
+index 9048fe30c..0bdbfc946 100644
+--- a/src/modules/module-session-manager/client-session/endpoint-link.c
++++ b/src/modules/module-session-manager/client-session/endpoint-link.c
+@@ -209,7 +209,7 @@ int endpoint_link_update(struct endpoint_link *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -241,7 +241,7 @@ int endpoint_link_update(struct endpoint_link *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/modules/module-session-manager/client-session/session.c b/src/modules/module-session-manager/client-session/session.c
+index 681c56118..87c1b96a7 100644
+--- a/src/modules/module-session-manager/client-session/session.c
++++ b/src/modules/module-session-manager/client-session/session.c
+@@ -196,7 +196,7 @@ int session_update(struct session *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -222,7 +222,7 @@ int session_update(struct session *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/pipewire/introspect.c b/src/pipewire/introspect.c
+index 35598a90d..2855009c0 100644
+--- a/src/pipewire/introspect.c
++++ b/src/pipewire/introspect.c
+@@ -213,7 +213,7 @@ struct pw_node_info *pw_node_info_merge(struct pw_node_info *info,
+ 		uint32_t i, user, n_params = update->n_params;
+ 		void *np;
+ 
+-		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
++		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
+ 		if (np == NULL) {
+ 			free(info->params);
+ 			info->params = NULL;
+@@ -283,7 +283,7 @@ struct pw_port_info *pw_port_info_merge(struct pw_port_info *info,
+ 		uint32_t i, user, n_params = update->n_params;
+ 		void *np;
+ 
+-		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
++		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
+ 		if (np == NULL) {
+ 			free(info->params);
+ 			info->params = NULL;
+@@ -443,7 +443,7 @@ struct pw_device_info *pw_device_info_merge(struct pw_device_info *info,
+ 		uint32_t i, user, n_params = update->n_params;
+ 		void *np;
+ 
+-		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
++		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
+ 		if (np == NULL) {
+ 			free(info->params);
+ 			info->params = NULL;
+diff --git a/src/pipewire/utils.c b/src/pipewire/utils.c
+index 2f3240faf..a644049fd 100644
+--- a/src/pipewire/utils.c
++++ b/src/pipewire/utils.c
+@@ -168,3 +168,13 @@ ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags)
+ 	close(fd);
+ 	return bytes;
+ }
++
++SPA_EXPORT
++void* pw_reallocarray(void *ptr, size_t nmemb, size_t size)
++{
++#ifdef HAVE_REALLOCARRAY
++	return reallocarray(ptr, nmemb, size);
++#else
++	return realloc(ptr, nmemb * size);
++#endif
++}
+diff --git a/src/pipewire/utils.h b/src/pipewire/utils.h
+index 8f8e002b7..b320db22f 100644
+--- a/src/pipewire/utils.h
++++ b/src/pipewire/utils.h
+@@ -88,6 +88,8 @@ pw_strip(char *str, const char *whitespace);
+ 
+ ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags);
+ 
++void* pw_reallocarray(void *ptr, size_t nmemb, size_t size);
++
+ /**
+  * \}
+  */
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
