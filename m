Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720EEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 01:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C561E83FBD;
	Fri, 10 Jun 2022 01:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybU3vkFe-bUY; Fri, 10 Jun 2022 01:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A85B83F9D;
	Fri, 10 Jun 2022 01:03:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E10951BF2A7
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 01:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEBC761152
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 01:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id noXkPMT5P_eK for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 01:03:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22FD361151
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 01:03:00 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 19so4567066iou.12
 for <buildroot@buildroot.org>; Thu, 09 Jun 2022 18:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoMUO82sMY8A3TF5uE5w752Bzl588R12H8UBvOmJuD0=;
 b=YuqydJ5fhhV2OOGO4aVmoZhSrK0xO2JfIX3eU2j6sG5MAreKpdIS95QrmDsC9vCkjN
 f3vWTtJqTyLXRl+eCCLqZRwSTY3MUgsZkg0dT4qlV+U/G+8aUBJ4KgNAtqP0OcmGP7qF
 JR4RWCwy+UF7Mthr9FSq+weSAyCdPQDgJ9TdSsDr/dGc4IyihWBvlkVATJ4I6wvYruv8
 5dlhCVZVssWl5tWSXDpw8ePYXTtMKaLG/9NUbGweqv+2c+K+VmDyg3t94eh+50Gl6VtV
 DPBpnibopuWDUAlG6a/mQf+9xWvfyq5PbgoUZptURH9CG73j/jpWIy1c2Zhh0Xlmko2x
 d5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoMUO82sMY8A3TF5uE5w752Bzl588R12H8UBvOmJuD0=;
 b=6GYmEAoaHu8Qo9fRT1bRHk6CmgTrrLfYNqjruPXe0nB6v/hoBebuC9clygkk2pvTYN
 Igv+YCH28EAtM3qe68dYiOzNCJ4IokCWApKe3Y4igSnKMKui6ar/QlCBuUIP3Am2HH/9
 o9mDjzFgDT/HeWJmNjHcpIP9T+cJOW3E8WskOJrEYWkMY2HCAKV42G3bzYqsXT8rvZUd
 2pJsvHhOmdMVXac1m3MsWdGVRH+NzvXf+1IaYreqoBc0pYO1lHTF6B8ZaZZjU7SCPz0k
 /sKrH6ZK+ZkzMvY5iYv82TKhPv/rKWHM8bGKAG5y5VDfZieK27ZLPIER2lw/sVddUml3
 +ryg==
X-Gm-Message-State: AOAM531xlMTLPwuv1SaiZ0sCGUeMOLg9M54er+6BulQYjt+PJ+91hlJN
 caa3TLYKxlYCzBsZzeMyRVKr2culWJI=
X-Google-Smtp-Source: ABdhPJzkJbplloF+z4ZIAMpoxurRVYriugWZf1eFZSIAjfQZ4hvGJiAFsaf8hIWTWTd0EFepD2FT6A==
X-Received: by 2002:a02:a404:0:b0:331:6e99:5fc1 with SMTP id
 c4-20020a02a404000000b003316e995fc1mr21566870jal.136.1654822978792; 
 Thu, 09 Jun 2022 18:02:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 m6-20020a026a46000000b0033192b7fd35sm6880177jaf.128.2022.06.09.18.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 18:02:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jun 2022 19:02:55 -0600
Message-Id: <20220610010255.80277-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.52
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable new unsupported bluez5-codec-lc3plus feature.

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ild-on-uclibc-without-locale-support.patch |  65 ----
 .../0002-fix-detection-of-reallocarray.patch  | 287 ------------------
 package/pipewire/pipewire.hash                |   2 +-
 package/pipewire/pipewire.mk                  |   3 +-
 4 files changed, 3 insertions(+), 354 deletions(-)
 delete mode 100644 package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
 delete mode 100644 package/pipewire/0002-fix-detection-of-reallocarray.patch

