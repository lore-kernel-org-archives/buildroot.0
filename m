Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5213FCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7866060E;
	Sun, 11 Oct 2026 13:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQIPqQ7S2uPx; Sun, 11 Oct 2026 13:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1963960612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724393;
	b=dY4kQIaWbx6v26ias5TKk+kV8dEd/SBd5hG6eJJW/UJ0lrC0y8t0so8Wopow6AhPmPdG
	 a/Zp/6yemN3Gbg4QIuQ/1WXn7C29N4IqDeyHWCvwQ8AGp3zzZTSW5whlTOOzJ6e350NZB
	 4HwMrCy1szQq7AYaSby9Z3BGYzhsH5A3v6BhEjJX5bBUagQAS2suKp5rOs53Bad+Ef8oR
	 7slG1gXt0ey88bowF9NUqDErpflkLvBbGdAz8r1De3AEMm4qSKAC9XZebPLB59n6ZnMTx
	 feFVSdkkfJbnXXMegUdXX4HJWwLtyoC5Yfz1UY1t1PPnro0q0NsqwfpYOpsobbgQHEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=z6vPJCY9LigamMkWzFg6SGuBWZnJzGJQJsSXFapa7YY=;
	b=BL+A9Vo3ixoX1U944J/F0Rhi5YtGXwOeJj8Xn3yNibKRVa5Icx6P2fS51RnKnxEa3aCx
	 vUOtdDFLIllO2Ag88+vymDGX4/vlx7FmP/f6l5MICnr7OcUef2p5sVck2h6m1AtHLvYjr
	 t4GjPA1vAJRYOZJsfPhbg0uFyGRvc5F+00XGFViEziDKK2SIeZxqu6qJsNPJGgKf/+U3X
	 XVQEVjPCuaUnmvrvLpKsMAlc/jpeaQckIY/YY/g76+qyPx0hQszyqC5NHjN+zhWb6HpIH
	 hfJQ2rmYSNFH1zUxH9NAcTa9/1oR01IIohcJxVE2P8RDT0H3o84QdW6pvQMKkYZM4Cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724393;
	bh=z6vPJCY9LigamMkWzFg6SGuBWZnJzGJQJsSXFapa7YY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bDkimqxy/mOn/Vsu+/VCh1FWJGRoVvCV0x30uo0VovWkvt5UlBNBSkNc4Mjhrh/cz
	 l5y8QIe/C4w6uLOHWdQTtIfqf3r85uEkdmdalehS1kvU5mA8D/c9harhiTuV0yP+WM
	 2bcdQL+XTihCUHMjk+LjnRgM6s/xwGpjaWn1iCfMsY7aHiQF69HgWENaAJCwJxokTe
	 osZeXt5kh2W6X6iZFOdISCIr4HrKPshyQekdpFl2/OaFHQGXe9bxQYGhpxT7zrP6Nj
	 2t1ZmD1k01kmCWBbAjZgklXF+DJVt25osAz3bOArf5MXtrVGQy2SMr/bdYXsFfEUfl
	 3nWhFkWzVRLtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1963960612;
	Sun, 11 Oct 2026 13:13:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C2EA194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0217140676
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBPFL3WXHAsc for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2E9C7405BD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724389;
 b=nBcnYvdSym7O6jr/T5mBpcO4WlVBDFLt9SAe8IcWA2mUixMof/sZsQ/NwMHnsjw9bHay
 vl/Cud5ALy6zJbZQ2grDbN8jxF0QvaSSMyz/rVhaJs7NxWFf0gWdgvz7d7ai39NJSTAO+
 LZgcqQOBzfruTXq9B9jRDn8KgVsre8btvPu7XTf43xYAK+axRaCie1ZWiht9deQOJBb8V
 8SQnHacIsLvx9GwZ4cJx7g0/wdfFkvZ8YO4kWKfZPgApSgX2ErYlslwSNkRxp0+aEG+v2
 RLdIJ8ufow0GXz/Q9sz8yJ0tTk76fpLgOzebci0oPjoeFadichazva1h13WLuSj1a3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724389;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qmGR/z2dnlU5wtH6XnDKb2GE6v97om/5j1eAODBCQTI=;
 b=GYc3U1o5JP6cvUCtCg4zCtESr3u6VUwYBAwRpFYaTSlSvEbJbdQShZ3Jj4YgHfJZoYIQ
 CKv122tGcduirbKp2sCuue/6ximrZvZrhmikEhNOJRW0t46Io5eo6XoC2zOSA9ivEUNPE
 odmArKTzrYdBuA5o3cPUk8FD05Hz6+dCucKfZhq/eiye4okAMjap1bKPKuUx1wX3jQCoy
 W8xpX844F75HbBM+Mo7Ci54w/Y/akeGTDxuG9o/28jtZ18G7pe0i6LxOxZZyfM5kcDRC4
 1K6Edfw/jtLihIJtcS7C8TLDJtDuO7LgnSX0aASQqpwWU9qp6rl9lNJ8Qr6KgO/B0kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E9C7405BD
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:13:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76740937B6; Sun, 11 Oct 2026 13:11:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:12:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f7c08d8fb36e6e12522ce6f8012c91ace520204
X-Git-Newrev: 5e8705263cf4592d8c02fac71803053e17d4f83b
X-Patchwork-Hint: ignore
Message-Id: <20261011131150.76740937B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add first-class support for all
 upstream linux versions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e8705263cf4592d8c02fac71803053e17d4f83b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add new KConfig symbols for all actively supported longterm versions of the
