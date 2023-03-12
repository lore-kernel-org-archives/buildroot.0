Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613E9C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F6641C68;
	Sun, 12 Mar 2023 22:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F6641C68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wo4Jjz_U46lh; Sun, 12 Mar 2023 22:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8CEC409AC;
	Sun, 12 Mar 2023 22:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8CEC409AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24DA91BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F419440106
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F419440106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zK5RpV9fvjg7 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:06:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FD3740522
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD3740522
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D88887012; Sun, 12 Mar 2023 22:06:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:06:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c5ac7e0344ad858642955e571d9be547e7a146a
X-Git-Newrev: 835858d79d554bc4753e8a691ae42f3162c88608
X-Patchwork-Hint: ignore
Message-Id: <20230312220625.1D88887012@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: switch to meson build
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

commit: https://git.buildroot.net/buildroot/commit/?id=835858d79d554bc4753e8a691ae42f3162c88608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.mk | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 2baa25ec9e..4168d6c2db 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -11,9 +11,10 @@ RAUC_LICENSE = LGPL-2.1
 RAUC_LICENSE_FILES = COPYING
 RAUC_CPE_ID_VENDOR = pengutronix
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
+RAUC_CONF_OPTS += -Dtests=false
 
 ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
-RAUC_CONF_OPTS += --enable-service
+RAUC_CONF_OPTS += -Dservice=true
 RAUC_DEPENDENCIES += dbus
 
 # systemd service uses dbus interface
@@ -28,35 +29,35 @@ endef
 endif
 
 else
-RAUC_CONF_OPTS += --disable-service
+RAUC_CONF_OPTS += -Dservice=false
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_GPT),y)
-RAUC_CONF_OPTS += --enable-gpt
+RAUC_CONF_OPTS += -Dgpt=enabled
 RAUC_DEPENDENCIES += util-linux-libs
 else
-RAUC_CONF_OPTS += --disable-gpt
+RAUC_CONF_OPTS += -Dgpt=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
-RAUC_CONF_OPTS += --enable-network
+RAUC_CONF_OPTS += -Dnetwork=true
 RAUC_DEPENDENCIES += libcurl
 else
-RAUC_CONF_OPTS += --disable-network
+RAUC_CONF_OPTS += -Dnetwork=false
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_JSON),y)
-RAUC_CONF_OPTS += --enable-json
+RAUC_CONF_OPTS += -Djson=enabled
 RAUC_DEPENDENCIES += json-glib
 else
-RAUC_CONF_OPTS += --disable-json
+RAUC_CONF_OPTS += -Djson=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_STREAMING),y)
-RAUC_CONF_OPTS += --enable-streaming
+RAUC_CONF_OPTS += -Dstreaming=true
 RAUC_DEPENDENCIES += libnl
 else
-RAUC_CONF_OPTS += --disable-streaming
+RAUC_CONF_OPTS += -Dstreaming=false
 endif
 
 HOST_RAUC_DEPENDENCIES = \
@@ -65,12 +66,13 @@ HOST_RAUC_DEPENDENCIES = \
 	host-libglib2 \
 	host-squashfs \
 	$(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
+
 HOST_RAUC_CONF_OPTS += \
-	--disable-network \
-	--disable-json \
-	--disable-service \
-	--without-dbuspolicydir \
-	--with-systemdunitdir=no
+	-Dnetwork=false \
+	-Dstreaming=false \
+	-Djson=disabled \
+	-Dservice=false \
+	-Dtests=false
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
