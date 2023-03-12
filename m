Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7ECC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3774B40025;
	Sun, 12 Mar 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3774B40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlixSIPrqc-a; Sun, 12 Mar 2023 14:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 649BB404C2;
	Sun, 12 Mar 2023 14:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 649BB404C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84B311BF31F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C2EC60A6F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C2EC60A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGLfdda5JoPT for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 14:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9253F607CE
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 14:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9253F607CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8211F86F2C; Sun, 12 Mar 2023 14:51:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 15:50:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6219046db6a434d549706e039f221c46464cee21
X-Git-Newrev: d82fea26623e3934e1e6f82d9f6fce078914419b
X-Patchwork-Hint: ignore
Message-Id: <20230312145137.8211F86F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d82fea26623e3934e1e6f82d9f6fce078914419b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janet needs gcc >= 4.9 for stdatomic.h since version 1.26.0 and
https://github.com/janet-lang/janet/commit/bfcfd58259911b92ff516bab9216831b34653805
resulting in the following build failure since commit
5c6f32bd255fc97823d464beacfa905a141066ec:

src/core/abstract.c:35:23: fatal error: stdatomic.h: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/a2b40adb93b751221ba2cdf9a705f86c30499021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janet/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/janet/Config.in b/package/janet/Config.in
index 0e25ce34e3..7b78c14bf4 100644
--- a/package/janet/Config.in
+++ b/package/janet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JANET
 	bool "janet"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  Janet is a functional and imperative programming language.
 	  The entire language (core library, interpreter, compiler,
@@ -8,3 +9,6 @@ config BR2_PACKAGE_JANET
 	  and two headers.
 
 	  https://janet-lang.org/
+
+comment "janet needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
