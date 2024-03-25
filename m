Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12AC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2AE608E3;
	Mon, 25 Mar 2024 22:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff4AwJ2IJtvw; Mon, 25 Mar 2024 22:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B318C60A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B318C60A66;
	Mon, 25 Mar 2024 22:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A85601BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C33813B6
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OGXwXTinhAA for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D21E81362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D21E81362
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D21E81362
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:48 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1e00d1e13acso29142975ad.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406087; x=1712010887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxTjpzU1cbdweWyFwkGASU0gLYCBvYRVBG4JA6ijTWg=;
 b=YP6nXREhC3tx0zSOYaAykBda9lvNNYO1348Qe//f1raqqad6uzv77on8nmQg9Bitnv
 IMhdtDv2QTFIFXRc1tIdh76w/it6PgRjdLdpc4jGwsYzvw0wBwFyvzFCxlAlDNndbXNQ
 we/1gbNUcYiP8+zpLhKe/IaYlp+MASYP6i1OBA0YjdPsPW8ViIAnGGWOIwuKs4Yrx8JY
 FSIOGMpjpPK05yh4iYv+upWKFCqkLc1BNxbjaYhDgmmM7OXFiIVfOBrnYcsNfGo3cWvV
 dix1PQwzWS1ALNQjZGYCUHvzUNg+8ApZxdyHQ/C0IGQTBcztInhi5cUd9cD6nmTmByeA
 oOzg==
X-Gm-Message-State: AOJu0Yzh/QdqjPZhipWHzXuEV8QMGQ8rSIAPBOG65ROlLRp0L1fujBgf
 MxLj5VTRalV8zr4cwoO73J5aI2AJNOw7Td6GPNy74XgRBXwg2HD+eMPEb62pkGyP/kYAy1M6yOD
 N
X-Google-Smtp-Source: AGHT+IHvQO9Db93vpL65LDcGeyjLWJ+ObmhyLA1t4OqFMlOm6idqFRA25TO9oT+e7k5kpIHw3pLGXg==
X-Received: by 2002:a17:902:6505:b0:1de:ec6b:50b1 with SMTP id
 b5-20020a170902650500b001deec6b50b1mr8453565plk.54.1711406086714; 
 Mon, 25 Mar 2024 15:34:46 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:23 -0600
Message-ID: <20240325223424.108702-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406087; x=1712010887;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxTjpzU1cbdweWyFwkGASU0gLYCBvYRVBG4JA6ijTWg=;
 b=rqj8FmFEODgF9Q0Cl/TkjzXExlFiXTZ90Z/d2IAe46+yw2BoSQ0sstWQq/rReJl+Ut
 zlswkW3ebnQVhhGdcBlmyYTO6sa9kT35nBV3IkhYbHJ4xLyXygOK7mdsE5pG4idcj5Kx
 4wXlVdXNzWYms/KCvWEUXEg1ul0VdSdO4ad4c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rqj8FmFE
Subject: [Buildroot] [PATCH v2 12/13] package/flutter-engine: bump version
 to 3.19.4
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 0005-skip-configuration-dependency-if-unit-tests-are-disa.patch, which
fixes gtk+-3.0 being an unconditional requirement.

Other changes:
Flutter 3.19.x made Wayland and X11 an unconditional requirement, resulting in
the following errors when compiling:

"""
../../flutter/third_party/swiftshader/src/WSI/libWaylandClient.hpp:18:10: fatal error: 'wayland-client.h' file not found
   18 | #include <wayland-client.h>
      |          ^~~~~~~~~~~~~~~~~~

../../flutter/third_party/swiftshader/src/WSI/WaylandSurfaceKHR.cpp:15:
../../flutter/third_party/swiftshader/src/WSI/WaylandSurfaceKHR.hpp:22:10: fatal error: 'wayland-client.h' file not found
   22 | #include <wayland-client.h>
      |          ^~~~~~~~~~~~~~~~~~
1 error generated.
[1369/11229] CC obj/flutter/third_party/sqlite/sqlite.sqlite3.o
"""

After raising an issue found here:
https://github.com/flutter/flutter/issues/144635 and after several hours of
searching, the problem is https://github.com/flutter/buildroot/commit/d01da2716
which hardcodes the following values if building for a Linux platform:
  - ozone_platform_x11 = true
  - ozone_platform_wayland = true

As upstream maintainers listed the above as low priority (P3), a simple fix is
to add two additional sed calls in FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP and
FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP which set ozone_platform_x11 and
ozone_platform_wayland to the appropriate values.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...on-dependency-if-unit-tests-are-disa.patch | 32 +++++++++++++++++++
 package/flutter-engine/flutter-engine.mk      |  8 ++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch

diff --git a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
new file mode 100644
index 0000000000..125bfc6910
--- /dev/null
+++ b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
@@ -0,0 +1,32 @@
+From 2252a85e59669b5826019f60a98b7a69939dacfd Mon Sep 17 00:00:00 2001
+From: Greg Spencer <gspencer@google.com>
+Date: Mon, 4 Mar 2024 12:30:41 -0800
+Subject: [PATCH] Skip configuration dependency if unit tests are disabled.
+
+Commit 88baf62f made gtk+-3.0 an unconditional requirement, see:
+
+Issue: https://github.com/flutter/flutter/issues/144421
+Upstream: Merged. https://github.com/flutter/engine/pull/51179
+
+Signed-off-by: Greg Spencer <gspencer@google.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ flutter/testing/BUILD.gn | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/flutter/testing/BUILD.gn b/flutter/testing/BUILD.gn
+index 9eac29452..a7d094695 100644
+--- a/flutter/testing/BUILD.gn
++++ b/flutter/testing/BUILD.gn
+@@ -51,7 +51,7 @@ source_set("testing") {
+ 
+   sources = [ "run_all_unittests.cc" ]
+ 
+-  if (is_linux) {
++  if (enable_unittests && is_linux) {
+     # So that we can call gtk_init in main().
+     configs += [ "//flutter/shell/platform/linux/config:gtk" ]
+   }
+-- 
+2.44.0
+
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d08274f546..ff21e0949d 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.16.8
+FLUTTER_ENGINE_VERSION = 3.19.4
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -154,6 +154,9 @@ else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
 		$(@D)/build_overrides/vulkan_headers.gni
+
+	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
+		$(@D)/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 endif
@@ -164,6 +167,9 @@ else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
 		$(@D)/build_overrides/vulkan_headers.gni
+
+	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
+		$(@D)/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 endif
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
