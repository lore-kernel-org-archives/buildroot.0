Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A8BC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 18:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EC5408A7;
	Sun,  4 Dec 2022 18:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EC5408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kMe6qIADuri; Sun,  4 Dec 2022 18:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60949408F9;
	Sun,  4 Dec 2022 18:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60949408F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24BA71BF2BF
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B20A40894
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B20A40894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBGmxiL17nAi for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 18:19:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A710408C5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A710408C5
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 18:19:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 i131-20020a1c3b89000000b003d1cb516ce0so836186wma.4
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 10:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5I5fE4ceMMBc/csXQIrE6y6KVCAseG/dYfYxewxBiPE=;
 b=zpjO4m9JwJ3HIhfDl9UC6+Ix230kylDGJDIf9Hbi2oRKyigR8y8iOzaUHKn9IRNTLT
 CBEhnSHynnrFBWmJvWTKYDWTpS6eN+6jOTUV+t+2pmrdmKPTwsVHuO0XC4rjUOf/Iyzj
 alVvzAjp+3Rp5ksURRhmOoFqv+niBGSNeyCVeLE8RLdkP5kVXbsmnkJq5t8ZV8hgCTy3
 QvW2c4/9zrt7ZcFdQDolWpPhFWMBJ7uIDwK0z8DHVPaMzu+W8vt4F9J3TFNLvUA/KUlK
 D347YyDvGgnF/QJLiXf0UgnfLyNKk6Q9PSdcR6U3Lg4H/FL8dwCFioGExXrMGwwJwPAk
 M2rQ==
X-Gm-Message-State: ANoB5pnqEWmFm4l1Jjkxs+u+m1D6tD0sby8uwgz1Ij3Ow6cv+dtfFVkk
 f/TlpqI6QxXnHnmwxqrHWuFYhLys/ro=
X-Google-Smtp-Source: AA0mqf5GlR9ooLZphkS+tf/pp4dUoeG0nE4lrFrUXiAnyd2FGIxhAsiBdTfNf+ZUTt1luuYPxefy9A==
X-Received: by 2002:a1c:f006:0:b0:3cf:ecd8:330d with SMTP id
 a6-20020a1cf006000000b003cfecd8330dmr47469360wmb.130.1670177991163; 
 Sun, 04 Dec 2022 10:19:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 dn11-20020a05600c654b00b003c701c12a17sm18403860wmb.12.2022.12.04.10.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:19:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 19:19:48 +0100
Message-Id: <20221204181948.13898-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5I5fE4ceMMBc/csXQIrE6y6KVCAseG/dYfYxewxBiPE=;
 b=KtVWN2qn7u3MliYDs2rOdaGry38vGvg7lpu2H0ZCaKup7IHeEVJn+ANGy4wF870Q1L
 hcYi3MLBCaoNSCFLZg0j2ueqGHrHwbHL0aAj7HzueXcgQD9+XN6JH/7yMHgLkAElSfM1
 jB1v8WJNi5+C46rlsSnK5uruzj385EPLeayhLyQRmpiXDg2sG1E58zFdT4C4VSUdKt15
 IsepyiFPI6dv9+w1RFr2EvXFcJaUEbIVDiP15TIg7kaRDnQiZqDgBLSv0MRhsy21oBTg
 vpRwYeKDNOXctQQp43S6SfdPKIRm1+PxImWkMkk2XNZI9eZU0bXdLoXvWBQbSkirDR6v
 /vcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KtVWN2qn
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: fix license
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 343974b99528702842e8c1dad945fcd4f0defd6c forgot to change the
licensing information which has been updated with
https://code.qt.io/cgit/qt/qtbase.git/commit/?id=05fc3aef53348fb58be6308076e000825b704e58
resulting in the following build failure:

ERROR: LICENSE.GPL2 has wrong sha256 hash:
ERROR: expected: 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
ERROR: got     :

Fixes:
 - http://autobuild.buildroot.org/results/bf20b7457349f1bb7a82d471ad2c9e4307ac540c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt6/qt6base/qt6base.hash | 14 +++++++++-----
 package/qt6/qt6base/qt6base.mk   |  9 +++++++--
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 5dd26973fa..6544a371c6 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -2,8 +2,12 @@
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
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b7ee6037f3..5f9ea58862 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,8 +7,13 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
-QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
-QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs), Apache-2.0, BSD-3-Clause, BSL-1.0, MIT
+QT6BASE_LICENSE_FILES = LICENSES/Apache-2.0.txt LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSL-1.0.txt LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt LICENSES/MIT.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+	
 QT6BASE_DEPENDENCIES = \
 	host-ninja \
 	host-qt6base \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
