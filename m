Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E7FC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27D76052B
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F27D76052B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85ED6FB90;
	Mon,  2 Aug 2021 12:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p51O3JXuZYUV; Mon,  2 Aug 2021 12:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E636FB91;
	Mon,  2 Aug 2021 12:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4EA1BF402
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E750A83A69
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VG9NnhEB_fXz for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 12:33:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0794D83A5A
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 12:33:10 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id go31so30562660ejc.6
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0Pd4PNVGr9s1cJG2vqbNldSF+ZFjsI3xsdIn/kZNvc=;
 b=JbezkAuS9xK+2d1VL0nQiXemfUxFS+7nzwV5wexaiEu49/+5E52v9rrE27Gk50Nb7w
 GkwqREaHk00whTVZ7JPaeXEB2YjKNfXlnJ39AjG3j17W124u/seIGPZvfLHd+UDPhMvG
 TQKS4u6zUw5d1sw7ouTK1CxDQ+Dr8DZIGYQYWSxKYK5WFHai9ec88WMSmkWuPeZ9OOjr
 EjD8L0MmaHbo+igIf1UqpaWY1b3DK95Pppb6eNR+2mnNr6tOLOYyFqjKOdCawUS6NXcd
 AV0C0IkHgjmwJqKn3Xm6pud3QkCSkY6/yelwGbWVVFcpvEHPiCXd7Dh+CidSG4c5Pewl
 r0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0Pd4PNVGr9s1cJG2vqbNldSF+ZFjsI3xsdIn/kZNvc=;
 b=LR7DoYQwEeyVCGSTMmxVoMhjpiebRTxwNhxcK3WdeDtI1z5t/Fz3qLAsGm62zfUs1H
 tXWlgbviIqZLg3GWYU5laUjd7eiGXGxcpD/4zBm24WG6yKgXEcO0LbKTLsq1z80eXRwV
 wyrg1OBSHV1lwj4D7L5JOnhIhIMkMHWJSKpl+E32JxvdTwixaFwIDiPg8RbElpkY9k++
 NI/VRs81FRE8R4UUzhqqJIxfMKoB8S9iJkNxqYSoc/JDocTWEkOJVvuK8Cm4Hsr4hYzr
 SsogJ2NmDJ8sz+66TcwEJ3L/K+KJ8E/Fq30i2BQ1/k82lRvwmBHyq1BxmibshzydigAj
 IwOg==
X-Gm-Message-State: AOAM533SGx8pTOQVB+6PejApSIEYKwPBI5DnWMOZbd3iAj3HVBjGtTiL
 xBp5FD7x5CMv6cLAifJtuof/H3dDMUxwLYn06I0=
X-Google-Smtp-Source: ABdhPJzAU+zU9uVtE2+mmc/oEMluOIERSyPM2yJLCeqxwlR/rAa25pCwHrB5XE+rDFtnSEowenJTaw==
X-Received: by 2002:a17:907:987c:: with SMTP id
 ko28mr15363335ejc.200.1627907589098; 
 Mon, 02 Aug 2021 05:33:09 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id j23sm5919122eds.21.2021.08.02.05.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 05:33:08 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 14:33:00 +0200
Message-Id: <20210802123300.564709-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next] package/gtest: remove partial host
 package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

gmock (which is part of the gtest package) has a host variant that is
not actually the full host package, but instead just installs a single
python script.

This script, however, is no longer maintained and is not needed for most
practical uses of gmock. Even if it is used, its output is meant to be
hand-edited, so it shouldn't be used as part of the build flow.

Therefore, remove the host-gtest package. A proper, full host package
may make sense (for building other host packages that use gtest), but
this single script really doesn't.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Norbert Lange <nolange79@gmail.com>
---
Since we're so close to the 2021.08 release, this should probably be
delayed a little.
---
 package/gtest/gtest.mk | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 6447954e36..a9ac49957b 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -13,23 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_PRODUCT = google_test
 
-ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-GTEST_DEPENDENCIES += host-gtest
-endif
-
-HOST_GTEST_LICENSE = Apache-2.0
-HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python3
-else
-HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python
-endif
-
-HOST_GTEST_GMOCK_PYTHONPATH = \
-	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
-
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
 # gtest.
@@ -52,14 +35,4 @@ else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
-define HOST_GTEST_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
-		$(HOST_DIR)/bin/gmock_gen
-	cp -rp $(@D)/googlemock/scripts/generator/cpp \
-		$(HOST_GTEST_GMOCK_PYTHONPATH)
-endef
-
 $(eval $(cmake-package))
-# The host package does not build anything, just installs gmock_gen stuff, so
-# it does not need to be a host-cmake-package.
-$(eval $(host-generic-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
