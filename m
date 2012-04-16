From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 21:46:46 +0200
Subject: [Buildroot] [git commit] boost: fix build with uClibc,
	add locale/timer modules options
Message-ID: <20120416200221.6AB0A96AED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b354dac5a414a7e335276a53a32b9dcfd61b379
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Boost 1.49 added two new modules, locale and timer - So add sub options
to control compilation of those. The locale module by default compiles
the posix backend under Linux, but this needs monetary.h which isn't
provided by uClibc, so work around that.

While we're at it, hide the icu option as that is just an internal
configuration option used by E.G. the locale module.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/Config.in |   14 ++++++++++----
 package/boost/boost.mk  |   15 ++++++++++++++-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 578fced..8798367 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -37,13 +37,16 @@ config BR2_PACKAGE_BOOST_GRAPH
 config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 	bool "boost-graph_parallel"
 
-config BR2_PACKAGE_BOOST_ICU
-        select BR2_PACKAGE_ICU
-	bool "boost-icu"
-
 config BR2_PACKAGE_BOOST_IOSTREAMS
 	bool "boost-iostreams"
 
+config BR2_PACKAGE_BOOST_LOCALE
+	depends on BR2_USE_WCHAR
+	bool "boost-locale"
+
+comment "boost-locale requires a toolchain with wchar support"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
@@ -75,6 +78,9 @@ config BR2_PACKAGE_BOOST_THREAD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	bool "boost-thread"
 
+config BR2_PACKAGE_BOOST_TIMER
+	bool "boost-timer"
+
 config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e25e24d..8864bf9 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -24,6 +24,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
@@ -34,15 +35,25 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SIGNALS),,signals)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
 
-ifeq ($(BR2_PACKAGE_BOOST_ICU),y)
+ifeq ($(BR2_PACKAGE_ICU),y)
 BOOST_FLAGS += --with-icu
 BOOST_DEPENDENCIES += icu
 else
 BOOST_FLAGS += --without-icu
 endif
 
+ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+# posix backend needs monetary.h which isn't available on uClibc
+BOOST_OPT += boost.locale.posix=off
+endif
+
+BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
+endif
+
 BOOST_LINK = $(if $(BR2_PREFER_STATIC_LIB),static,shared)
 BOOST_MULTI = $(if $(BR2_PACKAGE_BOOST_MULTITHREADED),multi,single)
 BOOST_VARIANT = $(if $(BR2_ENABLE_DEBUG),debug,release)
@@ -64,6 +75,7 @@ define BOOST_INSTALL_TARGET_CMDS
 	link=$(BOOST_LINK) \
 	threading=$(BOOST_MULTI) \
 	runtime-link=$(BOOST_LINK) \
+	$(BOOST_OPT) \
 	--prefix=$(TARGET_DIR)/usr \
 	--layout=system install )
 endef
@@ -75,6 +87,7 @@ define BOOST_INSTALL_STAGING_CMDS
 	variant=$(BOOST_VARIANT) \
 	link=$(BOOST_LINK) \
 	threading=$(BOOST_MULTI) \
+	$(BOOST_OPT) \
 	runtime-link=$(BOOST_LINK) \
 	--prefix=$(STAGING_DIR)/usr \
 	--layout=system install)
