Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550B9C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB3F61319;
	Fri,  9 Aug 2024 13:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxREfjqgqjhk; Fri,  9 Aug 2024 13:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B07DA612F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B07DA612F4;
	Fri,  9 Aug 2024 13:59:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 692061BF21A
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 13:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55EF9409FB
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 13:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_-6ODM4Z7N5 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 13:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07E7641296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E7641296
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07E7641296
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:59:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2EE323537291; Fri,  9 Aug 2024 15:59:11 +0200 (CEST)
Date: Fri, 9 Aug 2024 15:59:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrYgrzSPAcUueLsj@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723211951; bh=QCZzjlhHNQzJKbhVmd6BGldbr66JuSALNhyoFqiMwO0=;
 h=Date:From:To:Cc:Subject:From;
 b=m08vMhWwzCa3733O1CWxFb4yW5i+a6pu+oIYSbrlp0qbJLN9jz8dJ5cHqtCfamq84
 H/5qlC0kMK0lXDp7CNz+zVaejuCkLJSa0rZv9eJNwKvqMqIRWJbeQPE5h2npUmYFNd
 TEgDhoS5wPUmo401KNYPrxBSfj2kJL4mSz8II+/0LMQ03VJZpRHsq25d2bviDV2+nO
 goNLe6bL32Fhyr2O7j88gaacXX6wEJl9dTSYOlzUdkn3klVo9oGF5YqjkwOxQegLYz
 03fD0A6oNRShjM/9C5Xy1GDGj9Enas20AXMNr8SjDTBTA1fOncQBVUEKmsILXAmxaK
 v4DvSMEQykmtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=m08vMhWw
Subject: [Buildroot] [PATCH] package/rpm: update to 4.19.1.1
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
Cc: James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a full Changelog see:
https://github.com/rpm-software-management/rpm/compare/rpm-4.18.1-release...rpm-4.19.1.1-release

Upstream project switched to Cmake buildsystem.
Patch 0001 is already upstream.

To make use of rpm on the target /var/lib/rpm/rpmrc and other macros
must exist, so modify top level Makefile so that this directory is
not removed when package rpm is choosen. The removal was added in
commit 960fc93df2f7981e13a1bb7fb76fd958e36b8611.

Use old deprecated openpgp implementation as the newer rpm-sequoia
needs rust / cargo library support. See the comment in the rpm.mk file.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 Makefile                                      |  5 +-
 .../0001-fix-var-declare-in-label-error.patch | 40 ---------
 package/rpm/rpm.hash                          |  4 +-
 package/rpm/rpm.mk                            | 82 +++++++++----------
 4 files changed, 44 insertions(+), 87 deletions(-)
 delete mode 100644 package/rpm/0001-fix-var-declare-in-label-error.patch

diff --git a/Makefile b/Makefile
index f51e8f690f..8755831bd3 100644
--- a/Makefile
+++ b/Makefile
@@ -734,10 +734,13 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
-		$(TARGET_DIR)/usr/lib/rpm $(TARGET_DIR)/usr/doc
+		$(TARGET_DIR)/usr/doc
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
 		\( -name '*.a' -o -name '*.la' -o -name '*.prl' \) -print0 | xargs -0 rm -f
