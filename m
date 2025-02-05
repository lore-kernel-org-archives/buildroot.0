Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9563AC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 353FA8115D;
	Fri, 28 Feb 2025 17:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMCvONsAiPcK; Fri, 28 Feb 2025 17:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D868117D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D868117D;
	Fri, 28 Feb 2025 17:14:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B28568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E8D42F78
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOXmKErNzjz1 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1706942D26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1706942D26
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 108D785E25; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 14:58:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b
X-Git-Newrev: 5da83ec50ff4ed11883f224541ef6c37bf2c305f
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.108D785E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/psplash: add support
 for two configure options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5da83ec50ff4ed11883f224541ef6c37bf2c305f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for two configure options:
  --disable-progress-bar, via BR2_PACKAGE_PSPLAH_PROGRESS_BAR
  --disable-startup-msg, via BR2_PACKAGE_PSPLASH_STARTUP_MSG

Both buildroot options will default to 'y' to be compatible with the
previous behaviour, since those were enabled by default by not
specifying the disable config flag.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/psplash/Config.in  | 12 ++++++++++++
 package/psplash/psplash.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index da99b264e0..61162fa583 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -35,6 +35,18 @@ config BR2_PACKAGE_PSPLASH_IMAGE
 	  Use a personalized png image as boot splash.
 	  Let it empty if you want to keep the psplash default image.
 
+config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
+	bool "enable progress bar"
+	default y
+	help
+	  Enable progress bar management via the "PROGRESS" command.
+
+config BR2_PACKAGE_PSPLASH_STARTUP_MSG
+	bool "enable startup message"
+	default y
+	help
+	  Enable text banner output on startup.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 69f9bf386d..62268e778b 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -19,6 +19,18 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)
+PSPLASH_CONF_OPTS += --enable-progress-bar
+else
+PSPLASH_CONF_OPTS += --disable-progress-bar
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)
+PSPLASH_CONF_OPTS += --enable-startup-msg
+else
+PSPLASH_CONF_OPTS += --disable-startup-msg
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
