Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64375C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 13:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D57A8329E;
	Tue, 19 Apr 2022 13:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTe9rtMT9KrS; Tue, 19 Apr 2022 13:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B21FD8322E;
	Tue, 19 Apr 2022 13:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3D971BF42C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 13:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FECE410A6
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 13:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZ_WLs1NPA91 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 13:30:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C79940C81
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:30:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso1581361wml.1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CIIdSzayDLJTp6kvLXHaYH3BM3rY7WR36nptwb0dszs=;
 b=AwhCsFtOeNIsC0dgEfsvLfVF/4zeaxY7Cgjcb15qKv27JZ23pMuwmbDJUpNfd2BlGT
 wOfTS/lr6nCwGeYDeWh8Bw6cokSVGd0jEabzXohfgmya/aG+Uuwol64ipUbuGEuJrD8s
 rgtVkuTF+tKlyUzGTgEwdvMKH9Rz+NiLBkdkyzpYQfCaKMjHtlM/z5P9Vo0EHh2IreSq
 pwCdG6xS2xp2Y/VhIGRspW4EoZrOzyyO3mFrnXGBN5Mq55uBNgNYklUFImSKmQlUYxRG
 muFnHL7n9YYbrDXDmbbUBJVnCD+Zo4exPP9mO5V7WCl92zdsagIlfgzrbetQn2DqongE
 PdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CIIdSzayDLJTp6kvLXHaYH3BM3rY7WR36nptwb0dszs=;
 b=iLPIJk9lHrlejd1Ao7lxKnUL1f+gJ3HjuA/cHMaAGvJQf+RRcRoPk3F7Z3HWtGscrz
 MV6XjMDqDKgcQFw7UybXtbPiDoKPYGF5MXEQAOqzkXynBjWtQ7nP6fWFFYU43G25NtWf
 +TRWKmUWfjhBxsFl2/b5vQztzBz+8nfrmuSSOczeSxUUOWB5BBcJI+GK3QkujuhVGWT1
 kc0SRsCs1MYdb7LIGo8/gn1q/nd4tXMV0NVQu7zuXJ9JFy1edsVCS3YfRB1ge6BzR+Cq
 TdyLFznqztblX19VjKIzGbjPRdhdkq9If6/ZYgkYi8111s7nVqX0c4htfNO++nCrKVzg
 dfdw==
X-Gm-Message-State: AOAM530qOYw0UfTFxWjlRS/BZA7sK2775qsh1JSiF2hWnl90tyC7TfWq
 rvq3i8QA6KQZj4dKyYMrbhUsHFXGnOM=
X-Google-Smtp-Source: ABdhPJxrsjXydSzQ6473SjQzrFgJxAyoq7bvHkeavgFv/WDeqJ9dToGM74SHbY7GfRaQbsaD+nrQcA==
X-Received: by 2002:a05:600c:1e85:b0:391:ca59:76be with SMTP id
 be5-20020a05600c1e8500b00391ca5976bemr18577813wmb.184.1650375007290; 
 Tue, 19 Apr 2022 06:30:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l14-20020adffe8e000000b00207af9cdd90sm12392801wrr.39.2022.04.19.06.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:30:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 15:28:04 +0200
Message-Id: <20220419132805.2571073-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/netsurf: fix build with
 BR2_OPTIMIZE_FAST
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable duktape with BR2_OPTIMIZE_FAST to fix the following build
failure:

In file included from content/handlers/javascript/duktape/duktape.h:195,
                 from build/Linux-framebuffer/duktape/application_cache.c:21:
content/handlers/javascript/duktape/duk_config.h:2861:2: error: #error __FAST_MATH__ defined, refusing to compile
 2861 | #error __FAST_MATH__ defined, refusing to compile
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2f1b42e2be3aa76cbacd84f3d0ad8b13edce6982

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsurf/netsurf.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 1064698c12..574c1423df 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -14,6 +14,17 @@ NETSURF_CPE_ID_VENDOR = netsurf-browser
 NETSURF_DEPENDENCIES = expat jpeg libpng \
 	host-bison host-flex host-gperf host-pkgconf host-vim
 
+# internal duktape doesn't build with BR2_OPTIMIZE_FAST
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+define NETSURF_DUKTAPE_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := NO"       >> $(@D)/netsurf/Makefile.config
+endef
+else
+define NETSURF_DUKTAPE_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := YES"      >> $(@D)/netsurf/Makefile.config
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
 NETSURF_DEPENDENCIES += libgtk2
 NETSURF_FRONTEND = gtk2
@@ -77,6 +88,7 @@ endef
 endif
 
 define NETSURF_CONFIGURE_CMDS
+	$(NETSURF_DUKTAPE_CONFIGURE_CMDS)
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
 	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
