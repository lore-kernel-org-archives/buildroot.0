Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D169C7EE23
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7ED3613A0;
	Wed, 31 May 2023 15:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7ED3613A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT9hkK8vOeoV; Wed, 31 May 2023 15:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D74B6612E1;
	Wed, 31 May 2023 15:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D74B6612E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614221BF5DB
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 15:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39EDB4054E
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 15:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39EDB4054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDt8KfN9AAeQ for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 15:12:57 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E03B40194
Received: from mfwd10.mailplug.co.kr (mfwd10.mailplug.co.kr [14.63.168.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E03B40194
 for <buildroot@buildroot.org>; Wed, 31 May 2023 15:12:56 +0000 (UTC)
Received: (qmail 25525 invoked from network); 1 Jun 2023 00:06:13 +0900
Received: from wmail10.mailplug.com (121.156.118.13)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 1 Jun 2023 00:05:13 +0900
Received: (qmail 2375668 invoked from network); 1 Jun 2023 00:05:09 +0900
Received: from unknown (HELO sslauth19)
 (cherniaev.andrei@kairo.space@211.253.39.94)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 1 Jun 2023 00:05:09 +0900
From: AndreiCherniaev <cherniaev.andrei@kairo.space>
To: buildroot@buildroot.org
Date: Thu,  1 Jun 2023 00:05:06 +0900
Message-Id: <20230531150507.67562-1-cherniaev.andrei@kairo.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] add MMX instruction set capability for Geode CPU
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

Signed-off-by: AndreiCherniaev <cherniaev.andrei@kairo.space>

Before this patch there is no way no enable MMX for Geode. Modern Geode CPU support MMX.
This capability will interesting with ffmpeg for example.
---
 arch/Config.in.x86 | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index c770ae3ffe..595db48d91 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -521,11 +521,10 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
-	bool "geode"
-	# Don't include MMX support because there several variant of geode
-	# processor, some with MMX support, some without.
-	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
-	depends on !BR2_x86_64
+        bool "geode"
+        depends on !BR2_x86_64
+        help
+          see also BR2_x86_geode_with_MMX
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
@@ -633,5 +632,16 @@ config BR2_READELF_ARCH_NAME
 	default "Intel 80386"			if BR2_i386
 	default "Advanced Micro Devices X86-64" if BR2_x86_64
 
+config BR2_x86_geode_with_MMX
+        bool "GEODE with MMX"
+        depends on BR2_x86_geode
+        default n
+        select BR2_X86_CPU_HAS_MMX
+        help
+          there several variant of geode processor,
+          some with MMX support, some without.
+          See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+          And decide can you use MMX or not
+
 # vim: ft=kconfig
 # -*- mode:kconfig; -*-
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
