Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00613ECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 12:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFBF4161B;
	Tue, 30 Aug 2022 12:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFBF4161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAj6snNF1FWJ; Tue, 30 Aug 2022 12:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF4FC414C4;
	Tue, 30 Aug 2022 12:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4FC414C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8DD11BF3E9
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 12:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D4860FAB
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 12:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D4860FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whI9X8krv2if for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 12:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C5F60FA8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7C5F60FA8
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 12:44:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id k17so5727968wmr.2
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 05:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=ow1WLqGzmgKZLLT7kQMzvnqkXETqTvl4+6axoLRrKE0=;
 b=0W0umejmuuIWvsuI5zQxRDb/9xr6Q+hzSqMsDGgbrrvN8u0sJ1xsZlIiKdhUaLwAnr
 yJdNv5gDf+hkoajG8KPYYHCZFx8bBtwrzY/zbJtqIF/Oh1S5O6OC1DgpTjQXyf0zefQ7
 FBpmWgD2xurjlDYfwjvNGXWw15fNCDQIueidnji2GzeKxMCVRHbhaF3BBHmQBPKKl64k
 bQ7szMLupR4pxHHR5Ern8GF0MGD0hlQdegBI9BKOVkttFNPqXhz5dpMSpvC5PC+eBbVd
 ebzLaxpJv0lNBBFMk/j3NM7QiskZVhfYzCApMnmkBfb846ZIVimjj2l1zkYYDSbJEW6s
 sjlg==
X-Gm-Message-State: ACgBeo1k7w9wDpdonkmX8OA9K2hEZ41LSBTMHs5gockW9uMNlvOzPI4b
 rjHNQd32GsZqIpSfoepXuPtTeOd5h98=
X-Google-Smtp-Source: AA6agR6XgFFwZ6OM6XWa3CjxUakavAcgPIsI7OdfFE4N2aSUwcCEMVPedDMa/+5wcaosCNb6FWaQeA==
X-Received: by 2002:a05:600c:4fcd:b0:3a6:2694:e3ba with SMTP id
 o13-20020a05600c4fcd00b003a62694e3bamr9942584wmq.160.1661863464887; 
 Tue, 30 Aug 2022 05:44:24 -0700 (PDT)
Received: from scaer.home (alyon-659-1-81-139.w80-9.abo.wanadoo.fr.
 [80.9.176.139]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc015000000b003a5c999cd1asm12833806wmb.14.2022.08.30.05.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 05:44:24 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 14:44:23 +0200
Message-Id: <20220830124423.164957-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=ow1WLqGzmgKZLLT7kQMzvnqkXETqTvl4+6axoLRrKE0=;
 b=mDQINSLkq3g5ie0Xs52daI6uV716Xn5HIusKCAP70olwkfse6DovIIFlWh4hFBheaT
 tl3ppzrQu36WTsyfw98Lr76S5LxyLkANPhkNGulziZ8KKi/cj62ucBoYOgM4QYhf73D/
 NrNuZNxEQEVmRcWzVm/Vvb+ZLsLI14mZC4OyVdk58LWN28O2pJnlXmktun1MxTAeo+C4
 D2rqSzXsE0LgjLZDOzY3pnbEm/LB6zNDxeOM+rtX+KurV8KOEMMYZEAx8AvSp0Apuy6D
 bevUSndtDXkY/PAjgds7w3+BCB2O/KbMR++cFfQdGX0vF7oRHmapOc4W/gOzWzfBIkb9
 Kn3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mDQINSLk
Subject: [Buildroot] [PATCH] package/ncurses: drop our custom host build
 commands
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit bf446513e7e7 (ncurses: fix hanging installation due to old
version of tic) introduced the build of the host tic, to be used by the
target ncurses. That commit purportedly built a static tic, but that is
(at least now) wrong: there is nothing that makes the build of tic
static.

Initially, host-ncurses was configured with --without-shared, but that
only drives whether to generate shared libs or not, it does not drive
whether to do a shared or static link of executables.

And in any case, in af23d762e51b (ncurses: enable shared library build
on the host) we explicitly stopped requesting the build of a static
library, to instead require the build of a shared library.

So, we never had a statically linked tic ever.

Furthermore, we override the _BUKLLD_CMDS, but we do not provide any
_INSTALL_CMDS. As a consequence, the full ncurses is installed, not just
tic. And since we override the _BUILD_CMDS, the libraries are not built,
so they get built during the install step.

And we do indeed need the libraries (host-gettext needs them), and not
just tic.

So, just drop our custom _BUILD_CMDS and just build the whole package
with the default settings. We keep the explicit use of --with-shared,
as this is not the standard flag (--enable-shared) and it is not obvious
what the default is.

The set of files installed before and after this change is exactly the
same, and tic still is an "ELF 64-bit LSB shared object" with a RUNPATH
that still correctly points to $(HOST_DIR)/lib

To be noted: there is no regressin in build time either, since we were
already building everything anyway.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ncurses/ncurses.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5d9c6bb0dd..2881ca1308 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -184,16 +184,6 @@ define NCURSES_TARGET_CLEANUP_TERMINFO
 endef
 NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_TARGET_CLEANUP_TERMINFO
 
-#
-# On systems with an older version of tic, the installation of ncurses hangs
-# forever. To resolve the problem, build a static version of tic on host
-# ourselves, and use that during installation.
-#
-define HOST_NCURSES_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) sources
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/progs tic
-endef
-
 HOST_NCURSES_CONF_ENV = \
 	ac_cv_path_LDCONFIG=""
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
