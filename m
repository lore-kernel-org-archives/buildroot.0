Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F5BE77170
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 19:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB79C413A6;
	Thu,  5 Dec 2024 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bgUcsPdvwhY; Thu,  5 Dec 2024 19:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0484D41424
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0484D41424;
	Thu,  5 Dec 2024 19:49:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2CE1FDB
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E041400E7
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-f1dXQ8dG9j for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 19:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6B440176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB6B440176
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:49:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C669D86988; Thu,  5 Dec 2024 19:49:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 21:48:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 312215ad6bc45a46b4ea5b3dc1826014b9c155de
X-Git-Newrev: eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b
X-Patchwork-Hint: ignore
Message-Id: <20241205194942.C669D86988@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igh-ethercat: add
 configuration options
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

commit: https://git.buildroot.net/buildroot/commit/?id=eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add configuration options and description for EtherCAT userlib, clitool,
tty and additional drivers.

Signed-off-by: Jannik Becher <becher.jannik@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igh-ethercat/Config.in       | 77 +++++++++++++++++++++++++++++++++---
 package/igh-ethercat/igh-ethercat.mk | 14 ++++++-
 2 files changed, 84 insertions(+), 7 deletions(-)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index e600ef5fcd..49be9d13bc 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -11,19 +11,86 @@ config BR2_PACKAGE_IGH_ETHERCAT
 
 if BR2_PACKAGE_IGH_ETHERCAT
 
+config BR2_PACKAGE_IGH_ETHERCAT_CLITOOL
+	bool "Enable CLI Tool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Enable the EtherCAT CLI tool for testing and diagnostics.
+
+config BR2_PACKAGE_IGH_ETHERCAT_USERLIB
+	bool "Enable User Space Library"
+	help
+	  Install the EtherCAT user space library.
+
+config BR2_PACKAGE_IGH_ETHERCAT_TTY
+	bool "Enable TTY Driver"
+	help
+	  Enable the EtherCAT TTY driver for serial communication
+	  support.
+
+config BR2_PACKAGE_IGH_ETHERCAT_GENERIC
+	bool "Enable Generic Driver"
+	help
+	  Enable the generic EtherCAT master driver.
+
 config BR2_PACKAGE_IGH_ETHERCAT_8139TOO
-	bool "8139too driver"
+	bool "8139too Driver"
+	help
+	  Enable Realtek 8139too-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E100
-	bool "e100 driver"
+	bool "e100 Driver"
+	help
+	  Enable Intel e100-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E1000
-	bool "e1000 driver"
+	bool "e1000 Driver"
+	help
+	  Enable Intel e1000-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E1000E
-	bool "e1000e driver"
+	bool "e1000e Driver"
+	help
+	  Enable Intel e1000e-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_GENET
+	bool "genet Driver"
+	help
+	  Enable Broadcom GENET-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_IGB
+	bool "igb Driver"
+	help
+	  Enable Intel igb-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_IGC
+	bool "igc Driver"
+	help
+	  Enable Intel igc-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_R8169
-	bool "r8169 driver"
+	bool "r8169 Driver"
+	help
+	  Enable Realtek r8169-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_STMMAC_PCI
+	bool "stmmac-pci Driver"
+	help
+	  Enable Synopsys STMMAC PCI-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_STMMAC
+	bool "stmmac Driver"
+	help
+	  Enable Synopsys STMMAC-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_DWMAC_INTEL
+	bool "dwmac-intel Driver"
+	help
+	  Enable Intel DesignWare MAC-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_CCAT
+	bool "ccat Driver"
+	help
+	  Enable CCAT-based EtherCAT driver.
 
 endif
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 374f8891e5..0fcba65cf5 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -15,12 +15,22 @@ IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
 	--with-linux-dir=$(LINUX_DIR) \
-	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_USERLIB),--enable-userlib,--disable-userlib) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_CLITOOL),--enable-tool,--disable-tool) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_TTY),--enable-tty,--disable-tty) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_GENERIC),--enable-generic,--disable-generic) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e) \
-	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_GENET),--enable-genet,--disable-genet) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_IGB),--enable-igb,--disable-igb) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_IGC),--enable-igc,--disable-igc) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_STMMAC_PCI),--enable-stmmac-pci,--disable-stmmac-pci) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_STMMAC),--enable-stmmac,--disable-stmmac) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_DWMAC_INTEL),--enable-dwmac-intel,--disable-dwmac-intel) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_CCAT),--enable-ccat,--disable-ccat)
 
 $(eval $(kernel-module))
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
