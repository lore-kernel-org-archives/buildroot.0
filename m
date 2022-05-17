Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D32FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4650F84066;
	Tue, 17 May 2022 21:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SWxFdMqxmOF; Tue, 17 May 2022 21:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DFB84028;
	Tue, 17 May 2022 21:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB39B1BF9AA
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8EC84058
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5Raf7kUSTLZ for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF11784028
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A421385FAD; Tue, 17 May 2022 20:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 23:09:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdb247436c7309f3fb8e7d60ed5e66883ae17a45
X-Git-Newrev: feda018834aa59d8b9398604f9c91e08de87943f
X-Patchwork-Hint: ignore
Message-Id: <20220517205918.A421385FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: propagate reverse
 dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=feda018834aa59d8b9398604f9c91e08de87943f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It appears some grpc reverse dependencies aren't propagated properly.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRPC
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_STATIC_LIBS [=n] && (BR2_TOOLCHAIN_HAS_SYNC_4 [=y] || BR2_TOOLCHAIN_HAS_ATOMIC [=y]) && BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_FALCOSECURITY_LIBS [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_LINUX_KERNEL [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 [=y]

On BR2_PACKAGE_COLLECTD_GRPC, we take this opportunity to drop the
Config.in comment about the BR2_HOST_GCC_AT_LEAST_4_9, which was
dropped from BR2_PACKAGE_COLLECTD_GRPC in commit
8251d8c2559b25f11684776fc343059cf100657d ("package/grpc: restrict
host-grpc to the absolute minimum")

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in           |  7 +++----
 package/falcosecurity-libs/Config.in |  4 +++-
 package/sysdig/Config.in             | 10 +++++++---
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index dc6ecd2b72..fb76a105dc 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -683,16 +683,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc -> libabseil-cpp
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+comment "grpc needs a toolchain w/ C++, gcc >= 5"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| !BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index e0b5a3d134..157bc8ef6d 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_FALCOSECURITY_LIBS
 	bool
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	select BR2_PACKAGE_C_ARES
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3a21f51725..c0a631bd49 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
 	depends on BR2_LINUX_KERNEL # falcosecurity-libs
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # falcosecurity-libs
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # falcosecurity-libs
 	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
 	depends on !BR2_STATIC_LIBS # falcosecurity-libs
 	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # falcosecurity-libs
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # falcosecurity-libs
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
@@ -21,10 +23,12 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 5, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
