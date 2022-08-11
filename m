Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0231C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB92401EA;
	Thu, 11 Aug 2022 11:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB92401EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRluTH6MvnGk; Thu, 11 Aug 2022 11:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D412417EF;
	Thu, 11 Aug 2022 11:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D412417EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46E441C1190
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 216A74180D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 216A74180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wye0r4KcPz4 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 377884179A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377884179A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 18F2E870FC; Thu, 11 Aug 2022 10:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 11:40:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11477df6b144c43c005f62b005a17630061cb781
X-Git-Newrev: 6fcdaa4c5096b51e16f295b0ba7939cc4db30f50
X-Patchwork-Hint: ignore
Message-Id: <20220811104614.18F2E870FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: Allow installation of
 perf scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fcdaa4c5096b51e16f295b0ba7939cc4db30f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to run the full gamut of "perf tests" installing the perf
scripts is required, otherwise we run into errors similar to those:

	failed to open shell test directory: /usr/libexec/perf-core/tests/shell

Make this possible by introducing a new option allowing us to install
perf scripts.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in             |  7 +++++++
 package/linux-tools/linux-tool-perf.mk.in | 12 +++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 732ac65a25..10b6538a59 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -76,6 +76,13 @@ comment "perf needs a toolchain w/ dynamic library"
 
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
+config BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS
+	bool "enable installation of perf scripts"
+	help
+	  Enable the installation of the perf scripts under
+	  /usr/libexec/perf-core/ which is necessary for running "perf
+	  tests"
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
 	bool "enable perf TUI"
 	depends on BR2_USE_MMU # slang
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d82d45973c..7bba440530 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -159,12 +159,18 @@ define PERF_BUILD_CMDS
 endef
 
 # After installation, we remove the Perl and Python scripts from the
-# target.
+# target unless BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS is enabled
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
+define PERF_INSTALL_REMOVE_SCRIPTS
+	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+endef
+endif
+
 define PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/ install
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(PERF_INSTALL_REMOVE_SCRIPTS)
 endef
 
 define PERF_LINUX_CONFIG_FIXUPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
