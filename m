Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDA1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 18:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A712D400CB;
	Mon, 10 Jan 2022 18:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFHYyz4GpsqI; Mon, 10 Jan 2022 18:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B2D400D6;
	Mon, 10 Jan 2022 18:52:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E34911BF352
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D330F4025B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdyhYkW2WkUI for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 18:52:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B6B140288
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 18:52:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8CDD183487; Mon, 10 Jan 2022 19:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1641840743; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=MDCB7msx+hSWoTFj2oZc3qU3SSCfuCefvik4WVYijuI=;
 b=OmMVld4bZV2K+loIZQAtZhwL3PuNswgAAEG8hH9OqNUaGsy9mo4GfhBHyP4m1jRMBkQ1T/
 5x+06o9TC5cHjTyFrnYvEbiiCwAzoD/jlt1QVcdYBLJSQukxdCQBMwMK62psScLs6pVlGX
 WrH/AuHMM0w5dW618I1wERx5FxLDRQM=
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 19:51:40 +0100
Message-Id: <20220110185147.84697-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v5] package/networkd-dispatcher: new package
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@busybox.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff via buildroot <buildroot@busybox.net>

Networkd-dispatcher is a dispatcher daemon for systemd-networkd
connection status changes. This daemon is similar to
NetworkManager-dispatcher, but is much more limited in the types of
events it supports due to the limited nature of systemd-networkd.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---

Changes v1 -> v2
  - add .hash file
  - use tabs for DEVELOPERS indentation

v2 -> v3
  - bump version to 2.1 (fixes an issue with systemd 246)
  - resolve merge conflict in DEVELOPERS

v3 -> v4
  - adjust to changed dependencies of python-gobject
  - removed dependencies already covered by depends on BR2_PACKAGE_DBUS
  - sorted dependencies
  - resolve merge conflict in DEVELOPERS

v4 -> v5
  - update dependencies of gobject-introspection
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/networkd-dispatcher/Config.in         | 21 ++++++++++++++++
 .../networkd-dispatcher.hash                  |  3 +++
 .../networkd-dispatcher.mk                    | 25 +++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/networkd-dispatcher/Config.in
 create mode 100644 package/networkd-dispatcher/networkd-dispatcher.hash
 create mode 100644 package/networkd-dispatcher/networkd-dispatcher.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12777e8d61..4b65d219c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1991,6 +1991,7 @@ N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/grpc/
 F:	package/gtest/
 F:	package/libabseil-cpp/
+F:	package/networkd-dispatcher/
 F:	package/protobuf/
 F:	package/re2/
 
diff --git a/package/Config.in b/package/Config.in
index 3a2ad30df9..23264afd9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2294,6 +2294,7 @@ endif
 	source "package/netstat-nat/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
+	source "package/networkd-dispatcher/Config.in"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
diff --git a/package/networkd-dispatcher/Config.in b/package/networkd-dispatcher/Config.in
new file mode 100644
index 0000000000..1dfa12ba45
--- /dev/null
+++ b/package/networkd-dispatcher/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_NETWORKD_DISPATCHER
+	bool "networkd-dispatcher"
+	depends on BR2_USE_WCHAR # dbus-python -> glib2
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python -> glib2
+	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
+	depends on BR2_PACKAGE_DBUS # dbus-python
+	depends on BR2_PACKAGE_PYTHON3 # runtime, python-gobject
+	depends on BR2_PACKAGE_SYSTEMD_NETWORKD # runtime
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON_GOBJECT
+	help
+	  Networkd-dispatcher is a dispatcher daemon for
+	  systemd-networkd connection status changes.
+	  This daemon is similar to NetworkManager-dispatcher,
+	  but is much more limited in the types of events it
+	  supports due to the limited nature of systemd-networkd.
+
+	  https://gitlab.com/craftyguy/networkd-dispatcher
diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
new file mode 100644
index 0000000000..ca7c300783
--- /dev/null
+++ b/package/networkd-dispatcher/networkd-dispatcher.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  1682c0106d9d2879087612e76aebb87672ebf339c43f229a3ee27dadb428575b  networkd-dispatcher-2.1.tar.bz2
+sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
new file mode 100644
index 0000000000..4f609db73a
--- /dev/null
+++ b/package/networkd-dispatcher/networkd-dispatcher.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# networkd-dispatcher
+#
+################################################################################
+
+NETWORKD_DISPATCHER_VERSION = 2.1
+NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
+NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
+NETWORKD_DISPATCHER_LICENSE = GPL-3.0
+NETWORKD_DISPATCHER_LICENSE_FILES = LICENSE
+
+define NETWORKD_DISPATCHER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/networkd-dispatcher $(TARGET_DIR)/usr/bin/networkd-dispatcher
+	mkdir -p $(TARGET_DIR)/etc/networkd-dispatcher/{routable,dormant,no-carrier,off,carrier,degraded,configuring,configured}.d
+endef
+
+define NETWORKD_DISPATCHER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/networkd-dispatcher.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/networkd-dispatcher.service
+	$(INSTALL) -D -m 0644 $(@D)/networkd-dispatcher.conf \
+		$(TARGET_DIR)/etc/conf.d/networkd-dispatcher.conf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
