Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032D8CEBF86
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 22:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BFE060A82;
	Sat, 15 Nov 2025 22:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQ8QA3RF4mA0; Sat, 15 Nov 2025 22:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE91460A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE91460A7D;
	Sat, 15 Nov 2025 22:07:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1E5D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2DA540597
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4mgmy1I1vUe for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 22:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5078403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5078403FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5078403FF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:07:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BD69A4C6621;
 Sat, 15 Nov 2025 23:07:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54716)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKOQD-000000008Uk-3rN7;
 Sat, 15 Nov 2025 22:07:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 15 Nov 2025 23:07:05 +0100
Message-ID: <20251115220705.572223-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763244426;
 bh=sPo4tqHjb9gBB9Os/zWfo5G7hTZ5WIHleoNZVhRev+c=;
 h=From:To:Cc:Subject:Date:From;
 b=IiuSt6OGyd50cOFu1Ok+0UEBO7fLqQenOHZUTQC6EcKquHfhxIneun4llFuEkRH6K
 DNuH050MuVDxYyvniMuY6zlFytPzuRlayhKTXUrWsMaAYWJcj1xmtKXsX9roxGkASb
 YNea+62PKktVn+JTQj4M+Bjw4G7JDQApen6FSGjH7meZn9LRecEt16IPiZiXCW7U5k
 xfI0iAFbPU37RtYAhizre1TwlaVBAuZyn33B3gDv4ZvKQadfNHbJlj4FuKTYK7O+S9
 Lw/wFfUTRHOO1V+lWtkOnlaEbzX6mMXB8x1yGtUJcccfMLvZ1DsObl00y4SegJSbKV
 7tfnRl5v+dHEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IiuSt6OG
Subject: [Buildroot] [PATCH 1/1] package/ola: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package is incompatible with newer versions of protobuf:
https://github.com/OpenLightingProject/ola/issues/1879#issuecomment-2567133849
https://github.com/OpenLightingProject/ola/pull/1975#issuecomment-2346854820

with no upstream fixes in sight and fails to build with protobuf 29.3
currently used by buildroot:
https://lists.buildroot.org/pipermail/buildroot/2025-February/772533.html

Fixes:
https://autobuild.buildroot.net/results/fbb/fbbfef6e3715c0ac195537ab88ebb2e0e6c90c2f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   1 -
 Config.in.legacy                              |   6 +
 DEVELOPERS                                    |   3 -
 package/Config.in                             |   1 -
 ...-ola-fix-compilation-with-musl-1-2-3.patch |  35 ---
 ...-protoc-version-checking-since-v20.x.patch |  35 ---
 ...rectly-match-multi-digit-major-versi.patch |  28 ---
 package/ola/Config.in                         | 196 ---------------
 package/ola/ola.hash                          |   8 -
 package/ola/ola.mk                            | 232 ------------------
 support/testing/tests/package/test_ola.py     |  95 -------
 .../usr/bin/sample_ola_rdm_discovery.py       |  24 --
 12 files changed, 6 insertions(+), 658 deletions(-)
 delete mode 100644 package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
 delete mode 100644 package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
 delete mode 100644 package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
 delete mode 100644 package/ola/Config.in
 delete mode 100644 package/ola/ola.hash
 delete mode 100644 package/ola/ola.mk
 delete mode 100644 support/testing/tests/package/test_ola.py
 delete mode 100755 support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py

diff --git a/.checkpackageignore b/.checkpackageignore
index 4821f41cce..2554347bd7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -764,7 +764,6 @@ package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch lib_patch.Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch lib_patch.Upstream
 package/ofono/S46ofono lib_sysv.Variables
-package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch lib_patch.Upstream
 package/olsr/0001-olsrd-migrate-to-using-bison-3.7.1.patch lib_patch.Upstream
 package/olsr/0002-lib-pud-Makefile-fix-parallel-build.patch lib_patch.Upstream
 package/olsr/0003-pud-adapt-to-API-changes-in-gpsd-3-20.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 24e627a28b..9fcff38d33 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_OLA
