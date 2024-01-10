Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C9AC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9DE1436D7;
	Wed, 10 Jan 2024 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9DE1436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xf1-3md-ug2C; Wed, 10 Jan 2024 20:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5761C43771;
	Wed, 10 Jan 2024 20:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5761C43771
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5701BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA51F83438
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA51F83438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7dHKdwtB1Jx for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA74820D7
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA74820D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBBD885C74; Wed, 10 Jan 2024 20:11:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:11:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce3f5e748a1cdd03ba19a238f7377484a6687ad5
X-Git-Newrev: 22b629729667bac6aa3a9c5079be4487bb850d23
X-Patchwork-Hint: ignore
Message-Id: <20240110201140.EBBD885C74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=22b629729667bac6aa3a9c5079be4487bb850d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added optional support for execinfo

https://git.exim.org/exim.git/commitdiff/204a7a2c2e8601558905dc34c576a627045a9f21
https://git.exim.org/exim.git/commitdiff/48ea675fee2d5fee8d33c525e28727b69114cfce

in version 4.97 which was added to buildroot with commit
faec3ca30e358575f70a036879029f63f7da9b29

Fixes:
http://autobuild.buildroot.net/results/282/282882371e1d8c224c457bf65016f8abd11f8c45/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/exim.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index fb9eecd71b..98b6097957 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -103,6 +103,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
+	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
 endef
 
@@ -126,6 +127,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+EXIM_DEPENDENCIES += libexecinfo
+EXIM_EXTRALIBS += -lexecinfo
+else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+EXIM_CFLAGS = -DNO_EXECINFO
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
@@ -136,7 +144,7 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_CFLAGS)"
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
