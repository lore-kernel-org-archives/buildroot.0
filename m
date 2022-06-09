Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25672C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 11:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA77641CCF;
	Thu,  9 Jun 2022 11:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqrAr99CToyD; Thu,  9 Jun 2022 11:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6261141CB8;
	Thu,  9 Jun 2022 11:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E19F71BF3A9
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 11:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEAAD41CB2
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 11:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjNKJ-ztR_hO for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 11:25:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B6F841CB6
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 11:25:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3542386E92; Thu,  9 Jun 2022 11:13:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 13:25:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fab913fec8ce7091c5fec6b93635687303b9ccd1
X-Git-Newrev: 49def9eac812ef83558487084558a6dd83d3e844
X-Patchwork-Hint: ignore
Message-Id: <20220609111328.3542386E92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lttng-modules:
 needs CONFIG_KPROBES
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

commit: https://git.buildroot.net/buildroot/commit/?id=49def9eac812ef83558487084558a6dd83d3e844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

/nvmedata/autobuild/instance-18/output-1/build/lttng-modules-2.13.1/./src/wrapper/kallsyms.c:20:3: error: #error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
   20 | # error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a733056d59f15573698c191562afced3f7a331ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2c05de430eaff1d2839e15465ba821eea968a858)
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