+	bool "ola has been removed"
+	select BR2_LEGACY
+	help
+	  ola is incompatible with current versions of protobuf
+
 config BR2_PACKAGE_DVBSNOOP
 	bool "dvbsnoop has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 47fe1f467e..f26da64fdf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1820,7 +1820,6 @@ F:	package/libopenmpt/
 F:	package/mokutil/
 F:	package/oath-toolkit/
 F:	package/octave/
-F:	package/ola/
 F:	package/openblas/
 F:	package/opencsd/
 F:	package/openmpi/
@@ -1976,8 +1975,6 @@ F:	support/testing/tests/package/test_numactl.py
 F:	support/testing/tests/package/test_numactl/
 F:	support/testing/tests/package/test_oath_toolkit.py
 F:	support/testing/tests/package/test_octave.py
-F:	support/testing/tests/package/test_ola.py
-F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_openocd.py
 F:	support/testing/tests/package/test_parted.py
diff --git a/package/Config.in b/package/Config.in
index ec67380db6..12f327cb27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -566,7 +566,6 @@ endmenu
 	source "package/nvme/Config.in"
 	source "package/nxp-mwifiex/Config.in"
 	source "package/ofono/Config.in"
-	source "package/ola/Config.in"
 	source "package/open2300/Config.in"
 	source "package/openfpgaloader/Config.in"
 	source "package/openipmi/Config.in"
