Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7042FC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8AC4051D;
	Sun, 12 Mar 2023 14:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D8AC4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqUbWmwksmqu; Sun, 12 Mar 2023 14:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50E5C40484;
	Sun, 12 Mar 2023 14:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E5C40484
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C28411BF31F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB8540484
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB8540484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4TghnKWAUfa for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D43F3404DF
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D43F3404DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEBB886F20; Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 15:46:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 243c76cfa6990d0743424fe5d1a30dda950166a3
X-Git-Newrev: 5ca0250eb991570f6137a84ceab86d9cb9cd9ac5
X-Patchwork-Hint: ignore
Message-Id: <20230312144943.BEBB886F20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: fix build failure due
 to mixed endianness
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ca0250eb991570f6137a84ceab86d9cb9cd9ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit cde69c668d6692114845a927c8c5534ed78019db bumped version where
Makefile changed CONFIG_PLATFORM_GENERIC to CONFIG_PLATFORM_AUTODETECT.
This way overriding the default platform doesn't work anymore resulting in
wrong CFLAGS including endianness macro and leading to a build failure.
So let's rename CONFIG_PLATFORM_GENERIC to CONFIG_PLATFORM_AUTODETECT to
fix.

Fixes:
http://autobuild.buildroot.net/results/2a8432646926b3b69383d204673c4113aae9de12

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8821cu/rtl8821cu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index b3e4ad3fc8..5a93376c20 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -24,7 +24,7 @@ RTL8821CU_USER_EXTRA_CFLAGS = \
 	-Wno-error
 
 RTL8821CU_MODULE_MAKE_OPTS = \
-	CONFIG_PLATFORM_GENERIC=n \
+	CONFIG_PLATFORM_AUTODETECT=n \
 	CONFIG_RTL8821CU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
