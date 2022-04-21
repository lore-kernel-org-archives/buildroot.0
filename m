Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13780C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC73F83033;
	Thu, 21 Apr 2022 21:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4UjrLjMBJ9t; Thu, 21 Apr 2022 21:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D6782CD3;
	Thu, 21 Apr 2022 21:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1591BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CEA441149
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAKUUAwVNgDo for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BCAB4113C
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4A6A8840FF; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:28:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c99d2d34298ddfed16581ae3405ed70b52640cb5
X-Git-Newrev: 7a441e4cf967094f2e2429a37dd2107bb91d2a81
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.4A6A8840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: add tbb support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7a441e4cf967094f2e2429a37dd2107bb91d2a81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opencv4/Config.in  | 14 ++++++++++++++
 package/opencv4/opencv4.mk | 10 ++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 31c32385da..23d34a9d22 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -309,6 +309,20 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
+config BR2_PACKAGE_OPENCV4_WITH_TBB
+	bool "tbb support"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # tbb
+	select BR2_PACKAGE_TBB
+	help
+	  Use shared tbb from the target system.
+
+comment "tbb needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
+comment "tbb needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_OPENCV4_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index e75f7144de..0563026b18 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -155,8 +155,7 @@ OPENCV4_CONF_OPTS += \
 	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
-	-DWITH_IPP_A=OFF \
-	-DWITH_TBB=OFF
+	-DWITH_IPP_A=OFF
 
 # Smartek stuff
 OPENCV4_CONF_OPTS += -DWITH_GIGEAPI=OFF
@@ -313,6 +312,13 @@ else
 OPENCV4_CONF_OPTS += -DWITH_QT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TBB),y)
+OPENCV4_CONF_OPTS += -DWITH_TBB=ON
+OPENCV4_DEPENDENCIES += tbb
+else
+OPENCV4_CONF_OPTS += -DWITH_TBB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TIFF),y)
 OPENCV4_CONF_OPTS += -DWITH_TIFF=ON
 OPENCV4_DEPENDENCIES += tiff
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
