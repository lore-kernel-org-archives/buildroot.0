Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED00BECAAA1
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 01:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 403EB40148;
	Wed,  7 Sep 2022 01:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403EB40148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGvDonHqjpUW; Wed,  7 Sep 2022 01:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C617640135;
	Wed,  7 Sep 2022 01:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C617640135
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF041BF20F
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 01:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6675D607B5
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 01:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6675D607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNnx3cA_jIyg for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 01:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97F0760701
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97F0760701
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 01:59:01 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s11so6891641ilt.7
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 18:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HdSc3nXY83OIxXgwYhfVNeleySlecPNKIYbXqFDRANk=;
 b=AmXV97845Ja+tlGZ9YWp+P0gRo/xYJ+rZmfqvsG6lY1lKcHZeRVwKN6YZqPaKRtYiX
 j7cHTwFK7jSVpaPAZs6nmrREjywdgpEEL4VnXF0/ywjFwva7SmBFnbUTMB/HGgEhhqR1
 qK+0uX0O0CeIlrl55fR0r1qYjt57h9k1yOpK9IscliKMBEFBR2HIaJPuDAtAeUrHQJKq
 2ifrWOX860AXolETcJzwCTwKtHObQ35NtVF66P3ZZ0i7N1Q3PM/YkY2W6UIXdrHjmXfW
 qaDIV4wJp7K22EZaPBx1G8VnQXuMO/XqHkkabDDP88Cpy7X3LGlS/5Oc/9RZFTSnjwVw
 dJEw==
X-Gm-Message-State: ACgBeo3H7hwpTRdfhFihkalkJJM0KDUk78WhUhZGIVGYHELjZVRMdIt0
 2QhdAeR5c/zjFpQuER5Y+nlKdftHmfg=
X-Google-Smtp-Source: AA6agR7imhaEtnrwzKfw72AH77FKw2Aop1umBB+RdIUK9YaBC1hKaCftPlPqc+OuTQsxvC1ldRImRA==
X-Received: by 2002:a05:6e02:1749:b0:2eb:84df:e9e1 with SMTP id
 y9-20020a056e02174900b002eb84dfe9e1mr732902ill.66.1662515940334; 
 Tue, 06 Sep 2022 18:59:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05660227cb00b0068886ea6d9asm6733051ios.54.2022.09.06.18.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 18:58:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 19:58:38 -0600
Message-Id: <20220907015838.262210-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=HdSc3nXY83OIxXgwYhfVNeleySlecPNKIYbXqFDRANk=;
 b=KZPC51I3SjTRKFbeP4FijwAoVZjYZ+/FhRGTrPR2zTv71ybJz5nmsaUMw6ojnAWM6V
 HOXhsP3oCa0mC4QryNnf/LkdYKniHtWR/brgT8X/LhtvRnea9pVLbF2cJwxqDhEvZRnJ
 gPRiTvdSAAdRpqCwd//o50IUzUj8DFro5OzkjhFvWATfRlS5mAuwl4tO6Nj2vJdEpnHx
 SHCphw4zshOz2fsD7xPh5z3M8KTGB9QnzMnSO0A80eSPGUg8SMxMk+k8FRreuWOYEaIt
 zs2U8Y9YNBvMPdxvOFVgF+Jjwp56rTMP4YNfTmvQKPuhgQpSeSAts5rbioJ+1od/IB8w
 e0Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KZPC51I3
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.57
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for new bluez5-codec-opus codec feature.

Disable new unsupported flatpak feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 905608c3bf..21c3119945 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bb4662ee4f4036586905268354329228d763fc08d99ca8f0e8ec7e002e46b88d  pipewire-0.3.56.tar.bz2
+sha256  da1fd2e6ee088aa22f5398caca76ff879e398ec9216fb6b9400c1177b8c68115  pipewire-0.3.57.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 790d9c8d9f..1aad4a3c5c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.56
+PIPEWIRE_VERSION = 0.3.57
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -32,7 +32,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
-	-Dlibcanberra=disabled
+	-Dlibcanberra=disabled \
+	-Dflatpak=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -103,8 +104,14 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
 PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
 PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
+ifeq ($(BR2_PACKAGE_OPUS),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=enabled
+PIPEWIRE_DEPENDENCIES += opus
 else
-PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=disabled
+endif
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5=disabled -Dbluez5-codec-opus=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
