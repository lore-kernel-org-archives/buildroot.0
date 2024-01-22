Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69288C46CD2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 22:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0942840133;
	Mon, 22 Jan 2024 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0942840133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjpdQyPTegFY; Mon, 22 Jan 2024 22:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A8D440279;
	Mon, 22 Jan 2024 22:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A8D440279
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE0CF1BF853
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C524640279
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C524640279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIwF1IJS-Zm1 for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 22:23:59 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61E3840133
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 22:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E3840133
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40eb2f392f0so4101405e9.1
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 14:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705962236; x=1706567036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SueWXIcOOJfSGB3Rqvt2fLnCVa4NsTmTf+OwIOIUQ0k=;
 b=CWkwfXKelTI17utDlOAv3xctkXwdlXxQDv+Qgn6VZ31g9hC0UBJui3KCta4WLFFjgt
 +aqVwThv/J9ag6vFFsWDaFqBwYwBacI2j1VwSxlFV5eH+N9rL3CVlb7qc+hVDa/Iwj7R
 La2SYUSuRVtyRYqkhTkiwsDFHJ1Ji/iFdS/Lk516sC8kxwqp+LFNBydEABq07tORd5Fz
 B/YVI/dK/IaiF9+ise4eKLglhKhiCJf0/xP6YpJWckkBCZz0BKTTT829+xfeGBeke4ST
 tZyzxCQl7hn8fb8hJUrWHGXHVhqoGzFkp74CB+Fju8De0e/f3SmNG/OZIH+9jF/shPvZ
 WRaw==
X-Gm-Message-State: AOJu0YyrcqdEJvntL9TqfqQHvBqtQ8OX4d0V+GedE5rX/mvZzxym61/j
 OGyArXyCuT/2nMVcwCKnKPDwbq0NFv7/s4B6bthfmcK5FXbTcTuMxkmbeaJq
X-Google-Smtp-Source: AGHT+IHXBDOXIs4WypX58JXwlW+HGnOHRDDR/l0j5xmEFLp0N/AvNh9knQFz9gAujpuKBr6JWW/1fw==
X-Received: by 2002:a05:600c:511f:b0:40e:5493:df45 with SMTP id
 o31-20020a05600c511f00b0040e5493df45mr2682723wms.166.1705962236366; 
 Mon, 22 Jan 2024 14:23:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b0040e4c1dade4sm44754210wms.36.2024.01.22.14.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:23:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 23:23:51 +0100
Message-ID: <20240122222351.477993-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705962236; x=1706567036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SueWXIcOOJfSGB3Rqvt2fLnCVa4NsTmTf+OwIOIUQ0k=;
 b=AgWjBZV8FoeVe+Q4Mo+jmOJuLJr/Yx+lm8/Z9Qpu3OOmfTpkzhAfT5Lhnl1CTsTzBG
 s41z9aJ2Q0IChiPOvJjcDKh48fS71+sP3BVX6wrzgpESerD/y5Qxn1oOZx0dWv6/VBK3
 LmcYdLrKpsMbXd4Knl2CM1HJkTjAeX1Cjzn39ZVeu9xaxn7YKGluUaSWN1fWYNm7/E52
 gyEQj8HCXzp1X31NoP/lE+5aC6Mg1JRmYeuZSK3ql68e8ZFFLagFOyZOt1ZR8q9ffN2r
 eC/K/yFprEaqkJxZ4QAIltxpvXRMPdcXyB8B8J8M3Ma5CJt1bBaeFuxroRCcD2jjlkDt
 xumg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AgWjBZV8
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix grpc build
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following grpc build failure raised since bump of libabseil-cpp
to version 20230802.1 in commit
aea790392af5358568a4f1c5d2dd9f1adfb29109:

configure:25127: checking grpc++/grpc++.h usability
configure:25127: /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0 -D_FORTIFY_SOURCE=2 -std=c++11  -DNOMINMAX  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
In file included from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/config.h:86,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/const_init.h:25,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/synchronization/mutex.h:67,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/impl/codegen/sync.h:32,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/completion_queue.h:41,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/channel.h:25,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/grpcpp.h:52,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpc++/grpc++.h:26,
                 from conftest.cpp:167:
/home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #error "C++ versions less than C++14 are not supported."
   79 | #error "C++ versions less than C++14 are not supported."
      |  ^~~~~

[...]

    grpc  . . . . . . . . no (libgrpc++ not found) (dependency error)

[...]

configure: error: "Some plugins are missing dependencies - see the summary above for details"

Fixes:
 - http://autobuild.buildroot.org/results/e2cf909ab3c356f1881fd18cfa039e87faa10d7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-configure.ac-fix-grpc-build.patch    | 96 +++++++++++++++++++
 package/collectd/collectd.mk                  |  2 +
 2 files changed, 98 insertions(+)
 create mode 100644 package/collectd/0002-configure.ac-fix-grpc-build.patch

