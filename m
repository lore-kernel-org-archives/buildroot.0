Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78000C02191
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400A2606FF;
	Sat, 14 Sep 2024 11:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bySk2GwPXbEZ; Sat, 14 Sep 2024 11:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E48660718
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E48660718;
	Sat, 14 Sep 2024 11:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C32471BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0A10407AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_fEG40xCHdc for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674E040520
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674E040520
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:31:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53DE082897; Sat, 14 Sep 2024 11:31:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 13:31:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5459a3f6a9a83f2cbf8d2e9a2a32a8d27e99c90
X-Git-Newrev: 2a9d61fec10a1386da9769668ae64d98c08add88
X-Patchwork-Hint: ignore
Message-Id: <20240914113156.53DE082897@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmitool: use versioned or custom
 PEN registry
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a9d61fec10a1386da9769668ae64d98c08add88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous default URL used for the PEN registry was not stable and
could change at any time, making it unacceptable to have to update its
hash every time.

With this patch, if the PEN (Enterprise numbers) registry is installed
by the iana-assignments package, ipmitool will use it. Otherwise, the
user can provide a custom file in a rootfs overlay.

Downloading such a file is no longer supported.

Fixes:
- http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f

Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: always look in /usr/share/misc/iana/]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 Config.in.legacy             | 12 ++++++++++++
 package/ipmitool/Config.in   | 17 +++++------------
 package/ipmitool/ipmitool.mk | 17 +----------------
 3 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7513aa7efd..6a1518f439 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
+	string "IANA PEN registry moved to iana-assignment package"
+	help
+	  Installation of the IANA PEN is now handled by the
+	  iana-assignment package; to install a custom PEN,
+	  use a rootfs-overlay for example.
+
+config BR2_PACKAGE_IPMITOOL_PEN_REG_URI_WRAP
+	bool
+	default y if BR2_PACKAGE_IPMITOOL_PEN_REG_URI != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_ERLANG_P1_YAML
 	bool "erlang-p1-yaml has been renamed"
 	select BR2_LEGACY
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 9516ff8596..dd2b0e6b6d 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -5,22 +5,15 @@ config BR2_PACKAGE_IPMITOOL
 	  IPMItool provides a simple command-line interface to
 	  IPMI-enabled devices.
 
+	  ipmitool will look up the IANA PEN (Enterprise Numbers)
+	  registry in /usr/share/misc/iana/. The IANA PEN is optional,
+	  it can be provided by the iana-assignment package or by a
+	  rootfs overlay.
+
 	  https://github.com/ipmitool/ipmitool/
 
 if BR2_PACKAGE_IPMITOOL
 
-config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
-	string "IANA PEN registry URL or path"
-	default "https://www.iana.org/assignments/enterprise-numbers.txt"
-	help
-	  Enter an URL or a file path to the PEN registry to use.
-
-	  Note that the official registry is 4MiB+ and may change any
-	  time and is thus not guaranteed to be reproducible.
-
-	  Leave empty to not use a registry; vendor IDs will be
-	  displayed instead of the corresponding names.
-
 config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 4f2151904d..159bb7c8b6 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -14,6 +14,7 @@ IPMITOOL_AUTORECONF = YES
 IPMITOOL_DEPENDENCIES = host-pkgconf
 
 IPMITOOL_CONF_OPTS = --disable-registry-download
+IPMITOOL_CONF_ENV = IANADIR=/usr/share/misc/iana
 
 ifeq ($(BR2_PACKAGE_FREEIPMI),y)
 IPMITOOL_DEPENDENCIES += freeipmi
@@ -49,20 +50,4 @@ endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
 endif
 
-IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
-ifneq ($(IPMITOOL_PEN_REG_URI),)
-ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
-IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
-BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
-IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
-else
-IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
-endif #findstring
-define IPMITOOL_INSTALL_PEN_REG
-	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
-		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
-endef
-IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
-endif # IPMITOOL_PEN_REG_URI !empty
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
