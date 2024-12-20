Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD62E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7551F83C11;
	Fri, 20 Dec 2024 16:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s873em9WrBvD; Fri, 20 Dec 2024 16:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3093E83C09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3093E83C09;
	Fri, 20 Dec 2024 16:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92DF6730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D933610B1
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGThhBCBM4U2 for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 16:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAB6361053
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB6361053
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAB6361053
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 16:44:18 +0000 (UTC)
X-CSE-ConnectionGUID: EAhpzzBLQ/+/Q93IYrna1g==
X-CSE-MsgGUID: pYAEgGGnQDe8AxehQ6aoig==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 17:44:17 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 17:44:15 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 17:44:14 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 17:44:14 +0100
X-CSE-ConnectionGUID: 24c6Akq4RAKb5c+BVSi5DA==
X-CSE-MsgGUID: YV2Ri9GFQCC5VDhT7/VmTw==
X-IronPort-AV: E=Sophos;i="6.12,251,1728943200"; d="scan'208";a="231691280"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien BOIBESSOT <julien.boibessot@armadeus.com>, 
 Tal Shorer <tal.shorer@gmail.com>, Marcin Bis <marcin@bis.org.pl>
Date: Fri, 20 Dec 2024 17:44:14 +0100
Message-ID: <adc7c8fecb8ac3010b16178bdad062132dd0d0d8.1734713054.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734713060; x=1766249060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cQ/sqBeeeJW3flEVJy5WezuqHvACviqPGqYfth8fkSw=;
 b=WiTdNFKRHQQlDRhVxRnKbjSHpvuQyXQzWj5XDT9Dz79QVtEXEt+I6R9c
 v8jma7XMqXuSNlA5dY7mzIf0JnOvrSspx7MYmLlDuwO39uEVKsGHqLAAV
 m9m4Itu6QesEBOhkkaA3FV7na+4nXVfE5oQbQkI1/fWoeSWRB/TsC34cI
 mrfTr2MXIMwM2U6pVBllrb3D8zFlxShbeUkMj0AlvSe93C+amQpLEQ73e
 aIz21IPMk3fn3Tzdx7XlCsKUDkFvDcbMkTc/GsRIR/AxR9W+mjXs5zE7Y
 P9NFELF5zLBKl4dMmqubOridCNkl6ytVn0BEjOwRjCfQTHq7BV3MLMNuh
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=WiTdNFKR
Subject: [Buildroot] [PATCH] package/usbip: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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

---
There have been various attempts in the past:
  - a separate package from legacy sources:
    https://patchwork.ozlabs.org/project/buildroot/patch/CAOPBCFUzO64CXWKr4Z2rJeUb2NXExu=H1Gp2QyymrHcjVNaJuA@mail.gmail.com/
  - a hybrid between a separate package and linux-tools:
    https://patchwork.ozlabs.org/project/buildroot/patch/1481736504-12256-1-git-send-email-tal.shorer@gmail.com/
  - a linux-tools implementatio:
    https://patchwork.ozlabs.org/project/buildroot/patch/1512566955-4712-1-git-send-email-julien.boibessot@free.fr/

All had shortcomings, so I started entirely from scratch. I first tried
a linux-tools implementation (available if needed), but I really found
it to be ugly and kludgy. The separate package is way nicer.
---
 package/Config.in        |  1 +
 package/usbip/Config.in  | 13 +++++++++++++
 package/usbip/usbip.hash |  5 +++++
 package/usbip/usbip.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/usbip/Config.in
 create mode 100644 package/usbip/usbip.hash
 create mode 100644 package/usbip/usbip.mk

diff --git a/package/Config.in b/package/Config.in
index f33c4780f8..ee6a5a0e67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -651,6 +651,7 @@ endmenu
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
 	source "package/usbguard/Config.in"
+	source "package/usbip/Config.in"
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
diff --git a/package/usbip/Config.in b/package/usbip/Config.in
new file mode 100644
index 0000000000..3038031aa0
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_USBIP
+	bool "usbip"
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  The USB-over-IP suite of tools.
+
+	  Note: you'll have to enable either (or both) of "VHCI hcd"
+	  (CONFIG_USBIP_VHCI_HCD) if you want to access a remote USB
+	  device, or "Host driver" (CONFIG_USBIP_HOST) if you want
+	  to share a USB device, in your kernel configuration.
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
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
