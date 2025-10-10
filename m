Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276D7CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8700884760;
	Fri, 10 Oct 2025 16:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GDCUlo13PQa; Fri, 10 Oct 2025 16:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC8E0847B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC8E0847B0;
	Fri, 10 Oct 2025 16:23:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 795BF226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60396614FB
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxduT65jysCN for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83233614FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83233614FA
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7031186F4B; Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 18:18:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9d3a0418be38a237a51bb8aacce5bda40e2bddc
X-Git-Newrev: ee984e116a83dedf1fae4e680369943ea2a53153
X-Patchwork-Hint: ignore
Message-Id: <20251010162330.7031186F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: add config option for
 "enableaudit"
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee984e116a83dedf1fae4e680369943ea2a53153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux policies commonly contain "dontaudit" rules, which omit
certain denied actions from the audit logs to keep the log volume
manageable. When investigating issues this can become a problem in
itself because messages that could show the cause might be hidden.

The common advice is to use "semodule -DB" to temporarily disable the
dontaudit rules, but this is only possible with a modular policy,
while package/refpolicy builds a monolithic policy. Instead, the
Rules.monolithic makefile offers the "enableaudit" target, which
removes any dontaudit rules before compiling the policy.

This patch adds a config option to run the enableaudit target during
the configure stage, intended for debug builds.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: remove unneeded "default n" in Config.in]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/refpolicy/Config.in    | 12 ++++++++++++
 package/refpolicy/refpolicy.mk |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 7aea39b223..242d7f34e0 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -121,6 +121,18 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_ENABLEAUDIT
+	bool "remove dontaudit rules from policy (debugging only)"
+	help
+	  Remove dontaudit rules from policy.conf before compiling the
+	  policy. This can be useful for debugging to see "denied"
+	  audit log messages that would otherwise be hidden, which
+	  show the cause of problems.
+
+	  Warning: This option will likely produce a high rate of
+	  audit log messages, and should be enabled only for
+	  debugging.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads, gcc >= 5, host gcc >= 5"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index be27147ec5..127faf793a 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -101,6 +101,12 @@ define REFPOLICY_CONFIGURE_SYSTEMD
 endef
 endif
 
+ifeq ($(BR2_REFPOLICY_ENABLEAUDIT),y)
+define REFPOLICY_CONFIGURE_ENABLEAUDIT
+	$(REFPOLICY_MAKE) -C $(@D) enableaudit
+endef
+endif
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
@@ -111,6 +117,7 @@ define REFPOLICY_CONFIGURE_CMDS
 		$(REFPOLICY_COPY_EXTRA_MODULES)
 	)
 	$(REFPOLICY_MAKE) -C $(@D) bare conf
+	$(REFPOLICY_CONFIGURE_ENABLEAUDIT)
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
