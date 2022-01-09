Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B635C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BB504036F;
	Sun,  9 Jan 2022 15:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpJYI-KVfbfr; Sun,  9 Jan 2022 15:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D6964022C;
	Sun,  9 Jan 2022 15:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0831BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219704033C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPGQmCvIKIXS for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:40:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55ECB40339
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8414082D9F; Sun,  9 Jan 2022 15:33:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 16:35:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c669bd5115d748a76018490af0c798df2747657d
X-Git-Newrev: 4e36e8f2081a66f477dd038793082045876d65ee
X-Patchwork-Hint: ignore
Message-Id: <20220109153345.8414082D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: disable system mbedtls
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e36e8f2081a66f477dd038793082045876d65ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hiawatha needs mbedtls3 since bump to version 11.1 in commit
24e4c888c3d36e3943206ea55894b84344cc8b2e:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/hiawatha-11.1/src/wigwam.c:39:10: fatal error: mbedtls/psa_util.h: No such file or directory
   39 | #include "mbedtls/psa_util.h"
      |          ^~~~~~~~~~~~~~~~~~~~

As mbedtls 3.x is not backward compatible with mbedtls 2.x, disable
system mbedtls to let hiawatha uses its own copy (which will be
installed in $(TARGET_DIR)/usr/lib/hiawatha)

Fixes:
 - http://autobuild.buildroot.org/results/064af90aa95c28781d96d7eca0f14841fce0687a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiawatha/Config.in   | 1 -
 package/hiawatha/hiawatha.mk | 7 +++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 8f1908f6f4..4b1a3ca86c 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -32,6 +32,5 @@ if BR2_PACKAGE_HIAWATHA
 
 config BR2_PACKAGE_HIAWATHA_SSL
 	bool "hiawatha TLS support"
-	select BR2_PACKAGE_MBEDTLS
 
 endif
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 5618e6900d..017592de1e 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -20,8 +20,11 @@ HIAWATHA_CONF_OPTS = \
 	-DWORK_DIR=/var/lib/hiawatha
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_MBEDTLS=ON
-HIAWATHA_DEPENDENCIES += mbedtls
+# Disable system mbedtls as hiawatha needs mbedtls 3.x
+HIAWATHA_CONF_OPTS += \
+	-DENABLE_TLS=ON \
+	-DINSTALL_MBEDTLS_HEADERS=OFF \
+	-DUSE_SYSTEM_MBEDTLS=OFF
 else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
