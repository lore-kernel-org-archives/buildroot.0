Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB2C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 21:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB50F41927;
	Thu, 16 Mar 2023 21:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB50F41927
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcgxVoqsIGpu; Thu, 16 Mar 2023 21:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACB241B62;
	Thu, 16 Mar 2023 21:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AACB241B62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2C0D1BF97F
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA87A60E39
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA87A60E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSn2sZ_cksVU for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C8960AFB
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C8960AFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBF0E87497; Thu, 16 Mar 2023 21:36:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 22:32:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3c3e3e64c74ec85cb0a45318d72eff0634bc775e
X-Git-Newrev: b54aa2be6756d43562ff8aae30a40dbc65bc3c2d
X-Patchwork-Hint: ignore
Message-Id: <20230316213653.EBF0E87497@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmad: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=b54aa2be6756d43562ff8aae30a40dbc65bc3c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

/tmp/ccv8mDeW.s:93: Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/92a3f19b4fa12a7724f9e3d99284da4ad2beecb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0aaadd525f2df02911349ffe1518814fa095bf96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/libmad.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 33134e26d4..084a533cc0 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -31,6 +31,13 @@ LIBMAD_IGNORE_CVES += CVE-2017-8374
 # is able to properly behave in the face of a missing C++ compiler.
 LIBMAD_AUTORECONF = YES
 
+# libmad has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBMAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 define LIBMAD_INSTALL_STAGING_PC
 	$(INSTALL) -D package/libmad/mad.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
