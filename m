Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A7EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 14:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C0441B96;
	Fri, 16 Dec 2022 14:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C0441B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It-tPkjsy9hV; Fri, 16 Dec 2022 14:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121C841BC4;
	Fri, 16 Dec 2022 14:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121C841BC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5105E1BF973
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39BF28211B
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39BF28211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dhu7WbAm-I7E for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 14:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 003F88211F
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 003F88211F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1EE986773; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 15:21:28 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e3e8ebd7d7a1fa4a1557736ae6f92d1a9903b624
X-Git-Newrev: 2d32b043a60c1a4400e90d7127fdf66a84e6b322
X-Patchwork-Hint: ignore
Message-Id: <20221216142239.E1EE986773@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/connman: fix
 CVE-2022-3229{2, 3}
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d32b043a60c1a4400e90d7127fdf66a84e6b322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-32292: In ConnMan through 1.41, remote attackers able to
send HTTP requests to the gweb component are able to exploit a
heap-based buffer overflow in received_data to execute code.

Fix CVE-2022-32293: In ConnMan through 1.41, a man-in-the-middle attack
against a WISPR HTTP query could be used to trigger a use-after-free in
WISPR handling, leading to crashes or code execution.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2f2b4c80f44ac0da88fc087017d495e627131350)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-gweb-Fix-OOB-write-in-received_data.patch |  36 +++++
 ...r-Add-reference-counter-to-portal-context.patch | 142 +++++++++++++++++
 ...03-wispr-Update-portal-context-references.patch | 175 +++++++++++++++++++++
 package/connman/connman.mk                         |   7 +
 4 files changed, 360 insertions(+)

