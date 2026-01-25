Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5BDE63C9C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 12:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9875983658;
	Sun, 25 Jan 2026 12:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGma11tucYFb; Sun, 25 Jan 2026 12:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90BF832E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769343633;
	bh=VV4QJhsQt92x66hB62o1Yp54qLuDgAn/OMySZFwnbjw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fNshr2BJZ2rl4/0YU72yj5Y1Rn+FbmQi1Fti/hgJXkgREPrQVpistfsQ/zAGkYica
	 ZiCqJn7INVEzgcEa+DcSn/BiPftbQU3ibxNp3MOnxJZMUzU5cxR3rHJlu30HTriQc7
	 1MmMrRC7hp4x67t+9ZbdpBQBiEtMDxFMiV09NB5tf3ynWewvUG+ei7vrektyMUlk4d
	 7v1nZEGNi4ptwm+5X//GdIJXYoDbYNZEodrJxte9MCoL44vORm0u/vObR0nW8Tqonu
	 yIAdO/jv7Wjz67Q12iV+4oT7D0x4trJ/UmCbT+kakwdy/fteI5+A3TElizG+FYQxdy
	 0N3U9Snw0doIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90BF832E7;
	Sun, 25 Jan 2026 12:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2071CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77466407D8
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqXl3I_uRb_D for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 12:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=michael@michaelcullen.name; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E579440797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E579440797
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E579440797
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:20:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-65813e3bdaaso6368697a12.1
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 04:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769343627; x=1769948427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GoLnWq0Tb1MsDTNlHqsj63IGk9GItDG1aeBprMI7uLs=;
 b=mn6AmK4GXVjvBxpPEOtIGG+tTsx+dx70trllthwVOOcNr08E+8gTPJe5u8gLJw3ToS
 1ZAjt8K3mypVjeGSc7ma4753NDjLuQCgZUdLEsx1nCBz0xA6FA3VLm4GO0nXoX195TL5
 54osySXJ+O1an6DWH315Tstl17yM9b6SkBQco+GzOuD8yyZhtQAe2g5XCCUJ4BCVF0OH
 PC98wwF1NYJFS+yA+IfZLMKDa1LJ0y9p35iryAiggQGFlk87bVi5mjr9QbuXhQH788d/
 L85EzlJRmpfxQs+qF9wM14U7fgk/lqfBgib/XzMlpTeWZ2P2fTP8moNruN8YJ2PEfZD0
 uXvw==
X-Gm-Message-State: AOJu0YzOn8hkjyTZH3wnlz2zyDoYKYQTRgWmTY6531gwc2WNi4J6pfTs
 G881joJ1q+pNrrSCZhlESRdUmx9NTTBFwZRp7PTy7/kWfzQ0HNSXIzwEGxQqWHvGwt4cYEak5oJ
 QauI=
X-Gm-Gg: AZuq6aItYUeInz0YMgq0fMtCNIKLO3qi39o10LLMhps5tad1oReQEcH3MGRFlqKFGL7
 xUko6A74MJYCFZ/tfTZq1bgskkdYRjjuFZE+fkPfoIR9h2SOSA70K0qzcwuVKh46K6H4NzN4srC
 Qbrh1alt9VJ42klYHidgX8Fsosw9DZNpv00tKttN5/Hj3rfn+cfM9JxbbEAYFCKF4z0Klzo+wa6
 FtN3i5mooDdxtWOG+sUFlb8B7fdubn1m7lo8At7JBkuK7hHHRp4X5CrvHZ09VCOVphccKw41noM
 nb6aCmjeOp+GRMaxJFSjtNSdKrhahCtapWUizH/d5Yap9boKafzm1B2PJ5cjzrIvNaRQbtY9mG4
 WJdMB4X5ngRD7iSI4onxO8zfefT6OIE4Xk/Ybs+chsJFGYwDjt8ikA5KvS9QU9nwJWzSCWIIvfE
 AGjYa4c3Pk5rCt+ZDgiccsoLxPocMtVMAp+iBVAi2hs86qlgJK+g==
X-Received: by 2002:aa7:d995:0:b0:658:1350:1fd2 with SMTP id
 4fb4d7f45d1cf-65870a06976mr680962a12.13.1769343626275; 
 Sun, 25 Jan 2026 04:20:26 -0800 (PST)
