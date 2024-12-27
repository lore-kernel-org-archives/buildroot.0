Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9E2E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 12:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A1A402C2;
	Fri, 27 Dec 2024 12:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2QMNLdSBsJT; Fri, 27 Dec 2024 12:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F82402C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F82402C5;
	Fri, 27 Dec 2024 12:12:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99A8DE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 12:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86BEA402C5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 12:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ge6SHKxowdY for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 12:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8BA402C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D8BA402C2
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 12:12:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 480B88751D; Fri, 27 Dec 2024 12:12:32 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 12:12:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 653e62918fb4fffe981e2212ae5597280d2ae091
X-Git-Newrev: f05f2c1ad717b7cda065ee06fc1daa80cd09d859
X-Patchwork-Hint: ignore
Message-Id: <20241227121232.480B88751D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbip: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=f05f2c1ad717b7cda065ee06fc1daa80cd09d859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usbip allows configuring a client and a server, to share a USB device
across the network.

As explained in the .mk, usbip has been part from the kernel since
linux-3.17. This would call for making it part of linux-tools, but this
is a bit unwieldy: usbip is an autotools package, so trying to do a
proper integration in linux-tools would basically need a complete
duplication of the autotools infra [0].

Instead, we decided to go with a full-blown package of its own, that
just uses the current-latest kernel version. This makes for a nice,
little autotools package as we like them. Nothing fancy.

To be noted, though: usbip has its own license and license file, so
that's what we use, and we do not reference those for the rest of the
kernel: its GPL-2.0-or-later, not GPL-2.0(-only).

Finally, we only enable the core usbip support in the kernel, and leave
it to the user whether they should enable server and/or client support.

[0] been there, done that; that was ugly and incomplete, what with the
    libtool patches, autoreconf, and what not.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Cc: Tal Shorer <tal.shorer@gmail.com>
Cc: Marcin Bis <marcin@bis.org.pl>
[Julien Olivain:
  - Config.in: add hwdata comment
  - Config.in: add a package homepage url
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in        |  1 +
 package/usbip/Config.in  | 18 ++++++++++++++++++
 package/usbip/usbip.hash |  5 +++++
 package/usbip/usbip.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 06472aa972..39a2110b96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -655,6 +655,7 @@ endmenu
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
 	source "package/usbguard/Config.in"
+	source "package/usbip/Config.in"
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
diff --git a/package/usbip/Config.in b/package/usbip/Config.in
new file mode 100644
index 0000000000..25f8fb8577
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_USBIP
+	bool "usbip"
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  The USB-over-IP suite of tools.
+
+	  Note: you'll have to enable either (or both) of "VHCI hcd"
+	  (CONFIG_USBIP_VHCI_HCD) if you want to access a remote USB
+	  device, or "Host driver" (CONFIG_USBIP_HOST) if you want
+	  to share a USB device, in your kernel configuration. The
+	  Buildroot package "hwdata" with the "usb.ids" file is also
+	  useful (but not mandatory) to list and identify USB device
+	  by name.
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/usb/usbip
+
+comment "usbip needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/usbip/usbip.hash b/package/usbip/usbip.hash
new file mode 100644
index 0000000000..dc901617bf
--- /dev/null
+++ b/package/usbip/usbip.hash
@@ -0,0 +1,5 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d450ab215de4e1f8bb85e0f4216760fa33fd024b4526b144f4ce0d9012b29c9e  linux-6.12.6.tar.xz
+
+# Locally computed
+sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  tools/usb/usbip/COPYING
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
new file mode 100644
index 0000000000..77dd341f9b
--- /dev/null
+++ b/package/usbip/usbip.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# usbip
+#
+################################################################################
+
+# Since linux 3.17, usbip is part of the linux source tree. Usually, we'd add
+# such a tool in the linux-tools package.
+#
+# However, usbip is autotools-based, so we'd have to duplicate the autotools
+# infra in linux-tools; the basic infra is easy to duplicate, but then come
+# the conditional libtool patches, and it's not trivial to do. And of course,
+# there would be the maintenance cost...
+#
+# usbip is not very tied to the kernel, in fact. It is pretty stable, API-wise,
+# so we can just use a recent kernel version.
+USBIP_VERSION = 6.12.6
+USBIP_SOURCE = linux-$(USBIP_VERSION).tar.xz
+USBIP_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v6.x
+USBIP_DL_SUBDIR = linux
+
+# usbip's licensing diverges from that of the rest of the kernel
+USBIP_LICENSE = GPL-2.0-or-later
+USBIP_LICENSE_FILES = tools/usb/usbip/COPYING
+
+USBIP_DEPENDENCIES = udev
+
+USBIP_SUBDIR = tools/usb/usbip
+USBIP_INSTALL_STAGING = YES
+
+USBIP_AUTORECONF = YES
+USBIP_CONFIGURE_OPTS = --without-tcp-wrappers
+
+define USBIP_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USBIP_CORE)
+endef
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
