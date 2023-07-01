Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCA2EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 18:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2422941681;
	Sat,  1 Jul 2023 18:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2422941681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UzbY_WmbUsQ; Sat,  1 Jul 2023 18:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D048D417C3;
	Sat,  1 Jul 2023 18:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D048D417C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 165C11BF329
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F06FE60C19
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F06FE60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dm186zUJaryO for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 18:07:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A385C60AE9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A385C60AE9
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 18:07:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EFFCA4C00BC;
 Sat,  1 Jul 2023 20:06:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57008)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFezn-0008Kn-1O;
 Sat, 01 Jul 2023 20:06:55 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Jul 2023 20:06:55 +0200
Message-Id: <20230701180655.4192877-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688234816;
 bh=wpJOyoQsxiQYq/z2mO4GUL3CyIdMwYOdJR7dYtODs/8=;
 h=From:To:Cc:Subject:Date:From;
 b=RhEw09yEvhG2t1ZoqmVauk78q6kSvxzKPnVcyuKRaqBbKY0VDnbe7k3XFQsp43q8c
 PvFfshGeGDbt7TozMzUNlmoIZfDhhr1BuJrPVj0jdPsdtE3w2WkcMYfz54MLJL9O+I
 E6X6tnQPqUJxMKripn38eX5Ag0GwU1fXiC5D1tqf8JBy7a67P60xNhPhWMxjfIrGs5
 ZU3Z+tRmmDc0jl6vVp+Fapne7BuuGCTrzMY8gpyXVJ7LFs9033KeAUdvq9WMGEYKTd
 qDwGhnHkYl5p51gUDLnui0Caglt+n6s2O/kKXFXiTZiRt1+ISIPSLFX+zZ5G1Hlru2
 w3aOk7QBqirBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RhEw09yE
Subject: [Buildroot] [PATCH 1/1] package/gupnp: fix build with newer
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/b26/b267c4137edebc504757b6275824c748cce3d894/

libxml2 deprecated the function xmlRecoverMemory with commit
https://github.com/GNOME/libxml2/commit/51035c539edf67de93ced3cf037bb1f2b298e526
first included in versions 2.11.0. Buildroot bumped libxml2 to the 2.11
branch with commit dfe1ca7872a45bcdc825ff0900d7fd929097a635.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-all-Drop-xmlRecoverMemory.patch      | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 package/gupnp/0001-all-Drop-xmlRecoverMemory.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
