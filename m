Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21951C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08F541568;
	Sat,  4 May 2024 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfE97JxUiOUZ; Sat,  4 May 2024 21:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33EA64082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EA64082E;
	Sat,  4 May 2024 21:40:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78A6F1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6372582CE4
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHN-sBXAtbYD for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 699E582CC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699E582CC7
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 699E582CC7
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso5274685e9.2
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858826; x=1715463626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i84qJY1pWjBIkzk83IU5/uhuYbX5G0gndRA9yVuUGpE=;
 b=eoxqAZFsYJb2hffgXI0cyQdmllxZAis45j2Ej+vfBEUMy9Owd9HUfMWCNRhDhl4qUB
 XKTwXSsbXduUuzAr2I4loQi2YZ6XQi0UYdiXAXOUOnoxxEiJfLchJSYaLEuUJwVE2sFG
 AG8xMSiW7T7bcLYMCsA9vE3RZ5CRacY5N7fKB0Sxzjq+O3fQTGagmuc6eUuKa9thkre9
 eZ0buxsHi0n8uCPT1IhCcQoooo2aeB4Aa8gCMw9i2ECr+qOTmt3mwmoZSX6rJUqo0Y1A
 uYVUd4rWfTYVBP8q1VmMdKCa+aCeykryKSeLaDG3bIXbPz+ui796gv63LHTLpylicigU
 v1Kw==
X-Gm-Message-State: AOJu0Yzjy/m5X+CcvSf0FvlyA7KWSUincTw+FT1vb5ZrnbTd6dQu4TFP
 auOOnHgok5rNw3BY6bXfUpw1JWQGBBXhCRwIUU5FgpkGFznKjkzBKC2gbg==
X-Google-Smtp-Source: AGHT+IH5vObg39m3CbInKQ81AaA+jcIj5WiXbmkzIYoo2l1AzzwxN0Vi+L+Y1KVQaY7J8wo3/8YE2Q==
X-Received: by 2002:a05:600c:314e:b0:41e:ae29:c807 with SMTP id
 h14-20020a05600c314e00b0041eae29c807mr137430wmo.29.1714858826327; 
 Sat, 04 May 2024 14:40:26 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:04 +0200
Message-ID: <b3890cc5eca37625cd2cb90056429d991229a0ff.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858826; x=1715463626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i84qJY1pWjBIkzk83IU5/uhuYbX5G0gndRA9yVuUGpE=;
 b=fJmKoG2tJvs1LvMp912HCx4AsXq0jU8zmHwIYAWHXRe22VcufaLulmuMRKN0tfGcXB
 SW9YQQNP7uuz1OzMKVHNtuNuKTDfFbFr3q2yI7g44Mk2U8oROIYJ2YkFi7Lz0FPbyRxp
 PBhta7EZSqcE/gKpZYFwaABGOhoaoJ109jLHPQhQY5xc7aEmq+TSZLtBtwSHgMfnqTay
 axj7i0Tp5hz3q4+Mgih48YetYI2mY57OD0ID7FGDS8tyLkX1c5GBPTFhscOoq679VeXE
 h5A/sk5Ljk18oVwiKuZVKlQ4GpuoiwaJ/9Leq25Gh0XeGTcgEtjTinqgTbQTKl4+aGe5
 T14w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fJmKoG2t
Subject: [Buildroot] [PATCH 03/22 v3] package/flutter-packages: fix and
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
but is generated remotely by github, as the _SITE is computed with our
github helper macro.

So, the -br1 suffix is both superfluous and confusing.

Drop the suffix to avoid any confusion in the future, and add a little
blurb explaining the situation close to where the variable is set, and
add a check-package disable line.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout: use check-package disable comment instead of ignoring the file]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

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
index 4beaa39325..0cc3bdff24 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -9,7 +9,14 @@ FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSIO
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
 FLUTTER_PACKAGES_DL_SUBDIR = flutter-packages
-FLUTTER_PACKAGES_SOURCE = flutter-packages-$(FLUTTER_PACKAGES_VERSION)-br1.tar.gz
+
+# This default value *is* required, because this file is not a package (it
+# does not call any of the *-package macros), so the _SOURCE variable is not
+# defined. However, we need a variable for the sub-packages to share the
+# same tarball name.
+# check-package disable lib_mk.RemoveDefaultPackageSourceVariable
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
