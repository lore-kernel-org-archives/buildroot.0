Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3934C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3642F4157A;
	Mon,  6 Jun 2022 09:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQVI-bNanlEU; Mon,  6 Jun 2022 09:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0302C41830;
	Mon,  6 Jun 2022 09:38:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7491BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D87060BF3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CC18EOLmdq1f for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:38:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55DB860AF6
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 749A486C7A; Mon,  6 Jun 2022 09:26:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 11:38:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bee0f34598d64a983a30ab7999bf4305f957377
X-Git-Newrev: 2c05de430eaff1d2839e15465ba821eea968a858
X-Patchwork-Hint: ignore
Message-Id: <20220606092640.749A486C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: needs CONFIG_KPROBES
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c05de430eaff1d2839e15465ba821eea968a858
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

/nvmedata/autobuild/instance-18/output-1/build/lttng-modules-2.13.1/./src/wrapper/kallsyms.c:20:3: error: #error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
   20 | # error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a733056d59f15573698c191562afced3f7a331ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 4c1c50d0a0..d527bc19ef 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -12,5 +12,9 @@ LTTNG_MODULES_LICENSE_FILES = \
 	LICENSES/LGPL-2.1 LICENSES/GPL-2.0 LICENSES/MIT LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
+define LTTNG_MODULES_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KPROBES)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
