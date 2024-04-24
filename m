Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B6C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45BFE60D88;
	Wed, 24 Apr 2024 19:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhfVxA-5wN98; Wed, 24 Apr 2024 19:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2993060DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2993060DA0;
	Wed, 24 Apr 2024 19:26:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDFAC1BF34A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8BDC60DA0
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9GAp1jERwgV for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AA5660D88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA5660D88
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AA5660D88
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:26:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso1581725e9.2
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713986808; x=1714591608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zxHuIR9mfkNQoICa8uCUiH2TbZEmKe06XxQ9H88SOY=;
 b=l+/rzag3tgNP3p/75rL9hLQfkJFz1Uht2sfLHelMBCgYih7+1F80wdm8ve6SV8jJD0
 Hchg2qimeGDuA6RJQG4zPHcu305NPtz6nRRFqsI/LB3jB3ZmtZt5CcP/mDEw8Z/q9zcE
 8FtFKEuBQyFzrDYe76Bwf16PxVPFWzPu5uPGvhKG4KnDtxpBpBltzluOJrgFl7W8PYK8
 Yp7rsTrf+C6TptVIjicd8DZWktC1JlpJSk0HMwwi/L5eaT5OoixNa3zMInimt5fHzBSS
 AxG50xxzrgADfrOMR5Ba10dxWerVeZEHcerIAZKaVk7B4yGDDfvhLSFI8ik3g0eNeY9F
 egRg==
X-Gm-Message-State: AOJu0Yx/shsZS6S2mbQLM1fu4SycQaDfrIILFTynqH5i843Wxo0SHr4t
 UM9Bh3PaRyzaBZOOUUFMwuw+ez9hQ0wXNG7wgcQ1a70/Cu/9AFt3JxghPw==
X-Google-Smtp-Source: AGHT+IGn+kscTMghU8QcwCFqOaDPEpi+7axtXXawQM8s29b2+qrNmUql7uKr+4w9km9hSBYYLb/qjg==
X-Received: by 2002:adf:e988:0:b0:345:c1cc:2d85 with SMTP id
 h8-20020adfe988000000b00345c1cc2d85mr2038339wrm.55.1713986808106; 
 Wed, 24 Apr 2024 12:26:48 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adffbd2000000b0034b2141dcb3sm8000304wrs.75.2024.04.24.12.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 12:26:47 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 21:26:47 +0200
Message-ID: <20240424192647.2710610-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713986808; x=1714591608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7zxHuIR9mfkNQoICa8uCUiH2TbZEmKe06XxQ9H88SOY=;
 b=JX3Xm8cilwvaAeJ6h5ouDhboQWCrO5c0iGTXMWZIJk5AhKEQdfkp2SWKTmv684emLH
 QC3MAha17XsarN0x+yjrygKZVAsnrz1FS/EfG8efCylF98yH/W1/cQT0i7kFsOSyueUG
 47SGAthsl3x0MOLPMNbUpzEULiF82b4IS/O6CFEexRsrddJH/xDqOCd8G/f4ubXSwxvz
 eqVIyLH0EIqt1qy+/uM/zStCGQazsM9Z8GzVvxj5Eyp2vQM558+q5BsUkV7511LKJBEx
 /WvhWpL+6/DSVn8CwJ2o4fStaXXU6NCMAEF4tA5UY+Q637WOBwy6BjPlt5DjXZ0nKifT
 XsCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JX3Xm8ci
Subject: [Buildroot] [PATCH] package/flutter-packages: fix and comment the
 shared _SOURCE variable
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
