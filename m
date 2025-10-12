Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD688CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 15:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA37607D9;
	Sun, 12 Oct 2025 15:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gB-gSzfunQFM; Sun, 12 Oct 2025 15:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F40160DC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F40160DC0;
	Sun, 12 Oct 2025 15:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 919F712B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7785160DC0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC7RxeMYEvzS for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 15:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C52E9607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52E9607D9
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C52E9607D9
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:21:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so635963666b.0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760282465; x=1760887265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iaLxileauK2XcfAPp2yQE0QOYc4uv4CLgWvWZiG+rU=;
 b=IfB0TuUz/tSiqxr5ypxWhE5DgPa/WAhVOCGBkl3ab+YcIJL1FQtpUfnuZWBiI7Kn0k
 mFx+guosu3YWYc4lhR9BXFX7xuJheFdH5W11C7tIm+2GdIuY/hKUUfpe0zFWKZIlSlSC
 s+QGyFvVnkxskoJCk9pQxHJCufzUAWmFn4xEncBktyT3uJNhdQJuAgGZZmnzfHvCG0G1
 Tjg7ZaCa/oy4mgbe0noh4S91S4FA4CJw0b8Ie7PtFrEIq2rn5ublH6h4+s9OQfKq+5+V
 2uINlBe8b2IQhzvZXiXBSzHgOCcsym2MrCKzlQLqlq/3d4NIFN1w4eY1Tu4ZDTIHu1wG
 bc/g==
X-Gm-Message-State: AOJu0YzDomtM/i4dzPIsyDf6Pt1d9bSauR98wYTkLmFDnXV8XowMIDci
 E/7HmUB/f/+ro2Wu3ietH7twKVI/489du050i7/IpILHSjZ2AJKt5oNa8ZfNZjWWyfRJrV79m0v
 wO4XAVug=
X-Gm-Gg: ASbGncu5s3R6EK7w+EE7QBT/mQjl9yMlg6/rHfJwpnkuElW/7GgS4+tRDYCmSk7BTzL
 DaPhbHuJyHktxQ6+1Lov1SJiKHzlMz9g4GXuXofF3G2+hPnFlHaCIH4s+8LhwzBakqu2Ro7cxzb
 SPQ7LPGBpp1IzmT9nH3Gn1Z1OdhWI/YnpnthMxrH7JVDbsyciuGnMbgYfRByYi6DqhZnjBWRvx/
 H5ito7jYiBlcwkYeDgEr8ebu7mxzvlh4CdmGahzZzpqVr5Vt3x28KQ2YrriCQ1/2gnVAK82ozKh
 fOROvhR53SyU2bivR885cfIRPWLuSH5PL9b6Xjed0gLqjDyuo/DRWmQtLcNK1Dirn3oq3YbseAA
 jcpZ7ulphfaqZhGc50W1CjTcG8J+PBr5ZFsBnB/GOgR6bkFe+j2LaOlD7a3zAkzP+JgnSrJHors
 IIOJFA8cYJ3jcPPaVsJXWJTH2IHF2miwh0k2EcneOu27xd7tAsf3mGCSd14ZJeJBpQRv4ULnELh
 ZQL3CrOQQozoJ6nBrwp
X-Google-Smtp-Source: AGHT+IHnzK4UHwWg5Bwx+fl8ElQMWXulHcu6GFXHbpGKblT+QyhpS3ZUyMk7hz1y7Hn4sucx21Dr+A==
X-Received: by 2002:a17:906:ef05:b0:b4e:d6e3:1670 with SMTP id
 a640c23a62f3a-b50aa48ca83mr1972116166b.11.1760282465441; 
 Sun, 12 Oct 2025 08:21:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d5cad896sm737406066b.1.2025.10.12.08.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 08:21:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 12 Oct 2025 17:20:40 +0200
Message-ID: <20251012152040.2484426-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760282465; x=1760887265;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7iaLxileauK2XcfAPp2yQE0QOYc4uv4CLgWvWZiG+rU=;
 b=pdMnL9mc1JvUTlkCjScRcrLJPZlUEXXBQMpIfj1YB/S/3Ouaivw64PK7QnbjzXOm80
 zGgIyuB86e9H39lIhaxXmCF55QwaiSnPNneeu/wv/BlHvlYmMy5Y2OexbH7IMI0Ygbhr
 UuBdGOn4KoMdiNur2OmWmLmv3I/mw2mEQvKn4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pdMnL9mc
