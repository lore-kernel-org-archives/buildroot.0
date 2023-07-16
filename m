Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA54EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F25940185;
	Sun, 16 Jul 2023 16:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F25940185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DU0tvyVsmrNc; Sun, 16 Jul 2023 16:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FD4400FF;
	Sun, 16 Jul 2023 16:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FD4400FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1DF1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98BE40908
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D98BE40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvUY9N2bFr0v for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAC7E408E6
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC7E408E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B636D86E88; Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:16:59 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: d7af75764a043180f0487a58ec3f34d116e33973
X-Git-Newrev: 76dd7489f23d96f739116c5cf9a425d20a76d57b
X-Patchwork-Hint: ignore
Message-Id: <20230716162141.B636D86E88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gupnp: fix build
 with newer versions of libxml2
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

commit: https://git.buildroot.net/buildroot/commit/?id=76dd7489f23d96f739116c5cf9a425d20a76d57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/b26/b267c4137edebc504757b6275824c748cce3d894/

libxml2 deprecated the function xmlRecoverMemory with commit
https://github.com/GNOME/libxml2/commit/51035c539edf67de93ced3cf037bb1f2b298e526
first included in versions 2.11.0. Buildroot bumped libxml2 to the 2.11
branch with commit dfe1ca7872a45bcdc825ff0900d7fd929097a635.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f9ce6dbf6c76398d5d1e4e8cc3b883e83d55394)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp/0001-all-Drop-xmlRecoverMemory.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/package/gupnp/0001-all-Drop-xmlRecoverMemory.patch b/package/gupnp/0001-all-Drop-xmlRecoverMemory.patch
new file mode 100644
index 0000000000..46e09c267e
--- /dev/null
+++ b/package/gupnp/0001-all-Drop-xmlRecoverMemory.patch
@@ -0,0 +1,113 @@
+From c3d084736cca81dd4ec05f7e4b634050eb6e8525 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Thu, 4 May 2023 19:14:29 +0200
+Subject: [PATCH] all: Drop xmlRecoverMemory
+
+use xmlReadMemory, also use NONET flat
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to branch gupnp-1.4]
+---
+ libgupnp/gupnp-control-point.c        | 7 +++++--
+ libgupnp/gupnp-service-info.c         | 8 ++++++--
+ libgupnp/gupnp-service-proxy-action.c | 7 +++++--
+ libgupnp/gupnp-service-proxy.c        | 7 +++++--
+ libgupnp/gupnp-service.c              | 7 +++++--
+ 5 files changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-point.c
+index deb4b42..17c485a 100644
+--- a/libgupnp/gupnp-control-point.c
++++ b/libgupnp/gupnp-control-point.c
+@@ -613,8 +613,11 @@ got_description_url (SoupSession           *session,
+                 xmlDoc *xml_doc;
+ 
+                 /* Parse response */
+-                xml_doc = xmlRecoverMemory (msg->response_body->data,
+-                                            msg->response_body->length);
++                xml_doc = xmlReadMemory (msg->response_body->data,
++                                         msg->response_body->length,
++                                         NULL,
++                                         NULL,
++                                         XML_PARSE_NONET | XML_PARSE_RECOVER);
+                 if (xml_doc) {
+                         doc = gupnp_xml_doc_new (xml_doc);
+ 
+diff --git a/libgupnp/gupnp-service-info.c b/libgupnp/gupnp-service-info.c
+index 9a9f4de..1c7489e 100644
+--- a/libgupnp/gupnp-service-info.c
++++ b/libgupnp/gupnp-service-info.c
+@@ -592,8 +592,12 @@ got_scpd_url (G_GNUC_UNUSED SoupSession *session,
+         if (SOUP_STATUS_IS_SUCCESSFUL (msg->status_code)) {
+                 xmlDoc *scpd;
+ 
+-                scpd = xmlRecoverMemory (msg->response_body->data,
+-                                         msg->response_body->length);
++                scpd = xmlReadMemory (msg->response_body->data,
++                                      msg->response_body->length,
++                                      NULL,
++                                      NULL,
++                                      XML_PARSE_NONET | XML_PARSE_RECOVER);
++
+                 if (scpd) {
+                         introspection = gupnp_service_introspection_new (scpd);
+ 
+diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-service-proxy-action.c
+index f089152..079219f 100644
+--- a/libgupnp/gupnp-service-proxy-action.c
++++ b/libgupnp/gupnp-service-proxy-action.c
+@@ -87,8 +87,11 @@ check_action_response (G_GNUC_UNUSED GUPnPServiceProxy *proxy,
+         }
+ 
+         /* Parse response */
+-        response = xmlRecoverMemory (action->msg->response_body->data,
+-                                     action->msg->response_body->length);
++        response = xmlReadMemory (action->msg->response_body->data,
++                                  action->msg->response_body->length,
++                                  NULL,
++                                  NULL,
++                                  XML_PARSE_NONET | XML_PARSE_RECOVER);
+ 
+         if (!response) {
+                 if (action->msg->status_code == SOUP_STATUS_OK) {
+diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-proxy.c
+index 5dd1bfc..eed9882 100644
+--- a/libgupnp/gupnp-service-proxy.c
++++ b/libgupnp/gupnp-service-proxy.c
+@@ -1561,8 +1561,11 @@ server_handler (G_GNUC_UNUSED SoupServer        *soup_server,
+         }
+ 
+         /* Parse the actual XML message content */
+-        doc = xmlRecoverMemory (msg->request_body->data,
+-                                msg->request_body->length);
++        doc = xmlReadMemory (msg->request_body->data,
++                             msg->request_body->length,
++                             NULL,
++                             NULL,
++                             XML_PARSE_NONET | XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 /* Failed */
+                 g_warning ("Failed to parse NOTIFY message body");
+diff --git a/libgupnp/gupnp-service.c b/libgupnp/gupnp-service.c
+index 2794ebc..e82daaa 100644
+--- a/libgupnp/gupnp-service.c
++++ b/libgupnp/gupnp-service.c
+@@ -1002,8 +1002,11 @@ control_server_handler (SoupServer                      *server,
+                 *end = '\0';
+ 
+         /* Parse action_node */
+-        doc = xmlRecoverMemory (msg->request_body->data,
+-                                msg->request_body->length);
++        doc = xmlReadMemory (msg->request_body->data,
++                             msg->request_body->length,
++                             NULL,
++                             NULL,
++                             XML_PARSE_NONET | XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 soup_message_set_status (msg, SOUP_STATUS_BAD_REQUEST);
+ 
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