Received: from localhost ([2a02:8109:b280:ac00:21a2:4071:7e5:966])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-6584b076254sm3732453a12.0.2026.01.25.04.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jan 2026 04:20:25 -0800 (PST)
To: buildroot@buildroot.org
Cc: Michael Cullen <michael@michaelcullen.name>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Jan 2026 13:20:22 +0100
Message-ID: <20260125122022.667915-1-michael@michaelcullen.name>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106185726.654877-1-michael@michaelcullen.name>
References: <20260106185726.654877-1-michael@michaelcullen.name>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=michaelcullen.name; s=google; t=1769343627; x=1769948427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GoLnWq0Tb1MsDTNlHqsj63IGk9GItDG1aeBprMI7uLs=;
 b=UBPXXHc7xbc+3ItESAykTxWlq7yz48SBNJDFTsplv9/o9es2Ib6Ln/Bv91wM85Fx4q
 K4V9bj0AS0W/zWhnyBcgz9JxmUmwlZaXRpwfO+O38400BdTIPHqVE+R5UMcwLAkr+Sin
 hONkunEeK9fJSND8y+ytY6iDN6Y2ZK6OidIUVd8PXzoiboCdwd1thI8wMk7ix7aupImG
 qcNbG7yg/Bojq0TzfYItcEf2f7lE9vtM8bJmpuSckwTFJdnPRegnLMyHYXaPlFL9rFzy
 CitwoK/V18YZfvFfTwfIu67YMaRwWbpoDZ1xfHwSj5/ysLQDyUNM1wbsEk1s3OFYej22
 PL7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=michaelcullen.name
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=michaelcullen.name header.i=@michaelcullen.name
 header.a=rsa-sha256 header.s=google header.b=UBPXXHc7
Subject: [Buildroot] [PATCH v2] package/zimg: add zimg package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Cullen via buildroot <buildroot@buildroot.org>
Reply-To: Michael Cullen <michael@michaelcullen.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds an image transformation library called zimg.

There are a number of patches applied. One is from upstream and supports
building on GCC-15, the others are autotools patches to allow installing
various components useful for verifying the library is working on the
target, which are not usually installed by the upstream project.

Note that while this version of zimg claims to support C++11 upwards,
upstream is moving towards only supporting C++17 upwards in the master
branch.

This has been tested on a Raspberry Pi 4 and a Raspberry Pi 5, and on
x86_64 (run in a chroot).

Signed-off-by: Michael Cullen <michael@michaelcullen.name>
---
Changes V1 -> V2:
  - Submitted PR upstream with patches
  - Changed help text to reference "gcc >= 4.9" rather than just "C++11"
  - Added explicit "--disable-..." configure options
  - Removed "disable SIMD" option as requested. This option was only there
      because the upstream configure script supports it so I decided to expose
      it. It probably isn't very useful in normal situations though
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/zimg/0001-Fix-build-with-GCC-15.patch |  34 +++++
 .../0002-Add-option-to-install-test-app.patch |  83 +++++++++++++
 .../0003-Add-option-to-install-examples.patch | 107 ++++++++++++++++
 .../0004-Add-option-to-install-tests.patch    | 116 ++++++++++++++++++
 package/zimg/Config.in                        |  28 +++++
 package/zimg/zimg.mk                          |  35 ++++++
 8 files changed, 407 insertions(+)
 create mode 100644 package/zimg/0001-Fix-build-with-GCC-15.patch
 create mode 100644 package/zimg/0002-Add-option-to-install-test-app.patch
 create mode 100644 package/zimg/0003-Add-option-to-install-examples.patch
 create mode 100644 package/zimg/0004-Add-option-to-install-tests.patch
 create mode 100644 package/zimg/Config.in
 create mode 100644 package/zimg/zimg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 08c98ec53b..975caf7035 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2412,6 +2412,9 @@ N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
 F:	configs/engicam_px30_core_defconfig
 
+N:	Michael Cullen <michael@michaelcullen.name>
+F:	package/zimg/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index 94ea56b297..6c603f7de0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1804,6 +1804,7 @@ menu "Graphics"
 	source "package/wpebackend-fdo/Config.in"
 	source "package/wpewebkit/Config.in"
 	source "package/zbar/Config.in"
