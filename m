Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99425C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BA460BC0;
	Sun,  9 Jan 2022 18:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehGRSUUa21Jm; Sun,  9 Jan 2022 18:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE41B60B91;
	Sun,  9 Jan 2022 18:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 495AD1BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 459CA60B91
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95XdUp7igGXW for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:18:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C08860B59
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:18:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7F87B82DB5; Sun,  9 Jan 2022 18:12:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 19:17:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac573c55aac3cbb4257f5388c91321c81095c654
X-Git-Newrev: bf9dcd3b08fd88ef21550f75dc57de212fcea26c
X-Patchwork-Hint: ignore
Message-Id: <20220109181211.7F87B82DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: disable
 MBEDTLS_FATAL_WARNINGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf9dcd3b08fd88ef21550f75dc57de212fcea26c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable MBEDTLS_FATAL_WARNINGS to avoid the following build failure
since bump to version 2.28.0 in commit
0f8aab08e762742d753d5920718f31c629d0f8d7:

/home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  412 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/af017382bb5772de7383d71ed7b8af44717981f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index c238d664f8..5facb99b2a 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -8,7 +8,8 @@ MBEDTLS_VERSION = 2.28.0
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-	-DENABLE_TESTING=OFF
+	-DENABLE_TESTING=OFF \
+	-DMBEDTLS_FATAL_WARNINGS=OFF
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0
 MBEDTLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
