From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Oct 2015 16:33:32 +0100
Subject: [Buildroot] [git commit] pkgconf: bump to version 0.9.12
Message-ID: <20151005153345.6BD1D80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f6d320b64ae582d17362dae971288c993736dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches, they aren't required any more.
It fixes a bug where inline comments cause issues, like:

Libs: -lblah # -lbleh

...it would make pkgconf search for the '#' package

This is required for the nettle 3.1.1 upgrade since howgeed.pc adjusts
Libs according to static/dynamic builds using the comment feature.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkgconf/0001-fix-variable.patch       |   29 ------------------
 package/pkgconf/0002-fix-double-sysroot.patch |   40 -------------------------
 package/pkgconf/pkgconf.hash                  |    4 +-
 package/pkgconf/pkgconf.mk                    |    4 +-
 4 files changed, 4 insertions(+), 73 deletions(-)

diff --git a/package/pkgconf/0001-fix-variable.patch b/package/pkgconf/0001-fix-variable.patch
deleted file mode 100644
index 4c213d6..0000000
--- a/package/pkgconf/0001-fix-variable.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-[PATCH] prefix sysroot to include/libdir path variables
-
-Prefix includedir / libdir variable values with sysroot if a variable is
-requested (--variable=<name>), similar to how it's done for -I / -L flags.
-
-This is sometimes used to find header files (E.G. in gst-plugins configure),
-so ensure the sysroot'ed files are used.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff -Nura pkgconf-0.8.9.orig/main.c pkgconf-0.8.9/main.c
---- pkgconf-0.8.9.orig/main.c	2012-10-24 14:32:08.236508699 -0300
-+++ pkgconf-0.8.9/main.c	2012-10-24 14:54:36.771070217 -0300
-@@ -298,7 +298,13 @@
- 	if (eflag != PKG_ERRF_OK)
- 		return false;
- 
--	printf("%s\n", req.buf);
-+	if ( !strcmp(req.variable, "includedir") ||
-+	  !strcmp(req.variable, "mapdir") ||
-+	  !strcmp(req.variable, "sdkdir") ||
-+	  !strcmp(req.variable, "libdir"))
-+		printf("%s%s\n", sysroot_dir, req.buf);
-+	else
-+		printf("%s\n", req.buf);
- 	return true;
- }
- 
diff --git a/package/pkgconf/0002-fix-double-sysroot.patch b/package/pkgconf/0002-fix-double-sysroot.patch
deleted file mode 100644
index 14bc34a..0000000
--- a/package/pkgconf/0002-fix-double-sysroot.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-pkgconf: don't double prefix lib/include paths with sysroot
-
-A .pc file could contain statements of the form:
-    -L/usr/lib
-but also:
-    -L/path/to/sysroot/usr/lib
-
-The latter form typically occurs when the dependency was configured with a
-statement like --with-xxx=$(STAGING_DIR)/usr.
-
-pkgconf only expects the first form, and prefixes it with the specified
-sysroot. However, this strategy would result in a double sysroot in the
-second case:
-    -L/path/to/sysroot/path/to/sysroot/usr/lib
-
-This patch checks for the presence of the sysroot in the specified -L or -I
-directives, and only adds the sysroot when not already present.
-
-Upstream-status: will be submitted
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
----
- main.c |  3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff -r 16865d81819f -r 9d8e1737687f main.c
---- a/main.c	Mon Jun 16 19:47:52 2014 +0200
-+++ b/main.c	Mon Jun 16 19:48:15 2014 +0200
-@@ -82,7 +82,8 @@
- 	{
- 	case 'L':
- 	case 'I':
--		return sysroot_dir;
-+		if (strncmp(sysroot_dir, frag->data, strlen(sysroot_dir)) != 0)
-+			return sysroot_dir;
- 	default:
- 		break;
- 	}
diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
index 97060bd..79191bc 100644
--- a/package/pkgconf/pkgconf.hash
+++ b/package/pkgconf/pkgconf.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256 3bbb1c40832b522de0bf0e5bdeba62160ac499a541facedac5755929a9e87027 pkgconf-0.8.9.tar.bz2
+# Locally calculated
+sha256	7ec8b516e655e247f4ba976837cee808134785819ab8f538f652fe919cc6c09f	pkgconf-0.9.12.tar.bz2
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 3c93fd5..c8b0cba 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PKGCONF_VERSION = 0.8.9
-PKGCONF_SITE = http://rabbit.dereferenced.org/~nenolod/distfiles
+PKGCONF_VERSION = 0.9.12
+PKGCONF_SITE = https://github.com/pkgconf/pkgconf/releases/download/pkgconf-$(PKGCONF_VERSION)
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