+ifneq ($(BR2_PACKAGE_RPM),y)
+	rm -rf $(TARGET_DIR)/usr/lib/rpm
+endif
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch b/package/rpm/0001-fix-var-declare-in-label-error.patch
deleted file mode 100644
index 648040c663..0000000000
--- a/package/rpm/0001-fix-var-declare-in-label-error.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
-From: Florian Festi <ffesti@redhat.com>
-Date: Thu, 16 Mar 2023 19:05:04 +0100
-Subject: [PATCH] Fix compiler error on clang
-
-Turns out variable declarations are not allowed after a label, even in
-C99. And while some compilers don't seem to care others do.
-
-Moving the declaration of mayopen to the start of the function to avoid
-this problem.
-
-Resolves: #2435
-
-Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
-Signed-off-by: James Knight <james.d.knight@live.com>
----
- lib/fsm.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/fsm.c b/lib/fsm.c
-index 5671ac642d..183293edb0 100644
---- a/lib/fsm.c
-+++ b/lib/fsm.c
-@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
-     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
-     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
-     int firstlinkfile = -1;
-+    int mayopen = 0;
-     char *tid = NULL;
-     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
-     struct filedata_s *firstlink = NULL;
-@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
- 
- setmeta:
- 	    /* Special files require path-based ops */
--	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
-+	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
- 	    if (!rc && fd == -1 && mayopen) {
- 		int flags = O_RDONLY;
- 		/* Only follow safe symlinks, and never on temporary files */
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index fd03f062bc..59cc66bba6 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.18.1.html
-sha256  37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  rpm-4.18.1.tar.bz2
+# From https://rpm.org/wiki/Releases/4.19.1.1.html
+sha256  874091b80efe66f9de8e3242ae2337162e2d7131e3aa4ac99ac22155e9c521e5  rpm-4.19.1.1.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index c66ce6992d..46467fc4e0 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.18
-RPM_VERSION = $(RPM_VERSION_MAJOR).1
+RPM_VERSION_MAJOR = 4.19
+RPM_VERSION = $(RPM_VERSION_MAJOR).1.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
@@ -23,98 +23,92 @@ RPM_LICENSE_FILES = COPYING
 RPM_CPE_ID_VENDOR = rpm
 RPM_SELINUX_MODULES = rpm
 
-# Don't set --{dis,en}-openmp as upstream wants to abort the build if
-# --enable-openmp is provided and OpenMP is < 4.5:
-# https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
-	--disable-rpath \
-	--with-gnu-ld \
-	--without-fapolicyd \
-	--without-fsverity \
-	--without-imaevm
+	-DWITH_FSVERITY=OFF \
+	-DWITH_FAPOLICYD=OFF \
+	-DWITH_IMAEVM=OFF \
+	-DENABLE_TESTSUITE=OFF
+
+# use deprecated openpgp implementation instead of rpm-sequoia,
+# because otherwise we need to use a rust library, which is not yet
+# supported by cargo-package infrastructure
+RPM_CONF_OPTS += -DWITH_INTERNAL_OPENPGP=ON
+
+ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
+RPM_CONF_OPTS += -DENABLE_OPENMP=ON
+else
+RPM_CONF_OPTS += -DENABLE_OPENMP=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
-RPM_CONF_OPTS += --with-acl
+RPM_CONF_OPTS += -DWITH_ACL=ON
 else
-RPM_CONF_OPTS += --without-acl
+RPM_CONF_OPTS += -DWITH_ACL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 RPM_DEPENDENCIES += audit
-RPM_CONF_OPTS += --with-audit
+RPM_CONF_OPTS += -DWITH_AUDIT=ON
 else
-RPM_CONF_OPTS += --without-audit
+RPM_CONF_OPTS += -DWITH_AUDIT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
-RPM_CONF_OPTS += --enable-plugins
+RPM_CONF_OPTS += -DWITH_DBUS=ON
 else
-RPM_CONF_OPTS += --disable-plugins
+RPM_CONF_OPTS += -DWITH_DBUS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 RPM_DEPENDENCIES += libcap
-RPM_CONF_OPTS += --with-cap
+RPM_CONF_OPTS += -DWITH_CAP=ON
 else
-RPM_CONF_OPTS += --without-cap
+RPM_CONF_OPTS += -DWITH_CAP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RPM_DEPENDENCIES += libgcrypt
-RPM_CONF_OPTS += --with-crypto=libgcrypt
+RPM_CONF_OPTS += -DWITH_OPENSSL=OFF
 else
 RPM_DEPENDENCIES += openssl
-RPM_CONF_OPTS += --with-crypto=openssl
-endif
-
-ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-RPM_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
-else
-RPM_CONF_OPTS += --without-libintl-prefix
+RPM_CONF_OPTS += -DWITH_OPENSSL=ON
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 RPM_DEPENDENCIES += libselinux
-RPM_CONF_OPTS += --with-selinux
+RPM_CONF_OPTS += -DWITH_SELINUX=ON
 else
-RPM_CONF_OPTS += --without-selinux
+RPM_CONF_OPTS += -DWITH_SELINUX=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 RPM_DEPENDENCIES += python3
-RPM_CONF_OPTS += --enable-python
+RPM_CONF_OPTS += -DENABLE_PYTHON=ON
 else
-RPM_CONF_OPTS += --disable-python
+RPM_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 RPM_DEPENDENCIES += readline
-RPM_CONF_OPTS += --with-readline
+RPM_CONF_OPTS += -DWITH_READLINE=ON
 else
-RPM_CONF_OPTS += --without-readline
+RPM_CONF_OPTS += -DWITH_READLINE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
-RPM_CONF_OPTS += --enable-sqlite
-else
-RPM_CONF_OPTS += --disable-sqlite
-endif
-
-ifeq ($(BR2_PACKAGE_ZSTD),y)
-RPM_DEPENDENCIES += zstd
-RPM_CONF_OPTS += --enable-zstd
+RPM_CONF_OPTS += -DENABLE_SQLITE=ON
 else
-RPM_CONF_OPTS += --disable-zstd
+RPM_CONF_OPTS += -DENABLE_SQLITE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
 RPM_DEPENDENCIES += libarchive
-RPM_CONF_OPTS += --with-archive
+RPM_CONF_OPTS += -DWITH_ARCHIVE=ON
 else
-RPM_CONF_OPTS += --without-archive
+RPM_CONF_OPTS += -DWITH_ARCHIVE=OFF
 endif
 
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
@@ -122,4 +116,4 @@ RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
 	LIBS=$(TARGET_NLS_LIBS)
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
