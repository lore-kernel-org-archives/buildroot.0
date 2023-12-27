Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D769C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 18:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEF140245;
	Wed, 27 Dec 2023 18:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CEF140245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6C6YSkDmKMjo; Wed, 27 Dec 2023 18:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD4E401BD;
	Wed, 27 Dec 2023 18:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD4E401BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2215F1BF3E1
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08039823F4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08039823F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srMT3eI8LC9p for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 18:18:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BD5A823DD
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 18:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BD5A823DD
Received: from fli4l.lan.fli4l (p5b3a01e6.dip0.t-ipconnect.de [91.58.1.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11ED1A4C063A;
 Wed, 27 Dec 2023 19:17:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37490)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rIYTc-0004WE-29;
 Wed, 27 Dec 2023 19:17:56 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 19:17:55 +0100
Message-Id: <20231227181756.156827-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703701077;
 bh=0FQgRR2DCPf7xCOMuIjDz1uIWDppmoucLYjCJKNhRgU=;
 h=From:To:Cc:Subject:Date:From;
 b=mTTpI76DV7jWlOUB209cXgjR/YLSXhPkoKbxVRGLbdhqgRC2DHqoW74iUB18HxVnF
 NlZw1HRpynxGcfn6LM2wq0t6Ota0DSeFhHgd1MHawdsDAMprDjZMNeZPLSOoxlFIdI
 43JsdAAEilqu1vhZIsYOX/mJkJK2x9wAhgnbKCmI5HKQ8MdEaft+DSXJpi2bUPAhUS
 rRww1qz3wqDGFTBIHSfHRpjTs7QaY3lHru/zGq8emvjWQiOaAnvnVXxGUpjThGv2y0
 PQPyzk5WrM7koTAa8lzXWuWl8/SmMhcc+CynCaWh9EKIn9SoPhzT1Cdb4exf2T7gl/
 rPgsEGMMlM29g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=mTTpI76D
Subject: [Buildroot] [PATCH 1/2] package/exim: fix build with libexecinfo
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added optional support for execinfo

https://git.exim.org/exim.git/commitdiff/204a7a2c2e8601558905dc34c576a627045a9f21
https://git.exim.org/exim.git/commitdiff/48ea675fee2d5fee8d33c525e28727b69114cfce

in version 4.97 which was added to buildroot with commit
faec3ca30e358575f70a036879029f63f7da9b29

Fixes:
http://autobuild.buildroot.net/results/282/282882371e1d8c224c457bf65016f8abd11f8c45/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 23d888e6f2..30b0d78c94 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
+	$(EXIM_EXTRALIBS)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
@@ -126,6 +127,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+EXIM_DEPENDENCIES += libexecinfo
+define EXIM_EXTRALIBS
+$(call exim-config-add,EXTRALIBS,-lexecinfo)
+endef
+else
+EXIM_C_FLAGS = -DNO_EXECINFO
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
@@ -136,7 +146,7 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)"
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
