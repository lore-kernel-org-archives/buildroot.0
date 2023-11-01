Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13EBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D90E432A0;
	Wed,  1 Nov 2023 21:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D90E432A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l30eZxXoM5D9; Wed,  1 Nov 2023 21:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DB244328A;
	Wed,  1 Nov 2023 21:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DB244328A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F27931BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D95CE84B63
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95CE84B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqDX1IwIOHj1 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:50:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D1F84B5D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D1F84B5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEE45864C2; Wed,  1 Nov 2023 21:50:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:44:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c7e0f011906646e45a23139c3006b4d767e19fa
X-Git-Newrev: 6d8512bf04762754b2243df3d2658d75cf7f9d31
X-Patchwork-Hint: ignore
Message-Id: <20231101215040.DEE45864C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: fix configure cache
 preseed for fcntl capabilities
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d8512bf04762754b2243df3d2658d75cf7f9d31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 4.19.1 in
commit a8ff60cff9402dcd04fffb67af15dfe2caab0995 and
https://gitlab.com/samba-team/samba/-/commit/fb4bb188acfc3e88887b500a05e9e4db8b08aed3:

Cross answers file /home/buildroot/autobuild/instance-1/output-1/build/samba4-4.19.1/cache.txt is incomplete

Indeed, a typo in the configure script was fixed, which causes our
logic to preseed the configure cache with test results to no longer be
taken into account.

Fixes:
 - http://autobuild.buildroot.org/results/c1fbfdab11c0521b8199f6a661987eb6076c84d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 832b128132..b89f961d99 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -118,7 +118,7 @@ SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_CTDB_TESTS
 
 define SAMBA4_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
-	echo 'Checking whether fcntl supports setting/geting hints: $(if $(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13),OK,NO)' >>$(@D)/cache.txt;
+	echo 'Checking whether fcntl supports setting/getting hints: $(if $(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13),OK,NO)' >>$(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
 		$(SAMBA4_PYTHON) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
