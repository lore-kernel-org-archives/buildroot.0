Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A88BCEFCF0
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 18:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291D481498;
	Tue,  6 Jan 2026 18:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdEfFIk_7MtF; Tue,  6 Jan 2026 18:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB37F814DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767725859;
	bh=mJJxQpR8xIMsAqvorETjUK5t1NxN8fIJ+ZFc+wIpuXQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JruckFOuYivmfs/1q1Vhxn2wxENL1o7wtvukJvOfxd6eMkMhTqMSuS1rml3Qesb3p
	 fU211xyWm93olOQ1toXcH30XtXJhOV40AlWwCBPvQbyI5nGmm9j1lfO2XrW50CCUV4
	 g60yR8xSygHkW3WtOBrxNWOKi3S+e6U7a7Fg7Zpc0lM0rfA0Z7yXCe9p/yaiaCIwZJ
	 MblqA6b21tQY/U4L87u3zOyYLSAQsuk+jiIb4BJbFgqbfbYkB7oQzduEp5fqKxAdbE
	 TRnUQ0haOnIhV7aw/jvkL8pHSlq+n/kl7vcL9lpSKsnPPKc0OpRWMDNiMn//jpgd+2
	 LcQ6r9XScb4yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB37F814DB;
	Tue,  6 Jan 2026 18:57:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B6870B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 18:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5974E403B3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 18:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhFpw1lYRRXu for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 18:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=michael@michaelcullen.name; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41AA14090A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41AA14090A
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41AA14090A
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 18:57:35 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b843e8a4fbfso78350966b.0
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 10:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767725853; x=1768330653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cH+8O/NDzub6stk3BWYMlh6f8u4FVuqqNwLvs2LiZ7w=;
 b=mowzcYWW4A5TW+7f52ociM9pxvWSRSAGzAPtLSyUpCtCW/u56Wt70ycxHv+JqkgnRR
 FryDpEpDiErDN7y7qclW3h/9fqNVmSGt7AAu5VWDNPlUvJCyagYrU0TW1kf5lzUic7Uf
 n29pUJvKkTZ22f4Xvr5dxs6AJsy/0RiwImPsXOLtqsGqL144MwRKT4HdMB1GDmOQa8nU
 5TTVddK7xUBqz9+y/TDbVrE+zoYwvdVr2kEvprV2utGZjDiUqSx+4mI3YjDPwA5vdXwH
 RcYpLl0z43SnwpKUwTSl/jgO4LRVBCEP6L/ZCSRQNbDATRRjX34tEMS86yXO0qzb9uw+
 r+qg==
X-Gm-Message-State: AOJu0YyqfNnMviTMVoYLli3PJwqznoA8XP226whvzxxRiQNcpN29a7+C
 pb/cfju9aXyGHtEab82FwK8XGJhqizvMusRlHawAt9wPFmALqnLc3a/gMVSPUOOMGZEdmuhbiQ0
 lDNk=
X-Gm-Gg: AY/fxX4sNL1/wgu9T7MeXl+mR1JGxcjaZt0InKMialbrphlJyAAwYn8jGJ71ObelvDr
 y8P9mWCqUgVQ+PIlwCUps8hp2KET9WSPTqFIm5NBJpc3hsLXZWxAhvylnYy8LVIRKJ3edqfn8+E
 ZR/FsyD0+OtrL2cRmUyu59bVx1treBTcUFIhWuzjxLs9v61HWs+r+B2hCZBHuLRwhSTqx8uKGDd
 nKLaeBU056eSCywt1aIO4y2rypJ8h5jV6w8/42L34XYLJvT1XbVT818+f7IGCGJJU6UcYKn8ZKn
 u66OZIEbUooeUivuW5XCJSyV0bddoBSj0iBqaWvWWRfcbWMMR3OEV8WGX0vwmzETl9+TXcA5R5K
 cSosvSbui6tAPJCal4wKNX2FgUBfa1vt2PT1BmnSpp7Fy8+z0VUTINWklUxB5NdYivyPvZ1hkiy
 vf0qbxD1dZdYBAB3L8vz/7pbxGCqt5nFNGLolrwSCkyy41NZXks9o=
