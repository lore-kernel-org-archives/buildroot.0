Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E31C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B1882243;
	Thu,  9 Mar 2023 21:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B1882243
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJoVuqIr1f7M; Thu,  9 Mar 2023 21:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD93B8220B;
	Thu,  9 Mar 2023 21:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD93B8220B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4591BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 557578220B
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557578220B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HaJpjkgdmRfh for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:37:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EC9382151
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC9382151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BE8186D06; Thu,  9 Mar 2023 21:37:26 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 22:33:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e817622b812cf579061abd78f08af029eba72ea
X-Git-Newrev: 0aaadd525f2df02911349ffe1518814fa095bf96
X-Patchwork-Hint: ignore
Message-Id: <20230309213726.2BE8186D06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmad: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=0aaadd525f2df02911349ffe1518814fa095bf96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

/tmp/ccv8mDeW.s:93: Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/92a3f19b4fa12a7724f9e3d99284da4ad2beecb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
