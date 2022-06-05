Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB40C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A135341A62;
	Sun,  5 Jun 2022 20:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvkfak2BcbGG; Sun,  5 Jun 2022 20:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F210A41A4B;
	Sun,  5 Jun 2022 20:24:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBB421BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D98A084057
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AaQ3KLrfwdL4 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A5858401D
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9914C86BCA; Sun,  5 Jun 2022 20:13:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 22:24:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3a6c130754d80005d3212ea7426599fe3a679ad6
X-Git-Newrev: 9e59c4ab3883b4dc8b3a9b269524e62415780966
X-Patchwork-Hint: ignore
Message-Id: <20220605201306.9914C86BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rauc: add option to
 enable/disable streaming support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e59c4ab3883b4dc8b3a9b269524e62415780966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

RAUC 1.7 introduces streaming update support. Make this configurable
and add required dependency to libnl.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/Config.in | 10 ++++++++++
 package/rauc/rauc.mk   |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 1170e50845..7451b29a55 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -40,6 +40,16 @@ config BR2_PACKAGE_RAUC_NETWORK
 	  This option enables support for updating firmware over
 	  the network using libcurl.
 
+if BR2_PACKAGE_RAUC_NETWORK
+
+config BR2_PACKAGE_RAUC_STREAMING
+	bool "streaming update support"
+	select BR2_PACKAGE_LIBNL
+	help
+	  This option enables support for streaming update mode.
+
+endif
+
 config BR2_PACKAGE_RAUC_JSON
 	bool "JSON output support"
 	select BR2_PACKAGE_JSON_GLIB
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 90b2317d4b..8bfb0b79ba 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -52,6 +52,13 @@ else
 RAUC_CONF_OPTS += --disable-json
 endif
 
+ifeq ($(BR2_PACKAGE_RAUC_STREAMING),y)
+RAUC_CONF_OPTS += --enable-streaming
+RAUC_DEPENDENCIES += libnl
+else
+RAUC_CONF_OPTS += --disable-streaming
+endif
+
 HOST_RAUC_DEPENDENCIES = \
 	host-pkgconf \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