diff --git a/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
deleted file mode 100644
index 0f2e6844e5..0000000000
--- a/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 4738c934bbf2a86aa62d752a130d13c524a47696 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 20 May 2022 20:18:07 -0600
-Subject: [PATCH] Fix build on uclibc without locale support
-
-When uclibc is build with !UCLIBC_HAS_LOCALE the macro
-__LOCALE_C_ONLY will be set, use this to disable unsupported and
-not required(due to only supporting the C locale) locale functions.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-4738c934bbf2a86aa62d752a130d13c524a47696]
----
- spa/include/spa/utils/string.h | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h
-index 43d19616c..edf4e954f 100644
---- a/spa/include/spa/utils/string.h
-+++ b/spa/include/spa/utils/string.h
-@@ -275,14 +275,20 @@ static inline int spa_scnprintf(char *buffer, size_t size, const char *format, .
-  */
- static inline float spa_strtof(const char *str, char **endptr)
- {
-+#ifndef __LOCALE_C_ONLY
- 	static locale_t locale = NULL;
- 	locale_t prev;
-+#endif
- 	float v;
-+#ifndef __LOCALE_C_ONLY
- 	if (SPA_UNLIKELY(locale == NULL))
- 		locale = newlocale(LC_ALL_MASK, "C", NULL);
- 	prev = uselocale(locale);
-+#endif
- 	v = strtof(str, endptr);
-+#ifndef __LOCALE_C_ONLY
- 	uselocale(prev);
-+#endif
- 	return v;
- }
- 
-@@ -319,14 +325,20 @@ static inline bool spa_atof(const char *str, float *val)
-  */
- static inline double spa_strtod(const char *str, char **endptr)
- {
-+#ifndef __LOCALE_C_ONLY
- 	static locale_t locale = NULL;
- 	locale_t prev;
-+#endif
- 	double v;
-+#ifndef __LOCALE_C_ONLY
- 	if (SPA_UNLIKELY(locale == NULL))
- 		locale = newlocale(LC_ALL_MASK, "C", NULL);
- 	prev = uselocale(locale);
-+#endif
- 	v = strtod(str, endptr);
-+#ifndef __LOCALE_C_ONLY
- 	uselocale(prev);
-+#endif
- 	return v;
- }
- 
--- 
-2.25.1
-
diff --git a/package/pipewire/0002-fix-detection-of-reallocarray.patch b/package/pipewire/0002-fix-detection-of-reallocarray.patch
deleted file mode 100644
index 8cb80c8672..0000000000
--- a/package/pipewire/0002-fix-detection-of-reallocarray.patch
+++ /dev/null
@@ -1,287 +0,0 @@
-From 85ca67b9275780cc40bee08f92954db9184cad56 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 27 May 2022 15:00:17 +0200
-Subject: [PATCH] fix detection of reallocarray
-
-Fix detection of reallocarray (e.g. on glibc) raised since commit
-0708a39b439cec2871cfe3b705191028397e5b8b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/85ca67b9275780cc40bee08f92954db9184cad56]
----
- meson.build                                            |  1 +
- pipewire-jack/src/metadata.c                           |  2 +-
- spa/plugins/bluez5/bluez5-dbus.c                       |  5 +++++
- src/modules/module-client-node/client-node.c           |  2 +-
- src/modules/module-client-node/remote-node.c           |  4 ++--
- src/modules/module-client-node/v0/client-node.c        |  4 ++--
- .../client-endpoint/endpoint-stream.c                  |  4 ++--
- .../module-session-manager/client-endpoint/endpoint.c  |  4 ++--
- .../client-session/endpoint-link.c                     |  4 ++--
- .../module-session-manager/client-session/session.c    |  4 ++--
- src/pipewire/introspect.c                              |  6 +++---
- src/pipewire/utils.c                                   | 10 ++++++++++
- src/pipewire/utils.h                                   |  5 ++---
- 13 files changed, 35 insertions(+), 20 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 314091779..e6bc29ba4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -375,6 +375,7 @@ check_functions = [
-   ['gettid', '#include <unistd.h>', ['-D_GNU_SOURCE'], []],
-   ['memfd_create', '#include <sys/mman.h>', ['-D_GNU_SOURCE'], []],
-   ['getrandom', '#include <stddef.h>\n#include <sys/random.h>', ['-D_GNU_SOURCE'], []],
-+  ['reallocarray', '#include <stdlib.h>', ['-D_GNU_SOURCE'], []],
-   ['sigabbrev_np', '#include <string.h>', ['-D_GNU_SOURCE'], []],
-   ['XSetIOErrorExitHandler', '#include <X11/Xlib.h>', [], [x11_dep]],
- ]
-diff --git a/pipewire-jack/src/metadata.c b/pipewire-jack/src/metadata.c
-index 8ccb5a348..d50948ff4 100644
---- a/pipewire-jack/src/metadata.c
-+++ b/pipewire-jack/src/metadata.c
-@@ -120,7 +120,7 @@ static jack_property_t *add_property(jack_description_t *desc, const char *key,
- 
- 	if (desc->property_cnt == desc->property_size) {
- 		ns = desc->property_size > 0 ? desc->property_size * 2 : 8;
--		np = reallocarray(desc->properties, ns, sizeof(*prop));
-+		np = pw_reallocarray(desc->properties, ns, sizeof(*prop));
- 		if (np == NULL)
- 			return NULL;
- 		desc->property_size = ns;
-diff --git a/spa/plugins/bluez5/bluez5-dbus.c b/spa/plugins/bluez5/bluez5-dbus.c
-index 98bf05df1..c2e4a7ba7 100644
---- a/spa/plugins/bluez5/bluez5-dbus.c
-+++ b/spa/plugins/bluez5/bluez5-dbus.c
-@@ -50,6 +50,7 @@
- #include <spa/utils/string.h>
- #include <spa/utils/json.h>
- 
-+#include "config.h"
- #include "codec-loader.h"
- #include "player.h"
- #include "defs.h"
-@@ -1579,7 +1580,11 @@ const struct a2dp_codec **spa_bt_device_get_supported_a2dp_codecs(struct spa_bt_
- 		if (j >= size) {
- 			const struct a2dp_codec **p;
- 			size = size * 2;
-+#ifdef HAVE_REALLOCARRRAY
- 			p = reallocarray(supported_codecs, size, sizeof(const struct a2dp_codec *));
-+#else
-+			p = realloc(supported_codecs, size * sizeof(const struct a2dp_codec *));
-+#endif
- 			if (p == NULL) {
- 				free(supported_codecs);
- 				return NULL;
-diff --git a/src/modules/module-client-node/client-node.c b/src/modules/module-client-node/client-node.c
-index 2533c360c..9357d03da 100644
---- a/src/modules/module-client-node/client-node.c
-+++ b/src/modules/module-client-node/client-node.c
-@@ -191,7 +191,7 @@ static int update_params(struct params *p, uint32_t n_params, const struct spa_p
- 		p->params = NULL;
- 	} else {
- 		struct spa_pod **np;
--		np = reallocarray(p->params, p->n_params, sizeof(struct spa_pod *));
-+		np = pw_reallocarray(p->params, p->n_params, sizeof(struct spa_pod *));
- 		if (np == NULL) {
- 			pw_log_error("%p: can't realloc: %m", p);
- 			free(p->params);
-diff --git a/src/modules/module-client-node/remote-node.c b/src/modules/module-client-node/remote-node.c
-index c04273e95..c0af9a21f 100644
---- a/src/modules/module-client-node/remote-node.c
-+++ b/src/modules/module-client-node/remote-node.c
-@@ -318,7 +318,7 @@ static int add_node_update(struct node_data *data, uint32_t change_mask, uint32_
- 							id, &idx, NULL, &param, &b.b);
- 				if (res == 1) {
- 					void *p;
--					p = reallocarray(params, n_params + 1, sizeof(struct spa_pod *));
-+					p = pw_reallocarray(params, n_params + 1, sizeof(struct spa_pod *));
- 					if (p == NULL) {
- 						res = -errno;
- 						pw_log_error("realloc failed: %m");
-@@ -384,7 +384,7 @@ static int add_port_update(struct node_data *data, struct pw_impl_port *port, ui
- 							id, &idx, NULL, &param, &b.b);
- 				if (res == 1) {
- 					void *p;
--					p = reallocarray(params, n_params + 1, sizeof(struct spa_pod*));
-+					p = pw_reallocarray(params, n_params + 1, sizeof(struct spa_pod*));
- 					if (p == NULL) {
- 						res = -errno;
- 						pw_log_error("realloc failed: %m");
-diff --git a/src/modules/module-client-node/v0/client-node.c b/src/modules/module-client-node/v0/client-node.c
-index e71abbb14..aeb5931c6 100644
---- a/src/modules/module-client-node/v0/client-node.c
-+++ b/src/modules/module-client-node/v0/client-node.c
-@@ -476,7 +476,7 @@ do_update_port(struct node *this,
- 			port->params = NULL;
- 		} else {
- 			void *p;
--			p = reallocarray(port->params, port->n_params, sizeof(struct spa_pod *));
-+			p = pw_reallocarray(port->params, port->n_params, sizeof(struct spa_pod *));
- 			if (p == NULL) {
- 				pw_log_error("%p: port %u can't realloc: %m", this, port_id);
- 				free(port->params);
-@@ -1049,7 +1049,7 @@ client_node0_update(void *data,
- 			this->params = NULL;
- 		} else {
- 			void *p;
--			p = reallocarray(this->params, this->n_params, sizeof(struct spa_pod *));
-+			p = pw_reallocarray(this->params, this->n_params, sizeof(struct spa_pod *));
- 			if (p == NULL) {
- 				pw_log_error("%p: can't realloc: %m", this);
- 				free(this->params);
-diff --git a/src/modules/module-session-manager/client-endpoint/endpoint-stream.c b/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
-index 8d7f2da2b..8dde6f749 100644
---- a/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
-+++ b/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
-@@ -196,7 +196,7 @@ int endpoint_stream_update(struct endpoint_stream *this,
- 			this->params = NULL;
- 		} else {
- 			void *p;
--			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
-+			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
- 			if (p == NULL) {
- 				free(this->params);
- 				this->params = NULL;
-@@ -227,7 +227,7 @@ int endpoint_stream_update(struct endpoint_stream *this,
- 				this->info.params = NULL;
- 			} else {
- 				void *p;
--				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
-+				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
- 				if (p == NULL) {
- 					free(this->info.params);
- 					this->info.params = NULL;
-diff --git a/src/modules/module-session-manager/client-endpoint/endpoint.c b/src/modules/module-session-manager/client-endpoint/endpoint.c
-index 8a7863ee1..aa13989b6 100644
---- a/src/modules/module-session-manager/client-endpoint/endpoint.c
-+++ b/src/modules/module-session-manager/client-endpoint/endpoint.c
-@@ -213,7 +213,7 @@ int endpoint_update(struct endpoint *this,
- 			this->params = NULL;
- 		} else {
- 			void *p;
--			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
-+			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
- 			if (p == NULL) {
- 				free(this->params);
- 				this->params = NULL;
-@@ -245,7 +245,7 @@ int endpoint_update(struct endpoint *this,
- 				this->info.params = NULL;
- 			} else {
- 				void *p;
--				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
-+				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
- 				if (p == NULL) {
- 					free(this->info.params);
- 					this->info.params = NULL;
-diff --git a/src/modules/module-session-manager/client-session/endpoint-link.c b/src/modules/module-session-manager/client-session/endpoint-link.c
-index 9048fe30c..0bdbfc946 100644
---- a/src/modules/module-session-manager/client-session/endpoint-link.c
-+++ b/src/modules/module-session-manager/client-session/endpoint-link.c
-@@ -209,7 +209,7 @@ int endpoint_link_update(struct endpoint_link *this,
- 			this->params = NULL;
- 		} else {
- 			void *p;
--			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
-+			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
- 			if (p == NULL) {
- 				free(this->params);
- 				this->params = NULL;
-@@ -241,7 +241,7 @@ int endpoint_link_update(struct endpoint_link *this,
- 				this->info.params = NULL;
- 			} else {
- 				void *p;
--				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
-+				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
- 				if (p == NULL) {
- 					free(this->info.params);
- 					this->info.params = NULL;
-diff --git a/src/modules/module-session-manager/client-session/session.c b/src/modules/module-session-manager/client-session/session.c
-index 681c56118..87c1b96a7 100644
---- a/src/modules/module-session-manager/client-session/session.c
-+++ b/src/modules/module-session-manager/client-session/session.c
-@@ -196,7 +196,7 @@ int session_update(struct session *this,
- 			this->params = NULL;
- 		} else {
- 			void *p;
--			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
-+			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
- 			if (p == NULL) {
- 				free(this->params);
- 				this->params = NULL;
-@@ -222,7 +222,7 @@ int session_update(struct session *this,
- 				this->info.params = NULL;
- 			} else {
- 				void *p;
--				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
-+				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
- 				if (p == NULL) {
- 					free(this->info.params);
- 					this->info.params = NULL;
-diff --git a/src/pipewire/introspect.c b/src/pipewire/introspect.c
-index 35598a90d..2855009c0 100644
---- a/src/pipewire/introspect.c
-+++ b/src/pipewire/introspect.c
-@@ -213,7 +213,7 @@ struct pw_node_info *pw_node_info_merge(struct pw_node_info *info,
- 		uint32_t i, user, n_params = update->n_params;
- 		void *np;
- 
--		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
-+		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
- 		if (np == NULL) {
- 			free(info->params);
- 			info->params = NULL;
-@@ -283,7 +283,7 @@ struct pw_port_info *pw_port_info_merge(struct pw_port_info *info,
- 		uint32_t i, user, n_params = update->n_params;
- 		void *np;
- 
--		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
-+		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
- 		if (np == NULL) {
- 			free(info->params);
- 			info->params = NULL;
-@@ -443,7 +443,7 @@ struct pw_device_info *pw_device_info_merge(struct pw_device_info *info,
- 		uint32_t i, user, n_params = update->n_params;
- 		void *np;
- 
--		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
-+		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
- 		if (np == NULL) {
- 			free(info->params);
- 			info->params = NULL;
-diff --git a/src/pipewire/utils.c b/src/pipewire/utils.c
-index 2f3240faf..a644049fd 100644
---- a/src/pipewire/utils.c
-+++ b/src/pipewire/utils.c
-@@ -168,3 +168,13 @@ ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags)
- 	close(fd);
- 	return bytes;
- }
-+
-+SPA_EXPORT
-+void* pw_reallocarray(void *ptr, size_t nmemb, size_t size)
-+{
-+#ifdef HAVE_REALLOCARRAY
-+	return reallocarray(ptr, nmemb, size);
-+#else
-+	return realloc(ptr, nmemb * size);
-+#endif
-+}
-diff --git a/src/pipewire/utils.h b/src/pipewire/utils.h
-index 8f8e002b7..b320db22f 100644
---- a/src/pipewire/utils.h
-+++ b/src/pipewire/utils.h
-@@ -88,6 +88,8 @@ pw_strip(char *str, const char *whitespace);
- 
- ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags);
- 
-+void* pw_reallocarray(void *ptr, size_t nmemb, size_t size);
-+
- /**
-  * \}
-  */
--- 
-GitLab
-
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index db618ea9c5..6112c7b5b5 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1820bfd524805ef3e4e4dcb368f26efa5f43ca90f8c3c67731e502268c34245e  pipewire-0.3.51.tar.bz2
+sha256  11b9de7eec5a5735ed1641630019f8cd2691d6200db227c0299497c107d29285  pipewire-0.3.52.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 5495c2749a..9f93437813 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.51
+PIPEWIRE_VERSION = 0.3.52
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -20,6 +20,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dspa-plugins=enabled \
 	-Daudiomixer=enabled \
 	-Daudioconvert=enabled \
+	-Dbluez5-codec-lc3plus=disabled \
 	-Dcontrol=enabled \
 	-Daudiotestsrc=enabled \
 	-Dsupport=enabled \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
