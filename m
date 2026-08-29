Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D085C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D99B605D0;
	Sat, 29 Aug 2026 21:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC4LJkvMoq_i; Sat, 29 Aug 2026 21:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038036;
	bh=C6D5Yl/Dqmvi3k7g3mHKaLzWaiEJuzDHP24cqZbEQvQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aU8U/wK+2RcCDKJszvhAj6E62qpX9qnUys0G5x1rRzBARfUQGfJXC9bSUhRwHqDwu
	 fYi3bkoTqWwP11BScMKFLSc1trWVIYx1JguTsFZBeq9pdmIznas47Wi1bB+IuNX672
	 6dKSTsDlnQIZRA96LCv2AXwjjQhNlF8nhat5Yq8lHSQpKDetR2NeachLZ6Wbceiul1
	 D2onSd4AqxuxatvtBFrSANcElOSQoxyR0pSy/YsSm3uhUwrAvJostfjYg6E7kNTGJV
	 Mc7BWhcMK0ybx1DB6+sdTHwa+NdUjnDCBFgrm87GaO6bbuWNjQTWWeBl2zEctYzVj/
	 RK/witnHNAYaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42319605EE;
	Sat, 29 Aug 2026 21:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E5F59D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4A5605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puxX74WxVvWv for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEABF605D0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:13:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E47C38F011; Sat, 29 Aug 2026 21:12:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:13:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ea2135a56d6038329ede3f744fbe5a363bc3557
X-Git-Newrev: bd5b267b1de0f9e00083ad862cdd5b11f16f402d
X-Patchwork-Hint: ignore
Message-Id: <20260829211255.E47C38F011@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: fix build failure with
 dbus and musl
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
Content-Type: multipart/mixed; boundary="===============1971486125248318467=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1971486125248318467==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd5b267b1de0f9e00083ad862cdd5b11f16f402d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The openscap build can fail with the following error:

In file included from [...]/src/OVAL/probes/unix/linux/systemdunitproperty_probe.c:38:
[...]/src/OVAL/probes/unix/linux/systemdshared.h: In function ‘get_all_systemd_units’:
[...]/src/OVAL/probes/unix/linux/systemdshared.h:188:50: error: implicit declaration of function ‘basename’; did you mean ‘rename’? [-Wimplicit-function-declaration]
  188 |                 char *unit_name_s = oscap_strdup(basename(value.str));
      |                                                  ^~~~~~~~
      |                                                  rename
In file included from [...]/src/OVAL/probes/unix/linux/systemdunitdependency_probe.c:37:
[...]/src/OVAL/probes/unix/linux/systemdshared.h: In function ‘get_all_systemd_units’:
[...]/src/OVAL/probes/unix/linux/systemdshared.h:188:50: error: implicit declaration of function ‘basename’; did you mean ‘rename’? [-Wimplicit-function-declaration]
  188 |                 char *unit_name_s = oscap_strdup(basename(value.str));
      |                                                  ^~~~~~~~
      |                                                  rename

This error happens when:
- dbus is enabled in the configuration, making openscap build probes
  code
- the toolchain uses musl, which does not declare basename() in string.h
  the way glibc does

The build error can be reproduced with the following minimal defconfig:

  BR2_arm=y
  BR2_cortex_a9=y
  BR2_ARM_ENABLE_NEON=y
  BR2_ARM_ENABLE_VFP=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE=y
  BR2_PACKAGE_DBUS=y
  BR2_PACKAGE_OPENSCAP=y

Backport the upstream fix to allow openscap to build with such
configuration. The custom patch can be removed once openscap is
re-released on its branch 1.3.x.

The issue affects master, 2026.05.x and 2025.02.x

Fixes: https://autobuild.buildroot.org/results/a874d4f34d36fa9f8566be90ad2d5facb99aec24/
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...02-OVAL-probes-add-missing-header-include.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/openscap/0002-OVAL-probes-add-missing-header-include.patch b/package/openscap/0002-OVAL-probes-add-missing-header-include.patch
new file mode 100644
index 0000000000..0c7598b2b5
--- /dev/null
+++ b/package/openscap/0002-OVAL-probes-add-missing-header-include.patch
@@ -0,0 +1,48 @@
+From ab69b76cb40d6f35d252246e965245804b17591f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
+Date: Thu, 13 Aug 2026 15:18:15 +0200
+Subject: [PATCH] OVAL/probes: add missing header include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Openscap build can fail with the following log when
+-Wimplicit-function-declaration is turned into an error:
+
+In file included from [...]/src/OVAL/probes/unix/linux/systemdunitproperty_probe.c:38:
+[...]/src/OVAL/probes/unix/linux/systemdshared.h: In function ‘get_all_systemd_units’:
+[...]/src/OVAL/probes/unix/linux/systemdshared.h:188:50: error: implicit declaration of function ‘basename’; did you mean ‘rename’? [-Wimplicit-function-declaration]
+  188 |                 char *unit_name_s = oscap_strdup(basename(value.str));
+      |                                                  ^~~~~~~~
+      |                                                  rename
+In file included from [...]/src/OVAL/probes/unix/linux/systemdunitdependency_probe.c:37:
+[...]/src/OVAL/probes/unix/linux/systemdshared.h: In function ‘get_all_systemd_units’:
+[...]/src/OVAL/probes/unix/linux/systemdshared.h:188:50: error: implicit declaration of function ‘basename’; did you mean ‘rename’? [-Wimplicit-function-declaration]
+  188 |                 char *unit_name_s = oscap_strdup(basename(value.str));
+      |                                                  ^~~~~~~~
+      |                                                  rename
+
+Add the missing header include pointed by `man 3 basename` to fix the
+error.
+
+Upstream: https://github.com/OpenSCAP/openscap/commit/ab69b76cb40d6f35d252246e965245804b17591f
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ src/OVAL/probes/unix/linux/systemdshared.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/OVAL/probes/unix/linux/systemdshared.h b/src/OVAL/probes/unix/linux/systemdshared.h
+index 879ae5be9d6c..57e94ca6f49e 100644
+--- a/src/OVAL/probes/unix/linux/systemdshared.h
++++ b/src/OVAL/probes/unix/linux/systemdshared.h
+@@ -35,6 +35,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <libgen.h>
+ #include <limits.h>
+ #include <stdio.h>
+ #include "common/debug_priv.h"
+-- 
+2.55.0
+

--===============1971486125248318467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1971486125248318467==--
