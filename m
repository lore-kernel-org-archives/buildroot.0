Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246D6C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B72DB405F5;
	Wed, 10 Aug 2022 15:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B72DB405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oz9gtxOAW43T; Wed, 10 Aug 2022 15:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4145409D5;
	Wed, 10 Aug 2022 15:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4145409D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C93591BF9CB
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A481940142
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A481940142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFkXcIEUuu8p for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:05:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A9D400A6
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A9D400A6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42AE587081; Wed, 10 Aug 2022 14:51:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:05:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b17de2459cdf7cf6c02ff21dd67a1750ad50094d
X-Git-Newrev: 4086bc1a9be9850b95657a42959b4bedc82ec050
X-Patchwork-Hint: ignore
Message-Id: <20220810145139.42AE587081@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/apg: fix musl
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4086bc1a9be9850b95657a42959b4bedc82ec050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop APG_CFLAGS (which is empty) to correctly set CFLAGS with
TARGET_CFLAGS (which will contain -static) passed by
TARGET_CONFIGURE_OPTS. Moreover, pass TARGET_CFLAGS to FLAGS which is
used to build apgbfm. This will fix the following musl static build
failure raised since the addition of the package in commit
99eb1a7019a4333f99e93b844962db301a8c3f98:

/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/10.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/armeb-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

Fixes:
 - http://autobuild.buildroot.org/results/0e53957965363ceb7141bf8a612998abec893b17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35b35d90b1e393f580b6a0497a561d8a7a55d563)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apg/apg.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/apg/apg.mk b/package/apg/apg.mk
index ac4dce77f9..16661f4b8d 100644
--- a/package/apg/apg.mk
+++ b/package/apg/apg.mk
@@ -10,8 +10,7 @@ APG_LICENSE = BSD-3-Clause
 APG_LICENSE_FILES = COPYING
 
 define APG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(APG_CFLAGS)" \
-		-C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) FLAGS="$(TARGET_CFLAGS)" -C $(@D)
 endef
 
 define APG_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
