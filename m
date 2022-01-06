Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868D3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 16:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF7A6FC04;
	Thu,  6 Jan 2022 16:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rmEbzXzvA9t; Thu,  6 Jan 2022 16:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6135860DB2;
	Thu,  6 Jan 2022 16:30:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9449B1BF3D1
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E71428EC
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 16:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fv5kGAzss7sm for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 16:30:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1DE9428EB
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B616C83460; Thu,  6 Jan 2022 16:24:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 15:35:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dc59ef8dca1965b3ed5d7b90f615a415ecbc863
X-Git-Newrev: d167f7006e724360994a88cb97ad65bec137db68
X-Patchwork-Hint: ignore
Message-Id: <20220106162435.B616C83460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-rcw: add in-tree rcw source
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d167f7006e724360994a88cb97ad65bec137db68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qoriq-rcw repository contains the RCW source for a lot of
development boards already. Add a new option
BR2_PACKAGE_HOST_QORIQ_RCW_INTREE to use one of these rather than a
custom one.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
[Arnout:
 - rename the option to _RCW_INTREE;
 - update commit message, documentation, and internal variables
   accordingly;
 - reorganise condition tree so it becomes a little simpler;
 - add patsubst so the source can be specified as either %.rcw or %.bin;
 - always install it as PBL.bin, to be consistent with the custom
   option.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qoriq-rcw/Config.in.host | 12 ++++++++++++
 package/qoriq-rcw/qoriq-rcw.mk   | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/qoriq-rcw/Config.in.host b/package/qoriq-rcw/Config.in.host
index 1f69c0389c..08fc83acd0 100644
--- a/package/qoriq-rcw/Config.in.host
+++ b/package/qoriq-rcw/Config.in.host
@@ -25,4 +25,16 @@ config BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
 	  included for use in the SDK or with post scripts but no
 	  RCW binary will not be generated.
 
+config BR2_PACKAGE_HOST_QORIQ_RCW_INTREE
+	string "In-tree RCW name"
+	depends on !BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
+	help
+	  This option is used to specify the RCW binary file for board.
+	  which is composed as platform/serdes_value/rcw_file: platform
+	  is the platform name, serdes_value is the setting of the
+	  Serdes, and rcw_file is the file name of RCW. For example:
+	  "ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
+
+	  If this option is empty, no rcw file is used.
+
 endif
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index bad4a451d3..93e660b1dd 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -13,8 +13,10 @@ QORIQ_RCW_LICENSE_FILES = LICENSE
 HOST_QORIQ_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 QORIQ_RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH))
+QORIQ_RCW_INTREE = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_INTREE))
 
 ifneq ($(QORIQ_RCW_FILES),)
+
 QORIQ_RCW_INCLUDES = $(filter-out %.rcw,$(QORIQ_RCW_FILES))
 # Get the name of the custom rcw file from the custom list
 QORIQ_RCW_PROJECT = $(notdir $(filter %.rcw,$(QORIQ_RCW_FILES)))
@@ -54,6 +56,20 @@ endef
 define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
 	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
 endef
+
+else ifneq ($(QORIQ_RCW_INTREE),)
+
+QORIQ_RCW_PLATFORM = $(firstword $(subst /, ,$(QORIQ_RCW_INTREE)))
+QORIQ_RCW_FILE_BIN = $(lastword $(subst /, ,$(QORIQ_RCW_INTREE)))
+
+define HOST_QORIQ_RCW_BUILD_CMDS
+	$(MAKE) -C $(@D)/$(QORIQ_RCW_PLATFORM)
+endef
+
+define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/$(patsubst %.rcw,%.bin,$(QORIQ_RCW_INTREE)) \
+		$(BINARIES_DIR)/PBL.bin
+endef
 endif
 
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
