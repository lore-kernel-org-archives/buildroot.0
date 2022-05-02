Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBA7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5A4560EB0;
	Mon,  2 May 2022 21:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lz0eY9n5zs5K; Mon,  2 May 2022 21:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C2B60C1A;
	Mon,  2 May 2022 21:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 625091BF2C0
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51AE881435
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84ozTJCv-4f5 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214C981398
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DF1C684EC9; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99113727d6458fff1aaae7f9e9305f9b657d4263
X-Git-Newrev: 858e6183d663e9ceba91b9a974dfeb331ead847d
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.DF1C684EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmnl: add options to build
 examples
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

commit: https://git.buildroot.net/buildroot/commit/?id=858e6183d663e9ceba91b9a974dfeb331ead847d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The example applications, which are minimal, can be of great help in
understanding how the library works.

As there is no configure option to enable examples compilation, building
and installation instructions had to be added to libmnl.mk. By default,
which is always the case for buildroot, they are disabled.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
