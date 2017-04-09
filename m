From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:33:54 +0200
Subject: [Buildroot] [git commit] policycoreutils: add option to build
	audit2allow
Message-ID: <20170409134130.4088182306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=005a5f33f25821af1edae15c7811c4ad305d3f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This python utility scans the logs for messages logged when the system
denied permission for operations, and  generates  a snippet of policy
rules which, if loaded into policy, might have allowed  those operations
to succeed.  However, this utility only generates Type Enforcement (TE)
allow rules.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: adjust Config.in to propagate the dependencies of sepolgen,
checkpolicy and python3.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/policycoreutils/Config.in          | 20 ++++++++++++++++++++
 package/policycoreutils/policycoreutils.mk | 14 ++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 53238b4..4b8a9dc 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -45,6 +45,26 @@ config BR2_PACKAGE_POLICYCOREUTILS
 
 if BR2_PACKAGE_POLICYCOREUTILS
 
+config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
+	bool "audit2allow"
+	depends on BR2_USE_WCHAR # python3, sepolgen
+	depends on BR2_USE_MMU # python3, sepolgen
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3, sepolgen, checkpolicy
+	depends on !BR2_STATIC_LIBS # python3, sepolgen
+	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
+	depends on !BR2_arc # checkpolicy
+	select BR2_PACKAGE_SEPOLGEN
+	select BR2_PACKAGE_CHECKPOLICY
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  Enable audit2allow to be built
+
+comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
 config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	bool "restorecond"
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 911d40d..c9dca4c 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -50,6 +50,20 @@ ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
 POLICYCOREUTILS_MAKE_DIRS += restorecond
 POLICYCOREUTILS_DEPENDENCIES += libglib2
 endif
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+POLICYCOREUTILS_DEPENDENCIES += python3
+POLICYCOREUTILS_MAKE_OPTS += PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
+else
+POLICYCOREUTILS_DEPENDENCIES += python
+POLICYCOREUTILS_MAKE_OPTS += PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
+endif
+
+POLICYCOREUTILS_DEPENDENCIES += sepolgen checkpolicy
+POLICYCOREUTILS_MAKE_DIRS += audit2allow
+endif
+
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.
 define POLICYCOREUTILS_BUILD_CMDS
