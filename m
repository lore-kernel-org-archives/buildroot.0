Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 08:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA884043B;
	Wed, 19 Jan 2022 08:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdJwztB5GV64; Wed, 19 Jan 2022 08:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89E67403A4;
	Wed, 19 Jan 2022 08:46:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E576A1BF35B
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E173260A99
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zL1NCJYOIlR3 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 08:45:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B58660A8E
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 08:45:57 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id r16so1567837ile.8
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 00:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abj7YwE3Kh5i+y9UCkpuVdwxQIO+9u2Kq1mE+QMM0Ws=;
 b=SfwWHnwxi7OZYQ+OKBbOwVnB+vLAmUtg0AWIMV3auplG7jrnIrbKNQE92UQYF9Srbd
 VneuwxLbNR4TZKPTBi+ChVvsF/dIr88Yu/PQ92GgEQ2Njd4S3dl0BmiPLmQpcgNmk2N3
 dZnQmNTVQXDDLiXmnzMoP7+Rl6A9JI/lQL9626YlwF3LpP3Z+UgmidA63TFxAKWHYHXd
 BEyiC2w3q0a6yQwkmpr6X4FOBVQ+wnifQ9PEMRWWrtgf3x+oYKbmr0o/DeVqtScDnvLO
 PLC07Q8IVC1xOaMmiqFbIAIPU4dotujy9pIYg/mlW/9LSiGG9hjT6q+uhzV0doZXwuIR
 7pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abj7YwE3Kh5i+y9UCkpuVdwxQIO+9u2Kq1mE+QMM0Ws=;
 b=PN9QfQJs5nIyDf+/Z6tf20gBHatwxzEbLeYS5HYO8WAcEgQqIXrfinV4DW1i2BEABk
 STqYgig2U1dUodCCIFz9m2nzSzzP3hRm1GrBiPF8GpIbxn0nFgjg4D/MiDpNrcvl19fv
 ZerhKfXYzyPDni7ikasOJGGpJa/uHjvWBJurgtbhjotWntp4OPk82CzKG6cdKH7jR9z1
 JMX1QBnl7dGoEWKcB2M98TxpwnU39mi3T3+wJJkBABQ2k4mBWFgsG8o7cLgsr0tES2jK
 QM7wQ5t9oJ756iNQgDRY9BaSk89mdceZSScWYTUcUpKoFubA3M+iiKIzlRj5IOFZglQQ
 7t1g==
X-Gm-Message-State: AOAM532Yby+a38GVgl2fSsLy7S6dNkIX0VKvId+5lrccmPGIEFvgi5x3
 04Hjo2RDbLtFNZ/LGRgSsEZrgLBhu7U=
X-Google-Smtp-Source: ABdhPJyWhApP78WEj8rN3dMpXlad8waeWLYIEXerZsDtOccVqXZzXcSmkO0qzzZTJS82YhKFGv6KuQ==
X-Received: by 2002:a05:6e02:1e01:: with SMTP id
 g1mr15969317ila.129.1642581956362; 
 Wed, 19 Jan 2022 00:45:56 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id q16sm4830513iow.47.2022.01.19.00.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 00:45:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 01:45:45 -0700
Message-Id: <20220119084545.3642950-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package make
 build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cmake build appears to be missing features such as pkg-config
generation support, switch to the regular makefile based build
which appears to work better.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/re2/re2.mk | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index b562d5d7ef..144c82339f 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,8 +10,30 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
-RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
-HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
+define RE2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D)
+endef
 
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
+define RE2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
+endef
+
+define RE2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install
+endef
+
+define HOST_RE2_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D)
+endef
+
+define HOST_RE2_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