Linux kernel. This makes it easier for individual configs to follow updates
of their kernels, without having to frequently update them. This should
generally improve the security of the target systems, which receive frequent
security updates while preserving a stable feature set.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Peter: move BR2_LINUX_KERNEL_LATEST_SERIES outside the choice to make
	utils/check-symbols happy, add version symlinks]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/5.10.271                       |  1 +
 linux/5.15.222                       |  1 +
 linux/6.1.189                        |  1 +
 linux/6.12.112                       |  1 +
 linux/6.18.55                        |  1 +
 linux/6.6.158                        |  1 +
 linux/Config.in                      | 49 +++++++++++++++++++++++++++++++++---
 linux/linux.mk                       |  2 +-
 package/linux-headers/Config.in.host |  4 +--
 9 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/linux/5.10.271 b/linux/5.10.271
new file mode 120000
index 0000000000..108006b730
--- /dev/null
+++ b/linux/5.10.271
@@ -0,0 +1 @@
+before-6.17
\ No newline at end of file
diff --git a/linux/5.15.222 b/linux/5.15.222
new file mode 120000
index 0000000000..108006b730
--- /dev/null
+++ b/linux/5.15.222
@@ -0,0 +1 @@
+before-6.17
\ No newline at end of file
diff --git a/linux/6.1.189 b/linux/6.1.189
new file mode 120000
index 0000000000..108006b730
--- /dev/null
+++ b/linux/6.1.189
@@ -0,0 +1 @@
+before-6.17
\ No newline at end of file
diff --git a/linux/6.12.112 b/linux/6.12.112
new file mode 120000
index 0000000000..108006b730
--- /dev/null
+++ b/linux/6.12.112
@@ -0,0 +1 @@
+before-6.17
\ No newline at end of file
diff --git a/linux/6.18.55 b/linux/6.18.55
new file mode 120000
index 0000000000..74e2b2d5b6
--- /dev/null
+++ b/linux/6.18.55
@@ -0,0 +1 @@
+from-6.17
\ No newline at end of file
diff --git a/linux/6.6.158 b/linux/6.6.158
new file mode 120000
index 0000000000..108006b730
--- /dev/null
+++ b/linux/6.6.158
@@ -0,0 +1 @@
+before-6.17
\ No newline at end of file
diff --git a/linux/Config.in b/linux/Config.in
index 3521fe5cd5..ec705b0bb0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,6 +21,12 @@ if BR2_LINUX_KERNEL
 config BR2_LINUX_NEEDS_MODULES
 	bool
 
+config BR2_LINUX_KERNEL_LATEST_SERIES
+	# Helper symbol to indicate if one of the "latest" kernel
+	# (either the very latest one or from a longterm supported series)
+	# has been selected
+	bool
+
 #
 # Version selection. We provide the choice between:
 #
@@ -35,12 +41,44 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (7.2)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_18
+	bool "Long term 6.18"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_12
+	bool "Long term 6.12"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_6
+	bool "Long term 6.6"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_1
+	bool "Long term 6.1"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_5_15
+	bool "Long term 5.15"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_5_10
+	bool "Long term 5.10"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.254-cip72)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -63,6 +101,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -144,6 +183,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.55" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.222" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.271" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
@@ -189,9 +234,7 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# requires host-openssl, so select it for the latest kernel
 	# version and the latest CIP version.
 	# This is mainly needed to fix autobuilder testing.
-	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION || \
-	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
diff --git a/linux/linux.mk b/linux/linux.mk
index cd80904113..75294cff18 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -45,7 +45,7 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
+ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_SERIES),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
 
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b11db18379..3cf2cdd4f4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -118,9 +118,7 @@ endif
 choice
 	bool "Custom kernel headers series"
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
-	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_SERIES || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
 		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
