Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0967FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 18:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53CD782909;
	Wed, 15 Dec 2021 18:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1sWP5r_sN8q; Wed, 15 Dec 2021 18:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D13C8290B;
	Wed, 15 Dec 2021 18:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C94A1BF2CF
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0C2415C0
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkJv9CRBRjZf for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 18:00:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2F29415BC
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 18:00:31 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DBF3AFF807;
 Wed, 15 Dec 2021 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639591230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6bf8VkA+9e8Fcz+/KEA6XEeVC1A++Tmg5rxPZylh80=;
 b=Qn+uiZzwrJPNQDMgn7hs2PxcJL6SlJXoDVf9wOTxI652OUe1P75uVWeI+vme1pc8LOp1PL
 cQy/manqQ8sP+0npcyUxUDQCq3Ojg8LSFhqZpOlk3XWrXQukQFxpwwPXPgZnEbun9hKYjA
 +SBVsevSL0sQ+OlPJ8ZCv45MdtRevAKWGAuMwedWHMf5VStbtl397XkG/jAsFfMrNzQ/fS
 xvC5MXchDwgmQ8zKlGzA4LCos7LWF4jqFqfQPb+gYG2MDc5zU5pJTOvRFlcF5+18A70yTc
 Z+wmorHiBUVlcn87ECd0lApmPSy0c36fPxtdUyqNou7OaeKsL7flYRulON9XUQ==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 19:00:20 +0100
Message-Id: <20211215180021.274991-2-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
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
