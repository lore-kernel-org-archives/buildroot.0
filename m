Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F0C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB2E6080A;
	Sat, 27 Apr 2024 18:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kon8HDyRJlzb; Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98EA0607BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98EA0607BA;
	Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90CBF1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF8E4019D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIyyltPwRqcH for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E6EC400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E6EC400AF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E6EC400AF
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b869326daso11364485e9.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243083; x=1714847883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7zxHuIR9mfkNQoICa8uCUiH2TbZEmKe06XxQ9H88SOY=;
 b=uTCA40gB5L/B3g+Xv0lOWGkfyej1dvn0ugSLupP7vtwWcdydfcx7Jb/HufDfiOFr50
 nv/mKauk+jZimrfCT2+ljbKFjjvYj504z95ycXfbvlX8vy+dm8ifzoJTBSLcjXZpAyUS
 PhIw5FVoCIo2GEWmnjU+GDcdaWjkBMXkSz4semoUCCJ7l0v39jPach9l/0zMhuQREBQn
 +4xiSvsULQhX/uwwaltuv8uOahi6sYF8LnbV016tDtgW1Rd7wW7Pk9Pt++8W9IAYW4/O
 dMbo11lVnCfAXP0x0u2d+Dn+vGim3Q7KkP5gEusNvMSv8lsv2bi6j501wCMHM99f0QM+
 VVTw==
X-Gm-Message-State: AOJu0Yy6i67Dw/oPVylL7eN73znnqf2O++ymc1rtX8c6wnIRmJZCyJsI
 iSOlVFbU/j9kqnPZBeBMW7eroDgkmSN6BAioEeSbO8sx+LKFxvCH85MdPQ==
X-Google-Smtp-Source: AGHT+IFWFnKeLqiZEb5dwyfknxnMMMoDsiQnQNvPvHgJgBCNGemFU4wtyBxrMQE9GFzIuRX7jwsl2g==
X-Received: by 2002:adf:e0c4:0:b0:346:662f:62b7 with SMTP id
 m4-20020adfe0c4000000b00346662f62b7mr4999444wri.71.1714243083134; 
 Sat, 27 Apr 2024 11:38:03 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:02 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:48 +0200
Message-ID: <ebdea6a1000a9de96be1470fe7efe29ce58b6a38.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243083; x=1714847883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zxHuIR9mfkNQoICa8uCUiH2TbZEmKe06XxQ9H88SOY=;
 b=SLwApwDTArY5T202c5ykKAjfwuXHmXUbgyn1ZeX3A8Cd+tt1fZvR7sZl/p11sgOmNe
 R5XvNxCtgShuE0Vx8t+mhFGFjDwijb7lpLxkhjFEQ5g9BJlQ2NpE2A6H++K1FV6Qtdys
 lRJnzTEIjl4QcBGkxcLYqJTaKjd7Gsq+QfzQ6HGErZk1Y9810VndCkMfN8GBX91d0TOK
 pePlQZ1xLe+FhXkqIDw6sk6Tfdp4wCMqHFFbeov1cbpwc+UAt6IQ+WyCQPI7HQImuuQ5
 XxTqwCU/o408UE4wFWMrgFzlkV22opEUbllS2Kl44mFqxIBTVS3qPHPYo0vdy5zJ6Fbl
 npaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SLwApwDT
Subject: [Buildroot] [PATCH 01/15 v2] package/flutter-packages: fix and
 comment the shared _SOURCE variable
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 631647f4a7c5 (package/flutter-packages/flutter-markdown-example:
new package) introduced a set of flutter packages, all sharing the same
upstream location and sources, and thus introduced a set of shared
variables (not unlike the qt5, qt6, and a few other similar packages).

Especially, it introduced the corresponding _SOURCE variable, that is
referenced by each sub-package of flutter-packages. Defining this
variable is required, because flutter-packages itself is not a package
in Buildroot parlance: it does not call any of the *-package macro. As
such, the default _SOURCE variable is not automatically generated.

The value for the variable was suffixed with the -br1 version-suffix as
used for the archives generated by the git backend.

However, this archive is not generated with our git download backend,
but is generated remotely by github, as the _SITE is computed with out
github helper macro.

So, the -br1 suffix is both superfluous and confusing.

Drop the suffix to avoid any confusion in the future, and add a little
blurb explaining the situation close to where the variable is set, and
add a check-package exclusion.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                            | 1 +
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 8 +++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3..8f1e716ef9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -399,6 +399,7 @@ package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib
 package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch lib_patch.Upstream
 package/flite/0001-fix-alsa-static.patch lib_patch.Upstream
 package/fltk/0001-disable-tests.patch lib_patch.Upstream
+package/flutter-packages/flutter-packages.mk lib_mk.RemoveDefaultPackageSourceVariable
 package/fluxbox/0001-fixes-bug-1138.patch lib_patch.Upstream
 package/freeradius-client/0001-fix-for-nettle.patch lib_patch.Upstream
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch lib_patch.Upstream
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 994434e25c..ea30e7a36d 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
+sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 4beaa39325..e8bd84e998 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -9,7 +9,13 @@ FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSIO
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
 FLUTTER_PACKAGES_DL_SUBDIR = flutter-packages
-FLUTTER_PACKAGES_SOURCE = flutter-packages-$(FLUTTER_PACKAGES_VERSION)-br1.tar.gz
+
+# This default value *is* required, because this file is not a package (it
+# does not call any of the *-package macro), so the _SOURCE variable is not
+# defined. However, we need a variable for the sub-packages to share the
+# same tarball name.
+FLUTTER_PACKAGES_SOURCE = flutter-packages-$(FLUTTER_PACKAGES_VERSION).tar.gz
+
 FLUTTER_PACKAGES_DEPENDENCIES = \
 	host-flutter-sdk-bin \
 	flutter-engine
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
