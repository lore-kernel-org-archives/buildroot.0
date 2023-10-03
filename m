Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA70E7543D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77DA82219;
	Tue,  3 Oct 2023 10:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E77DA82219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INNEe-0xY7K9; Tue,  3 Oct 2023 10:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E5D80FA0;
	Tue,  3 Oct 2023 10:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E5D80FA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE801BF34D
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0262881746
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0262881746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvhA3k1wI_dJ for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 10:01:36 +0000 (UTC)
X-Greylist: delayed 965 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Oct 2023 10:01:36 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B7C81518
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B7C81518
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 10:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1696326387; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QUT52LYmQ7aSwB22NAC8+WNxMB3fSvwnoZMfGUQl6kSdKVhpAbp2Mh4Nxwue+zXBhUSLeG/Nxz8IXj8P3K+Rjn+5Qqv9o02N24XQeHQVzb7rsGRnMLibEaz9Pob/CSs5kMe3aPBXXluix91JC/ME081DMa7x4XyIICq3VUTVKng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696326387;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=d9M2ITPFu5oCPD+yVl1TN5fd4l7RvmnOpZgd3qY4GQA=; 
 b=Gz2hp365Zl3zqVXZ4rG34rwSCmyK+52oNh8sAJY/okXs+PJsZZtIWKESWR6OWAIcaYrHddUv/nzGTFWKvBGlMJwp31yGVVanxB9BEwrligcjAKEs7qW3Ay0SnW9z41N+sGwAns4+FL+lGatEVQRKvkxnQYkBJyq5sH68vMTl+fQ=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 169632638500521.757594422899388;
 Tue, 3 Oct 2023 02:46:25 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231003094612.62025-2-enki@fsck.pl>
Date: Tue,  3 Oct 2023 11:46:10 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003094612.62025-1-enki@fsck.pl>
References: <20231003094612.62025-1-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696326387; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=d9M2ITPFu5oCPD+yVl1TN5fd4l7RvmnOpZgd3qY4GQA=;
 b=kGd7fnRMgh8IKsSTEku3IRQfcvec9VFWyKy89JKOpcA9lnqB1Zk/ePYP5zgbcWk5
 6MvXO9cOqO/Z/+PRj8sx6pJZiP9v1RifULbLZLcOZpgQzTDbgKFKP7K429QAC9RNCiD
 p3s2gWVjUe0GbQmfem1MNwkIBQhMLk64+VMvwp68=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=kGd7fnRM
Subject: [Buildroot] [PATCH 1/3] package/iniparser: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

iniparser is a required dependency of dns320l-daemon

Signed-off-by: Maciej Grela <enki@fsck.pl>
---
 package/Config.in                |  1 +
 package/iniparser/Config.in      |  6 +++++
 package/iniparser/iniparser.hash |  2 ++
 package/iniparser/iniparser.mk   | 42 ++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/iniparser/Config.in
 create mode 100644 package/iniparser/iniparser.hash
 create mode 100644 package/iniparser/iniparser.mk

diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..228e9eb1e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2085,6 +2085,7 @@ menu "Other"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
 	source "package/highway/Config.in"
+	source "package/iniparser/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/iniparser/Config.in b/package/iniparser/Config.in
new file mode 100644
index 0000000000..4932869943
--- /dev/null
+++ b/package/iniparser/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_INIPARSER
+	bool "iniparser"
+	help
+	  ini file parser
+
+	  https://github.com/ndevilla/iniparser
diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
new file mode 100644
index 0000000000..a745062fcd
--- /dev/null
+++ b/package/iniparser/iniparser.hash
@@ -0,0 +1,2 @@
+# From https://github.com/ndevilla/iniparser/releases
+sha256  960daa800dd31d70ba1bacf3ea2d22e8ddfc2906534bf328319495966443f3ae  iniparser-4.1.tar.gz
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
new file mode 100644
index 0000000000..dedb829140
--- /dev/null
+++ b/package/iniparser/iniparser.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# iniparser
+#
+################################################################################
+
+INIPARSER_VERSION = 4.1
+INIPARSER_SITE = $(call github,ndevilla,iniparser,v$(INIPARSER_VERSION))
+INIPARSER_INSTALL_STAGING = YES
+INIPARSER_LICENSE = MIT
+INIPARSER_LICENSE_FILES = LICENSE
+INIPARSER_SO_TARGET = libiniparser.so.1
+INIPARSER_A_TARGET = libiniparser.a
+
+INIPARSER_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+define INIPARSER_BUILD_CMDS
+	$(INIPARSER_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define INIPARSER_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(INIPARSER_SO_TARGET) $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D -m 0644 $(@D)/src/iniparser.h $(@D)/src/dictionary.h $(STAGING_DIR)/usr/include/
+	$(if ifeq ($(BR2_STATIC_LIBS),y),$(INSTALL) -D -m 0755 $(@D)/$(INIPARSER_A_TARGET) $(STAGING_DIR)/usr/lib/)
+endef
+
+define INIPARSER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(INIPARSER_SO_TARGET) $(TARGET_DIR)/usr/lib/
+	$(if ifeq ($(BR2_STATIC_LIBS),y),$(INSTALL) -D -m 0755 $(@D)/$(INIPARSER_A_TARGET) $(TARGET_DIR)/usr/lib/)
+endef
+
+define HOST_INIPARSER_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_INIPARSER_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(INIPARSER_SO_TARGET) $(HOST_DIR)/lib/
+	$(if ifeq ($(BR2_STATIC_LIBS),y),$(INSTALL) -D -m 0755 $(@D)/$(INIPARSER_A_TARGET) $(HOST_DIR)/lib/)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.39.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
