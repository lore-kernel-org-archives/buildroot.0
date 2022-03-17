Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 954118482C;
	Thu, 17 Mar 2022 21:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uBaroTrD45X; Thu, 17 Mar 2022 21:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAACF84824;
	Thu, 17 Mar 2022 21:02:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7CEB1C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B65EE41907
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rp4WKwYcXMyQ for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:02:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0104F41905
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:02:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 93A88843AF; Thu, 17 Mar 2022 20:53:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 22:01:41 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 5fa2a8d554e6cb0c3db2d86eda57ec4bfd321415
X-Git-Newrev: b6a980e372cf406e4e3a7c388a1c60a1d63dd345
X-Patchwork-Hint: ignore
Message-Id: <20220317205338.93A88843AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/oprofile: drop
 custom install rules
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6a980e372cf406e4e3a7c388a1c60a1d63dd345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Drop custom install rules which were added since commit
676797d57f33fbe9d5adc81932847154ebd1ce93. Indeed, they result in a
broken installation. Especially, they are trying to "guess" what must
be installed based on BR2_ARCH but oprofile has its own logic. For
example, goldmont microarchitecture files must be installed in i386
directory even if this architecture is 64 bits:
https://sourceforge.net/p/oprofile/oprofile/ci/0ad5a9e6af86a88e1dd41180f45bc48b646eba6a

This will result in the following runtime failure:

oprofile: could not open unit mask description file /usr/share/oprofile//i386/goldmont/unit_masks
Unable to find info for event cpu_clk_unhalted

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14641

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5259807318699646a7bb9cbc24fb137983bc5270)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/oprofile.mk | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 85bc4efa9b..265d6ebd18 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -14,51 +14,10 @@ OPROFILE_CONF_OPTS = \
 	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
 
-OPROFILE_BINARIES = \
-	utils/ophelp pp/opannotate pp/oparchive pp/opgprof \
-	pp/opreport opjitconv/opjitconv \
-	utils/op-check-perfevents libabi/opimport \
-	pe_counting/ocount pe_profiling/operf
-
-ifeq ($(BR2_i386),y)
-OPROFILE_ARCH = i386
-endif
-ifeq ($(BR2_mipsel),y)
-OPROFILE_ARCH = mips
-endif
-ifeq ($(BR2_powerpc),y)
-OPROFILE_ARCH = ppc
-endif
-ifeq ($(BR2_x86_64),y)
-OPROFILE_ARCH = x86-64
-endif
-ifeq ($(OPROFILE_ARCH),)
-OPROFILE_ARCH = $(BR2_ARCH)
-endif
-
 OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
-ifeq ($(BR2_STATIC_LIBS),)
-define OPROFILE_INSTALL_SHARED_LIBRARY
-	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
-endef
-endif
-
-define OPROFILE_INSTALL_TARGET_CMDS
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/oprofile
-	if [ -d $(@D)/events/$(OPROFILE_ARCH) ]; then \
-		cp -dpfr $(@D)/events/$(OPROFILE_ARCH) \
-			$(TARGET_DIR)/usr/share/oprofile; \
-	fi
-	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
-	$(OPROFILE_INSTALL_SHARED_LIBRARY)
-endef
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
