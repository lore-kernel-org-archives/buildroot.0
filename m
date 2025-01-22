Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBDC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C25851A0;
	Fri, 28 Feb 2025 17:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQWrXKB_vt8Q; Fri, 28 Feb 2025 17:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0562C851C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0562C851C7;
	Fri, 28 Feb 2025 17:01:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1174F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87224265D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4fiVZ_4AFO6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820DD4195D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 820DD4195D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DA1883AB0; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 21:44:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 24a19e01a6449cc22e0a83660ff651da8cd50b91
X-Git-Newrev: ea8dcb2288149e4ebbdb473ef2ac2f0ddb1f786e
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.7DA1883AB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igt-gpu-tools: add
 option to enable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea8dcb2288149e4ebbdb473ef2ac2f0ddb1f786e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Leave IGT tests disabled by default but allow users to build them with a
new Kconfig option. Those tests are helpful to sanity check GPUs on a
system.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igt-gpu-tools/Config.in        | 10 ++++++++++
 package/igt-gpu-tools/igt-gpu-tools.mk |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index de87bf8e99..184acb4cf1 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -24,6 +24,16 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 
 	  https://gitlab.freedesktop.org/drm/igt-gpu-tools
 
+if BR2_PACKAGE_IGT_GPU_TOOLS
+
+config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
+	bool "enable tests"
+	help
+	  Enable IGT tests, resulting in individual executables
+	  for GPU testing under /usr/libexec/igt-gpu-tools.
+
+endif
+
 comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index e3e7d4a896..bc430b6222 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -24,8 +24,13 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	zlib
 
 IGT_GPU_TOOLS_CONF_OPTS = \
-	-Dchamelium=disabled \
-	-Dtests=disabled
+	-Dchamelium=disabled
+
+ifeq ($(BR2_PACKAGE_IGT_GPU_TOOLS_TESTS),y)
+IGT_GPU_TOOLS_CONF_OPTS += -Dtests=enabled
+else
+IGT_GPU_TOOLS_CONF_OPTS += -Dtests=disabled
+endif
 
 # On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
 # indirect functions at runtime by checking CPU features with igt_x86_features.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
