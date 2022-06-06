Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FB2C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0151383F7E;
	Mon,  6 Jun 2022 12:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1WAjwsnpt69; Mon,  6 Jun 2022 12:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 987B683F13;
	Mon,  6 Jun 2022 12:57:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 666A11BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6332E60BCE
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZ-kdhix1G0A for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:57:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB2060BDC
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:57:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F75B86D4B; Mon,  6 Jun 2022 12:45:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:57:11 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2ef9db7ad325e4fb3a142e10c2146da1fbf7e766
X-Git-Newrev: 4c4230c32cb9a266be76eb430dc26f7241af8c44
X-Patchwork-Hint: ignore
Message-Id: <20220606124526.4F75B86D4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcec: fix build
 with gcc 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c4230c32cb9a266be76eb430dc26f7241af8c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with gcc 10:

/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h: In function 'bool LibCecBootloader(const char*)':
/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:175:14: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
  175 |       return NULL;
      |              ^~~~
/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:184:12: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
  184 |     return NULL;
      |            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/e34bd78cc81e6da12a85c1e4ee76931818d91073

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 858a7fe4e59ae43b6c83d203ca6591c444618eff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libcec/0001-cecloader-h-fix-null-return.patch  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libcec/0001-cecloader-h-fix-null-return.patch b/package/libcec/0001-cecloader-h-fix-null-return.patch
new file mode 100644
index 0000000000..424e41c0ae
--- /dev/null
+++ b/package/libcec/0001-cecloader-h-fix-null-return.patch
@@ -0,0 +1,37 @@
+From 452b2049b2ee3e73968c603e5524b2d349ac0c3e Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Sat, 9 Apr 2022 17:59:11 +0000
+Subject: [PATCH] cecloader.h: fix null return
+
+returning NULL is invalid for a return type of bool when NULL is defined
+as `nullptr` instead of 0L
+
+[Retrieved from:
+https://github.com/Pulse-Eight/libcec/pull/599/commits/452b2049b2ee3e73968c603e5524b2d349ac0c3e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/cecloader.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/cecloader.h b/include/cecloader.h
+index be76468f..550f598e 100644
+--- a/include/cecloader.h
++++ b/include/cecloader.h
+@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+     if (!g_libCEC)
+     {
+       std::cout << dlerror() << std::endl;
+-      return NULL;
++      return false;
+     }
+   }
+ 
+@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+   if (!LibCecBootloader)
+   {
+     std::cout << "cannot find CECStartBootloader" << std::endl;
+-    return NULL;
++    return false;
+   }
+ 
+   bool bReturn = LibCecBootloader();
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
