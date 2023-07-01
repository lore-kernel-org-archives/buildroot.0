Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBBDEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 19:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AEC660BEE;
	Sat,  1 Jul 2023 19:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEC660BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJ7aVSbNJuz2; Sat,  1 Jul 2023 19:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 340C960BE3;
	Sat,  1 Jul 2023 19:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 340C960BE3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3EF1BF86C
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F61F41713
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F61F41713
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ayn1rE4hAch for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 19:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 184B541711
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 184B541711
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04DF1861D8; Sat,  1 Jul 2023 19:51:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 21:51:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f9ce6dbf6c76398d5d1e4e8cc3b883e83d55394
X-Git-Newrev: d8f81062d3c4bb9894b408ec28d9de3bbe2143f4
X-Patchwork-Hint: ignore
Message-Id: <20230701195148.04DF1861D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-av: fix build with newer
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8f81062d3c4bb9894b408ec28d9de3bbe2143f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gupnp-av/0001-libxml2.11-support.patch | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
