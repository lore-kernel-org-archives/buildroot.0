Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C6C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5B634067F;
	Sun,  6 Nov 2022 15:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B634067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndZ3f7W_3rQR; Sun,  6 Nov 2022 15:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A2D40629;
	Sun,  6 Nov 2022 15:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A2D40629
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC0B1BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7577C40629
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7577C40629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1DNagbwI4vj for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:38:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E25404F8
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49E25404F8
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:38:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k8so13065752wrh.1
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nEqE55GgsHwa8DYlTD1To1HOQtuyWFPpPa/ZuFFUPqg=;
 b=mJjkmLoYCq9pTy0lnrAopZx+5RwobS0Mx4b51BWsv+XY9lOH9qKJXK04MseKFvL7Qz
 6hRgiIxWexjg72DQH7HAz4oF70rF+je6IZriEzfoL+7kAWWtEVh6P1xw+5E7QP4TaN5m
 wMHdl1xq+HgRUOLzHsQ5+2CzndV+MLF621bouDsXY7H4eaNTjK3n0WIOMDVTbZPq5NGb
 Hgcm58EcdR4FdVDMhG72MoTEub1ENo4twS30CVHU39JZg5s6593xzOsi9EJe5PvXY04I
 g8hHE4Op7ha5qZ5PNaPeFMI2g7DqMgF12HuCn4bdZTMKh25B57ZWICmA7jiRvfxox31F
 shGg==
X-Gm-Message-State: ACrzQf2Qhp1C05SzBIf1DrVsQ3iAg9B9UQJMTPZxAwkYb8Guy1Pyv05J
 klxFgODiZaQUm1YLEHczZNPn5OZ1Hb8=
X-Google-Smtp-Source: AMsMyM4hcxD2ZSOUbCsRnOY04taCTd/VS0tl6sBmNkWouqYgLgmDb9QZLYdYqA4+WzOyeAEKe4TFUA==
X-Received: by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr20748091wrm.17.1667749093001; 
 Sun, 06 Nov 2022 07:38:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w16-20020a5d4050000000b002366dd0e030sm4859367wrp.68.2022.11.06.07.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:38:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 16:38:03 +0100
Message-Id: <20221106153803.276223-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nEqE55GgsHwa8DYlTD1To1HOQtuyWFPpPa/ZuFFUPqg=;
 b=QQ5ZvbfMYlDKBZM+SUWBqmkzoJSlLe9L0amG3uXRtgHTPxULgHUKirs1W4JPe5xZie
 FQ7G3sKxQdzgTggW9YrdNxVhsTaF2kmPgLgOv/9L55KH97qRYM0wfbAUaBWqK/u1MmpT
 hBUG4wOqEkZtIQOgQYJTwcm4jKC4ANcXXoRkKW6BV7+sT/PQSQh7fS9fegCMFtx8dHdw
 o6VdqWwjCw7OPpwxq0uU3OVSFvrhpqwbwxZCS/HONVluTPVsLguMnbpRfs2JIzKmxUtS
 6caIv8IMwBBownUe9qKXaQqShpvfDC6sM45NOjygo5u5myYcYe78FJzOjUWx8k5eg3ra
 wbmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QQ5ZvbfM
Subject: [Buildroot] [PATCH 1/1] package/lxc: add systemd optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 5.0.1 in
commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:

Run-time dependency systemd found: NO (tried pkgconfig and cmake)

../output-1/build/lxc-5.0.1/config/init/systemd/meson.build:11:4: ERROR: Dependency "systemd" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/495175c367084093bc01c40290736c738d876894

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index f0a0e8041a..e1639c5f15 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -63,4 +63,19 @@ else
 LXC_CONF_OPTS += -Dopenssl=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LXC_CONF_OPTS += -Dsd-bus=enabled
+LXC_DEPENDENCIES += systemd
+else
+LXC_CONF_OPTS += -Dsd-bus=disabled
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LXC_CONF_OPTS += -Dinit-script=systemd
+else ifeq ($(BR2_INIT_SYSV),y)
+LXC_CONF_OPTS += -Dinit-script=sysvinit
+else
+LXC_CONF_OPTS += -Dinit-script=
+endif
+
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