diff --git a/package/collectd/0002-configure.ac-fix-grpc-build.patch b/package/collectd/0002-configure.ac-fix-grpc-build.patch
new file mode 100644
index 0000000000..00de673e89
--- /dev/null
+++ b/package/collectd/0002-configure.ac-fix-grpc-build.patch
@@ -0,0 +1,96 @@
+From d355618813bb8180e460ba45a0ebd3ce5183e267 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 22 Jan 2024 22:15:21 +0100
+Subject: [PATCH] configure.ac: fix grpc build
+
+abseil and other google tools are now subject to
+"Google's Foundational C++ Support Policy" [0][1]. This currently
+mandates gcc 7.3.1 and C++14 as minimum versions. So replace -std=c++11
+by -std=c++14 to fix following build failure:
+
+checking whether /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ accepts -std=c++11
+configure:25105: result: yes
+configure:25127: checking grpc++/grpc++.h usability
+configure:25127: /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0 -D_FORTIFY_SOURCE=2 -std=c++11  -DNOMINMAX  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/config.h:86,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/const_init.h:25,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/synchronization/mutex.h:67,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/impl/codegen/sync.h:32,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/completion_queue.h:41,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/channel.h:25,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/grpcpp.h:52,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpc++/grpc++.h:26,
+                 from conftest.cpp:167:
+/home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #error "C++ versions less than C++14 are not supported."
+   79 | #error "C++ versions less than C++14 are not supported."
+      |  ^~~~~
+
+[0] https://github.com/abseil/abseil-cpp/releases/tag/20230125.0
+[1] https://github.com/google/oss-policies-info/blob/b842c39db88e6569dfe2cf98be434b03507cb503/foundational-cxx-support-matrix.md
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e2cf909ab3c356f1881fd18cfa039e87faa10d7d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/collectd/collectd/commit/d355618813bb8180e460ba45a0ebd3ce5183e267
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c816d3dbbc..dad27f53b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2853,20 +2853,20 @@ PKG_CHECK_MODULES([GRPCPP], [grpc++],
+ fi
+ 
+ if test "x$withval" != "xno"; then
+-  AC_MSG_CHECKING([whether $CXX accepts -std=c++11])
+-  if test_cxx_flags -std=c++11; then
++  AC_MSG_CHECKING([whether $CXX accepts -std=c++14])
++  if test_cxx_flags -std=c++14; then
+     AC_MSG_RESULT([yes])
+   else
+     AC_MSG_RESULT([no])
+-    with_libgrpcpp="no (requires C++11 support)"
+-    with_libprotobuf="no (<google/protobuf/util/time_util.h> requires C++11 support)"
++    with_libgrpcpp="no (requires C++14 support)"
++    with_libprotobuf="no (<absl/base/policy_checks.h> requires C++14 support)"
+   fi
+ fi
+ 
+ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_PUSH(C++)
+   SAVE_CPPFLAGS="$CPPFLAGS"
+-  CPPFLAGS="-std=c++11 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   AC_CHECK_HEADERS([grpc++/grpc++.h],
+     [with_libgrpcpp="yes"],
+     [with_libgrpcpp="no (<grpc++/grpc++.h> not found)"]
+@@ -2880,7 +2880,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   SAVE_CPPFLAGS="$CPPFLAGS"
+   SAVE_LDFLAGS="$LDFLAGS"
+   SAVE_LIBS="$LIBS"
+-  CPPFLAGS="-std=c++11 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   LDFLAGS="$with_libgrpcpp_ldflags"
+   if test "x$GRPCPP_LIBS" = "x"; then
+     LIBS="-lgrpc++"
+@@ -2908,7 +2908,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_POP(C++)
+ fi
+ 
+-BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++11 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
++BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
+ BUILD_WITH_LIBGRPCPP_LDFLAGS="$with_libgrpcpp_ldflags"
+ BUILD_WITH_LIBGRPCPP_LIBS="$GRPCPP_LIBS"
+ AC_SUBST([BUILD_WITH_LIBGRPCPP_CPPFLAGS])
+@@ -4852,7 +4852,7 @@ if test "x$withval" != "xno"; then
+   AC_CHECK_LIB([protobuf], [main],
+     [
+       SAVE_CPPFLAGS="$CPPFLAGS"
+-      CPPFLAGS="-std=c++11 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
++      CPPFLAGS="-std=c++14 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
+       if test "x$PROTOBUF_LIBS" = "x"
+       then
+         PROTOBUF_LIBS="-lprotobuf"
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6c993827c4..76f622b8db 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -14,6 +14,8 @@ COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_CPE_ID_VENDOR = collectd
 COLLECTD_SELINUX_MODULES = apache collectd
+# We're patching configure.ac
+COLLECTD_AUTORECONF = YES
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
