Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B67C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4678160D63;
	Mon,  6 Dec 2021 18:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bv-5g-PmmQJt; Mon,  6 Dec 2021 18:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1E960D60;
	Mon,  6 Dec 2021 18:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54C201BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CADC041C28
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLFQWbWQxXHT for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC26941C16
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6529281061; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:15:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b35be2baf2cb3039baa047c6c00715df4aa18cc4
X-Git-Newrev: e87da5514c81a87736e3b8fc6dc1bc5077e4765c
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.6529281061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup: add gssapi support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e87da5514c81a87736e3b8fc6dc1bc5077e4765c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup/libsoup.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index a8b4cf12bb..1a26714992 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -25,7 +25,6 @@ LIBSOUP_DEPENDENCIES = \
 LIBSOUP_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 LIBSOUP_CONF_OPTS = \
-	-Dgssapi=disabled \
 	-Dgtk_doc=false \
 	-Dntlm=disabled \
 	-Dsysprof=disabled \
@@ -47,6 +46,15 @@ else
 LIBSOUP_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+LIBSOUP_CONF_OPTS += \
+	-Dgssapi=enabled \
+	-Dkrb5_config=$(STAGING_DIR)/usr/bin/krb5-config
+LIBSOUP_DEPENDENCIES += libkrb5
+else
+LIBSOUP_CONF_OPTS += -Dgssapi=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
 LIBSOUP_CONF_OPTS += -Dgnome=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
