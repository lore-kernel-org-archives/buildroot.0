Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2C8CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 16:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5482C408B0;
	Sat, 25 Oct 2025 16:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkSbTNanfIU0; Sat, 25 Oct 2025 16:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A69D408A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A69D408A7;
	Sat, 25 Oct 2025 16:47:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C395ED7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4E7E608BB
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSmB2zvg1Qxs for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 16:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED6216081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED6216081F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED6216081F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:47:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf49.dip0.t-ipconnect.de [79.214.207.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 467DBA4C4579;
 Sat, 25 Oct 2025 18:47:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46606)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vChQ2-000000007TZ-3dxt;
 Sat, 25 Oct 2025 16:47:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dominik Michael Rauh <dmrauh@posteo.de>
Date: Sat, 25 Oct 2025 18:47:06 +0200
Message-ID: <20251025164706.3551408-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761410827;
 bh=0hLeh3e3BxNzoMzvtj8fH6PUJZCDnAx0r57uZGtny/k=;
 h=From:To:Cc:Subject:Date:From;
 b=hqSAv7J0XEuKKPtN0+UiJcXTQ9z/JW5qncw3RiLJLiHJCY20PCsw85unf0JDC3Jn7
 Qy/lbqw0WVsg7ILDOnUUAQnoM2JYD+ZCiawjW3zVpeu/qWHTYMNhY3IvkMUDwEG6hX
 /5vzeZquvCd2C46qQ08Jvcwbuc/Jp3qRkumQOP04Dh8Uoy+XvqBdFBrDx9sxfep8j5
 9I+czsH03g3sXUC3uddnJyRU0cMLg4Czraqw3abMBADnZVeRk2LzIu/RpgPk9GmAHI
 i/RI2AUwofPKBt1H8PCrTN1uGTsN6OvTOKFyD6EPL+RmGew3Xn5uDI+ypYK811CwtZ
 pMA1MTjChGXXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=hqSAv7J0
Subject: [Buildroot] [PATCH RFC 1/1] package/sqlite: bump version to 3.50.4
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

The autoconf-based configure script until version 3.48.0 enabled rtree
support by default:
https://github.com/sqlite/sqlite/blob/version-3.48.0/autoconf/configure.ac#L180

while the autosetup-based needs -DSQLITE_ENABLE_RTREE
https://github.com/sqlite/sqlite/blob/version-3.50.4/autosetup/sqlite-config.tcl#L763

Add Config.in option for RTREE support and enable it for gdal to provide
a needed dependency:
https://github.com/OSGeo/gdal/blob/v3.11.4/cmake/helpers/CheckDependentLibraries.cmake#L277

Added upstream patch to fix forced addition of rpath and added
configure option --disable-rpath for target build.

Added configure option --soname=legacy to fix wrong library name which
breaks linking of kodi:
https://github.com/LibreELEC/LibreELEC.tv/commit/7f2281bd7cc59425e754ac9d720071688f75580f

Added configure option --disable-shared for static builds.

Added build fixes for BR2_m68k_cf.

Removed SQLITE_CONF_OPTS and readline support from host build to avoid
dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
This patch is not suitable to be committed as-is. It was created to help
the review process and needs to be applied after reverting the reverts of
the last attempt to bump sqlite:

git revert --no-edit c4c282f8ec 014174f00d 835b5659ea db481210e9 b7f154eab7 296744b0f4 939244b828 f0a272ef14 274c36578f

The final patch will not include the revert of the json1 option.

 package/gdal/Config.in                  |  1 +
 package/sqlite/0001-disable-rpath.patch | 59 +++++++++++++++++++++++++
 package/sqlite/Config.in                |  8 ++--
 package/sqlite/sqlite.hash              |  2 +-
 package/sqlite/sqlite.mk                | 27 ++++++++---
 5 files changed, 86 insertions(+), 11 deletions(-)
 create mode 100644 package/sqlite/0001-disable-rpath.patch

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 6ee088ce0c..c1bbf58fc7 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_GDAL
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_QHULL
+	select BR2_PACKAGE_SQLITE_ENABLE_RTREE if BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
 	help
 	  GDAL is a translator library for raster and vector geospatial
