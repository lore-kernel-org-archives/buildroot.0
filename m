Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4FA661299;
	Tue, 12 Jul 2022 20:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FA661299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xw07Gtu8WPU1; Tue, 12 Jul 2022 20:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE9461292;
	Tue, 12 Jul 2022 20:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE9461292
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEED1BF39F
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3D284042
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 20:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3D284042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9tY01qlGwEq for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 20:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BB78402C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8BB78402C
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 20:35:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d16so12742478wrv.10
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 13:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JsnA5m5QfXZe3UH2Zng/qU/jTfdz2ImzZL+lmT6mOwE=;
 b=ggigwSjfQ4vBduvPWPjM9+V9My64ueGA+1yr82zGDu/olzjPBYBb01wGgxpU9Om/Sg
 hRIuJK3JTmXelNfJ91SpbEuIPCBrXvQydS88tL9rsGK2md3F+QA6NeR0H/pB4HdJfWqD
 8p3qQw7IDdCgQR1BhEZdwxEokriNrVs+LB0b1QmlXxJPnZEiOjvswuQ86/4GO8X2DN7H
 Xk7smVUOuyxRkwiDADWDkmfIWO4EHZB095aSa6KkaOM4b8Qg3JoW2WTrqxp42xzrQG0q
 UCDCeK2V7Hz8hoOF+otUzhxNksWxYQ/5hJ6jUGsuId2xXmMp1fnldLQRMm0+7TIzSXBB
 ztjg==
X-Gm-Message-State: AJIora+1rSOXkhqNicvDn2mqg/7EXXwpRR4ti3mu8JqOhOys0h2J3qi6
 w+g3nFLADGNYLz8+P2Kidn0VkbwSjqY=
X-Google-Smtp-Source: AGRyM1v8ixlIuIlrycbeFDeOftF6oapcKe9H7oD1p1Dg06LI/x9mC02xhNgunhV9YrW1+/p6tsY5Ug==
X-Received: by 2002:a5d:6dae:0:b0:21d:ac34:d087 with SMTP id
 u14-20020a5d6dae000000b0021dac34d087mr6736883wrs.336.1657658098788; 
 Tue, 12 Jul 2022 13:34:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003a2cf5eb900sm7846142wmi.40.2022.07.12.13.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 13:34:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 22:31:51 +0200
Message-Id: <20220712203151.1891202-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JsnA5m5QfXZe3UH2Zng/qU/jTfdz2ImzZL+lmT6mOwE=;
 b=J1kQZf6IybFesfyUAUMgnWQWVixNzWVNehpFjp/DxX6wjc2ATkkmdyrS1+4ZnzKxh2
 i+MWcQjBoEeemPZUebqxO4QOlIwUqUR8ferrN94wnYsBAEPoNGB3jacJYDSWFsrkF+kP
 IbvgjT/VJVage6lKJUeWRRCeYF84hrHEI4f8Os5O18TCXgKAuqEP05E2e2zMYj8oI6DC
 Ie7eYpqGAO/UlN8pSmtekPtQU8H9Cx6WhSlmk5spq8AqLYXa2X255ka2gWHpMOM7t2nR
 2d6nTaXZ8JruLycevlTBtNpnpwpHf128PadeuUTZxlcXOGGAEZYewW3s8K9bBWeFnQga
 8SRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J1kQZf6I
Subject: [Buildroot] [PATCH 1/1] package/gtest: drop host-gtest
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop host-gtest to avoid the following build failure raised since bump
to version 1.12.0 in commit a336b731af5979a25213b33c5840de6d1ed88bdc and
https://github.com/google/googletest/commit/6202251f0963187a7781f181365cf8c19bf343d5:

/usr/bin/install -D -m 0755 /home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/gmock_gen
/usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/6a8fb259760f84c67a3482cc5964c6610f9b70a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/Config.in |  9 ---------
 package/gtest/gtest.mk  | 15 ---------------
 2 files changed, 24 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 4355e9c9c5..4591cb5e48 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -26,7 +26,6 @@ if BR2_PACKAGE_GTEST
 
 config BR2_PACKAGE_GTEST_GMOCK
 	bool "gmock"
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-gtest
 	help
 	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
 	  C++'s specifics in mind, Google C++ Mocking Framework (or
@@ -43,14 +42,6 @@ config BR2_PACKAGE_GTEST_GMOCK
 	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW,
 	      and Symbian.
 
-	  There are both host and target packages. The target one has
-	  include files required to compile the tests and the static
-	  libraries required to link/run them. The host package installs
-	  gmock_gen, a Python script used to generate code mocks.
-
-comment "gmock needs host gcc >= 5"
-	depends on !BR2_HOST_GCC_AT_LEAST_5
-
 endif # BR2_PACKAGE_GTEST
 
 comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 8ec5e9c535..a9ac49957b 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -13,10 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_PRODUCT = google_test
 
-HOST_GTEST_LICENSE = Apache-2.0
-HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
-HOST_GTEST_DEPENDENCIES = host-python3
-
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
 # gtest.
@@ -34,20 +30,9 @@ GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-GTEST_DEPENDENCIES += host-gtest
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
 else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
-define HOST_GTEST_POST_INSTALL_PYTHON
-	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
-		$(HOST_DIR)/bin/gmock_gen
-	cp -rp $(@D)/googlemock/scripts/generator/cpp \
-		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-endef
-
-HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
-
 $(eval $(cmake-package))
-$(eval $(host-cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
