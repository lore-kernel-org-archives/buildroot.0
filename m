From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 May 2018 23:33:29 +0200
Subject: [Buildroot] [git commit branch/next] package/mono: bump to version
 5.12.0.226
Message-ID: <20180529213239.EAD8183454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80821d3ed8e5607d259386abe5e3f98625614d11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps mono to version 5.12.0.226 and it's monolite dependency
to version 1051200002, doing so it removes also a couple of upstreamed
patches.
This new mono version requires also a different option for
managing aot, so this patch refactors also the configure options.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...4-fixing-initialization-of-have-vasprintf.patch | 29 ----------------------
 ...6-Remove-unit-tests-from-mono-compilation.patch | 29 ----------------------
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               | 21 +++++++---------
 package/monolite/monolite.hash                     |  2 +-
 package/monolite/monolite.mk                       |  2 +-
 6 files changed, 12 insertions(+), 73 deletions(-)

diff --git a/package/mono/0004-fixing-initialization-of-have-vasprintf.patch b/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
deleted file mode 100644
index 55648593a5..0000000000
--- a/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1c3d615d93b20d10c2729478d5104977dd9af23f Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Wed, 5 Aug 2015 12:59:45 +0200
-Subject: [PATCH] Fixing initialization of have_vasprintf
-
-This patch initialize properly have_vasprintf in case vasprint function is found.
-Solves multiple definition of `vasprintf' error in case vasprint is not properly detected.
-
-Patch is upstream:
-
-   https://github.com/mono/mono/commit/40c171799b671718969ee28a02f92884d7fd181e
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- eglib/configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/eglib/configure.ac b/eglib/configure.ac
-index 5281419..4bf91e5 100644
---- a/eglib/configure.ac
-+++ b/eglib/configure.ac
-@@ -135,6 +135,7 @@ AC_CHECK_SIZEOF(void *)
- AC_CHECK_SIZEOF(long)
- AC_CHECK_SIZEOF(long long)
- AC_CHECK_FUNCS(strlcpy stpcpy strtok_r rewinddir vasprintf)
-+AC_CHECK_FUNC(vasprintf, have_vasprintf=yes)
- AC_CHECK_FUNCS(getrlimit)
- 
- #
diff --git a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
deleted file mode 100644
index a3e88e73a2..0000000000
--- a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 26e31fc54af591bdd88d6a4a79b7fa91c57f4b0c Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Thu, 10 Aug 2017 23:30:05 +0200
-Subject: [PATCH] Remove unit-tests from mono compilation
-
-This patch fixes compiling errors with unit-tests under linux.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- mono/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mono/Makefile.am b/mono/Makefile.am
-index 8c9c2cb..7af36ec 100644
---- a/mono/Makefile.am
-+++ b/mono/Makefile.am
-@@ -34,7 +34,7 @@ monotouch-do-clean:
- 	  (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$target); \
-     done;
- else
--SUBDIRS = $(btls_dirs) arch utils cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
-+SUBDIRS = $(btls_dirs) arch utils cil metadata $(sgen_dirs) mini dis tests benchmark profiler
- endif
- endif
--DIST_SUBDIRS = btls arch utils cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
-+DIST_SUBDIRS = btls arch utils cil metadata $(sgen_dirs) mini dis tests benchmark profiler
--- 
-2.7.4
-
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 850395022f..47e34424ad 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 2a2f5c2a214a9980c086ac7561a5dd106f13d823a630de218eabafe1d995c5b4  mono-5.4.0.201.tar.bz2
+sha256 f0636baa0c1399805526142e799cb697ddccf736e506cf1a30a870eaa2830a89  mono-5.12.0.226.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 802c1d4402..2d60fc68fd 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.4.0.201
+MONO_VERSION = 5.12.0.226
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
@@ -17,13 +17,15 @@ MONO_INSTALL_STAGING = YES
 # patching configure.ac
 MONO_AUTORECONF = YES
 
-# Disable managed code (mcs folder) from building
-MONO_CONF_OPTS = --with-mcs-docs=no \
+MONO_COMMON_CONF_OPTS = --with-mcs-docs=no \
 	--with-ikvm-native=no \
-	--enable-minimal=profiler,debug,aot \
-	--disable-mcs-build \
+	--enable-minimal=profiler,debug \
 	--enable-static \
-	--disable-btls
+	--disable-btls \
+	--disable-system-aot
+
+# Disable managed code (mcs folder) from building
+MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-mcs-build
 
 # The libraries have been built by the host-mono build. Since they are
 # architecture-independent, we simply copy them to the target.
@@ -42,12 +44,7 @@ MONO_DEPENDENCIES += host-mono
 
 ## Mono managed
 
-HOST_MONO_CONF_OPTS = --with-mcs-docs=no \
-	--disable-libraries \
-	--with-ikvm-native=no \
-	--enable-minimal=profiler,debug,aot \
-	--enable-static \
-	--disable-btls
+HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries
 
 # ensure monolite is used
 HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 76f54678d3..77810a9511 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 8c893c3eb3efb5006e19fb45a878860265c3f47fbaf2470be47612e84725d9fd  monolite-linux-1050400003-latest.tar.gz
+sha256 fece21adc06118fa5d79d3621a5fc702ec354abf83be29a36f8718645a2dc058  monolite-linux-1051200002-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 80b2af9544..4e1d548994 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 1050400003
+MONOLITE_VERSION = 1051200002
 MONOLITE_SITE = http://download.mono-project.com/monolite
 MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
