Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC2C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D95864039D;
	Thu, 11 Aug 2022 11:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95864039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYrKCMHelAxW; Thu, 11 Aug 2022 11:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F014032A;
	Thu, 11 Aug 2022 11:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02F014032A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 660421BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4109E60FBE
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4109E60FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leCBEZeiWwQ4 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB9360F5D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB9360F5D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 562C787113; Thu, 11 Aug 2022 11:23:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:36:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6b80ec9cac889a9cf1cdff6bd8582caccb6e95be
X-Git-Newrev: be070658aa5af1d4719a2c91849d9d7bec14b0bf
X-Patchwork-Hint: ignore
Message-Id: <20220811112356.562C787113@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libp11: needs
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=be070658aa5af1d4719a2c91849d9d7bec14b0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

threads are mandatory since bump to version 0.4.12 in commit
86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb and
https://github.com/OpenSC/libp11/commit/4bd92da60a670e3c25d9cb69fca3363f47a225c7:

In file included from eng_back.c:30:
p11_pthread.h:92:2: error: #error Locking not supported on this platform.
   92 | #error Locking not supported on this platform.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/22adeb78ec4a807c362e6666825f50db6c0408f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a81caea821199a2932f82ad24b1ee93c577a0477)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index 4d7ff56895..ef1e5b4703 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBP11
 	bool "libp11"
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBP11
 
 	  https://github.com/OpenSC/OpenSC/wiki
 
-comment "libp11 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libp11 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
