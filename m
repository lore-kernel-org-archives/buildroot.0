Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60EDCD6E74
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 17:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98B97404CA;
	Thu,  5 Sep 2024 17:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4-TY-Un8Ffy; Thu,  5 Sep 2024 17:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742C4405B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 742C4405B3;
	Thu,  5 Sep 2024 17:27:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB2C11BF3E9
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 17:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B809D405B3
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 17:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpqdnfxQ0Mwy for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 17:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 901FB404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 901FB404CA
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 901FB404CA
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 17:27:16 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 86DDF3F9C3;
 Thu,  5 Sep 2024 19:27:09 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id BE98C5F497;
 Thu,  5 Sep 2024 19:23:37 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 19:26:07 +0200
Message-Id: <20240905172607.1322733-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905172607.1322733-1-guillaume.chaye@zeetim.com>
References: <20240905172607.1322733-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1725557229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YuuJl7pMz7QD76YRN6rNpc486CLfPOFqJS4uBimxBeE=;
 b=ah5wsmy9XgJp052Vimqn+LBE7GMz39hMukmfy8x8bhZkXpPVEGY3ZfhoOAzCaUxcxIsk5Q
 q74yoH16ziNXMFJ/gPAuRLbz6rMiptow8wBcKj/issn7p1WdHl1/VTG/ejZ2/yvhvsSYCx
 JS4VuVvPY3jZ24fM7lzl9WGUNC7c6G9Y3aH5x+VLL2VrKP6nTPhmoGMxz2ViIfc65rS2SL
 FAMFJivQC1aJdR3whtLRIJPMAqi8Xuj+k+66rwSUIdL0euiwICQuIBq6OdIwWGWtQIcoca
 L1mygOrmZaHmLSXZy+JMF32oxWHRJtKPxzt33Ik99OJGQ2I1r3karqWBbmM0ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=ah5wsmy9
Subject: [Buildroot] [PATCHv2 2/2] package/efitools: efitools is a set of
 utilities to manipulate efi variables
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/efitools/Config.in   |  6 ++++++
 package/efitools/efitools.mk | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/efitools.mk

diff --git a/package/efitools/Config.in b/package/efitools/Config.in
new file mode 100644
index 0000000000..acc41cd49b
--- /dev/null
+++ b/package/efitools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EFITOOLS
+	bool "efitools"
+    select BR2_PACKAGE_GNU_EFI
+    select BR2_PACKAGE_OPENSSL
+    help
+        A set of utilities to manipulate efi variables
\ No newline at end of file
diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
new file mode 100644
index 0000000000..5b249e81e4
--- /dev/null
+++ b/package/efitools/efitools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# efitools
+#
+################################################################################
+
+EFITOOLS_VERSION = 1.9.2
+EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
+EFITOOLS_SOURCE = efitools-$(EFITOOLS_VERSION).tar.gz
+EFITOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
+EFITOOLS_DEPENDENCIES = openssl gnu-efi host-perl-file-slurp
+
+EFITOOLS_INCDIR=-I$(@D)/include/ -I$(STAGING_DIR)/usr/include/efi -I$(STAGING_DIR)/usr/include/efi/$(ARCH) -I$(STAGING_DIR)/usr/include/efi/protocol
+EFITOOLS_LIB_INCDIR=-I$(TARGET_DIR)/usr/include
+
+define EFITOOLS_BUILD_CMDS
+$(TARGET_MAKE_ENV) INCDIR="$(EFITOOLS_LIB_INCDIR)" $(MAKE) -C $(@D) INCDIR="$(EFITOOLS_INCDIR)"
+endef
+
+define EFITOOLS_INSTALL_TARGET_CMDS
+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
\ No newline at end of file
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
