Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B8BC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 22:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E3960F47;
	Sun, 17 Jul 2022 22:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E3960F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OfjOFqSXduQ; Sun, 17 Jul 2022 22:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E6F607C1;
	Sun, 17 Jul 2022 22:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E6F607C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56B021BF59E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A275817AD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A275817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Br5S31B7Se0X for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 22:17:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1232E8174C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1232E8174C
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 22:17:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r2so13669529wrs.3
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 15:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jR0mMsyf3jpVWjgTEpc6nNDcq8LLibHIk5uVWBnmU38=;
 b=ENW2DvZA57YyYl81R2NIigy1DKKAt+ZW7+r61LqzpiP291Ct2OdrLLuoG8nfwZSUTl
 zS5WmEyX4ebN6tQ4W2YE4ZduwZM8J1ksgDEjp4L4alxODDammNen9Nq3bvQAvdPnqNXt
 8cvxrfD9Yfvz3Rl6zKUtx/KACaBXEMoWoJiCyMEpd06/OHMa86IfnRUxV3k7S6HbvbOr
 X+IpZLGtkOL+1LNvY8mfmhDTpyy7hiFGyY2xGlUfEd0/rHgAan1cuhiuF0ZN+FpbYzQB
 79BKRzXvBPHaumqWiKcFUnx8T6ZfxjWRHo5NtqYA3rBKE3luyUrOsfEnrUHX7VcYLe9G
 9Uvw==
X-Gm-Message-State: AJIora+vhGfKfBEr8I3l4fVwPiUN62B/XfMSsxateS3XdOy6SCFRpmkN
 9VhF+JgAm1XPStUr4BebLQBUk+gZrS4=
X-Google-Smtp-Source: AGRyM1v8A7rz58W+eQ5RHkajgwZE5jgXO4v60/din76L6oY0NQPuDrPA5K3gzz3HeHB3nzOZg2B8Aw==
X-Received: by 2002:a5d:430d:0:b0:210:2ce0:e2a9 with SMTP id
 h13-20020a5d430d000000b002102ce0e2a9mr20488572wrq.627.1658096237920; 
 Sun, 17 Jul 2022 15:17:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d4ecb000000b0021d808826fbsm9247422wrv.44.2022.07.17.15.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 15:17:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 00:14:00 +0200
Message-Id: <20220717221400.2907670-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jR0mMsyf3jpVWjgTEpc6nNDcq8LLibHIk5uVWBnmU38=;
 b=E9LVw20bxktdvzMOevT+6qSn/CMzzxdb+TCXQOsOvZACs7JS27qe4WOH0QA5t+eL4b
 6FQ8QRY74WzHL7pW8Y+Hdh/rdnHuv3qZcxGFkh2hnbfiEiRCPC0tmn405qHnsHSOm0n/
 9wtMY9M96ZeNLLGoOOtomrW2e85KyGQ91k+CbPLh+yIc7HSATQbrrDx8GhaPyBWSKYkB
 8tup3vl7UyQjeAnsfsoetP/ydkc8+PzaZOimx9v3qBeJMTs5RBzW+6XiLnhCLXSkAVsI
 Qd2iWmQGaSvn4oz0kjyz8Y1dYnFvKSCdUoWsweEKjHlDxoIiETCNF/IT7B4VXWFriTHh
 /mgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E9LVw20b
Subject: [Buildroot] [PATCH 1/1] package/apg: fix musl static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
