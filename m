Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49068C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 072E940B62;
	Tue,  7 Jun 2022 15:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQ7hTSJofEs3; Tue,  7 Jun 2022 15:46:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCEB94063E;
	Tue,  7 Jun 2022 15:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBB81BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD8D41575
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViVLIcUTpu5b for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:45:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A936410B5
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D6EA586DB5; Tue,  7 Jun 2022 15:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 17:43:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6208ab73460c50a164dc205def544c9627c90ea6
X-Git-Newrev: ac5b6028cd0a93c9b271d8a8b6d2a95a5aebc55d
X-Patchwork-Hint: ignore
Message-Id: <20220607153342.D6EA586DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qpid-proton:
 needs C++ and threads
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ac5b6028cd0a93c9b271d8a8b6d2a95a5aebc55d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

qpid-proton needs C++ (and so threads due to proactor) to avoid the
following build failure:

CMake Error at /nvmedata/autobuild/instance-3/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

C++ check can't easily be removed:
https://github.com/apache/qpid-proton/pull/366

Fixes:
 - http://autobuild.buildroot.org/results/76f8deccc9c4eee29eddf42586cc28e96eec0827

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f255a32211a3778e3cbc7ecef6ee2edec850f27d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpid-proton/Config.in      |  7 +++++--
 package/qpid-proton/qpid-proton.mk | 15 +--------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index b49a2afa7e..adddc6eca0 100644
--- a/package/qpid-proton/Config.in
+++ b/package/qpid-proton/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_QPID_PROTON
 	bool "qpid-proton"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # build a shared library
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -13,5 +15,6 @@ config BR2_PACKAGE_QPID_PROTON
 
 	  https://qpid.apache.org/proton/
 
-comment "qpid-proton needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "qpid-proton needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 103cf9fd31..fae6ecc413 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -23,6 +23,7 @@ QPID_PROTON_DEPENDENCIES = \
 # go language binding is enabled when host-go is present
 # For now, disable all of them.
 QPID_PROTON_CONF_OPTS = \
+	-DBUILD_CPP=ON \
 	-DBUILD_GO=OFF \
 	-DBUILD_PYTHON=OFF \
 	-DBUILD_RUBY=OFF \
@@ -31,20 +32,6 @@ QPID_PROTON_CONF_OPTS = \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
-# epoll proactor unconditionally uses pthread and cpp (C++) bindings
-# unconditionally use proactor
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-QPID_PROTON_CONF_OPTS += -DBUILD_CPP=ON
-else
-QPID_PROTON_CONF_OPTS += -DBUILD_CPP=OFF
-endif
-else
-QPID_PROTON_CONF_OPTS += \
-	-DBUILD_CPP=OFF \
-	-DPROACTOR=none
-endif
-
 ifeq ($(BR2_PACKAGE_JSONCPP),y)
 QPID_PROTON_DEPENDENCIES += jsoncpp
 QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
