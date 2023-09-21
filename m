Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D3BE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A5383C75;
	Thu, 21 Sep 2023 19:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A5383C75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id foPfmXCp4GQh; Thu, 21 Sep 2023 19:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C444783C65;
	Thu, 21 Sep 2023 19:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C444783C65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9DDF1BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 837E782CF1
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 837E782CF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rMix6UpvRdi for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:31:42 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5BDA83C65
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5BDA83C65
Received: from localhost.localdomain ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jPOkqZfcMhgyOjPOkqn0Bi; Thu, 21 Sep 2023 21:31:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:31:11 +0200
Message-Id: <20230921193111.1136943-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKhKR3hoExSvTdAAnwN8x73ov2gP0gQklFXwf5HuP/wn/7mMM1Y+IZxLXrXJlvpPNqDd5eChwVPICkEW2MSVhUkA2cVrTUP0Nobz63ELuJ3KaoMtcRSz
 qaykUk6yWvurO0PA5x7tkGdFPbJ5Qocb5pY6uEWxA8RC2fuzC6rHPm4G7QAY51deCPkhOx7971iNMaxi9WGbEERD8XBruIO6+Tt45LyWhqrIJyU+x/AT7YP/
 ZtsGmbKSfv7WeperE5wliGOULVI8xuxPB35C/AL0KxOEbiyTs+P/2pFp9YCxBkF8SVDhB3w9OkKnyfSBkdC8dHeyNCyr3FI9+6nCK1F5KW7+cv3oPw3xK9Pt
 2cuNerpItRA2SNZq9FXUEVVMFrAW8AMcRhPbCxvB957uqW7grIwVWj97AeLRGRDsWGS/EnnE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695324699; bh=L9EIJE0jE3vl+HusyhwMfmT/lFzH+5wRE8ly4Sn6XvA=;
 h=From:To:Subject:Date:MIME-Version;
 b=WU1AIJhqmFcFB011+xxTUqgRXp1SGn3DcaiOpQ/DeL1z7mdqHcRvprbnP84kgrU1t
 g9p32KpHxXau4eF6vgS/WGf2HQCnkD06ORLR3DosRSREABB7j8HQ0z+o6Vf2Z7+tm/
 A5Rfk1f2TVOv4hxGPd+RBUMXKG+M/IB6yQ9rXDM2o1lxDzQ35OB/MNvSaUxVs24K/G
 v0yEdwIu+EgErwtR/yHuBMB2Jbkh0iNhQJJh413Lb6sS5ux7K3FBQ4tJTO1KSFiaXD
 YgBRfLLhIyfR89ZHrEjEJE5fNwQfuxzn9Uj91ADg5NIo1oNy1gorlvvUJjlPUI2GJs
 bBXXmAKcif/dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WU1AIJhq
Subject: [Buildroot] [PATCH v3] package/apache: add option
 BR2_PACKAGE_APACHE_DAEMON
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Jim Reinhart <jimr@tekvox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

With option BR2_PACKAGE_APACHE_DAEMON disabled only htdigest and htpasswd
are built and installed. By default BR2_PACKAGE_APACHE_DAEMON is enabled
and entire apache daemon is built. This is useful for Mongoose credentials
handling.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
V1->V2:
* Hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is enabled
V2->V3:
as suggested by Arnout:
* change negative option BR2_PACKAGE_APACHE_UTILS_ONLY to BR2_PACKAGE_APACHE_DAEMON
* set a common APACHE_CONF_OPTS and only add specific options for
  BR2_PACKAGE_APACHE_DAEMON enabled or not
---
 package/Config.in        |  2 +-
 package/apache/Config.in |  9 +++++++++
 package/apache/apache.mk | 24 +++++++++++++++++++++---
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..aa5e9b5a98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2278,7 +2278,7 @@ menu "Networking applications"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
-if BR2_PACKAGE_APACHE
+if BR2_PACKAGE_APACHE_DAEMON
 menu "External Apache modules"
 	source "package/modsecurity2/Config.in"
 endmenu
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..5e9e4c5f9d 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -17,6 +17,14 @@ config BR2_PACKAGE_APACHE
 
 if BR2_PACKAGE_APACHE
 
+config BR2_PACKAGE_APACHE_DAEMON
+	bool "apache-daemon"
+	default y
+	help
+	  Provide entire Apache daemon, otherwise only htdigest and htpasswd
+	  will be built and installed.
+
+if BR2_PACKAGE_APACHE_DAEMON
 choice
 	prompt "Multi-Processing Module (MPM)"
 	default BR2_PACKAGE_APACHE_MPM_WORKER
@@ -40,6 +48,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
 	  Implements a hybrid multi-threaded multi-process web server
 
 endchoice
+endif
 
 endif
 
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 320a6ad20e..83df3854a3 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
 APACHE_CPE_ID_PRODUCT = http_server
 APACHE_SELINUX_MODULES = apache
-# Needed for mod_php
-APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
@@ -32,10 +30,16 @@ APACHE_MPM = worker
 endif
 
 APACHE_CONF_OPTS = \
-	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
 	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
+
+ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
+# Needed for mod_php
+APACHE_INSTALL_STAGING = YES
+
+APACHE_CONF_OPTS += \
+	--sysconfdir=/etc/apache2 \
 	--enable-http \
 	--enable-dbd \
 	--enable-proxy \
@@ -121,5 +125,19 @@ define APACHE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/apache/apache.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
 endef
+else
+APACHE_CONF_OPTS += \
+	--with-static-htdigest \
+	--with-static-htpasswd
+
+define APACHE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
+endef
+
+define APACHE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
+	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+endef
+endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