diff --git a/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
deleted file mode 100644
index f236ef0957..0000000000
--- a/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eb31017284f9a1c95602a9c06d606df6b558a691 Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Thu, 14 Apr 2022 17:39:32 -0700
-Subject: [PATCH] ola: fix compilation with musl 1.2.3
-
-musl 1.2.3 defines NULL as nullptr. cannot use reinterpret_cast with
-nullptr.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-[Retrieved from:
-https://github.com/OpenLightingProject/ola/pull/1773/commits/eb31017284f9a1c95602a9c06d606df6b558a691]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ola/AutoStart.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ola/AutoStart.cpp b/ola/AutoStart.cpp
-index 89fa51f115..4dbe20d317 100644
---- a/ola/AutoStart.cpp
-+++ b/ola/AutoStart.cpp
-@@ -110,11 +110,11 @@ TCPSocket *ConnectToServer(unsigned short port) {
-     // Try to start the server, we pass --daemon (fork into background) and
-     // --syslog (log to syslog).
-     execlp("olad", "olad", "--daemon", "--syslog",
--#ifdef __FreeBSD__
--           reinterpret_cast<char*>(0));
-+#if __cplusplus >= 201103L
-+           nullptr);
- #else
-            reinterpret_cast<char*>(NULL));
--#endif  // __FreeBSD__
-+#endif  // __cplusplus >= 201103L
-     OLA_WARN << "Failed to exec: " << strerror(errno);
-     _exit(1);
-   }
diff --git a/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
deleted file mode 100644
index ee98c5569d..0000000000
--- a/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d4414feefd95adf9c91d7eaf1e94380296c35f7a Mon Sep 17 00:00:00 2001
-From: Peter Newman <peternewman@users.noreply.github.com>
-Date: Fri, 7 Jul 2023 15:57:35 +0100
-Subject: [PATCH] Fix protoc version checking, since v20.x (cherry picked from
- commit 2e55aa88756718d8ab4a4c8fde97d620542c2c98)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/OpenLightingProject/ola/commit/d4414feefd95adf9c91d7eaf1e94380296c35f7a
----
- config/ola.m4 | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/config/ola.m4 b/config/ola.m4
-index f838ab70a..51b6c825c 100644
---- a/config/ola.m4
-+++ b/config/ola.m4
-@@ -44,7 +44,14 @@ if test -z "$PROTOC" ; then
-   AC_MSG_ERROR([cannot find 'protoc' program]);
- elif test -n "$1" ; then
-   AC_MSG_CHECKING([protoc version])
--  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
-+  # Since v20.x we only get effectively the minor and patch versions out of protoc.
-+  # Treat them as major and minor and everything should keep working indefinitely.
-+  # See https://protobuf.dev/support/version-support/
-+  # So we've got either of these:
-+  # libprotoc 2.4.1
-+  # libprotoc 23.3
-+  # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
-+  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
-   [required=$1]
-   [required_major=`echo $required | sed 's/[^0-9].*//'`]
-   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
--- 
-2.34.1
-
diff --git a/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
deleted file mode 100644
index cee2c7eb43..0000000000
--- a/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d Mon Sep 17 00:00:00 2001
-From: Peter Newman <peternewman@users.noreply.github.com>
-Date: Fri, 7 Jul 2023 16:14:21 +0100
-Subject: [PATCH] Protoc check - correctly match multi-digit major versions
- (cherry picked from commit 69a2946622cdfce54cb6ed7f2210df2be0ec5576)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/OpenLightingProject/ola/commit/546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d
----
- config/ola.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/ola.m4 b/config/ola.m4
-index 51b6c825c..eacee5d94 100644
---- a/config/ola.m4
-+++ b/config/ola.m4
-@@ -51,7 +51,7 @@ elif test -n "$1" ; then
-   # libprotoc 2.4.1
-   # libprotoc 23.3
-   # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
--  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
-+  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/[^0-9]*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
-   [required=$1]
-   [required_major=`echo $required | sed 's/[^0-9].*//'`]
-   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
--- 
-2.34.1
-
diff --git a/package/ola/Config.in b/package/ola/Config.in
deleted file mode 100644
index 1766f5bd76..0000000000
--- a/package/ola/Config.in
+++ /dev/null
@@ -1,196 +0,0 @@
-comment "ola needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-
-menuconfig BR2_PACKAGE_OLA
-	bool "ola (open lighting architecture)"
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on !BR2_STATIC_LIBS # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	help
-	  Open Lighting Architecture provides applications
-	  with a mechanism to send and receive DMX512 & RDM
-	  commands using hardware devices and DMX over IP protocols.
-
-	  https://www.openlighting.org/ola/
-
-if BR2_PACKAGE_OLA
-
-comment "bindings and interface"
-
-config BR2_PACKAGE_OLA_WEB
-	bool "http interface"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
-	select BR2_PACKAGE_LIBMICROHTTPD
-	help
-	  Build OLA with browser interface.
-
-config BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	bool "python bindings"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
-	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_PROTOBUF
-	help
-	  Build OLA with support for the Python language.
-
-comment "tests and examples"
-
-config BR2_PACKAGE_OLA_EXAMPLES
-	bool "examples"
-	select BR2_PACKAGE_NCURSES
-	help
-	  Build OLA examples.
-
-config BR2_PACKAGE_OLA_RDM_TESTS
-	bool "rdm tests"
-	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	select BR2_PACKAGE_PYTHON_NUMPY
-	help
-	  Build OLA RDM tests.
-
-comment "rdm tests needs a glibc or musl toolchain w/ gcc >= 9"
-	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
-		!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
-
-comment "plugin selections"
-
-config BR2_PACKAGE_OLA_PLUGIN_ARTNET
-	bool "artnet"
-	help
-	  Build Artnet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_DUMMY
-	bool "dummy"
-	help
-	  Build Dummy plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_E131
-	bool "acn E131"
-	help
-	  Build ACN E131 plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_ESPNET
-	bool "espnet"
-	help
-	  Build EspNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_FTDIDMX
-	bool "ftdidmx"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
-	select BR2_PACKAGE_LIBFTDI1
-	help
-	  Build FTDI USB DMX plugin for OLA.
-
-comment "ftdidmx needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-config BR2_PACKAGE_OLA_PLUGIN_GPIO
-	bool "GPIO"
-	help
-	  Build GPIO plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_KARATE
-	bool "karate"
-	help
-	  Build Karate plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_KINET
-	bool "kinet"
-	help
-	  Build KiNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_MILINT
-	bool "Milford Instruments"
-	help
-	  Build Milford Instruments 1-463 plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
-	bool "Enttec Open DMX"
-	help
-	  Build Enttec Open DMX plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_OPENPIXELCONTROL
-	bool "Open Pixel Control"
-	help
-	  Build Open Pixel Control (OPC) plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_OSC
-	bool "osc"
-	select BR2_PACKAGE_LIBLO
-	help
-	  Build Open Sound Control (OSC) plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_PATHPORT
-	bool "pathport"
-	help
-	  Build Pathport plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_RENARD
-	bool "renard"
-	help
-	  Build Renard plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_SANDNET
-	bool "sandnet"
-	help
-	  Build SandNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_SHOWNET
-	bool "shownet"
-	help
-	  Build ShowNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_SPI
-	bool "spi"
-	help
-	  Build SPI plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
-	bool "stageprofi"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	help
-	  Build StageProfi plugin for OLA.
-
-comment "stageprofi needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
-	bool "uartdmx"
-	help
-	  Build UART Native DMX plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_USBDMX
-	bool "usbdmx"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	help
-	  Build USB DMX plugin for OLA.
-
-comment "usbdmx needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-config BR2_PACKAGE_OLA_PLUGIN_USBPRO
-	bool "usbpro"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	help
-	  Build UsbPro plugin for OLA.
-
-comment "usbpro needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-endif
diff --git a/package/ola/ola.hash b/package/ola/ola.hash
deleted file mode 100644
index a1a5577ed3..0000000000
--- a/package/ola/ola.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# Locally calculated
-sha256  44073698c147fe641507398253c2e52ff8dc7eac8606cbf286c29f37939a4ebf  ola-0.10.9.tar.gz
-
-# License files (locally computed)
-sha256  e6b95dd336a57abb343e2988ac22b7e21b35c5b86003e6eb9e066ffbeeff9da7  COPYING
-sha256  1480a883c87789075ccdead38b8ad9e2d740d6f7eefaaf183f894b50bebd8a25  GPL
-sha256  e6b95dd336a57abb343e2988ac22b7e21b35c5b86003e6eb9e066ffbeeff9da7  LGPL
-sha256  685ceaf368d37250f69f2861e91a4cbbab069e81af8bf50adce8a498936e02fc  LICENCE
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
deleted file mode 100644
index efaa5b6e3e..0000000000
--- a/package/ola/ola.mk
+++ /dev/null
@@ -1,232 +0,0 @@
-################################################################################
-#
-# ola
-#
-################################################################################
-
-OLA_VERSION = 0.10.9
-OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
-OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
-OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
-OLA_INSTALL_STAGING = YES
-# Bundled Makefile.in don't link correctly, regenerate with recent automake
-OLA_AUTORECONF = YES
-
-# util-linux provides uuid lib
-OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
-
-OLA_CONF_OPTS = \
-	ac_cv_have_pymod_google_protobuf=yes \
-	--disable-fatal-warnings \
-	--disable-gcov \
-	--disable-ja-rule \
-	--disable-java-libs \
-	--disable-root-check \
-	--disable-tcmalloc \
-	--disable-unittests \
-	--with-ola-protoc-plugin=$(HOST_DIR)/bin/ola_protoc_plugin
-
-HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf host-bison host-flex
-
-# When building the host part, disable as much as possible to speed up
-# the configure step and avoid missing host dependencies.
-HOST_OLA_CONF_OPTS = \
-	--disable-all-plugins \
-	--disable-osc \
-	--disable-uart \
-	--disable-libusb \
-	--disable-libftdi \
-	--disable-http \
-	--disable-examples \
-	--disable-unittests \
-	--disable-doxygen-html \
-	--disable-doxygen-doc \
-	--disable-fatal-warnings
-
-# On the host side, we only need ola_protoc_plugin, so build and install this
-# only.
-HOST_OLA_MAKE_OPTS = protoc/ola_protoc_plugin
-define HOST_OLA_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/bin/ola_protoc_plugin
-endef
-
-# sets where to find python libs built for target and required by ola
-OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-OLA_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-
-ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
-OLA_DEPENDENCIES += libexecinfo
-OLA_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
-endif
-
-## OLA Bindings and Interface selections
-
-ifeq ($(BR2_PACKAGE_OLA_WEB),y)
-OLA_CONF_OPTS += --enable-http
-OLA_DEPENDENCIES += libmicrohttpd
-else
-OLA_CONF_OPTS += --disable-http
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
-OLA_CONF_OPTS += --enable-python-libs
-OLA_DEPENDENCIES += python3 python-protobuf
-else
-OLA_CONF_OPTS += --disable-python-libs
-endif
-
-## OLA Examples and Tests
-
-ifeq ($(BR2_PACKAGE_OLA_EXAMPLES),y)
-OLA_CONF_OPTS += --enable-examples
-OLA_DEPENDENCIES += ncurses
-else
-OLA_CONF_OPTS += --disable-examples
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
-OLA_CONF_OPTS += --enable-rdm-tests
-OLA_DEPENDENCIES += python-numpy
-# needed as numpy builds some shared libraries and ola checks for
-# numpy using a host python test program which fails with 'wrong ELF
-# class'.
-OLA_CONF_ENV += ac_cv_have_pymod_numpy=yes
-else
-OLA_CONF_OPTS += --disable-rdm-tests
-endif
-
-## OLA Plugin selections
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
-OLA_CONF_OPTS += --enable-artnet
-else
-OLA_CONF_OPTS += --disable-artnet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
-OLA_CONF_OPTS += --enable-dummy
-else
-OLA_CONF_OPTS += --disable-dummy
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
-OLA_CONF_OPTS += --enable-e131
-else
-OLA_CONF_OPTS += --disable-e131
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
-OLA_CONF_OPTS += --enable-espnet
-else
-OLA_CONF_OPTS += --disable-espnet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_FTDIDMX),y)
-OLA_CONF_OPTS += --enable-ftdidmx
-OLA_DEPENDENCIES += libftdi1
-else
-OLA_CONF_OPTS += --disable-ftdidmx
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_GPIO),y)
-OLA_CONF_OPTS += --enable-gpio
-else
-OLA_CONF_OPTS += --disable-gpio
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KARATE),y)
-OLA_CONF_OPTS += --enable-karate
-else
-OLA_CONF_OPTS += --disable-karate
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
-OLA_CONF_OPTS += --enable-kinet
-else
-OLA_CONF_OPTS += --disable-kinet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_MILINT),y)
-OLA_CONF_OPTS += --enable-milinst
-else
-OLA_CONF_OPTS += --disable-milinst
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
-OLA_CONF_OPTS += --enable-opendmx
-else
-OLA_CONF_OPTS += --disable-opendmx
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENPIXELCONTROL),y)
-OLA_CONF_OPTS += --enable-openpixelcontrol
-else
-OLA_CONF_OPTS += --disable-openpixelcontrol
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
-OLA_CONF_OPTS += --enable-osc
-OLA_DEPENDENCIES += liblo
-else
-OLA_CONF_OPTS += --disable-osc
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
-OLA_CONF_OPTS += --enable-pathport
-else
-OLA_CONF_OPTS += --disable-pathport
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_RENARD),y)
-OLA_CONF_OPTS += --enable-renard
-else
-OLA_CONF_OPTS += --disable-renard
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SANDNET),y)
-OLA_CONF_OPTS += --enable-sandnet
-else
-OLA_CONF_OPTS += --disable-sandnet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SHOWNET),y)
-OLA_CONF_OPTS += --enable-shownet
-else
-OLA_CONF_OPTS += --disable-shownet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SPI),y)
-OLA_CONF_OPTS += --enable-spi
-else
-OLA_CONF_OPTS += --disable-spi
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
-OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
-OLA_DEPENDENCIES += libusb
-else
-OLA_CONF_OPTS += --disable-stageprofi
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_UARTDMX),y)
-OLA_CONF_OPTS += --enable-uartdmx
-else
-OLA_CONF_OPTS += --disable-uartdmx
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBDMX),y)
-OLA_CONF_OPTS += --enable-usbdmx --enable-libusb
-OLA_DEPENDENCIES += libusb
-else
-OLA_CONF_OPTS += --disable-usbdmx
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
-OLA_CONF_OPTS += --enable-usbpro --enable-libusb
-OLA_DEPENDENCIES += libusb
-else
-OLA_CONF_OPTS += --disable-usbpro
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/support/testing/tests/package/test_ola.py b/support/testing/tests/package/test_ola.py
deleted file mode 100644
index 017d6f7e3b..0000000000
--- a/support/testing/tests/package/test_ola.py
+++ /dev/null
@@ -1,95 +0,0 @@
-import os
-
-import infra.basetest
-
-
-class TestOla(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-        """
-        BR2_PACKAGE_OLA=y
-        BR2_PACKAGE_OLA_EXAMPLES=y
-        BR2_PACKAGE_OLA_PLUGIN_DUMMY=y
-        BR2_PACKAGE_OLA_PYTHON_BINDINGS=y
-        BR2_PACKAGE_OLA_WEB=y
-        BR2_PACKAGE_PYTHON3=y
-        BR2_ROOTFS_OVERLAY="{}"
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(
-           # overlay to add a script to test ola python bindings
-           infra.filepath("tests/package/test_ola/rootfs-overlay"))
-
-    def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
-        self.emulator.login()
-
-        # Check program executes
-        cmd = "olad --version"
-        self.assertRunOk(cmd)
-
-        # Start the daemon and wait a bit for it to settle
-        cmd = "olad --daemon && sleep 2"
-        self.assertRunOk(cmd)
-
-        # Check dummy plugin is loaded
-        cmd = "ola_plugin_info | grep -Fi dummy"
-        self.assertRunOk(cmd)
-
-        # Check dummy device and port are listed
-        cmd = "ola_dev_info"
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertIn("Device 1: Dummy Device", output[0])
-        self.assertIn("port 0, OUT Dummy Port", output[1])
-
-        # Create Universe 0
-        cmd = "ola_patch --device 1 --port 0 --universe 0"
-        self.assertRunOk(cmd)
-
-        # Check Universe 0 is created
-        cmd = "ola_dev_info"
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertIn("patched to universe 0", output[1])
-
-        # Discover Dummy device RDM UID
-        cmd = "ola_rdm_discover --universe 0 | head -1"
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        rdm_uid = output[0]
-
-        # Get RDM manufacturer_label PID
-        cmd = "ola_rdm_get --universe 0 --uid {} manufacturer_label".format(rdm_uid)
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "Open Lighting Project")
-
-        # Get RDM dmx_start_address PID, checks default value is 1
-        cmd = "ola_rdm_get --universe 0 --uid {} dmx_start_address".format(rdm_uid)
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "DMX Address: 1")
-
-        # Set RDM dmx_start_address PID to 2
-        cmd = "ola_rdm_set --universe 0 --uid {} dmx_start_address 2".format(rdm_uid)
-        self.assertRunOk(cmd)
-
-        # Get the new RDM dmx_start_address PID, checks value is now 2
-        cmd = "ola_rdm_get --universe 0 --uid {} dmx_start_address".format(rdm_uid)
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "DMX Address: 2")
-
-        # Perform a full RDM discovery using python bindings. The test
-        # expect to find the same UID detected with the C client.
-        cmd = "sample_ola_rdm_discovery.py | head -1"
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], rdm_uid)
-
-        # Test olad web interface
-        cmd = "wget -q -O - http://127.0.0.1:9090/ola.html | grep -F '<title>OLA Admin</title>'"
-        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py b/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
deleted file mode 100755
index c2aa0733bb..0000000000
--- a/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#! /usr/bin/env python3
-
-import sys
-
-from ola.ClientWrapper import ClientWrapper
-
-
-def show_uids(state, uids):
-    if state.Succeeded():
-        for uid in uids:
-            print(str(uid))
-    else:
-        print('Error: %s' % state.message, file=sys.stderr)
-    wrapper.Stop()
-
-
-wrapper = ClientWrapper()
-client = wrapper.Client()
-universe = 0
-full_discovery = True
-
-client.RunRDMDiscovery(universe, full_discovery, show_uids)
-
-wrapper.Run()
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
