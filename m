Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130C8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFB6481B84;
	Mon, 20 Dec 2021 22:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DApL9n31zieK; Mon, 20 Dec 2021 22:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200E881B69;
	Mon, 20 Dec 2021 22:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDA1D1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AFBB409B4
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lw8KVvEgpFqh for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D39CD40129
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C6FCB8289B; Mon, 20 Dec 2021 22:36:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:05:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a947133abd44eb297a63e2605b77658ca93ccc6
X-Git-Newrev: a42caa7a23091919c01dacb84df8dd2301e6b0b1
X-Patchwork-Hint: ignore
Message-Id: <20211220223640.C6FCB8289B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-dlna: add introspection
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=a42caa7a23091919c01dacb84df8dd2301e6b0b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- introspection support is needed to build latest rygel version
- build vala bindings to avoid a build failure as already done in other
  packages such as gssdp in commit
  d513e55930eda15a5fb15e00c1da774e6c18f66c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gupnp-dlna/gupnp-dlna.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 85d30b7cd2..dd548e3e2d 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -15,9 +15,14 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-GUPNP_DLNA_CONF_OPTS = \
-	--disable-introspection \
-	--disable-legacy-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
+else
+GUPNP_DLNA_CONF_OPTS += --disable-introspection
+endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
