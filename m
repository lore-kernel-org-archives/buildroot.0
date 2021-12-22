Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F70C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 08:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EF9682F51;
	Wed, 22 Dec 2021 08:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UncCx_ery1W7; Wed, 22 Dec 2021 08:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7FB382D0F;
	Wed, 22 Dec 2021 08:30:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEDA91BF2FA
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB6C760EDC
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwxYZjbBc6Np for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 08:30:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AD9060E66
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 08:30:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F6311814B9; Wed, 22 Dec 2021 09:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1640161842; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=8bQ0mbjsjY9CQpf2XdQOc2SUNoyyuv/Q9MB6J30XRTY=;
 b=RHsX86hlXTE2wZmfWyOeF810tvVWdpS/oHymSM7o/okeaOezV3KTWX4c6/GqZqwJTiyRhO
 /MjdJi2qXKKN4ugxEYwgDxdmikTTLUPTZ8hnoqRuU8IPC1BYOHqhVl4M47A0F1GD0Z3tUI
 1nbR9OxhGB7hl/vl8NCVBsa9aWruDkc=
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 09:30:19 +0100
Message-Id: <20211222083020.49627-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/boost: fix interprocess with musl
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Interprocess in 1.78.0 broke on musl with commit efc75031f568a16e8520019deeb71e272818c467
by using stuff from sys/stat.h without including it.

Fixes:
 - http://autobuild.buildroot.net/results/8af247ad084d510cd1100f76cb57a7fd32fcdb69

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...stat_h-include-on-musl-based-systems.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/boost/0001-fix-missing-sys_stat_h-include-on-musl-based-systems.patch

diff --git a/package/boost/0001-fix-missing-sys_stat_h-include-on-musl-based-systems.patch b/package/boost/0001-fix-missing-sys_stat_h-include-on-musl-based-systems.patch
new file mode 100644
index 0000000000..132b88e47e
--- /dev/null
+++ b/package/boost/0001-fix-missing-sys_stat_h-include-on-musl-based-systems.patch
@@ -0,0 +1,33 @@
+From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
+From: Leonardo Neumann <leonardo@neumann.dev.br>
+Date: Mon, 13 Dec 2021 01:07:20 -0300
+Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
+
+Boost 1.78.0 fails to build on musl-based systems because musl does
+not include sys/stat.h by default.
+
+Fixes #161 ("Boost compiler error")
+[buildroot@heine.tech:
+  - patch from https://github.com/boostorg/interprocess/pull/162
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+ boost/interprocess/permissions.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
+index ab55411e..0b21a685 100644
+--- a/boost/interprocess/permissions.hpp
++++ b/boost/interprocess/permissions.hpp
+@@ -29,6 +29,10 @@
+ 
+ #include <boost/interprocess/detail/win32_api.hpp>
+ 
++#else
++
++#include <sys/stat.h>
++
+ #endif
+ 
+ #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
