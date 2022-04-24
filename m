Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E60C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53DCA401CC;
	Sun, 24 Apr 2022 20:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzGTeTHnJauq; Sun, 24 Apr 2022 20:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A81EB40286;
	Sun, 24 Apr 2022 20:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2DA1BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A34760A92
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-Mp6NoLebgD for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:57:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E2A760AB7
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:57:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 873C68426E; Sun, 24 Apr 2022 20:47:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 22:56:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bdfb5f5ad2d43cca491a7bc621800eaa0064c38
X-Git-Newrev: 663b2edcd2be99638842edaf0406f4c984f32918
X-Patchwork-Hint: ignore
Message-Id: <20220424204706.873C68426E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: switch to pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=663b2edcd2be99638842edaf0406f4c984f32918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to pcre2 which is available since version 3.2 and
https://github.com/SELinuxProject/selinux/commit/50f0910cf05bdc1d10710c7c3fb748a178473387
as pcre is EOL

pcre2 is used by default since version 3.4 and
https://github.com/SELinuxProject/selinux/commit/e0da140d82c0ebebf1060ce87d0f11276c7fc59a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libselinux/Config.in     |  2 +-
 package/libselinux/libselinux.mk | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 348757abce..3098fe3ea4 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBSELINUX
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
 	select BR2_PACKAGE_LIBSEPOL
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libselinux is the runtime SELinux library that provides
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c6be8e638a..db35da130f 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -11,7 +11,7 @@ LIBSELINUX_LICENSE_FILES = LICENSE
 LIBSELINUX_CPE_ID_VENDOR = selinuxproject
 
 LIBSELINUX_DEPENDENCIES = \
-	$(BR2_COREUTILS_HOST_DEPENDENCY) host-pkgconf libsepol pcre
+	$(BR2_COREUTILS_HOST_DEPENDENCY) host-pkgconf libsepol pcre2
 
 LIBSELINUX_INSTALL_STAGING = YES
 
@@ -20,7 +20,8 @@ LIBSELINUX_INSTALL_STAGING = YES
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	ARCH=$(NORMALIZED_ARCH) \
-	SHLIBDIR=/usr/lib
+	SHLIBDIR=/usr/lib \
+	USE_PCRE2=y
 
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
 
@@ -76,14 +77,15 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
-	host-pkgconf host-libsepol host-pcre host-swig host-python3
+	host-pkgconf host-libsepol host-pcre2 host-swig host-python3
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
 	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
-	PYTHON=python$(PYTHON3_VERSION_MAJOR)
+	PYTHON=python$(PYTHON3_VERSION_MAJOR) \
+	USE_PCRE2=y
 
 define HOST_LIBSELINUX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