X-Google-Smtp-Source: AGHT+IF5S6JpUZ5i6UxJ/RvzragVX0AAbNwzHkPZWpwtnW9Npn7k6cP4vuCsxCGnOpGWiC2pnE375g==
X-Received: by 2002:a17:907:9713:b0:b73:780d:2bcf with SMTP id
 a640c23a62f3a-b84451ae664mr13520266b.16.1767725853190; 
 Tue, 06 Jan 2026 10:57:33 -0800 (PST)
Received: from localhost ([2a02:8109:b280:ac00:7405:a8a:6a7f:81c8])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b842a5118e1sm287893666b.54.2026.01.06.10.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 10:57:32 -0800 (PST)
To: buildroot@buildroot.org
Cc: Michael Cullen <michael@michaelcullen.name>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Jan 2026 19:57:26 +0100
Message-ID: <20260106185726.654877-1-michael@michaelcullen.name>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=michaelcullen.name; s=google; t=1767725853; x=1768330653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cH+8O/NDzub6stk3BWYMlh6f8u4FVuqqNwLvs2LiZ7w=;
 b=LKrGyQF8Kqt9I/OkuL7FQFKiHUYomYnm5d9KlXVM4F9Bj+jFtLkvCZvROEelLbvuea
 y3G1PR68kWc47tKVZVgBGdMm4ALMg1IMjmpmNaeMuvn0T850DdH+sBuajq80t4oq2wQ1
 hN3rAvZdmYd+kDTIUqGN/tpH35a9Zx3zsVfTZhShEdg1KvRqqJTucFqbbBF7qBTd5uIm
 KCpoHdHqKUJD5SnjZPTHDwdvhj+RZn/yFZaZjqSxV49X7AbfEo1s8M5WaR0IUDhM1JCO
 3opSohmK98lDiXaGSN2AS1mPmHA6ieVzAH89zGdVlqEp6+Jr5iCM7mshgeI21gRd34SX
 DVSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=michaelcullen.name
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=michaelcullen.name header.i=@michaelcullen.name
 header.a=rsa-sha256 header.s=google header.b=LKrGyQF8
Subject: [Buildroot] [PATCH] package/zimg: add zimg package
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
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/zimg/0001-Fix-build-with-GCC-15.patch |  34 +++++
 package/zimg/0002-Install-test-app.patch      |  55 +++++++++
 package/zimg/0003-install-examples.patch      |  79 ++++++++++++
 .../0004-Add-option-to-install-tests.patch    | 116 ++++++++++++++++++
 package/zimg/Config.in                        |  27 ++++
 package/zimg/zimg.mk                          |  33 +++++
 8 files changed, 348 insertions(+)
 create mode 100644 package/zimg/0001-Fix-build-with-GCC-15.patch
 create mode 100644 package/zimg/0002-Install-test-app.patch
 create mode 100644 package/zimg/0003-install-examples.patch
 create mode 100644 package/zimg/0004-Add-option-to-install-tests.patch
 create mode 100644 package/zimg/Config.in
 create mode 100644 package/zimg/zimg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..940b621d8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2427,6 +2427,9 @@ N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
 F:	configs/engicam_px30_core_defconfig
 
