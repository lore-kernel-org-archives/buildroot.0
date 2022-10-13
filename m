Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F643C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 12:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E09F611B7;
	Thu, 13 Oct 2022 12:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E09F611B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VY7sDZRXNcAA; Thu, 13 Oct 2022 12:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D3660A81;
	Thu, 13 Oct 2022 12:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D3660A81
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2341BF473
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 12:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 072BC418AF
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 12:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072BC418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCJwSReV-wZo for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 12:10:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619AB417FB
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 619AB417FB
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 12:10:48 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a13so2375923edj.0
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 05:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HueCmfrnMjim11haLeNLf1HBz9pWbnkH2niTRPNZ2TU=;
 b=KtM90XKWGEkNLluH9dznYm6bfyMJLkSek9iYaABS/76PBXAvjrvqReA6N2xV7N8woQ
 jFy5BEGIBfKtRiMP+svMp0Z32yhZNqt5PaYiO7eRFztRBihU7IZWU7SpJ6HJiWhsfLAm
 DZv/OgB6zx5NYKb2ODOBpv1ji5kr3x0PVhmeYtUlxU/W13+bbuWQ9iSafRRTDl9RCHfB
 Sn4ZhqknYZptFrX1l6QycJ+hiGlqF+slZXRe1CTQxErrVcwQCxdhtDq5qmSkeQDEeZLJ
 BehXnmHaax/4mMYBGMlkXHO2xBd2Ol8euARIHhjBTaUMfhq/Bg2hry7GwUw1j3Diio6d
 3ntA==
X-Gm-Message-State: ACrzQf13X0awPFlsmny3yg0nI2jqLIntyOyJP7CuzWhwJ3SFVMwgf3uR
 MI1BwRFix2X9xg8KN81pxurX3fXgH0U/gw==
X-Google-Smtp-Source: AMsMyM6HEidd+0S5VtZrH/EF1wDI1kCvcmLqvr3O+6McyVaYDuBIS4ZO/gVCQAj8c62V0rKO1s7aXg==
X-Received: by 2002:a05:6402:26c2:b0:45c:1fef:ee1d with SMTP id
 x2-20020a05640226c200b0045c1fefee1dmr18444252edd.13.1665663045967; 
 Thu, 13 Oct 2022 05:10:45 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 l22-20020aa7d956000000b0045b910b0542sm11082697eds.15.2022.10.13.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:10:45 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Oct 2022 14:10:40 +0200
Message-Id: <20221013121041.1398841-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HueCmfrnMjim11haLeNLf1HBz9pWbnkH2niTRPNZ2TU=;
 b=YqE4XqILfGSS2VIEeX6lUVGhW6opY4I9dumUMdCn5oqENVclWcM9Qsf3Irsry4k0vc
 aWQnQtlkCJBZmHwa0uka9HbIdTjihEhLOQ6NeSWUUcigHLq5Q5umxRczfY7sB7rJTAOF
 BAUU7ofZCht2hV7fvo0fIxbrMq4zd10rxqwMlOfI3X++lqPvNO/sywdjMLhWCDNU1kDU
 AscbD1Q865TOPvBAocO1Nkrm7JdyZQsaXbSizb5suPjtDxrifsSoe5PbhEE7ZnW0nqa2
 asY9dnnjG59m3skX1wIwUti1j6kdj8wXqEmrvAAkAyc7faqKGjyxwBMCbnOYJH70D0JH
 TJAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YqE4XqIL
Subject: [Buildroot] [PATCH v2 1/1] package/qt6: Change license hashes
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There was a major rework of how licenses are used in the Qt codebase
along with a new location for all licenses, so change the hash file to
reflect these changes
https://github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2

Changes for v2:
 - Also adjust the makefiles to refer to these new license file names
 - Added myself to the developers for the qt6 package for good measure

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/qt6/qt6base/qt6base.hash             | 15 ++++++++++-----
 package/qt6/qt6base/qt6base.mk               |  4 ++--
 package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++-----
 package/qt6/qt6serialport/qt6serialport.mk   |  4 ++--
 5 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6a54..6cb8d0fc54 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1478,6 +1478,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Jesse Van Gavere <jesseevg@gmail.com>
+F:	package/qt6/
 F:	package/qt6/qt6serialport/
 
 N:	Jianhui Zhao <zhaojh329@gmail.com>
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 5dd26973fa..b004347a5a 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -2,8 +2,13 @@
 sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
-sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSE.FDL
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b7ee6037f3..b53d53c653 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,8 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
-QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
-QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 no invariants (docs)
+QT6BASE_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
 QT6BASE_DEPENDENCIES = \
 	host-ninja \
 	host-qt6base \
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index fb1b3dcf6b..887f67b2ae 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -2,8 +2,10 @@
 sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files:
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
-sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index 01763657b8..03197fd60d 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -9,8 +9,8 @@ QT6SERIALPORT_SITE = $(QT6_SITE)
 QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
 QT6SERIALPORT_INSTALL_STAGING = YES
 QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
-QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
-QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 no invariants (docs)
+QT6SERIALPORT_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
 QT6SERIALPORT_CONF_OPTS = \
 	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