diff --git a/package/sqlite/0001-disable-rpath.patch b/package/sqlite/0001-disable-rpath.patch
new file mode 100644
index 0000000000..6eb20488b0
--- /dev/null
+++ b/package/sqlite/0001-disable-rpath.patch
@@ -0,0 +1,59 @@
+Add the --disable-rpath configure script flag to address
+
+Upstream: https://sqlite.org/src/info/a59d9bb25e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: autosetup/sqlite-config.tcl
+==================================================================
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -334,12 +334,12 @@
+         # canonical build!
+         static-shell=1
+           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {canonical autoconf} {
+-        # A potential TODO without a current use case:
+-        #rpath=1 => {Disable use of the rpath linker flag}
++        rpath=1 => {Disable use of the rpath linker flag}
++
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+               soname. "legacy" sets it to its historical value of
+               libsqlite3.so.0.  A value matching the glob "libsqlite3.*" sets
+@@ -2138,25 +2138,25 @@
+ }
+ 
+ ########################################################################
+ # Handle the --enable/disable-rpath flag.
+ proc sqlite-handle-rpath {} {
+-  proj-check-rpath
+   # autosetup/cc-shared.tcl sets the rpath flag definition in
+   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
+   # rather than as a compiler check. Though we should do a proper
+   # compiler check (as proj-check-rpath does), we may want to consider
+   # adopting its approach of clearing the rpath flags for environments
+   # for which sqlite-env-is-unix-on-windows returns a non-empty
+   # string.
+ 
+-#  if {[proj-opt-truthy rpath]} {
+-#    proj-check-rpath
+-#  } else {
+-#    msg-result "Disabling use of rpath."
+-#    define LDFLAGS_RPATH ""
+-#  }
++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
++  if {[proj-opt-truthy rpath]} {
++    proj-check-rpath
++  } else {
++    msg-result "Disabling use of rpath."
++    define LDFLAGS_RPATH ""
++  }
+ }
+ 
+ ########################################################################
+ # If the --dump-defines configure flag is provided then emit a list of
+ # all [define] values to config.defines.txt, else do nothing.
+
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index ce1e369b20..c649267040 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -30,11 +30,11 @@ config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	  http://www.sqlite.org/amalgamation.html), version 3 of the
 	  full-text search engine is added to the build automatically.
 
-config BR2_PACKAGE_SQLITE_ENABLE_JSON1
-	bool "Enable the JSON extensions for SQLite"
+config BR2_PACKAGE_SQLITE_ENABLE_RTREE
+	bool "Enable the RTREE extension for SQLite"
 	help
-	  When this option is defined in the amalgamation, the JSON
-	  extensions are added to the build automatically.
+	  When this option is defined in the amalgamation, the RTREE
+	  extension is added to the build automatically.
 
 config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 	bool "Enable sqlite3_unlock_notify() interface"
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ddec2637b8..2ade5afe03 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d8bfa0b55e36951f6e5a9fb8c99f3b58990ab785c57b4f84f37d163a0672759  sqlite-autoconf-3490000.tar.gz
+sha256  a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18  sqlite-autoconf-3500400.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8016ff1c4c..667ee8d70e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.49.0
-SQLITE_TAR_VERSION = 3490000
+SQLITE_VERSION = 3.50.4
+SQLITE_TAR_VERSION = 3500400
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
@@ -21,6 +21,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_RTREE),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_RTREE
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
@@ -37,6 +41,8 @@ endif
 # Work around using -O0
 ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y:)
 SQLITE_CFLAGS += $(TARGET_CFLAGS) -O0
+else ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+SQLITE_CFLAGS += $(TARGET_CFLAGS) -O0
 else
 # fallback to standard -O3 when -Ofast is present to avoid -ffast-math
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
@@ -58,12 +64,18 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
 SQLITE_CONF_OPTS += --fts3
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
-SQLITE_CONF_OPTS += --disable-json
+ifeq ($(BR2_STATIC_LIBS),y)
+SQLITE_CONF_OPTS += --disable-shared
 endif
 
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101971
+define SQLITE_FIX_MAKEFILE
+	chmod +w $(@D)/Makefile
+	sed -i "s/-fPIC//" $(@D)/Makefile
+endef
+
 define SQLITE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
 		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
@@ -72,8 +84,11 @@ define SQLITE_CONFIGURE_CMDS
 		--host="$(GNU_TARGET_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
 		--sysroot="$(STAGING_DIR)" \
+		--disable-rpath \
+		--soname=legacy \
 		$(SQLITE_CONF_OPTS) \
 	)
+	$(if $(BR2_m68k_cf),$(SQLITE_FIX_MAKEFILE))
 endef
 
 define SQLITE_BUILD_CMDS
@@ -90,12 +105,12 @@ endef
 
 define HOST_SQLITE_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
-		$(SQLITE_CONF_ENV) ./configure \
+		./configure \
 		--prefix=/usr \
 		--host="$(GNU_HOST_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
 		--sysroot="$(HOST_DIR)" \
-		$(SQLITE_CONF_OPTS) \
+		--disable-readline \
 	)
 endef
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
