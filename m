Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CACC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3FA384BB1;
	Sun, 24 Jul 2022 08:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FA384BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeXHPkosaUCm; Sun, 24 Jul 2022 08:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4D8D84BA3;
	Sun, 24 Jul 2022 08:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D8D84BA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4B01BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 445CF60B77
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 445CF60B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcPoX6fUtc2r for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:55:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 562D56064D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 562D56064D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 886EB85538; Sun, 24 Jul 2022 08:41:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 10:54:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d991c92f5be6a9a858c8689ea2d927365e9c664
X-Git-Newrev: ca1b48691003fd72f5f0b373e6737a1796611bf3
X-Patchwork-Hint: ignore
Message-Id: <20220724084143.886EB85538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca1b48691003fd72f5f0b373e6737a1796611bf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add python3 dependencies to avoid the following build failure raised
since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

Makefile:576: *** libffi is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/2893c213f49d37a0878dcf14ec68ef991471c70f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntpsec/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
index 1e88046420..c81673481e 100644
--- a/package/ntpsec/Config.in
+++ b/package/ntpsec/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_NTPSEC
 	bool "ntpsec"
+	depends on BR2_USE_MMU # python3
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON3
@@ -26,3 +30,8 @@ config BR2_PACKAGE_NTPSEC_NTS
 	  Enable Network Time Security (NTS) support.
 
 endif
+
+comment "ntpsec needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
