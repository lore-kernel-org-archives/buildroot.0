Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E72C4332F
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 17:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9E960BC8;
	Wed, 15 Dec 2021 17:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evo_BmUQaidX; Wed, 15 Dec 2021 17:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC31860ED0;
	Wed, 15 Dec 2021 17:57:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA131BF2CF
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F147C415B4
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsTrtfOvFA4t for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 17:57:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B78415B3
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 17:57:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B6523C17AC
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 17:34:33 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8A8FF240008;
 Wed, 15 Dec 2021 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639589669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6bf8VkA+9e8Fcz+/KEA6XEeVC1A++Tmg5rxPZylh80=;
 b=av7dZWq4XZxEMTsT1uIH3GVXJ3B1tSUbWMZ2gWaDHaFL4TST3hjvlRKs3D7UpQ74wvLC8V
 Dpvh9Fh8vqUCta2XNOmQpxxRYLJDwDnZGDDUbW9/MmUL9DRUhlRDtsJFZ4XVTCw1qUPv4J
 Uv4o0hZFRJBeaDCQ/JT+6z4XGKF3wjTYcuY9N1/NrYf+tfP0JPlEG5kw1aluUtSVDnBNav
 3UJyJS2zbPE4s8HeqlaGa5xSCxnmh+sqKq9rYDZnELobPjZKicK80mafSwS5e41+VoWDm2
 NcZgl4TOyF51LazF1TgK7hCNUzM2WRvt/9bPWWVd8QyaYLSAYRA7rWsRGc/jGg==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 18:34:10 +0100
Message-Id: <20211215173411.274024-2-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215173411.274024-1-thierry.bultel@linatsea.fr>
References: <20211215173411.274024-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/dracut: new host package
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dracut is the tool used by desktop distributions to
build initrds. In the embedded world, it can be
very usefull, too, for instance when wanting to
create an initramfs for a system recovery mode.
Whereas it is definitively possible to achieve
this with buildroot, the process is to have a
dedicated buildroot configuration for that,
and perform a full build. Instead of doing that,
the idea is to use dracut to pick the needed
binaries/shared libraries, configuration files,
or kernel modules from the 'target' directory.
The advantage is to save build time, and also
to have a consistency between the packages versions
taken for the recovery and the production filesystem.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 package/Config.in.host        |  1 +
 package/dracut/Config.in.host |  8 ++++++++
 package/dracut/dracut.mk      | 22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/dracut/Config.in.host
 create mode 100644 package/dracut/dracut.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 0e8b071a2b..42f671a78f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -15,6 +15,7 @@ menu "Host utilities"
 	source "package/cross-ldd/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
+	source "package/dracut/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
new file mode 100644
index 0000000000..8ed41d3719
--- /dev/null
+++ b/package/dracut/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_DRACUT
+	bool "host dracut"
+	select BR2_PACKAGE_HOST_KMOD
+	select BR2_PACKAGE_HOST_CROSS_LDD
+	help
+	dracut is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework.
+
+	https://dracut.wiki.kernel.org
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
new file mode 100644
index 0000000000..8de89603a5
--- /dev/null
+++ b/package/dracut/dracut.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# dracut
+#
+################################################################################
+
+DRACUT_VERSION = 055
+DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
+DRACUT_SITE = https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut
+DRACUT_LICENSE = GPL-2.0
+DRACUT_LICENSE_FILES = COPYING
+
+HOST_DRACUT_DEPENDENCIES += host-pkgconf host-kmod host-cross-ldd
+
+define HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
+	$(SED) '/unset LD_LIBRARY_PATH/d' $(HOST_DIR)/bin/dracut
+	$(SED) '/unset LD_PRELOAD/d' $(HOST_DIR)/bin/dracut
+endef
+
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
+
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
