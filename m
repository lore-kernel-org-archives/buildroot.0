Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1C3C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E1341884;
	Fri, 11 Nov 2022 22:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E1341884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2ea3OLPdpuy; Fri, 11 Nov 2022 22:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9499941878;
	Fri, 11 Nov 2022 22:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9499941878
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 129A91BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6AB241878
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6AB241878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dz6yLR6pTCkq for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:42:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9EA41877
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A9EA41877
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:42:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w14so8113011wru.8
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 14:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFjBMHm1epkVWKbEIhDPac0dkRXPa5Yg37GtNbpielw=;
 b=uTnoksHM+BF3jBXMPfHo0rbi2OmjiK8mlqGpiixAqnywMBCL7bKWp+/9HM5DSPUIxj
 wAVyFErh+R+WF/vj4Pgp7h9+YxXqpy3BGzW3+HCHASwfUOjsV1FGkbrWlKepixxWxJNF
 DtJTue/9YAwoX6jUHnsYTjuKuJwVVd7C5ma03IC9vQAN0rw10JInYHykDWGSZLA5EdxR
 6y1sVYjhXdsMhO8CVep5Skc+ibLvbZkEZ1bCBCz3mF7g0h3NfpY/9vkSKVkhUgX/n4Iz
 gD3Y1CdpguOKf9Sy4XD+zsfOfeD6vfO70kPt7St+bjnAjbcATyVoZNV/yYunZjLbx1hi
 J+Ug==
X-Gm-Message-State: ANoB5pnbiRX1TAugyRLkbm6/smSNijeRneLuKXGMm5ygSkbdCv0Fh3kx
 YrKeJ0IxKMLf4Q/iMcYWr9XzVBjzwoY=
X-Google-Smtp-Source: AA0mqf4gNRi1TQydGGTianmt2fFUw6PkboEHqT0L2Rf0bsDbu1euTxurODm7tT4E/O9qA5LEF+H5+Q==
X-Received: by 2002:a5d:5550:0:b0:22e:3f37:fdc with SMTP id
 g16-20020a5d5550000000b0022e3f370fdcmr2282891wrw.665.1668206541007; 
 Fri, 11 Nov 2022 14:42:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003cf894c05e4sm11176564wmq.22.2022.11.11.14.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:42:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 23:42:18 +0100
Message-Id: <20221111224218.6160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFjBMHm1epkVWKbEIhDPac0dkRXPa5Yg37GtNbpielw=;
 b=qiQRmCVeFEPgw3HH3wu0mFYBAJaNapZDbwAlm1QaT2uH1gSOM+W5fDZgSKsBMNQF+b
 95yy9q+sXyDDAkUS/WxQoMWXK06Ycf9lHCJWXegYWsj8X6cqyIuHT6K3BfTTBHTAaH9g
 xFG435ysBltVQ3A4KG29qdJEoI9hNGuwv12es+2xDlHNB1/91kKA317jY4IYfw8GqmQ4
 22h/Q92plAQPaGTtOpK3BI/OIsOIUDRLILDdbkdzCUGGvgOoYel5fB2T476T5i5ti9Cx
 gJ6QGM411O+iDULsjVJxsN+1X7J3J02kTMnkuazrfO9+ucvC3OCDz9z0YD+7qLlRmuoo
 ECZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qiQRmCVe
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix systemd build
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

Fix the following systemd build failure raised since bump to version
5.0.1 in commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:

../src/lxc/cgroups/cgfsng.c: In function 'unpriv_systemd_create_scope':
../src/lxc/cgroups/cgfsng.c:1234:104: error: incompatible type for argument 10 of 'sd_bus_call_method_asyncv'
 r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
                                                                                                       ^~~~

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261449

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...thod_async-to-replace-the-asyncv-one.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch

diff --git a/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch b/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
new file mode 100644
index 0000000000..22013cb363
--- /dev/null
+++ b/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
@@ -0,0 +1,47 @@
+From b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 25 Aug 2022 05:45:53 -0700
+Subject: [PATCH] use sd_bus_call_method_async to replace the asyncv one
+
+The sd_bus_call_method_asyncv's 10th parameter is of type
+va_list and supplying NULL when invoking it causes compilation
+error. Just replace it with the async one.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Retrieved from:
+https://github.com/lxc/lxc/commit/b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build              | 4 ++--
+ src/lxc/cgroups/cgfsng.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 21955a0504..f8bdcf4e83 100644
+--- a/meson.build
++++ b/meson.build
+@@ -295,9 +295,9 @@ if not want_sd_bus.disabled()
+         has_sd_bus = false
+     endif
+ 
+-    if not cc.has_function('sd_bus_call_method_asyncv', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
++    if not cc.has_function('sd_bus_call_method_async', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
+         if not sd_bus_optional
+-            error('libsystemd misses required sd_bus_call_method_asyncv function')
++            error('libsystemd misses required sd_bus_call_method_async function')
+         endif
+ 
+         has_sd_bus = false
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
+index 8a3615893f..d90e5385e1 100644
+--- a/src/lxc/cgroups/cgfsng.c
++++ b/src/lxc/cgroups/cgfsng.c
+@@ -1232,7 +1232,7 @@ static int unpriv_systemd_create_scope(struct cgroup_ops *ops, struct lxc_conf *
+ 	if (r < 0)
+ 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to connect to user bus: %s", strerror(-r));
+ 
+-	r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
++	r = sd_bus_call_method_async(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL);
+ 	if (r < 0)
+ 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to subscribe to signals: %s", strerror(-r));
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
