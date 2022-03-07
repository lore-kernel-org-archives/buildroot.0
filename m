Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C97C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33EFA82B3E;
	Mon,  7 Mar 2022 19:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkMjy38rzLHX; Mon,  7 Mar 2022 19:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7475B827F0;
	Mon,  7 Mar 2022 19:29:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50D6B1BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E784827F0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84RJiCv_qMDe for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4B1B827B5
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1612F82DBE; Mon,  7 Mar 2022 19:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43c8f8b77bf2d318882c5fffb886852872ca74b7
X-Git-Newrev: ec532199d6b404a1e51b5ed0dfdb21b18a8a3ed5
X-Patchwork-Hint: ignore
Message-Id: <20220307192114.1612F82DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: only install systemd service
 if built with dbus/service support
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
Content-Type: multipart/mixed; boundary="===============3968285679895644538=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3968285679895644538==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ec532199d6b404a1e51b5ed0dfdb21b18a8a3ed5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The systemd service will try to call rauc in service mode, so it is useless
and will fail if rauc does not have such support

Signed-off-by: Nuno Gonçalves <nunojpg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.mk | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 39f5255812..7a10470cf2 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -15,6 +15,18 @@ RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
 ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
 RAUC_CONF_OPTS += --enable-service
 RAUC_DEPENDENCIES += dbus
+
+# systemd service uses dbus interface
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+# configure uses pkg-config --variable=systemdsystemunitdir systemd
+RAUC_DEPENDENCIES += systemd
+define RAUC_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
+	printf '[Install]\nWantedBy=multi-user.target\n' \
+		>$(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf
+endef
+endif
+
 else
 RAUC_CONF_OPTS += --disable-service
 endif
@@ -33,17 +45,6 @@ else
 RAUC_CONF_OPTS += --disable-json
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-# configure uses pkg-config --variable=systemdsystemunitdir systemd
-RAUC_DEPENDENCIES += systemd
-endif
-
-define RAUC_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
-	printf '[Install]\nWantedBy=multi-user.target\n' \
-		>$(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf
-endef
-
 HOST_RAUC_DEPENDENCIES = \
 	host-pkgconf \
 	host-openssl \

--===============3968285679895644538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3968285679895644538==--
