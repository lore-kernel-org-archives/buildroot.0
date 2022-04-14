Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C23CF60F9C;
	Thu, 14 Apr 2022 19:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGQ5nB3k6rL6; Thu, 14 Apr 2022 19:46:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8FE60DF6;
	Thu, 14 Apr 2022 19:46:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA2A91BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C76AE60ACE
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzn7JKrZp0wN for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C88060F9C
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D37F383CAD; Thu, 14 Apr 2022 19:36:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:38:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2448ad26876564f480afc8c7c968fc44666decb3
X-Git-Newrev: f3c9d992cf73acafca96c6186428be3593457dde
X-Patchwork-Hint: ignore
Message-Id: <20220414193600.D37F383CAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix build on powerpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3c9d992cf73acafca96c6186428be3593457dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set NSS_DISABLE_CRYPTO_VSX which is available since version 3.64 and
https://github.com/nss-dev/nss/commit/9dab43371d4d924419523e18ba84f02804880533
to avoid the following build failure on powerpc:

cc1: warning: '-mvsx' requires hardware floating point
cc1: error: '-mno-vsx' turns off '-mcrypto'

Passing this option on non-powerpc is harmless.

Fixes:
 - http://autobuild.buildroot.org/results/6bedb5b658f6c9c16c26c73a524a995e5e84fcc8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libnss/libnss.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 57df104d6c..7568ec67ed 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -64,6 +64,11 @@ ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 LIBNSS_BUILD_VARS += NSS_DISABLE_ALTIVEC=1
 endif
 
+ifeq ($(BR2_POWERPC_CPU_HAS_VSX),)
+# Disable VSX if not supported
+LIBNSS_BUILD_VARS += NSS_DISABLE_CRYPTO_VSX=1
+endif
+
 ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 # Disable arm32-neon if neon is not supported
 LIBNSS_BUILD_VARS += NSS_DISABLE_ARM32_NEON=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
