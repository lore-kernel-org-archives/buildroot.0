Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97183C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 08:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5358138E;
	Tue,  2 Aug 2022 08:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5358138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3if3iZZOFQeq; Tue,  2 Aug 2022 08:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5735F8138A;
	Tue,  2 Aug 2022 08:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5735F8138A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2ADD71BF37E
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 132E360B5D
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 132E360B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjzqQAQjXpI7 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 08:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A2060B49
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 08:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A2060B49
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D02FA86C94; Tue,  2 Aug 2022 08:38:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Aug 2022 00:24:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eda5590fa9fc647598e2a407612b4072ec8cb3cd
X-Git-Newrev: b05b6bb9faab4e611e65227a4c4e9800b1556590
X-Patchwork-Hint: ignore
Message-Id: <20220802083855.D02FA86C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: refactor using
 BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b05b6bb9faab4e611e65227a4c4e9800b1556590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvmtools/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index c866b36569..88cccd08af 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -1,6 +1,11 @@
+config BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_OPENVMTOOLS
 	bool "openvmtools"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -51,7 +56,7 @@ comment "resolutionkms needs udev, a toolchain w/ threads"
 endif
 
 comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_ENABLE_LOCALE || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
