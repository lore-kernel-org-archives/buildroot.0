From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 15:56:14 -0500
Subject: [Buildroot] [PATCH 4/4] policycoreutils: Add audit2allow support.
In-Reply-To: <20170109205614.25011-1-aduskett@codeblue.com>
References: <20170109205614.25011-1-aduskett@codeblue.com>
Message-ID: <20170109205614.25011-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Policycoreutils is currently built without audit2allow support enabled.
This patch adds the ability to build policycoreutils with audit2allow
support.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/policycoreutils/Config.in          | 14 ++++++++++++++
 package/policycoreutils/policycoreutils.mk | 16 ++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 53238b4..d2ebb2f 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -45,6 +45,20 @@ config BR2_PACKAGE_POLICYCOREUTILS
 
 if BR2_PACKAGE_POLICYCOREUTILS
 
+config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
+	bool "audit2allow utility"
+	select BR2_PACKAGE_SEPOLGEN
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	help
+	  Enable audit2allow to be built
+
+comment "audit2allow requires python"
+	depends on !BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON3	  
+	  
 config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	bool "restorecond"
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 86639cc..5e1d536 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -39,6 +39,16 @@ POLICYCOREUTILS_MAKE_OPTS += \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	ARCH="$(BR2_ARCH)"
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+POLICYCOREUTILS_DEPENDENCIES += python3
+POLICYCOREUTILS_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
+else
+POLICYCOREUTILS_DEPENDENCIES += python
+POLICYCOREUTILS_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
+endif
+
 POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
 	secon semodule semodule_deps \
@@ -50,6 +60,12 @@ ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
 POLICYCOREUTILS_MAKE_DIRS += restorecond
 POLICYCOREUTILS_DEPENDENCIES += libglib2
 endif
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
+POLICYCOREUTILS_DEPENDENCIES += sepolgen
+POLICYCOREUTILS_MAKE_DIRS += audit2allow
+endif
+
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.
 define POLICYCOREUTILS_BUILD_CMDS
-- 
2.9.3
