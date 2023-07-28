Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8922CC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 15:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABC2614BC;
	Fri, 28 Jul 2023 15:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABC2614BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qs7PeEqj4q1r; Fri, 28 Jul 2023 15:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49CE0614A9;
	Fri, 28 Jul 2023 15:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49CE0614A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B29741BF28B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 15:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CF7A61492
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 15:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF7A61492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtIQinhcQcR8 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 15:19:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90D2D60B46
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 15:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D2D60B46
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2E36A4C0E76
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 17:19:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPPF9-0000w9-2C
 for buildroot@buildroot.org; Fri, 28 Jul 2023 17:19:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 17:19:03 +0200
Message-Id: <20230728151903.466787-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728151903.466787-1-bernd@kuhls.net>
References: <20230728151903.466787-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690557543;
 bh=H/iuj/7uJo2YQpWFSx5yWsHwQly48D8bfBpiyEXQ7FY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fACSqXRIOchrVCqQNxRKnP7VBPUiNuQWs6e3UbSM0Z2KgL1PTEs1Za+UqAbrY2L4Z
 S2k00tTQMBXFVTLgUs7x1JnbMH7MGY0DoMLQLVpWa9wvOAT0uCNhPYqKFkl7ZqY4GS
 OczPH/TkviwmXYajqkQQ4PukBacXCmz9wVnJcbIS/4FsE5P0Sp11DWaeZz5yUBKpDS
 UXoR5DgDw6dXm5YW76AoDccSWbXIvfwpBoYwwookalVdRnl+5I7hu/+LHVqffwfopH
 dd+kEa+QjxTj9LC3NApC/1sAEhiQyu8hyQ6Qo3CfE7evvk0/0+6AfHfggcCMlHWvLa
 r3h5Zy42+HVgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fACSqXRI
Subject: [Buildroot] [PATCH 2/2] package/libopenssl: fix libatomic
 dependency for x86 builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
autobuild.buildroot.net/results/ba9/ba926fc27cf3d97274729b3ec1cadb3229bd3af3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0006-Add-linux-x86-latomic-target.patch   | 30 +++++++++++++++++++
 package/libopenssl/Config.in                  |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/libopenssl/0006-Add-linux-x86-latomic-target.patch

diff --git a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
new file mode 100644
index 0000000000..f47eb1d268
--- /dev/null
+++ b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
@@ -0,0 +1,30 @@
+From c80a60dca209813c33ab3d2794bc32d84c12d033 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 28 Jul 2023 17:11:25 +0200
+Subject: [PATCH 1/1] Add linux-x86-latomic target
+
+Upstream: https://github.com/openssl/openssl/pull/21590
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Configurations/10-main.conf | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
+index 2200a85b16..bcf54a2a53 100644
+--- a/Configurations/10-main.conf
++++ b/Configurations/10-main.conf
+@@ -861,6 +861,10 @@ my %targets = (
+         asm_arch         => 'x86',
+         perlasm_scheme   => "elf",
+     },
++    "linux-x86-latomic" => {
++        inherit_from     => [ "linux-x86" ],
++        ex_libs          => add(threads("-latomic")),
++    },
+     "linux-x86-clang" => {
+         inherit_from     => [ "linux-x86" ],
+         CC               => "clang",
+-- 
+2.39.2
+
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index fdfa135f52..3199de8cfe 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -20,7 +20,8 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-ppc"			if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
 	default "linux-ppc64"			if BR2_powerpc64
 	default "linux-ppc64le"			if BR2_powerpc64le
-	default "linux-x86"			if BR2_i386
+	default "linux-x86"			if BR2_i386 && !BR2_TOOLCHAIN_HAS_LIBATOMIC
+	default "linux-x86-latomic"		if BR2_i386 && BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-x86_64"			if BR2_x86_64
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
