Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4361C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 05:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51CFE60E54;
	Mon,  2 May 2022 05:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBdtYG4baJjX; Mon,  2 May 2022 05:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 386BF60DFF;
	Mon,  2 May 2022 05:11:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67DE81BF3DF
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 05:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F14C4097D
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 05:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cD0p4_y8ZFWS for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 05:11:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-36.italiaonline.it [213.209.10.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE3124097E
 for <buildroot@buildroot.org>; Mon,  2 May 2022 05:11:15 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([87.0.15.73])
 by smtp-36.iol.local with ESMTPA
 id lOKung8uBc2f5lOKynE3jq; Mon, 02 May 2022 07:11:13 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1651468273; bh=T0YVYgKghbRXHJdqtR2PMJaxpgMWLOTGeUiFQiZDaBc=;
 h=From;
 b=lYPgKjKrvrsPTY5494bHytrP40JvKuLf+ozIqg3BZ9Bm3sSRjJ7CNQacG0jZQqU/Z
 BLdXn3iwQXiK6U1DPIAglMfliggcW+v3XcuofyYFPp0552+DuAV92iP14hv9TpXzlt
 uc1o7ytT/lqptGfFFdyA+UyzN/M1ImsS6tR+NqWC9p4QMSriE5s1d1gmoJcaxqMmYP
 rDnnrfAG5Yg/kiZG8cTzgSo29Ob5Ek8lvqvWJAHCc77CHMVjsdAw1fQFMSnWgzJu+9
 cN8kW+XtHMVMrQ9VuyVQRrxaaB2VHKupWPJwfpAxD2q0SMt+y6RGxnegMzS84zcpkp
 FKiZfRl+dOxIQ==
X-CNFS-Analysis: v=2.4 cv=Z6kpoFdA c=1 sm=1 tr=0 ts=626f67f1 cx=a_exe
 a=h5x6SpL9bzIPZN26QICeQA==:117 a=h5x6SpL9bzIPZN26QICeQA==:17 a=3HDBlxybAAAA:8
 a=mpPRL0umx70Eb4UdMuAA:9 a=laEoCiVfU_Unz3mSdgXN:22
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 07:10:59 +0200
Message-Id: <20220502051059.8301-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfIfeiRmxRManIhpdF/n2fapZMW2t5Rn2wlSgZIacMzNosYd0jJwS3DwWHpfqUQfVK6WoUQXw5WalNuAqhCaa4oGCAIuKoaFBvt0FYwS9IstDnz27Aovo
 4v0c11HvtvG4P0whE4++YjghM4WFDl63YHhEfyBFXeqEyPt25WkJ96ZZ5MQi1n3uxXwx5e/gLNL/7FBIjVXu0/QfiXnKHcECU6GmRerP+5ENvR5COCyCMmoJ
 uW6vBqapKzjl/5JCoVxwpLECF8MhEEW9oel1VM84LMIrsoqCJ/LzQJBAlbxUpT51f7y4uUzLx7rXZ85hwuP38g==
Subject: [Buildroot] [v2, 1/1] package/libmnl: add options to build examples
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The example applications, which are minimal, can be of great help in
understanding how the library works.

As there is no configure option to enable examples compilation, building
and installation instructions had to be added to libmnl.mk. By default,
which is always the case for buildroot, they are disabled.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
Changes v1 -> v2:
- Build all examples when BR2_PACKAGE_LIBMNL_EXAMPLES is set.
---
 package/libmnl/Config.in |  9 +++++++++
 package/libmnl/libmnl.mk | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
index 5acfb2447e..b4a4195751 100644
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -5,3 +5,12 @@ config BR2_PACKAGE_LIBMNL
 	  to Netlink developers.
 
 	  http://netfilter.org/projects/libmnl/
+
+if BR2_PACKAGE_LIBMNL
+
+config BR2_PACKAGE_LIBMNL_EXAMPLES
+	bool "install examples"
+	help
+	  Install binary examples.
+
+endif
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 3361d05248..d9b1fbabe7 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -12,4 +12,32 @@ LIBMNL_LICENSE = LGPL-2.1+
 LIBMNL_LICENSE_FILES = COPYING
 LIBMNL_CPE_ID_VENDOR = netfilter
 
+ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES),y)
+define LIBMNL_EXAMPLES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) check -C $(@D)
+endef
+LIBMNL_POST_BUILD_HOOKS += LIBMNL_EXAMPLES_BUILD_CMDS
+
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/genl/, genl-family-get genl-group-events)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/kobject/, kobject-event)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/netfilter/, nfct-create-batch \
+		nfct-daemon nfct-dump nfct-event nf-log \
+		nf-queue)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
+		rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
+		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
+		rtnl-route-add rtnl-route-dump rtnl-route-event)
+
+define LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
+	$(foreach t,$(LIBMNL_EXAMPLES_INSTALL_TARGETS), \
+		$(INSTALL) -D -m 0755 $(@D)/$(t) \
+			$(TARGET_DIR)/usr/bin/$(notdir $(t))$(sep))
+endef
+LIBMNL_POST_INSTALL_TARGET_HOOKS += LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