+N:	Michael Cullen <michael@michaelcullen.name>
+F:	package/zimg/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index 352fd626e0..f5d1c79008 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1809,6 +1809,7 @@ menu "Graphics"
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
diff --git a/package/zimg/0002-Install-test-app.patch b/package/zimg/0002-Install-test-app.patch
new file mode 100644
index 0000000000..cbafd0bd51
--- /dev/null
+++ b/package/zimg/0002-Install-test-app.patch
@@ -0,0 +1,55 @@
+From d4da533bec77c7f11aef08bed4888a82e1af8cba Mon Sep 17 00:00:00 2001
+From: Michael Cullen <michael@michaelcullen.name>
+Date: Tue, 6 Jan 2026 10:35:15 +0100
+Subject: [PATCH] Install test app
+
+To make sure zimg is working, it would be useful to be able to run the
+test app on the target. Currently, however, it is not installed.
+
+This patch renames it and installs it.
+
+Upstream: N/A - running test app on the target only applies to cross-compilation situations
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ Makefile.am | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8727ca4..6900c0d 100644
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
+@@ -292,11 +293,11 @@ endif # EXAMPLES
+ 
+ 
+ if TESTAPP
+-noinst_PROGRAMS += testapp
++bin_PROGRAMS += zimg_testapp
+ noinst_LTLIBRARIES += libtestcommon.la
+-testapp_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/src/zimg -I$(srcdir)/src/testcommon
++zimg_testapp_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/src/zimg -I$(srcdir)/src/testcommon
+ 
+-testapp_SOURCES = \
++zimg_testapp_SOURCES = \
+ 	src/testapp/apps.h \
+ 	src/testapp/colorspaceapp.cpp \
+ 	src/testapp/cpuinfoapp.cpp \
+@@ -314,7 +315,7 @@ testapp_SOURCES = \
+ 	src/testapp/utils.cpp \
+ 	src/testapp/utils.h
+ 
+-testapp_LDADD = libtestcommon.la libzimg_internal.la
++zimg_testapp_LDADD = libtestcommon.la libzimg_internal.la
+ endif # TESTAPP
+ 
+ 
+-- 
+2.52.0
+
diff --git a/package/zimg/0003-install-examples.patch b/package/zimg/0003-install-examples.patch
new file mode 100644
index 0000000000..c14a8f3e59
--- /dev/null
+++ b/package/zimg/0003-install-examples.patch
@@ -0,0 +1,79 @@
+From abc90707967cf4e2da2348d395d5842dc799ae53 Mon Sep 17 00:00:00 2001
+From: Michael Cullen <michael@michaelcullen.name>
+Date: Tue, 6 Jan 2026 10:39:06 +0100
+Subject: [PATCH] install examples
+
+Like the previous patch that installs the test app, this commit renames
+and installs the examples so they can be tested on the target.
+
+Upstream: N/A - running examples on the target only applies to cross-compilation situations
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ Makefile.am | 42 +++++++++++++++++++++---------------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6900c0d..0694b50 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -259,36 +259,36 @@ libtestcommon_la_SOURCES = \
+ 
+ 
+ if EXAMPLES
+-noinst_PROGRAMS += \
+-	doc/example/api_example \
+-	doc/example/api_example_c \
+-	doc/example/hdr_example \
+-	doc/example/interlace_example \
+-	doc/example/tile_example
++bin_PROGRAMS += \
++	doc/example/zimg_api_example \
++	doc/example/zimg_api_example_c \
++	doc/example/zimg_hdr_example \
++	doc/example/zimg_interlace_example \
++	doc/example/zimg_tile_example
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
+-- 
+2.52.0
+
diff --git a/package/zimg/0004-Add-option-to-install-tests.patch b/package/zimg/0004-Add-option-to-install-tests.patch
new file mode 100644
index 0000000000..a52fbd8c46
--- /dev/null
+++ b/package/zimg/0004-Add-option-to-install-tests.patch
@@ -0,0 +1,116 @@
+From 9a04431e7d5d6545b27a946600253eac9b5ee2ef Mon Sep 17 00:00:00 2001
+From: Michael Cullen <michael@michaelcullen.name>
+Date: Tue, 6 Jan 2026 12:26:32 +0100
+Subject: [PATCH] Add option to install tests
+
+When cross compiling, it may be useful to install the tests rather than
+run them. This gives an option to do that.
+
+Upstream: N/A - running tests on the target only applies to cross-compilation situations
+Signed-off-by: Michael Cullen <michael@michaelcullen.name>
+---
+ Makefile.am  | 21 +++++++++++++--------
+ configure.ac |  2 ++
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0694b50..4cbd97b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -320,10 +320,10 @@ endif # TESTAPP
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
+@@ -353,14 +353,14 @@ test_libmusl_m_la_SOURCES = \
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
+@@ -382,7 +382,7 @@ test_unit_test_SOURCES = \
+ 	test/resize/resize_impl_test.cpp
+ 
+ if ARMSIMD
+-test_unit_test_SOURCES += \
++test_zimg_unit_test_SOURCES += \
+ 	test/colorspace/arm/colorspace_neon_test.cpp \
+ 	test/depth/arm/depth_convert_neon_test.cpp \
+ 	test/depth/arm/dither_neon_test.cpp \
+@@ -391,7 +391,7 @@ test_unit_test_SOURCES += \
+ endif # ARMSIMD
+ 
+ if X86SIMD
+-test_unit_test_SOURCES += \
++test_zimg_unit_test_SOURCES += \
+ 	test/colorspace/x86/colorspace_avx_test.cpp \
+ 	test/colorspace/x86/colorspace_avx2_test.cpp \
+ 	test/colorspace/x86/colorspace_sse_test.cpp \
+@@ -411,7 +411,7 @@ test_unit_test_SOURCES += \
+ endif # X86SIMD
+ 
+ if X86SIMD_AVX512
+-test_unit_test_SOURCES += \
++test_zimg_unit_test_SOURCES += \
+ 	test/colorspace/x86/colorspace_avx512_test.cpp \
+ 	test/colorspace/x86/gamma_constants_avx512_test.cpp \
+ 	test/depth/x86/depth_convert_avx512_test.cpp \
+@@ -425,10 +425,15 @@ test/extra/googletest/build/lib/libgtest.a: .FAKE
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
+index 8402df6..49b5228 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,6 +17,7 @@ AC_CANONICAL_HOST
+ AC_ARG_ENABLE([testapp],   AS_HELP_STRING([--enable-testapp],   [Compile the test application. (default=no)]))
+ AC_ARG_ENABLE([example],   AS_HELP_STRING([--enable-example],   [Compile example programs. (default=no)]))
+ AC_ARG_ENABLE([unit-test], AS_HELP_STRING([--enable-unit-test], [Compile unit tests. May result in slower code. (default=no)]))
++AC_ARG_ENABLE([install-tests], AC_HELP_STRING([--enable-install-tests], [Install tests (default=no)]))
+ AC_ARG_ENABLE([debug],     AS_HELP_STRING([--enable-debug],     [Enable compilation options required for debugging. (default=no)]))
+ AC_ARG_ENABLE([simd],      AS_HELP_STRING([--disable-simd],     [Disable SIMD code. (default=no)]))
+ 
+@@ -114,6 +115,7 @@ int main()
+ AM_CONDITIONAL([TESTAPP],        [test "x$enable_testapp" = "xyes"])
+ AM_CONDITIONAL([EXAMPLES],       [test "x$enable_example" = "xyes"])
+ AM_CONDITIONAL([UNIT_TEST],      [test "x$enable_unit_test" = "xyes"])
++AM_CONDITIONAL([INSTALL_TESTS],  [test "x$enable_install_tests" = "xyes"])
+ AM_CONDITIONAL([ARMSIMD],        [test "x$enable_arm_simd" = "xyes"])
+ AM_CONDITIONAL([X86SIMD],        [test "x$enable_x86_simd" = "xyes"])
+ AM_CONDITIONAL([X86SIMD_AVX512], [test "x$enable_x86_simd_avx512" = "xyes"])
+-- 
+2.52.0
+
diff --git a/package/zimg/Config.in b/package/zimg/Config.in
new file mode 100644
index 0000000000..3fbac545dc
--- /dev/null
+++ b/package/zimg/Config.in
@@ -0,0 +1,27 @@
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
+
+config BR2_PACKAGE_ZIMG_DISABLE_SIMD
+	bool "Disable SIMD in zimg"
+
+endif
+
+comment "zimg needs a toolchain w/ C++11 support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/zimg/zimg.mk b/package/zimg/zimg.mk
new file mode 100644
index 0000000000..0dc314c765
--- /dev/null
+++ b/package/zimg/zimg.mk
@@ -0,0 +1,33 @@
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
+ZIMG_CONF_OPTS += --enable-testapp
+endif
+
+ifeq ($(BR2_PACKAGE_ZIMG_EXAMPLES),y)
+ZIMG_CONF_OPTS += --enable-example
+endif
+
+ifeq ($(BR2_PACKAGE_ZIMG_UNIT_TESTS),y)
+ZIMG_CONF_OPTS += --enable-unit-test --enable-install-tests
+endif
+
+ifeq ($(BR2_PACKAGE_ZIMG_DISABLE_SIMD),y)
+ZIMG_CONF_OPTS += --disable-simd
+endif
+
+$(eval $(autotools-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
