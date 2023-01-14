Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974EAC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 16:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDE9840105;
	Sat, 14 Jan 2023 16:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDE9840105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22UL2CHzB-gq; Sat, 14 Jan 2023 16:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5E5740585;
	Sat, 14 Jan 2023 16:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5E5740585
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4911BF380
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B0ED60BA9
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 16:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B0ED60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XR-f-3y4Liri for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 16:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7E7B60B9A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7E7B60B9A
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 16:10:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs20so23658477wrb.3
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 08:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvJfSFnmKwuQRE6ciqzniXYS/bKbEX/6eTEvVdpR+Z4=;
 b=DdJiMBVpUFi8xqa+7JjIbHbJClIW5irmrDUwf9JVosO8ZknNID1m2XVyVBM1eTSFSD
 cii9p75c6fNZuxz7UfuNf68kORr6/VWBA4fSOHp4ZnLxw4XbyxyHrUJ4sr1lcStDNUtY
 0zmsHoVXXepsStx1zIRZa59PTycdgRxaZBARBuo8cKl3o//xPfbwIhwohi/8yuLTjDF8
 bu0AvoORddg3xQCaYyOl72ziYV3RnXEwnyI2m7stKP+PZZBIXkfBhoqS2Z3J2ZD6rTH7
 +0BvGnWnAi6iMlONZmOF//s30KlTFWnePL9Oel4K+vYDZZJ2WyKzJBq6Hge5xzITKone
 Bazg==
X-Gm-Message-State: AFqh2koIPnwoqeQcPkELtz2NeTf5Tk99z0rSZnoDoLPVuyQnRl1pzeVf
 HF8uJ2sqT8nDcTemB9k87XpLsZT+JWw=
X-Google-Smtp-Source: AMrXdXse3mjPD6t5M//f8UI0azyA4jEcQI7xF5nCqhZmjc3zhosxRIHEcR//M4kXiefK+fH3ov2jqQ==
X-Received: by 2002:adf:f308:0:b0:2bd:f549:e66 with SMTP id
 i8-20020adff308000000b002bdf5490e66mr810121wro.63.1673712605371; 
 Sat, 14 Jan 2023 08:10:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t13-20020adfe10d000000b002b6bcc0b64dsm9274982wrz.4.2023.01.14.08.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 08:10:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 17:10:02 +0100
Message-Id: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TvJfSFnmKwuQRE6ciqzniXYS/bKbEX/6eTEvVdpR+Z4=;
 b=B3ROevxFq0D3xdRUUBBgzqhz7GMReXg7P4s8UmHa3T1++KrHL2nTxgjQspfH4HfZiT
 s+XjzA7JNWefhMsqWUFJzJMrOiJD/LKS7bm0IG0COsqbaed1MyPGqLa+LMpRRjlnHhvA
 Y9msjuZk4GZGh/UNvZ0Oj9WSy96z/GOrId4STGs7X6eemErVr9yPDeynXQPF6lDLhYU6
 YnKHqssqZjzoSTnNqltSWzjoJZqhXuZG6Dz9WxyUemoPqwLhgCkH/pM060zbNsFKmQSH
 VxmkXNZt2Tap/PjVIbSIiJrDUYO6F0+kQFTgmZluHe3V6l3we9TomjUi/Z1ppIvrZdBl
 hEhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B3ROevxF
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.16
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- libcap is a mandatory dependency since
  https://github.com/nhorman/rng-tools/commit/50afdce9d3fed6244a0cf772d38f2d8475312bc5
- Add Qrypt support:
  https://github.com/nhorman/rng-tools/commit/7ab7f540da567467055f77016590744d828fc9eb

https://github.com/nhorman/rng-tools/releases/tag/v6.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-build-without-sys-auxv.h.patch | 52 -------------------
 ...ropy-detection-to-look-for-the-setti.patch | 30 -----------
 ...ropy-library-to-timeout-fail-on-long.patch | 39 --------------
 package/rng-tools/Config.in                   | 14 +++++
 package/rng-tools/rng-tools.hash              |  2 +-
 package/rng-tools/rng-tools.mk                | 11 +++-
 6 files changed, 24 insertions(+), 124 deletions(-)
 delete mode 100644 package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
 delete mode 100644 package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
 delete mode 100644 package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch

