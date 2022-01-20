Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9EDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 00:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A204154A;
	Thu, 20 Jan 2022 00:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqJQnsds_6qj; Thu, 20 Jan 2022 00:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97E341525;
	Thu, 20 Jan 2022 00:39:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC05E1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 00:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA35660B3B
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 00:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYpL6FZDPJ-K for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 00:39:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B0A960B2F
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 00:39:03 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso5523101otj.8
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 16:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3wg19lsoIbSLDVfgvvM1TMQ/YP5MvkVBOrUOrfbQrr8=;
 b=l/ECiqgEKGFyU+AInJc6p3o+t7n0/Ya/+mwUOcPkX5slXh4iP6OKBSFeSBAFLtA82K
 2q6Y1EeJCTUc8b/wSMf0K1CM4XhtxsfMbxeFLzQ77CbytZoBKQ3ZQQC4JSDDtQXeR3ap
 4iLI7ufoRhZ6Zeyf9DxTzPMyA9c6FqUADt5dtpCNb5nK1TGHYVSqpjEU9KQqKoCtzq0e
 4bX4q9flpTpsUZSjQQozS0keKtBSm1tiaK22VNDr1ny1gOA1VG5VktUdP1QbnD+pMmvY
 CFamElkdHM7RKVsIvO1ObznHKKbUBIvN8qcAyA3XkVL9C+L5IzX4bkAcas2bI/NRMGBk
 5MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3wg19lsoIbSLDVfgvvM1TMQ/YP5MvkVBOrUOrfbQrr8=;
 b=6pWsx1JP1apV8xO0RmgO/6A5ggRpdTWDCoOGbkrlndYKVECJvuNEOB68FZDYoUy202
 8gzonb6Ix/pUeR4lO6lqwXQ208sU2e35/7JNnaofGKIy5YwC+u56ZocTSa1/zdk4f9Tc
 tpQj42+b0dXx1Ss2HDyL2K6ysGr2ieMcExoOiiNnVkY8QOI0AkUTFHMaTBXrabcdhEcw
 2+zk+rCxC1oHwO8lBun6Ec0QyMfrc7LokWbKFxAGyyR+dV39qPPaXvahiUNz783o5V90
 zrUK7x81A86YHHo6Iq5SRrOxnPwqm0TLojjm72MYiol71ixdOzqImaA59pjFQlVW5VAQ
 a72A==
X-Gm-Message-State: AOAM533l2OMbmoIU5YnnAjNvsl8G1vNhI4zoELMGa/pumK11sihWbMLc
 iuWQIHtNuLc/ACGZ6pLPz2+ypCRcQlE=
X-Google-Smtp-Source: ABdhPJx4DNiPSWvM8fZNPO/q0M14zYk/Kmpo8CbWp5kjCj3884jJTxpoS5tKnKCyzf88NjBn+HI5WQ==
X-Received: by 2002:a05:6830:4105:: with SMTP id
 w5mr8053013ott.10.1642639142810; 
 Wed, 19 Jan 2022 16:39:02 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id s7sm879175oiw.37.2022.01.19.16.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:39:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 17:38:27 -0700
Message-Id: <20220120003827.395469-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/re2: switch to generic-package
 make build
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
Changes v1 -> v2:
  - don't built shared libraries if BR2_STATIC_LIBS is set
---
 package/re2/re2.mk | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index b562d5d7ef..2863fcb662 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,8 +10,32 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
-RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
-HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
+define RE2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
+endef
 
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
+define RE2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
+		$(if $(BR2_STATIC_LIBS),static-install,install)
+endef
+
+define RE2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
+		$(if $(BR2_STATIC_LIBS),static-install,install)
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
