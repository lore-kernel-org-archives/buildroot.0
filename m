Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34865C28B2B
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1A041BB1;
	Thu, 18 Aug 2022 06:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1A041BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdHxGOVzbXBg; Thu, 18 Aug 2022 06:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C37941B87;
	Thu, 18 Aug 2022 06:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C37941B87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 585911BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E4E41BA8
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30E4E41BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYno8gfuTv7z for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45AFF41B87
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45AFF41B87
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B5DD187991; Thu, 18 Aug 2022 06:16:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:24:57 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ef5d468a888c4c8dece719f10b893045480b8663
X-Git-Newrev: dfdeccd91245f3af0ff4a28530fc2f6affedebf4
X-Patchwork-Hint: ignore
Message-Id: <20220818061635.B5DD187991@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/sg3_utils: fix
 build failure due to gcc bug 104028
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfdeccd91245f3af0ff4a28530fc2f6affedebf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The sg3_utils package exhibits gcc bug 104028 when built for the M68K
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_104028=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 283573f9b33e4450859c0ebcf8bfc456b80b5895)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sg3_utils/sg3_utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index e357fc1dde..b291bd69d9 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -24,6 +24,14 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SG3_UTILS_CONF_ENV += LIBS="-latomic"
 endif
 
+SG3_UTILS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+SG3_UTILS_CFLAGS += -O0
+endif
+
+SG3_UTILS_CONF_ENV += CFLAGS="$(SG3_UTILS_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
 define SG3_UTILS_REMOVE_PROGS
 	for prog in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