diff --git a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
deleted file mode 100644
index 0c15ab6b7d..0000000000
--- a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6ea89861c300a732d1bbcffd085d92f5c4c9228e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Aug 2022 11:57:21 +0200
-Subject: [PATCH] configure.ac: fix build without sys/auxv.h
-
-Fix the following build failure on aarch64 without sys/auxv.h (e.g. on
-uclibc) raised since version 6.13 and
-https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:
-
-rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
-   34 | #include <sys/auxv.h>
-      |          ^~~~~~~~~~~~
-
-The same issue could be raised on powerpc64le since version 6.11 and
-https://github.com/nhorman/rng-tools/commit/ade348cdb90c25b44b203fd4e9c33ec4bccff323
-
-Fixes:
- - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/nhorman/rng-tools/commit/6ea89861c300a732d1bbcffd085d92f5c4c9228e]
----
- configure.ac | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0af64e7..411c7b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,14 +76,17 @@ AC_PROG_GCC_TRADITIONAL
- 
- AX_PTHREAD
- 
-+dnl Checks for header files.
-+AC_CHECK_HEADERS(sys/auxv.h)
-+
- AM_CONDITIONAL([RDRAND], [test $host_cpu = x86_64 || test $host_cpu = i686])
- AS_IF([test $host_cpu = x86_64 || test $host_cpu = i686], [AC_DEFINE([HAVE_RDRAND],1,[Enable RDRAND])],[])
- 
--AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le])
--AS_IF([test $host_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
-+AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"])
-+AS_IF([test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
- 
--AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64])
--AS_IF([test $host_cpu = aarch64], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
-+AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"])
-+AS_IF([test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
- AM_CONDITIONAL([JITTER], [false])
- 
- AC_ARG_ENABLE(jitterentropy,
diff --git a/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch b/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
deleted file mode 100644
index 553842640d..0000000000
--- a/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e2698477e8abf623c18ab28d33cc894ec882a706 Mon Sep 17 00:00:00 2001
-From: Neil Horman <neil.horman@privafy.com>
-Date: Fri, 18 Mar 2022 18:59:52 -0400
-Subject: [PATCH] Adjust jitterentropy detection to look for the settick
- function
-
-Theres no great way to detect if jitterentropy has the internal timer
-feature enabled so we have to look for a function that is only defined
-when it is enabled
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded from upstream commit
- https://github.com/nhorman/rng-tools/commit/e2698477e8abf623c18ab28d33cc894ec882a706]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e16e1a0..0f5a38e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -94,7 +94,7 @@ AS_IF(
- 		AC_SEARCH_LIBS(jent_version,jitterentropy,
- 				[AM_CONDITIONAL([JITTER], [true])
- 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
--				AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
-+				AC_CHECK_LIB(jitterentropy, jent_notime_settick,
- 				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
- 				[],-lpthread)],
- 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
diff --git a/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
deleted file mode 100644
index 9d8dbe2d0b..0000000000
--- a/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c29424f10a0dcbd18ac25607fa1c81c18a960e81 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@tuxdriver.com>
-Date: Mon, 16 May 2022 13:38:54 -0400
-Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
-
-[Bernd: removed description of unrelated part of the patch]
-
-Also while we're at it, I might have a build solution for the presence
-of internal timers.  When jitterentropy is built without internal
-timers, jent_notime_init is defined publically, but when it is built
-with timers, its declared as a static symbol, preenting resolution, so
-we can test to see if the function exists.  If it does we _don't_ have
-notime support. The logic is a bit backwards, but i think it works
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded configure.ac patch from upstream commit
- https://github.com/nhorman/rng-tools/commit/57be6d4c90e78ea9ad036a3a6e9b09822ed4d219]
----
- configure.ac  |  6 ++---
- rngd_jitter.c | 62 ++++++++++++++++++++++++++++++++++++++-------------
- 2 files changed, 49 insertions(+), 19 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 52f2bb5..0af64e7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -101,9 +101,9 @@ AS_IF(
- 		AC_SEARCH_LIBS(jent_version,jitterentropy,
- 				[AM_CONDITIONAL([JITTER], [true])
- 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
--				AC_CHECK_LIB(jitterentropy, jent_notime_settick,
--				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
--				[],-lpthread)],
-+				AC_CHECK_LIB(jitterentropy, jent_notime_init,
-+				[],
-+				[AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
- 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
- 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
- )
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 0dd269c818..7b3192bcef 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RNG_TOOLS
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Daemon to use hardware random number generators.
@@ -35,6 +36,19 @@ config BR2_PACKAGE_RNG_TOOLS_NISTBEACON
 	  never be used for cryptographic purposes, or any use case in
 	  which random data should be known only by a single entity.
 
+config BR2_PACKAGE_RNG_TOOLS_QRYPT
+	bool "Qrypt Entropy Beacon support"
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Enable Qrypt NIST-Beacon like entropy support.
+
+	  Entropy gathered from Qrypt server based entropy beacons. Like
+	  NIST, it should likely not be used directly in cryptographic
+	  operation, as the entropy may be intercepted over a network,
+	  but can provide copius amounts of entropy for non-crypto
+	  purposes.
+
 endif
 
 comment "rng-tools needs a toolchain w/ NPTL"
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index be2ee13969..4c86791267 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a  rng-tools-6.15.tar.gz
+sha256  17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894  rng-tools-6.16.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index f736193a23..3e565103e4 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.15
+RNG_TOOLS_VERSION = 6.16
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
 RNG_TOOLS_SELINUX_MODULES = rngd
 
-RNG_TOOLS_DEPENDENCIES = host-pkgconf openssl
+RNG_TOOLS_DEPENDENCIES = host-pkgconf libcap openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
 
@@ -45,6 +45,13 @@ else
 RNG_TOOLS_CONF_OPTS += --without-nistbeacon
 endif
 
+ifeq ($(BR2_PACKAGE_RNG_TOOLS_QRYPT),y)
+RNG_TOOLS_DEPENDENCIES += jansson libcurl
+RNG_TOOLS_CONF_OPTS += --with-qrypt
+else
+RNG_TOOLS_CONF_OPTS += --without-qrypt
+endif
+
 define RNG_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/rng-tools/S21rngd \
 		$(TARGET_DIR)/etc/init.d/S21rngd
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