Subject: [Buildroot] [PATCH 1/1] package/gupnp-av: bump to version 0.14.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The removed patch has been merged in version 0.14.2.

Release notes:
https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.2/NEWS
https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.3/NEWS
https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.4/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../gupnp-av/0001-libxml2.11-support.patch    | 41 -------------------
 ...ix-compatibility-with-libxml2-2-12-x.patch | 26 ------------
 package/gupnp-av/gupnp-av.hash                |  4 +-
 package/gupnp-av/gupnp-av.mk                  |  2 +-
 4 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 package/gupnp-av/0001-libxml2.11-support.patch
 delete mode 100644 package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch

diff --git a/package/gupnp-av/0001-libxml2.11-support.patch b/package/gupnp-av/0001-libxml2.11-support.patch
deleted file mode 100644
index 739a8d774bda..000000000000
--- a/package/gupnp-av/0001-libxml2.11-support.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
-From: David Anes <david.anes@suse.com>
-Date: Thu, 4 May 2023 11:54:02 +0200
-Subject: use xmlReadMemory instead of xmlRecoverMemory, as it's been
- deprecated in libxml2 2.11.0
-
-Since version 2.11.0, some private symbols have been removed.
-
-Downloaded from
-https://code.opensuse.org/package/gupnp-av/blob/master/f/gupnp-av-libxml2.11-support.patch
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-av/-/issues/10
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-Index: gupnp-av-0.14.1/libgupnp-av/gupnp-didl-lite-parser.c
-===================================================================
---- gupnp-av-0.14.1.orig/libgupnp-av/gupnp-didl-lite-parser.c
-+++ gupnp-av-0.14.1/libgupnp-av/gupnp-didl-lite-parser.c
-@@ -230,7 +230,7 @@ gupnp_didl_lite_parser_parse_didl_recurs
-         GUPnPAVXMLDoc *xml_doc = NULL;
-         gboolean       result;
- 
--        doc = xmlRecoverMemory (didl, strlen (didl));
-+        doc = xmlReadMemory (didl, strlen (didl), NULL, NULL, XML_PARSE_RECOVER);
-         if (doc == NULL) {
-                 g_set_error (error,
-                              G_MARKUP_ERROR,
-Index: gupnp-av-0.14.1/libgupnp-av/gupnp-feature-list-parser.c
-===================================================================
---- gupnp-av-0.14.1.orig/libgupnp-av/gupnp-feature-list-parser.c
-+++ gupnp-av-0.14.1/libgupnp-av/gupnp-feature-list-parser.c
-@@ -114,7 +114,7 @@ gupnp_feature_list_parser_parse_text
-         xmlNode      *element;
-         GList        *feature_list = NULL;
- 
--        doc = xmlRecoverMemory (text, strlen (text));
-+        doc = xmlReadMemory (text, strlen (text), NULL, NULL, XML_PARSE_RECOVER);
-         if (doc == NULL) {
-                 g_set_error (error,
-                              G_MARKUP_ERROR,
diff --git a/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch b/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch
deleted file mode 100644
index 358098fbc480..000000000000
--- a/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 1e10a41fcef6ae0d3e89958db89bc22398f3b4f1 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sat, 25 Nov 2023 17:58:49 +0100
-Subject: [PATCH] xml: Fix compatibility with libxml2 2.12.x
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-av/-/commit/1e10a41fcef6ae0d3e89958db89bc22398f3b4f1
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libgupnp-av/xml-util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libgupnp-av/xml-util.h b/libgupnp-av/xml-util.h
-index e0e49f7..0bbe0f8 100644
---- a/libgupnp-av/xml-util.h
-+++ b/libgupnp-av/xml-util.h
-@@ -16,6 +16,7 @@
- 
- #include <glib.h>
- #include <libxml/tree.h>
-+#include <libxml/parser.h>
- #include <stdarg.h>
- #include <glib-object.h>
- 
--- 
-GitLab
-
diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index c8ed0db2a485..27f974165ae2 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.1.sha256sum:
-sha256  b79ce0cc4b0c66d9c54bc22183a10e5709a0011d2af272025948efcab33a3e4f  gupnp-av-0.14.1.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.4.sha256sum:
+sha256  21d974b3275cb5dcf5b8aa1d9a3fc80e7edca706935f6fbd004c79787138f8c7  gupnp-av-0.14.4.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 3821c4e170c3..fdc4d7034321 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_AV_VERSION_MAJOR = 0.14
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).1
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).4
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = https://download.gnome.org/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
