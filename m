Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDCFC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 059ED41757;
	Wed, 10 Aug 2022 15:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059ED41757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FAx6XKkVYfY; Wed, 10 Aug 2022 15:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7CE416B9;
	Wed, 10 Aug 2022 15:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7CE416B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8784C1BF344
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632AE81BBD
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 632AE81BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAqmADGqLmay for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:06:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C05F81B6D
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C05F81B6D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65AFC87084; Wed, 10 Aug 2022 14:51:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:05:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: b54a351aca7df3c20e3727862ae69310f0634895
X-Git-Newrev: 5e55b592fd22c6c413b9e2e3cd22e1e7f43e55e6
X-Patchwork-Hint: ignore
Message-Id: <20220810145143.65AFC87084@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/apg: fix musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e55b592fd22c6c413b9e2e3cd22e1e7f43e55e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
