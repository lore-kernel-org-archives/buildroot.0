Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F7FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A1C5415FB;
	Wed, 12 Jan 2022 20:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNBbFBArvIMO; Wed, 12 Jan 2022 20:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7875415F7;
	Wed, 12 Jan 2022 20:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3EF1BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17687415F7
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pph4KVdmMVpT for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:19:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0359415F5
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:19:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E8D6083456; Wed, 12 Jan 2022 20:12:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 21:16:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8a5f4ecd89a2bd84ab0a7a72f3c367a0980af4f
X-Git-Newrev: 27856dfd1af18161af84783c785481de9c7e8d94
X-Patchwork-Hint: ignore
Message-Id: <20220112201255.E8D6083456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/networkd-dispatcher: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=27856dfd1af18161af84783c785481de9c7e8d94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Networkd-dispatcher is a dispatcher daemon for systemd-networkd
connection status changes. This daemon is similar to
NetworkManager-dispatcher, but is much more limited in the types of
events it supports due to the limited nature of systemd-networkd.

To simplify the large number of transitive dependencies, remove the ones
that are implied by glibc.

To simplify the comment, simply don't show it if python is selected.
Python 2 is going to be removed soon anyway.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Arnout: add Config.in comment and rework/simplify dependencies]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/networkd-dispatcher/Config.in              | 29 ++++++++++++++++++++++
 .../networkd-dispatcher/networkd-dispatcher.hash   |  3 +++
 package/networkd-dispatcher/networkd-dispatcher.mk | 25 +++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0bfde69da..c15b117610 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2002,6 +2002,7 @@ N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/grpc/
 F:	package/gtest/
 F:	package/libabseil-cpp/
+F:	package/networkd-dispatcher/
 F:	package/protobuf/
 F:	package/re2/
 
diff --git a/package/Config.in b/package/Config.in
index 59297c3f3d..b76f50e565 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2297,6 +2297,7 @@ endif
 	source "package/netstat-nat/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
+	source "package/networkd-dispatcher/Config.in"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
diff --git a/package/networkd-dispatcher/Config.in b/package/networkd-dispatcher/Config.in
new file mode 100644
index 0000000000..ab8c473951
--- /dev/null
+++ b/package/networkd-dispatcher/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_NETWORKD_DISPATCHER
+	bool "networkd-dispatcher"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
+	depends on !BR2_PACKAGE_PYTHON # python3
+	depends on BR2_PACKAGE_SYSTEMD # runtime
+	select BR2_PACKAGE_DBUS # dbus-python
+	select BR2_PACKAGE_DBUS_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3 # python-gobject
+	select BR2_PACKAGE_PYTHON_GOBJECT # runtime
+	select BR2_PACKAGE_SYSTEMD_NETWORKD # runtime
+	help
+	  Networkd-dispatcher is a dispatcher daemon for
+	  systemd-networkd connection status changes.
+	  This daemon is similar to NetworkManager-dispatcher,
+	  but is much more limited in the types of events it
+	  supports due to the limited nature of systemd-networkd.
+
+	  https://gitlab.com/craftyguy/networkd-dispatcher
+
+comment "networkd-dispatcher needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on !BR2_PACKAGE_PYTHON
+	depends on !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
