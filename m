Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F59C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBF8503FD;
	Fri, 28 Feb 2025 17:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xThLUtJmMA9B; Fri, 28 Feb 2025 17:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAC2503C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BAC2503C5;
	Fri, 28 Feb 2025 17:12:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 128B868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D305542EFB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnAsn-vXWuB7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1EB342F8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1EB342F8D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDF7A7FDE0; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 17:33:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8a90a5efb65d78706940a57d5aad72770f84788
X-Git-Newrev: 3ef139386dae7cb82dfe9187cde18275999cf0b9
X-Patchwork-Hint: ignore
Message-Id: <20250228163031.BDF7A7FDE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package: add support for
 <pkg>_BUSYBOX_CONFIG_FIXUPS
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef139386dae7cb82dfe9187cde18275999cf0b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This will allow individual packages to define extra Busybox options
that they need.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.adoc | 6 ++++++
 package/busybox/busybox.mk               | 1 +
 package/pkg-generic.mk                   | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 89fc700452..f0b0508f53 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -631,6 +631,12 @@ different steps of the build process.
   This is seldom used, as package usually have no strict requirements on
   the kernel options.
 
+* +LIBFOO_BUSYBOX_CONFIG_FIXUPS+ lists the Busybox configuration
+  options that are needed to use this package especially in some scripts,
+  or at contrario the useless options. This shall be a set of
+  calls to one of the kconfig tweaking option: `KCONFIG_ENABLE_OPT`,
+  `KCONFIG_DISABLE_OPT`, or `KCONFIG_SET_OPT`.
+
 The preferred way to define these variables is:
 
 ----
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 900e5e7877..b7f1439fbc 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -422,6 +422,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
 define BUSYBOX_BUILD_CMDS
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fb9d9996c8..8fb6f97be8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1242,6 +1242,9 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+ifneq ($$($(2)_BUSYBOX_CONFIG_FIXUPS),)
+PACKAGES_BUSYBOX_CONFIG_FIXUPS += $$($(2)_BUSYBOX_CONFIG_FIXUPS)$$(sep)
+endif
 ifneq ($$($(2)_LINUX_CONFIG_FIXUPS),)
 PACKAGES_LINUX_CONFIG_FIXUPS += $$($(2)_LINUX_CONFIG_FIXUPS)$$(sep)
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
