Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC01EDE990
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21EF04017A;
	Thu, 14 Sep 2023 08:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21EF04017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4rdNTTkpyIM; Thu, 14 Sep 2023 08:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F24741702;
	Thu, 14 Sep 2023 08:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F24741702
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C79DC1BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A84CC81366
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84CC81366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLd-1G-YB1kG for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:33:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4486181258
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4486181258
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 325EB86EF3; Thu, 14 Sep 2023 08:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 10:19:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1a7879b652d76d98804a869707f04a153ac3b6ee
X-Git-Newrev: 6dde0f533b2aab3e59feb152642a8e3f58d854e2
X-Patchwork-Hint: ignore
Message-Id: <20230914083342.325EB86EF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/log4cxx: ignore
 CVE-2023-31038
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dde0f533b2aab3e59feb152642a8e3f58d854e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

CVE-2023-31038 affects log4cxx only if ODBC is supported. While
CVE-2023-31038 has been fixed in newer versions of log4cxx, there is
quite a huge gap to do a version bump, and the commit that fixes
CVE-2023-31038 could not be identified.

Therefore, we want to rely on the fact that our log4cxx package does
not support ODBC: there is indeed no explicit dependency on our
unixodbc package in log4cxx.mk. However, log4cxx automatically detects
if ODBC is available and if it is, it uses it.

So what we do in this commit is backport an upstream commit, which
adds explicitly options to enable/disable ODBC and ESMTP support, and
we use them to (1) always disable ODBC and (2) explicitly
enable/disable ESMTP support.

Thanks to ODBC being disabled, we're not affected by CVE-2023-31038.

Of course, there is a potential regression for users who were relying
on the implicit unixodbc dependency, but as we could not identify the
commit fixing the CVE-2023-31038, this is the best we can do at the
moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit cf686670b99ae0388b27867db64516c09b2de91f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Make-ODBC-and-SMTP-opt-in-191.patch       | 73 ++++++++++++++++++++++
 package/log4cxx/log4cxx.mk                         |  9 ++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch b/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
new file mode 100644
index 0000000000..a116fcc491
--- /dev/null
+++ b/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
@@ -0,0 +1,73 @@
+From 4900c27cc284ba2f671ae92e6ffb4ab391f9507a Mon Sep 17 00:00:00 2001
+From: Robert Middleton <rm5248@users.noreply.github.com>
+Date: Mon, 6 Feb 2023 20:39:02 -0500
+Subject: [PATCH] Make ODBC and SMTP opt-in (#191)
+
+See #189
+
+Upstream: afeaab6d0f0107c77dfadcbe3708f170c48d5ed9
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/main/include/CMakeLists.txt | 40 ++++++++++++++++++++++++---------
+ 1 file changed, 30 insertions(+), 10 deletions(-)
+
+diff --git a/src/main/include/CMakeLists.txt b/src/main/include/CMakeLists.txt
+index e31443fb..d6835293 100644
+--- a/src/main/include/CMakeLists.txt
++++ b/src/main/include/CMakeLists.txt
+@@ -85,22 +85,42 @@ include(CheckIncludeFiles)
+ include(CheckIncludeFileCXX)
+ include(CheckLibraryExists)
+ 
+-if(WIN32)
+-	CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
++option(LOG4CXX_ENABLE_ODBC "Support logging via ODBC" OFF)
++if(LOG4CXX_ENABLE_ODBC)
++    if(WIN32)
++            CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
++    else()
++            include(FindPkgConfig)
++
++            pkg_check_modules( odbc odbc )
++            if(${odbc_FOUND})
++                    set(HAS_ODBC 1)
++            else()
++                    set(HAS_ODBC 0)
++            endif(${odbc_FOUND})
++    endif(WIN32)
++
++    if(NOT ${HAS_ODBC})
++        message(SEND_ERROR "ODBC not found but requested")
++    endif()
+ else()
+-	include(FindPkgConfig)
+-
+-	pkg_check_modules( odbc QUIET odbc )
+-	if(${odbc_FOUND})
+-		set(HAS_ODBC 1)
+-	endif(${odbc_FOUND})
+-endif(WIN32)
++    set(HAS_ODBC 0)
++endif(LOG4CXX_ENABLE_ODBC)
++
++option(LOG4CXX_ENABLE_ESMTP "Support logging via libesmtp" OFF)
++if(LOG4CXX_ENABLE_ESMTP)
++    CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
++    if(NOT HAS_LIBESMTP)
++        message(SEND_ERROR "SMTP support with libesmtp not found but requested")
++    endif()
++else()
++    set(HAS_LIBESMTP 0)
++endif(LOG4CXX_ENABLE_ESMTP)
+ 
+ CHECK_INCLUDE_FILE_CXX(locale HAS_STD_LOCALE)
+ CHECK_FUNCTION_EXISTS(mbsrtowcs HAS_MBSRTOWCS)
+ CHECK_FUNCTION_EXISTS(wcstombs HAS_WCSTOMBS)
+ CHECK_FUNCTION_EXISTS(fwide HAS_FWIDE)
+-CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
+ CHECK_FUNCTION_EXISTS(syslog HAS_SYSLOG)
+ if(UNIX)
+     set(CMAKE_REQUIRED_LIBRARIES "pthread")
+-- 
+2.41.0
+
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index a5569126d4..aee682529c 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -11,10 +11,14 @@ LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
 LOG4CXX_CPE_ID_VENDOR = apache
+# We do not support ODBC functionality
+LOG4CXX_IGNORE_CVES = CVE-2023-31038
 
+# Note: if you want to support odbc, make sure CVE-2023-31038 is fixed
 LOG4CXX_CONF_OPTS = \
 	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
-	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
+	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config \
+	-DLOG4CXX_ENABLE_ODBC=OFF
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
@@ -23,7 +27,10 @@ LOG4CXX_DEPENDENCIES += boost
 endif
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=ON
 LOG4CXX_DEPENDENCIES += libesmtp
+else
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
 endif
 
 ifeq ($(BR2_USE_WCHAR),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
