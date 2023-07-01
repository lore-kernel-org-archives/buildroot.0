Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA37EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 18:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99552408BC;
	Sat,  1 Jul 2023 18:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99552408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BM_11OCGmqO5; Sat,  1 Jul 2023 18:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65261408D0;
	Sat,  1 Jul 2023 18:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65261408D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41E9B1BF329
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2866D4019D
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2866D4019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZ0nbA1oD2ps for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 18:18:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EEFD4011A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EEFD4011A
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 18:18:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E445BA4C00BC;
 Sat,  1 Jul 2023 20:18:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53234)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFfB1-0001tP-29;
 Sat, 01 Jul 2023 20:18:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Jul 2023 20:18:31 +0200
Message-Id: <20230701181831.286894-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688235511;
 bh=7FUGkkWlmPN1+7Mk5P7OOlSTj/a+lR7YpWZ+SneheEs=;
 h=From:To:Cc:Subject:Date:From;
 b=nagDnSTJrk3qMpE0h2jFQ29KvA1HsmzFagU4pnUmi7v5AQkbHsL+MNH4fVQ3Hq9nU
 3KB7ZnG00Pq4dM7vlCOxmq4Xp1YJ+dWthDrqiQ2iooy/DknuFeCRrss1dyJkeuYveW
 Nw3tSkP3pJ8MZbm0o7T8TNYUbvbddOcTPeX3otTr2Cw5fTgtwGRzgcyXZStqVCpiux
 /KwXSdvbppeVWK/tt7aahL5N4UTkuRDQs6KrwgMqysF/E678NlKxXqTUcF/nK1sTjx
 yx7wVS8a+AZVWu3ry0ECSvfNBvWQhs88X/tJceTVXVNONp/O5otYt3Wrk/URDQByGB
 FUDWkmBWry+XQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nagDnSTJ
Subject: [Buildroot] [PATCH 1/1] package/gupnp-av: fix build with newer
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../gupnp-av/0001-libxml2.11-support.patch    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/gupnp-av/0001-libxml2.11-support.patch

diff --git a/package/gupnp-av/0001-libxml2.11-support.patch b/package/gupnp-av/0001-libxml2.11-support.patch
new file mode 100644
index 0000000000..739a8d774b
--- /dev/null
+++ b/package/gupnp-av/0001-libxml2.11-support.patch
@@ -0,0 +1,41 @@
+From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
+From: David Anes <david.anes@suse.com>
+Date: Thu, 4 May 2023 11:54:02 +0200
+Subject: use xmlReadMemory instead of xmlRecoverMemory, as it's been
+ deprecated in libxml2 2.11.0
+
+Since version 2.11.0, some private symbols have been removed.
+
+Downloaded from
+https://code.opensuse.org/package/gupnp-av/blob/master/f/gupnp-av-libxml2.11-support.patch
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-av/-/issues/10
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+Index: gupnp-av-0.14.1/libgupnp-av/gupnp-didl-lite-parser.c
+===================================================================
+--- gupnp-av-0.14.1.orig/libgupnp-av/gupnp-didl-lite-parser.c
++++ gupnp-av-0.14.1/libgupnp-av/gupnp-didl-lite-parser.c
+@@ -230,7 +230,7 @@ gupnp_didl_lite_parser_parse_didl_recurs
+         GUPnPAVXMLDoc *xml_doc = NULL;
+         gboolean       result;
+ 
+-        doc = xmlRecoverMemory (didl, strlen (didl));
++        doc = xmlReadMemory (didl, strlen (didl), NULL, NULL, XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 g_set_error (error,
+                              G_MARKUP_ERROR,
+Index: gupnp-av-0.14.1/libgupnp-av/gupnp-feature-list-parser.c
+===================================================================
+--- gupnp-av-0.14.1.orig/libgupnp-av/gupnp-feature-list-parser.c
++++ gupnp-av-0.14.1/libgupnp-av/gupnp-feature-list-parser.c
+@@ -114,7 +114,7 @@ gupnp_feature_list_parser_parse_text
+         xmlNode      *element;
+         GList        *feature_list = NULL;
+ 
+-        doc = xmlRecoverMemory (text, strlen (text));
++        doc = xmlReadMemory (text, strlen (text), NULL, NULL, XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 g_set_error (error,
+                              G_MARKUP_ERROR,
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