+	source "package/zimg/Config.in"
 	source "package/zxing-cpp/Config.in"
 endmenu
 
diff --git a/package/zimg/0001-Fix-build-with-GCC-15.patch b/package/zimg/0001-Fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..d4f10d3a2b
--- /dev/null
+++ b/package/zimg/0001-Fix-build-with-GCC-15.patch
@@ -0,0 +1,34 @@
+From 03e6c1e5a6f8420404cb035e975738db96628eb2 Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowi@redhat.com>
+Date: Tue, 18 Mar 2025 17:11:00 -0400
+Subject: [PATCH] Fix build with GCC 15
+
+```
+src/testcommon/mmap.cpp: In member function 'void MemoryMappedFile::impl::map_file(const char*, int, int, int)':
+src/testcommon/mmap.cpp:273:62: error: 'PTRDIFF_MAX' was not declared in this scope
+  273 |                 if ((file_size = posix::get_file_size(fd)) > PTRDIFF_MAX)
+      |                                                              ^~~~~~~~~~~
+src/testcommon/mmap.cpp:22:1: note: 'PTRDIFF_MAX' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+```
+
+Upstream: https://github.com/sekrit-twc/zimg/commit/b013c7b006e6bee05b7964162f3a00402168e77f
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ src/testcommon/mmap.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/testcommon/mmap.cpp b/src/testcommon/mmap.cpp
+index b6ba709..0310fa9 100644
+--- a/src/testcommon/mmap.cpp
++++ b/src/testcommon/mmap.cpp
+@@ -10,6 +10,7 @@
+   #include <Windows.h>
+ #else
+   #include <cerrno>
++  #include <cstdint>
+ 
+   #include <fcntl.h>
+   #include <unistd.h>
+-- 
+2.52.0
+
diff --git a/package/zimg/0002-Add-option-to-install-test-app.patch b/package/zimg/0002-Add-option-to-install-test-app.patch
new file mode 100644
index 0000000000..94ec319c5b
--- /dev/null
+++ b/package/zimg/0002-Add-option-to-install-test-app.patch
@@ -0,0 +1,83 @@
+From b8f6ab33354702c52d996c74261242542610dfc3 Mon Sep 17 00:00:00 2001
+From: Michael Cullen <michael@michaelcullen.name>
+Date: Tue, 6 Jan 2026 10:35:15 +0100
+Subject: [PATCH] Add option to install test app
+
+To make sure zimg is working, it would be useful to be able to run the
+test app on the target. Currently, however, it is not installed.
+
+This patch renames it and adds an option to install it.
+
+Upstream: https://github.com/sekrit-twc/zimg/pull/233
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ Makefile.am  | 16 ++++++++++++----
+ configure.ac |  2 ++
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8727ca4..7f83427 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,6 +39,7 @@ dist_examplemisc_DATA = \
+ 	src/testcommon/win32_bitmap.h
+ 
+ 
++bin_PROGRAMS =
+ noinst_PROGRAMS =
+ lib_LTLIBRARIES = libzimg.la
+ noinst_LTLIBRARIES = libzimg_internal.la
+@@ -292,11 +293,18 @@ endif # EXAMPLES
+ 
+ 
+ if TESTAPP
+-noinst_PROGRAMS += testapp
++testapp_progs = zimg_testapp
++
++if INSTALL_TESTAPP
++bin_PROGRAMS += $(testapp_progs)
++else # INSTALL_TESTAPP
++noinst_PROGRAMS += $(testapp_progs)
++endif # INSTALL_TESTAPP
++
+ noinst_LTLIBRARIES += libtestcommon.la
+-testapp_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/src/zimg -I$(srcdir)/src/testcommon
++zimg_testapp_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/src/zimg -I$(srcdir)/src/testcommon $(graphengineflags)
+ 
+-testapp_SOURCES = \
++zimg_testapp_SOURCES = \
+ 	src/testapp/apps.h \
+ 	src/testapp/colorspaceapp.cpp \
+ 	src/testapp/cpuinfoapp.cpp \
+@@ -314,7 +322,7 @@ testapp_SOURCES = \
+ 	src/testapp/utils.cpp \
+ 	src/testapp/utils.h
+ 
+-testapp_LDADD = libtestcommon.la libzimg_internal.la
++zimg_testapp_LDADD = libtestcommon.la libzimg_internal.la
+ endif # TESTAPP
+ 
+ 
+diff --git a/configure.ac b/configure.ac
+index 8402df6..d7d0ea2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,6 +17,7 @@ AC_CANONICAL_HOST
+ AC_ARG_ENABLE([testapp],   AS_HELP_STRING([--enable-testapp],   [Compile the test application. (default=no)]))
+ AC_ARG_ENABLE([example],   AS_HELP_STRING([--enable-example],   [Compile example programs. (default=no)]))
+ AC_ARG_ENABLE([unit-test], AS_HELP_STRING([--enable-unit-test], [Compile unit tests. May result in slower code. (default=no)]))
++AC_ARG_ENABLE([install-testapp], AS_HELP_STRING([--enable-install-testapp], [Install test app (default=no)]))
+ AC_ARG_ENABLE([debug],     AS_HELP_STRING([--enable-debug],     [Enable compilation options required for debugging. (default=no)]))
+ AC_ARG_ENABLE([simd],      AS_HELP_STRING([--disable-simd],     [Disable SIMD code. (default=no)]))
+ 
+@@ -114,6 +115,7 @@ int main()
+ AM_CONDITIONAL([TESTAPP],        [test "x$enable_testapp" = "xyes"])
+ AM_CONDITIONAL([EXAMPLES],       [test "x$enable_example" = "xyes"])
+ AM_CONDITIONAL([UNIT_TEST],      [test "x$enable_unit_test" = "xyes"])
++AM_CONDITIONAL([INSTALL_TESTAPP], [test "x$enable_install_testapp" = "xyes"])
+ AM_CONDITIONAL([ARMSIMD],        [test "x$enable_arm_simd" = "xyes"])
+ AM_CONDITIONAL([X86SIMD],        [test "x$enable_x86_simd" = "xyes"])
+ AM_CONDITIONAL([X86SIMD_AVX512], [test "x$enable_x86_simd_avx512" = "xyes"])
+-- 
+2.52.0
+
diff --git a/package/zimg/0003-Add-option-to-install-examples.patch b/package/zimg/0003-Add-option-to-install-examples.patch
new file mode 100644
index 0000000000..b0687b842c
--- /dev/null
+++ b/package/zimg/0003-Add-option-to-install-examples.patch
@@ -0,0 +1,107 @@
+From 6bb35899f3720be6830af30eeed3dafbf028b6ed Mon Sep 17 00:00:00 2001
+From: Michael Cullen <michael@michaelcullen.name>
+Date: Tue, 6 Jan 2026 10:39:06 +0100
+Subject: [PATCH] Add option to install examples
+
+Like the previous patch that installs the test app, this commit renames
+and gives an option to install the examples so they can be tested on the target.
+
+Upstream: https://github.com/sekrit-twc/zimg/pull/233
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ Makefile.am  | 49 ++++++++++++++++++++++++++++---------------------
+ configure.ac |  2 ++
+ 2 files changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7f83427..7ef374c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -259,36 +259,43 @@ libtestcommon_la_SOURCES = \
+ 
+ 
+ if EXAMPLES
+-noinst_PROGRAMS += \
+-	doc/example/api_example \
+-	doc/example/api_example_c \
+-	doc/example/hdr_example \
+-	doc/example/interlace_example \
+-	doc/example/tile_example
++example_progs = \
++	doc/example/zimg_api_example \
++	doc/example/zimg_api_example_c \
++	doc/example/zimg_hdr_example \
++	doc/example/zimg_interlace_example \
++	doc/example/zimg_tile_example
++
++if INSTALL_EXAMPLES
++bin_PROGRAMS += $(example_progs)
++else # INSTALL_EXAMPLES
++noinst_PROGRAMS += $(example_progs)
++endif # INSTALL_EXAMPLES
++
+ noinst_LTLIBRARIES += libtestcommon.la
+ 
+ EXAMPLE_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/src/zimg/api -I$(srcdir)/src/testcommon
+ EXAMPLE_LDADD = libtestcommon.la libzimg.la
+ 
+-doc_example_api_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
+-doc_example_api_example_SOURCES = doc/example/api_example.cpp
+-doc_example_api_example_LDADD = $(EXAMPLE_LDADD)
++doc_example_zimg_api_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
++doc_example_zimg_api_example_SOURCES = doc/example/api_example.cpp
++doc_example_zimg_api_example_LDADD = $(EXAMPLE_LDADD)
+ 
+-doc_example_api_example_c_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
+-doc_example_api_example_c_SOURCES = doc/example/api_example_c.c dummy.cpp
+-doc_example_api_example_c_LDADD = $(EXAMPLE_LDADD)
++doc_example_zimg_api_example_c_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
++doc_example_zimg_api_example_c_SOURCES = doc/example/api_example_c.c dummy.cpp
++doc_example_zimg_api_example_c_LDADD = $(EXAMPLE_LDADD)
+ 
+-doc_example_hdr_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
+-doc_example_hdr_example_SOURCES = doc/example/hdr_example.cpp
+-doc_example_hdr_example_LDADD = $(EXAMPLE_LDADD)
++doc_example_zimg_hdr_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
++doc_example_zimg_hdr_example_SOURCES = doc/example/hdr_example.cpp
++doc_example_zimg_hdr_example_LDADD = $(EXAMPLE_LDADD)
+ 
+-doc_example_interlace_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
+-doc_example_interlace_example_SOURCES = doc/example/interlace_example.cpp
+-doc_example_interlace_example_LDADD = $(EXAMPLE_LDADD)
++doc_example_zimg_interlace_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
++doc_example_zimg_interlace_example_SOURCES = doc/example/interlace_example.cpp
++doc_example_zimg_interlace_example_LDADD = $(EXAMPLE_LDADD)
+ 
+-doc_example_tile_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
+-doc_example_tile_example_SOURCES = doc/example/tile_example.cpp
+-doc_example_tile_example_LDADD = $(EXAMPLE_LDADD)
++doc_example_zimg_tile_example_CPPFLAGS = $(EXAMPLE_CPPFLAGS)
++doc_example_zimg_tile_example_SOURCES = doc/example/tile_example.cpp
++doc_example_zimg_tile_example_LDADD = $(EXAMPLE_LDADD)
+ endif # EXAMPLES
+ 
+ 
+diff --git a/configure.ac b/configure.ac
+index d7d0ea2..26a0627 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,6 +18,7 @@ AC_ARG_ENABLE([testapp],   AS_HELP_STRING([--enable-testapp],   [Compile the tes
+ AC_ARG_ENABLE([example],   AS_HELP_STRING([--enable-example],   [Compile example programs. (default=no)]))
+ AC_ARG_ENABLE([unit-test], AS_HELP_STRING([--enable-unit-test], [Compile unit tests. May result in slower code. (default=no)]))
+ AC_ARG_ENABLE([install-testapp], AS_HELP_STRING([--enable-install-testapp], [Install test app (default=no)]))
++AC_ARG_ENABLE([install-examples], AS_HELP_STRING([--enable-install-examples], [Install example programs (default=no)]))
+ AC_ARG_ENABLE([debug],     AS_HELP_STRING([--enable-debug],     [Enable compilation options required for debugging. (default=no)]))
+ AC_ARG_ENABLE([simd],      AS_HELP_STRING([--disable-simd],     [Disable SIMD code. (default=no)]))
+ 
+@@ -116,6 +117,7 @@ AM_CONDITIONAL([TESTAPP],        [test "x$enable_testapp" = "xyes"])
+ AM_CONDITIONAL([EXAMPLES],       [test "x$enable_example" = "xyes"])
+ AM_CONDITIONAL([UNIT_TEST],      [test "x$enable_unit_test" = "xyes"])
+ AM_CONDITIONAL([INSTALL_TESTAPP], [test "x$enable_install_testapp" = "xyes"])
++AM_CONDITIONAL([INSTALL_EXAMPLES], [test "x$enable_install_examples" = "xyes"])
+ AM_CONDITIONAL([ARMSIMD],        [test "x$enable_arm_simd" = "xyes"])
+ AM_CONDITIONAL([X86SIMD],        [test "x$enable_x86_simd" = "xyes"])
+ AM_CONDITIONAL([X86SIMD_AVX512], [test "x$enable_x86_simd_avx512" = "xyes"])
+-- 
+2.52.0
+
diff --git a/package/zimg/0004-Add-option-to-install-tests.patch b/package/zimg/0004-Add-option-to-install-tests.patch
new file mode 100644
index 0000000000..a38dad4c86
--- /dev/null
+++ b/package/zimg/0004-Add-option-to-install-tests.patch
@@ -0,0 +1,116 @@
+From ca6948e68a5e3e0ce4d6483bb7a93f6781862ed4 Mon Sep 17 00:00:00 2001
+From: Michael Cullen <michael@michaelcullen.name>
+Date: Tue, 6 Jan 2026 12:26:32 +0100
+Subject: [PATCH] Add option to install tests
+
+When cross compiling, it may be useful to install the tests rather than
+run them. This gives an option to do that.
+
+Upstream: https://github.com/sekrit-twc/zimg/pull/233
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ Makefile.am  | 21 +++++++++++++--------
+ configure.ac |  2 ++
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7ef374c..3441f72 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -334,10 +334,10 @@ endif # TESTAPP
+ 
+ 
+ if UNIT_TEST
+-TESTS = test/unit_test
++TESTS = test/zimg_unit_test
+ 
+ check_LTLIBRARIES = test/libmusl_m.la
+-check_PROGRAMS = test/unit_test
++check_PROGRAMS = test/zimg_unit_test
+ 
+ test_libmusl_m_la_CFLAGS = $(AM_CFLAGS) -std=c99 -Wno-sign-compare -Wno-unused-variable -Wno-unused-but-set-variable
+ 
+@@ -367,14 +367,14 @@ test_libmusl_m_la_SOURCES = \
+ 	test/extra/musl-libm/powf_data.h \
+ 	test/extra/musl-libm/sin.c
+ 
+-test_unit_test_CPPFLAGS = \
++test_zimg_unit_test_CPPFLAGS = \
+ 	$(AM_CPPFLAGS) \
+ 	-I$(srcdir)/src/zimg \
+ 	-I$(srcdir)/test \
+ 	-I$(srcdir)/test/extra \
+ 	-I$(srcdir)/test/extra/googletest/googletest/include
+ 
+-test_unit_test_SOURCES = \
++test_zimg_unit_test_SOURCES = \
+ 	test/main.cpp \
+ 	test/api/api_test.cpp \
+ 	test/colorspace/colorspace_test.cpp \
+@@ -396,7 +396,7 @@ test_unit_test_SOURCES = \
+ 	test/resize/resize_impl_test.cpp
+ 
+ if ARMSIMD
+-test_unit_test_SOURCES += \
++test_zimg_unit_test_SOURCES += \
+ 	test/colorspace/arm/colorspace_neon_test.cpp \
+ 	test/depth/arm/depth_convert_neon_test.cpp \
+ 	test/depth/arm/dither_neon_test.cpp \
+@@ -405,7 +405,7 @@ test_unit_test_SOURCES += \
+ endif # ARMSIMD
+ 
+ if X86SIMD
+-test_unit_test_SOURCES += \
++test_zimg_unit_test_SOURCES += \
+ 	test/colorspace/x86/colorspace_avx_test.cpp \
+ 	test/colorspace/x86/colorspace_avx2_test.cpp \
+ 	test/colorspace/x86/colorspace_sse_test.cpp \
+@@ -425,7 +425,7 @@ test_unit_test_SOURCES += \
+ endif # X86SIMD
+ 
+ if X86SIMD_AVX512
+-test_unit_test_SOURCES += \
++test_zimg_unit_test_SOURCES += \
+ 	test/colorspace/x86/colorspace_avx512_test.cpp \
+ 	test/colorspace/x86/gamma_constants_avx512_test.cpp \
+ 	test/depth/x86/depth_convert_avx512_test.cpp \
+@@ -439,10 +439,15 @@ test/extra/googletest/build/lib/libgtest.a: .FAKE
+ 
+ .FAKE:
+ 
+-test_unit_test_LDADD = \
++test_zimg_unit_test_LDADD = \
+ 	test/extra/googletest/build/lib/libgtest.a \
+ 	test/libmusl_m.la \
+ 	libzimg_internal.la
++
++if INSTALL_TESTS
++bin_PROGRAMS += test/zimg_unit_test
++endif # INSTALL_TESTS
++
+ endif # UNIT_TEST
+ 
+ clean-local:
+diff --git a/configure.ac b/configure.ac
+index 26a0627..cc125da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,6 +17,7 @@ AC_CANONICAL_HOST
+ AC_ARG_ENABLE([testapp],   AS_HELP_STRING([--enable-testapp],   [Compile the test application. (default=no)]))
+ AC_ARG_ENABLE([example],   AS_HELP_STRING([--enable-example],   [Compile example programs. (default=no)]))
+ AC_ARG_ENABLE([unit-test], AS_HELP_STRING([--enable-unit-test], [Compile unit tests. May result in slower code. (default=no)]))
++AC_ARG_ENABLE([install-tests], AS_HELP_STRING([--enable-install-tests], [Install tests (default=no)]))
+ AC_ARG_ENABLE([install-testapp], AS_HELP_STRING([--enable-install-testapp], [Install test app (default=no)]))
+ AC_ARG_ENABLE([install-examples], AS_HELP_STRING([--enable-install-examples], [Install example programs (default=no)]))
+ AC_ARG_ENABLE([debug],     AS_HELP_STRING([--enable-debug],     [Enable compilation options required for debugging. (default=no)]))
+@@ -116,6 +117,7 @@ int main()
+ AM_CONDITIONAL([TESTAPP],        [test "x$enable_testapp" = "xyes"])
+ AM_CONDITIONAL([EXAMPLES],       [test "x$enable_example" = "xyes"])
+ AM_CONDITIONAL([UNIT_TEST],      [test "x$enable_unit_test" = "xyes"])
++AM_CONDITIONAL([INSTALL_TESTS],  [test "x$enable_install_tests" = "xyes"])
+ AM_CONDITIONAL([INSTALL_TESTAPP], [test "x$enable_install_testapp" = "xyes"])
+ AM_CONDITIONAL([INSTALL_EXAMPLES], [test "x$enable_install_examples" = "xyes"])
+ AM_CONDITIONAL([ARMSIMD],        [test "x$enable_arm_simd" = "xyes"])
+-- 
+2.52.0
+
diff --git a/package/zimg/Config.in b/package/zimg/Config.in
new file mode 100644
index 0000000000..2046f1426f
--- /dev/null
+++ b/package/zimg/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_ZIMG
+	bool "zimg"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  Scaling, colorspace conversion, and dithering library
+
+	  https://github.com/sekrit-twc/zimg
+
+if BR2_PACKAGE_ZIMG
+
+config BR2_PACKAGE_ZIMG_TESTAPP
+	bool "zimg test app"
+
+config BR2_PACKAGE_ZIMG_EXAMPLES
+	bool "zimg examples"
+
+config BR2_PACKAGE_ZIMG_UNIT_TESTS
+	bool "zimg unit tests"
+	help
+	  Build the Zimg unit tests. Note: building these enables some
+	  compilation options to improve repeatability, but these may
+	  reduce performance
+
+endif
+
+comment "zimg needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/zimg/zimg.mk b/package/zimg/zimg.mk
new file mode 100644
index 0000000000..3029b3e7b9
--- /dev/null
+++ b/package/zimg/zimg.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# zimg
+#
+################################################################################
+
+ZIMG_VERSION = release-3.0.6
+# This project uses submodules so the tarballs aren't really useful
+ZIMG_SITE_METHOD = git
+ZIMG_GIT_SUBMODULES = yes
+ZIMG_SITE = https://github.com/sekrit-twc/zimg.git
+ZIMG_LICENSE = WTFPL
+ZIMG_LICENSE_FILES = COPYING
+ZIMG_INSTALL_STAGING = YES
+ZIMG_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_ZIMG_TESTAPP),y)
+ZIMG_CONF_OPTS += --enable-testapp --enable-install-testapp
+else
+ZIMG_CONF_OPTS += --disable-testapp --disable-install-testapp
+endif
+
+ifeq ($(BR2_PACKAGE_ZIMG_EXAMPLES),y)
+ZIMG_CONF_OPTS += --enable-example --enable-install-examples
+else
+ZIMG_CONF_OPTS += --disable-example --disable-install-examples
+endif
+
+ifeq ($(BR2_PACKAGE_ZIMG_UNIT_TESTS),y)
+ZIMG_CONF_OPTS += --enable-unit-test --enable-install-tests
+else
+ZIMG_CONF_OPTS += --disable-unit-test --disable-install-tests
+endif
+
+$(eval $(autotools-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