diff --git a/package/connman/0001-gweb-Fix-OOB-write-in-received_data.patch b/package/connman/0001-gweb-Fix-OOB-write-in-received_data.patch
new file mode 100644
index 0000000000..d1a9d8f8fe
--- /dev/null
+++ b/package/connman/0001-gweb-Fix-OOB-write-in-received_data.patch
@@ -0,0 +1,36 @@
+From d1a5ede5d255bde8ef707f8441b997563b9312bd Mon Sep 17 00:00:00 2001
+From: Nathan Crandall <ncrandall@tesla.com>
+Date: Tue, 12 Jul 2022 08:56:34 +0200
+Subject: gweb: Fix OOB write in received_data()
+
+There is a mismatch of handling binary vs. C-string data with memchr
+and strlen, resulting in pos, count, and bytes_read to become out of
+sync and result in a heap overflow.  Instead, do not treat the buffer
+as an ASCII C-string. We calculate the count based on the return value
+of memchr, instead of strlen.
+
+Fixes: CVE-2022-32292
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d1a5ede5d255bde8ef707f8441b997563b9312bd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gweb/gweb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gweb/gweb.c b/gweb/gweb.c
+index 12fcb1d8..13c6c5f2 100644
+--- a/gweb/gweb.c
++++ b/gweb/gweb.c
+@@ -918,7 +918,7 @@ static gboolean received_data(GIOChannel *channel, GIOCondition cond,
+ 		}
+ 
+ 		*pos = '\0';
+-		count = strlen((char *) ptr);
++		count = pos - ptr;
+ 		if (count > 0 && ptr[count - 1] == '\r') {
+ 			ptr[--count] = '\0';
+ 			bytes_read--;
+-- 
+cgit 
+
diff --git a/package/connman/0002-wispr-Add-reference-counter-to-portal-context.patch b/package/connman/0002-wispr-Add-reference-counter-to-portal-context.patch
new file mode 100644
index 0000000000..c2cebdfdcc
--- /dev/null
+++ b/package/connman/0002-wispr-Add-reference-counter-to-portal-context.patch
@@ -0,0 +1,142 @@
+From 72343929836de80727a27d6744c869dff045757c Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 5 Jul 2022 08:32:12 +0200
+Subject: wispr: Add reference counter to portal context
+
+Track the connman_wispr_portal_context live time via a
+refcounter. This only adds the infrastructure to do proper reference
+counting.
+
+Fixes: CVE-2022-32293
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/wispr.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 42 insertions(+), 10 deletions(-)
+
+diff --git a/src/wispr.c b/src/wispr.c
+index a07896ca..bde7e63b 100644
+--- a/src/wispr.c
++++ b/src/wispr.c
+@@ -56,6 +56,7 @@ struct wispr_route {
+ };
+ 
+ struct connman_wispr_portal_context {
++	int refcount;
+ 	struct connman_service *service;
+ 	enum connman_ipconfig_type type;
+ 	struct connman_wispr_portal *wispr_portal;
+@@ -97,6 +98,11 @@ static char *online_check_ipv4_url = NULL;
+ static char *online_check_ipv6_url = NULL;
+ static bool enable_online_to_ready_transition = false;
+ 
++#define wispr_portal_context_ref(wp_context) \
++	wispr_portal_context_ref_debug(wp_context, __FILE__, __LINE__, __func__)
++#define wispr_portal_context_unref(wp_context) \
++	wispr_portal_context_unref_debug(wp_context, __FILE__, __LINE__, __func__)
++
+ static void connman_wispr_message_init(struct connman_wispr_message *msg)
+ {
+ 	DBG("");
+@@ -162,9 +168,6 @@ static void free_connman_wispr_portal_context(
+ {
+ 	DBG("context %p", wp_context);
+ 
+-	if (!wp_context)
+-		return;
+-
+ 	if (wp_context->wispr_portal) {
+ 		if (wp_context->wispr_portal->ipv4_context == wp_context)
+ 			wp_context->wispr_portal->ipv4_context = NULL;
+@@ -201,9 +204,38 @@ static void free_connman_wispr_portal_context(
+ 	g_free(wp_context);
+ }
+ 
++static struct connman_wispr_portal_context *
++wispr_portal_context_ref_debug(struct connman_wispr_portal_context *wp_context,
++			const char *file, int line, const char *caller)
++{
++	DBG("%p ref %d by %s:%d:%s()", wp_context,
++		wp_context->refcount + 1, file, line, caller);
++
++	__sync_fetch_and_add(&wp_context->refcount, 1);
++
++	return wp_context;
++}
++
++static void wispr_portal_context_unref_debug(
++		struct connman_wispr_portal_context *wp_context,
++		const char *file, int line, const char *caller)
++{
++	if (!wp_context)
++		return;
++
++	DBG("%p ref %d by %s:%d:%s()", wp_context,
++		wp_context->refcount - 1, file, line, caller);
++
++	if (__sync_fetch_and_sub(&wp_context->refcount, 1) != 1)
++		return;
++
++	free_connman_wispr_portal_context(wp_context);
++}
++
+ static struct connman_wispr_portal_context *create_wispr_portal_context(void)
+ {
+-	return g_try_new0(struct connman_wispr_portal_context, 1);
++	return wispr_portal_context_ref(
++		g_new0(struct connman_wispr_portal_context, 1));
+ }
+ 
+ static void free_connman_wispr_portal(gpointer data)
+@@ -215,8 +247,8 @@ static void free_connman_wispr_portal(gpointer data)
+ 	if (!wispr_portal)
+ 		return;
+ 
+-	free_connman_wispr_portal_context(wispr_portal->ipv4_context);
+-	free_connman_wispr_portal_context(wispr_portal->ipv6_context);
++	wispr_portal_context_unref(wispr_portal->ipv4_context);
++	wispr_portal_context_unref(wispr_portal->ipv6_context);
+ 
+ 	g_free(wispr_portal);
+ }
+@@ -452,7 +484,7 @@ static void portal_manage_status(GWebResult *result,
+ 		connman_info("Client-Timezone: %s", str);
+ 
+ 	if (!enable_online_to_ready_transition)
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 
+ 	__connman_service_ipconfig_indicate_state(service,
+ 					CONNMAN_SERVICE_STATE_ONLINE, type);
+@@ -616,7 +648,7 @@ static void wispr_portal_request_wispr_login(struct connman_service *service,
+ 				return;
+ 		}
+ 
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 		return;
+ 	}
+ 
+@@ -952,7 +984,7 @@ static int wispr_portal_detect(struct connman_wispr_portal_context *wp_context)
+ 
+ 		if (wp_context->token == 0) {
+ 			err = -EINVAL;
+-			free_connman_wispr_portal_context(wp_context);
++			wispr_portal_context_unref(wp_context);
+ 		}
+ 	} else if (wp_context->timeout == 0) {
+ 		wp_context->timeout = g_idle_add(no_proxy_callback, wp_context);
+@@ -1001,7 +1033,7 @@ int __connman_wispr_start(struct connman_service *service,
+ 
+ 	/* If there is already an existing context, we wipe it */
+ 	if (wp_context)
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 
+ 	wp_context = create_wispr_portal_context();
+ 	if (!wp_context)
+-- 
+cgit 
+
diff --git a/package/connman/0003-wispr-Update-portal-context-references.patch b/package/connman/0003-wispr-Update-portal-context-references.patch
new file mode 100644
index 0000000000..61c4e21f94
--- /dev/null
+++ b/package/connman/0003-wispr-Update-portal-context-references.patch
@@ -0,0 +1,175 @@
+From 416bfaff988882c553c672e5bfc2d4f648d29e8a Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 5 Jul 2022 09:11:09 +0200
+Subject: wispr: Update portal context references
+
+Maintain proper portal context references to avoid UAF.
+
+Fixes: CVE-2022-32293
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=416bfaff988882c553c672e5bfc2d4f648d29e8a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/wispr.c | 34 ++++++++++++++++++++++------------
+ 1 file changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/src/wispr.c b/src/wispr.c
+index bde7e63b..84bed33f 100644
+--- a/src/wispr.c
++++ b/src/wispr.c
+@@ -105,8 +105,6 @@ static bool enable_online_to_ready_transition = false;
+ 
+ static void connman_wispr_message_init(struct connman_wispr_message *msg)
+ {
+-	DBG("");
+-
+ 	msg->has_error = false;
+ 	msg->current_element = NULL;
+ 
+@@ -166,8 +164,6 @@ static void free_wispr_routes(struct connman_wispr_portal_context *wp_context)
+ static void free_connman_wispr_portal_context(
+ 		struct connman_wispr_portal_context *wp_context)
+ {
+-	DBG("context %p", wp_context);
+-
+ 	if (wp_context->wispr_portal) {
+ 		if (wp_context->wispr_portal->ipv4_context == wp_context)
+ 			wp_context->wispr_portal->ipv4_context = NULL;
+@@ -483,9 +479,6 @@ static void portal_manage_status(GWebResult *result,
+ 				&str))
+ 		connman_info("Client-Timezone: %s", str);
+ 
+-	if (!enable_online_to_ready_transition)
+-		wispr_portal_context_unref(wp_context);
+-
+ 	__connman_service_ipconfig_indicate_state(service,
+ 					CONNMAN_SERVICE_STATE_ONLINE, type);
+ 
+@@ -546,14 +539,17 @@ static void wispr_portal_request_portal(
+ {
+ 	DBG("");
+ 
++	wispr_portal_context_ref(wp_context);
+ 	wp_context->request_id = g_web_request_get(wp_context->web,
+ 					wp_context->status_url,
+ 					wispr_portal_web_result,
+ 					wispr_route_request,
+ 					wp_context);
+ 
+-	if (wp_context->request_id == 0)
++	if (wp_context->request_id == 0) {
+ 		wispr_portal_error(wp_context);
++		wispr_portal_context_unref(wp_context);
++	}
+ }
+ 
+ static bool wispr_input(const guint8 **data, gsize *length,
+@@ -618,13 +614,15 @@ static void wispr_portal_browser_reply_cb(struct connman_service *service,
+ 		return;
+ 
+ 	if (!authentication_done) {
+-		wispr_portal_error(wp_context);
+ 		free_wispr_routes(wp_context);
++		wispr_portal_error(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 		return;
+ 	}
+ 
+ 	/* Restarting the test */
+ 	__connman_service_wispr_start(service, wp_context->type);
++	wispr_portal_context_unref(wp_context);
+ }
+ 
+ static void wispr_portal_request_wispr_login(struct connman_service *service,
+@@ -700,11 +698,13 @@ static bool wispr_manage_message(GWebResult *result,
+ 
+ 		wp_context->wispr_result = CONNMAN_WISPR_RESULT_LOGIN;
+ 
++		wispr_portal_context_ref(wp_context);
+ 		if (__connman_agent_request_login_input(wp_context->service,
+ 					wispr_portal_request_wispr_login,
+-					wp_context) != -EINPROGRESS)
++					wp_context) != -EINPROGRESS) {
+ 			wispr_portal_error(wp_context);
+-		else
++			wispr_portal_context_unref(wp_context);
++		} else
+ 			return true;
+ 
+ 		break;
+@@ -753,6 +753,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 		if (length > 0) {
+ 			g_web_parser_feed_data(wp_context->wispr_parser,
+ 								chunk, length);
++			wispr_portal_context_unref(wp_context);
+ 			return true;
+ 		}
+ 
+@@ -770,6 +771,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 	switch (status) {
+ 	case 000:
++		wispr_portal_context_ref(wp_context);
+ 		__connman_agent_request_browser(wp_context->service,
+ 				wispr_portal_browser_reply_cb,
+ 				wp_context->status_url, wp_context);
+@@ -781,11 +783,14 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 		if (g_web_result_get_header(result, "X-ConnMan-Status",
+ 						&str)) {
+ 			portal_manage_status(result, wp_context);
++			wispr_portal_context_unref(wp_context);
+ 			return false;
+-		} else
++		} else {
++			wispr_portal_context_ref(wp_context);
+ 			__connman_agent_request_browser(wp_context->service,
+ 					wispr_portal_browser_reply_cb,
+ 					wp_context->redirect_url, wp_context);
++		}
+ 
+ 		break;
+ 	case 300:
+@@ -798,6 +803,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 			!g_web_result_get_header(result, "Location",
+ 							&redirect)) {
+ 
++			wispr_portal_context_ref(wp_context);
+ 			__connman_agent_request_browser(wp_context->service,
+ 					wispr_portal_browser_reply_cb,
+ 					wp_context->status_url, wp_context);
+@@ -808,6 +814,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 		wp_context->redirect_url = g_strdup(redirect);
+ 
++		wispr_portal_context_ref(wp_context);
+ 		wp_context->request_id = g_web_request_get(wp_context->web,
+ 				redirect, wispr_portal_web_result,
+ 				wispr_route_request, wp_context);
+@@ -820,6 +827,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 		break;
+ 	case 505:
++		wispr_portal_context_ref(wp_context);
+ 		__connman_agent_request_browser(wp_context->service,
+ 				wispr_portal_browser_reply_cb,
+ 				wp_context->status_url, wp_context);
+@@ -832,6 +840,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 	wp_context->request_id = 0;
+ done:
+ 	wp_context->wispr_msg.message_type = -1;
++	wispr_portal_context_unref(wp_context);
+ 	return false;
+ }
+ 
+@@ -890,6 +899,7 @@ static void proxy_callback(const char *proxy, void *user_data)
+ 					xml_wispr_parser_callback, wp_context);
+ 
+ 	wispr_portal_request_portal(wp_context);
++	wispr_portal_context_unref(wp_context);
+ }
+ 
+ static gboolean no_proxy_callback(gpointer user_data)
+-- 
+cgit 
+
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index a76a339e6f..fbd7318e4e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -13,6 +13,13 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CPE_ID_VENDOR = intel
 
+# 0001-gweb-Fix-OOB-write-in-received_data.patch
+CONNMAN_IGNORE_CVES += CVE-2022-32292
+
+# 0002-wispr-Add-reference-counter-to-portal-context.patch
+# 0003-wispr-Update-portal-context-references.patch
+CONNMAN_IGNORE_CVES += CVE-2022-32293
+
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
