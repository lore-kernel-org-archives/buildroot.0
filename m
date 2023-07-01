Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA47DEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F41C60AEC;
	Sat,  1 Jul 2023 19:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F41C60AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdkhL8mCG7La; Sat,  1 Jul 2023 19:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D3060BEF;
	Sat,  1 Jul 2023 19:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D3060BEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FDEE1BF868
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E77403BF
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E77403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpK2JTd8dy0Y for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 19:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F835400C6
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F835400C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF86D861D6; Sat,  1 Jul 2023 19:51:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 21:51:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c7d497f414210688130054cf78c949b4a1a8d82
X-Git-Newrev: 4f9ce6dbf6c76398d5d1e4e8cc3b883e83d55394
X-Patchwork-Hint: ignore
Message-Id: <20230701195147.EF86D861D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp: fix build with newer
 versions of libxml2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f9ce6dbf6c76398d5d1e4e8cc3b883e83d55394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b26/b267c4137edebc504757b6275824c748cce3d894/

libxml2 deprecated the function xmlRecoverMemory with commit
https://github.com/GNOME/libxml2/commit/51035c539edf67de93ced3cf037bb1f2b298e526
first included in versions 2.11.0. Buildroot bumped libxml2 to the 2.11
branch with commit dfe1ca7872a45bcdc825ff0900d7fd929097a635.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
