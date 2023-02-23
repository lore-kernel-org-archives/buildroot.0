Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28C5C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 15:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49EA561AC6;
	Thu, 23 Feb 2023 15:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49EA561AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8O06SdM7bO0q; Thu, 23 Feb 2023 15:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FCE961AE8;
	Thu, 23 Feb 2023 15:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FCE961AE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E63D41BF2CF
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 15:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C043041C6E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 15:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C043041C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Id6mmonNz0ZD for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 15:32:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F164F41C69
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F164F41C69
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 15:32:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p16so7030058wmq.5
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 07:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rpbvBt8IWm0gaYrRPI+dNBOqmAmBOriW2zZ6i5j9PO8=;
 b=y4dBqTGjvKYDjKOLhimF7XkV8ZCGKAy8BIIYBmPlGelwK/NPL5kKePTZqHKaqJ0Wmd
 IuU8X/ebFN4m7n0SZLvBPJE8195+dNaX9nFCGZGiU+CGiwf/jYlKtzLXCznJl7OejU7Q
 lStBP8bPT/mk50NiUFJaano4siyikNOdoz7B6pW5x7cjbFkcOrvR14gdr1X5fUf/Xwby
 Z7eVByVtnmtJ5QOC5pfzYpDU65appBpdTljnrddf1kvklHiw+miitKGZiGacC5rZCX/k
 r350soMdqlKiouiDdRpmhlWBkO5agiuyyWPHlbgJl/IofGCvBITdxLSusqK4Jt5W8N5y
 TGuQ==
X-Gm-Message-State: AO0yUKXlCO6LoKCDF2zJMlxlE/B7c0C+XIBlAwFdCozMfknifbr5iFEY
 PZ/qkT4slZ2vogJRWF5iNi+VxVeNCZc=
X-Google-Smtp-Source: AK7set8fJTP6p8Z1q/cdfKO7RX67NXJAbzNaS87tPhd0ULuvjNXwkpSdemXgUvszc/0FI3nVahrL1w==
X-Received: by 2002:a05:600c:4495:b0:3ea:bc08:ae27 with SMTP id
 e21-20020a05600c449500b003eabc08ae27mr1066617wmo.29.1677166359631; 
 Thu, 23 Feb 2023 07:32:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b002c563b124basm10708617wrp.103.2023.02.23.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:32:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 16:32:36 +0100
Message-Id: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rpbvBt8IWm0gaYrRPI+dNBOqmAmBOriW2zZ6i5j9PO8=;
 b=epiOoLP6xDLrEQTCnLIyPJ0oEbB2z0CZaW8hXvNMGb2DnhCqzjrc6fIlUx4rPaqJQI
 +BA9rMmn5SDH3ieQ+FQNV3Tqf6XdrCq7XS1uowAGsao6On+3MNpGdTUBimt74bXlA9jF
 p203kW1A7DkgoVIP7Fm69jqjIFzXKuZ4VIF0szpJ7ad8FnzkGuxEPhaQKzaWLkHt8IJU
 qNeAQ34pRVod6m8s2iQ1tO8wupJ3e44j/wB5wMujnwaiuz8D2a/j5gnFah1CltfVnwgN
 2vegS1XesQKvh05GR/UWLMPuQ7RFI1fMCWV9OxqBRlNzULtjeIrQdNG5Vaq0ewmaDiqc
 a+rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=epiOoLP6
Subject: [Buildroot] [PATCH 1/1] package/cairo: fix pthread detection
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pthreads detection fails if a warning is emitted resulting in the
following build failure with some toolchains:

onfigure:34189: checking for cairo's pthread feature
configure:34300: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm -lpthread >&5
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
configure:34300: $? = 0
configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
configure:34419: $? = 0
configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
configure:34500: $? = 0
configure:34555: checking whether cairo's pthread feature could be enabled
configure:34557: result: no (can't link with -lpthread or -pthread)

[...]

In file included from cairo-mutex-type-private.h:45,
                 from cairo-scaled-font-private.h:45,
                 from cairoint.h:434,
                 from cairo-analysis-surface.c:37:
cairo-mutex-impl-private.h:262:3: error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
  262 | # error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
      |   ^~~~~

To avoid this build failure, add a patch that overrides this broken
mechanism

Fixes:
 - http://autobuild.buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc00419a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e.ac.pthread-respect-enable-pthreads.patch | 59 +++++++++++++++++++
 package/cairo/cairo.mk                        | 13 ++--
 2 files changed, 68 insertions(+), 4 deletions(-)
 create mode 100644 package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.patch

diff --git a/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.patch b/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.patch
new file mode 100644
index 0000000000..c350c596cf
--- /dev/null
+++ b/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.patch
@@ -0,0 +1,59 @@
+From 243fe7f3d51c23159e25f36adee7e953fee29f6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Feb 2023 16:07:04 +0100
+Subject: [PATCH] build/configure.ac.pthread: respect --enable-pthreads
+
+Respect --enable-pthreads as pthreads detection fails if a warning is
+emitted resulting in the following build failure with some toolchains:
+
+onfigure:34189: checking for cairo's pthread feature
+configure:34300: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm -lpthread >&5
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+configure:34300: $? = 0
+configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+configure:34419: $? = 0
+configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+configure:34500: $? = 0
+configure:34555: checking whether cairo's pthread feature could be enabled
+configure:34557: result: no (can't link with -lpthread or -pthread)
+
+[...]
+
+In file included from cairo-mutex-type-private.h:45,
+                 from cairo-scaled-font-private.h:45,
+                 from cairoint.h:434,
+                 from cairo-analysis-surface.c:37:
+cairo-mutex-impl-private.h:262:3: error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
+  262 | # error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
+      |   ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc00419a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/configure.ac.pthread | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/build/configure.ac.pthread b/build/configure.ac.pthread
+index 29c930da9..084445587 100644
+--- a/build/configure.ac.pthread
++++ b/build/configure.ac.pthread
+@@ -244,7 +244,8 @@ AC_DEFUN([CAIRO_CONFIGURE_PTHREAD],[dnl
+ 
+ 	dnl Make sure we scored some pthreads.
+ 	if test "x$enable_pthread" = "xyes" -a "x$have_pthread" != "xyes"; then
+-		AC_MSG_ERROR([pthread requested but not found])
++		AC_MSG_WARN([pthread requested but not found])
++		have_pthread=yes
+ 	fi
+ 
+ 	dnl Set the output variables for CAIRO_ENABLE.
+-- 
+2.39.1
+
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index e8a704c7da..9034068403 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -11,6 +11,8 @@ CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_CPE_ID_VENDOR = cairographics
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
+# We're patching build/configure.ac.pthread
+CAIRO_AUTORECONF = YES
 
 # 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
 CAIRO_IGNORE_CVES += CVE-2018-19876
@@ -26,10 +28,6 @@ ifeq ($(BR2_m68k_cf),y)
 CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
-endif
-
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
@@ -70,6 +68,13 @@ HOST_CAIRO_DEPENDENCIES = \
 	host-pixman \
 	host-pkgconf
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+CAIRO_CONF_OPTS += --enable-pthread
+else
+CAIRO_CONF_OPTS += --disable-pthread
+CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
+endif
+
 # DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
 # DirectFB. Break circular dependency by disabling DirectFB support in Cairo
 # (which is experimental)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
