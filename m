Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F5CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4140A40AE2;
	Mon, 18 Jul 2022 10:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4140A40AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha3eqMfEvIfv; Mon, 18 Jul 2022 10:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428D8404F3;
	Mon, 18 Jul 2022 10:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 428D8404F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD9F1BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A15B540A59
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15B540A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oqC_deW80y4t for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1E95404F3
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E95404F3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6E48483C8B; Mon, 18 Jul 2022 09:57:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 12:10:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0425b12daf0d95abd4d5309426bc4af915a626b3
X-Git-Newrev: 35b35d90b1e393f580b6a0497a561d8a7a55d563
X-Patchwork-Hint: ignore
Message-Id: <20220718095754.6E48483C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apg: fix musl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=35b35d90b1e393f580b6a0497a561d8a7a55d563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
