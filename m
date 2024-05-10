Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5661C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A44844040A;
	Fri, 10 May 2024 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XK4ijKtaD57T; Fri, 10 May 2024 20:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E31540529
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E31540529;
	Fri, 10 May 2024 20:53:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213D61BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DF626160C
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68C-UbWq3MVv for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D7846159A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D7846159A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:53:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1875286F39; Fri, 10 May 2024 20:53:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:51:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e6e121496bfcbe09c018558be13733077b6df9b
X-Git-Newrev: 5961b219180c180ad816faa18681674d89eccaa9
X-Patchwork-Hint: ignore
Message-Id: <20240510205313.1875286F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=5961b219180c180ad816faa18681674d89eccaa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to fix the following build failure raised at least since
bump to version 3.9.0 in commit e76d9868c940f2d19968077b97e79c49376aa464
and
https://github.com/zhaojh329/libuhttpd/commit/81db1fa371bc80f40c1bfe60010e7d64bdf30b46:

/home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c: In function '__serve_file':
/home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:322:50: error: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type '__off_t' {aka 'long int'} [-Werror=format=]
  322 |         conn->send_header(conn, "Content-Range", "bytes */%" PRIu64, st->st_size);
      |                                                  ^~~~~~~~~~~         ~~~~~~~~~~~
      |                                                                        |
      |                                                                        __off_t {aka long int}
In file included from /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:36:
/home/autobuild/autobuild/instance-8/output-1/per-package/libuhttpd/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:91:41: note: format string is defined here
   91 | # define PRIu64         __PRI64_PREFIX "u"
cc1: all warnings being treated as errors

Fixes: e76d9868c940f2d19968077b97e79c49376aa464
 - http://autobuild.buildroot.org/results/46349a1409f9cff027b462456078284459e75511

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...03-CMakeLists.txt-add-BUILD_WERROR-option.patch | 30 ++++++++++++++++++++++
 package/libuhttpd/libuhttpd.mk                     |  1 +
 2 files changed, 31 insertions(+)

diff --git a/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch b/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
new file mode 100644
index 0000000000..2e87014e87
--- /dev/null
+++ b/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
@@ -0,0 +1,30 @@
+From c0f2260d8b7e435bce765e7ac91d51f1b349b87b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 10 Mar 2024 13:43:12 +0100
+Subject: [PATCH] CMakeLists.txt: add BUILD_WERROR option
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/zhaojh329/libuhttpd/commit/c0f2260d8b7e435bce765e7ac91d51f1b349b87b
+---
+ CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6fb9651..6719e5f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,13 @@ include(CheckLibraryExists)
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
+ 
+ add_definitions(-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64)
+-add_compile_options(-O -Wall -Werror --std=gnu99)
++add_compile_options(-O -Wall --std=gnu99)
++
++option(BUILD_WERROR "Build with -Werror" ON)
++
++if(BUILD_WERROR)
++    add_compile_options(-Werror)
++endif()
+ 
+ option(BUILD_STATIC "Build static library" OFF)
+ 
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 0d5306c6dd..78e0f42b22 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -10,6 +10,7 @@ LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
 LIBUHTTPD_INSTALL_STAGING = YES
 LIBUHTTPD_DEPENDENCIES = libev
+LIBUHTTPD_CONF_OPTS = -DBUILD_WERROR=OFF
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
