From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Nov 2020 07:35:35 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/quota: bump to version 4.06
Message-ID: <20201113063535.2737-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version) and so autoreconf
- Update hash of COPYING (mailing address updated:
  https://sourceforge.net/p/linuxquota/code/ci/b6bb53e1124e6b813fe4de5682b9d9a9f8a1fba8)
- Update indentation in hash file (two spaces)

https://sourceforge.net/p/linuxquota/code/ci/v4.06/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix Signed-off-by email in upstream patch

 ...-configure.ac-add-disable-pie-option.patch | 55 -------------------
 ...-realloc-3-instead-of-reallocarray-3.patch | 34 ++++++++++++
 package/quota/quota.hash                      | 10 ++--
 package/quota/quota.mk                        |  5 +-
 4 files changed, 40 insertions(+), 64 deletions(-)
 delete mode 100644 package/quota/0001-configure.ac-add-disable-pie-option.patch
 create mode 100644 package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch

diff --git a/package/quota/0001-configure.ac-add-disable-pie-option.patch b/package/quota/0001-configure.ac-add-disable-pie-option.patch
deleted file mode 100644
index c3b57fea66..0000000000
--- a/package/quota/0001-configure.ac-add-disable-pie-option.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From cb20e19028a8996de9305502ba5e5da3bd1181bf Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 2 Apr 2019 09:19:36 +0200
-Subject: [PATCH] configure.ac: add --disable-pie option
-
-PIE is not necessarily supported on all architectures, so add an option
-to allow the user to disable the PIE.
-
-This fixes the build on the m68k architecture:
- - http://autobuild.buildroot.org/results/25985bbc160e3d62b23c4c613b2a81f3711621e3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: merged]
----
- Makefile.am  |  2 +-
- configure.ac | 12 ++++++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 638198d..332bd67 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,5 +1,5 @@
- ACLOCAL_AMFLAGS = -I m4
--AM_LDFLAGS = -pie
-+AM_LDFLAGS = @PIE_LDFLAGS@
- 
- doc_DATA = \
-        README.mailserver \
-diff --git a/configure.ac b/configure.ac
-index 095ff86..5af4235 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,6 +55,18 @@ AS_IF([test "x${prefix}" = "xNONE"], [
-   AC_DEFINE_UNQUOTED(PACKAGE_LOCALE_DIR, "${prefix}/share/locale", [Locale-specific data directory])
- ])
- 
-+# ================
-+# Check for ldflags
-+# ================
-+AC_ARG_ENABLE([pie],
-+   [AS_HELP_STRING([--disable-pie], [Disable Position Independent Executable])],
-+   [enable_pie="$enableval"],
-+   [enable_pie=yes]
-+)
-+AS_IF([test x"$enable_pie" != "xno"], [
-+    PIE_LDFLAGS="-pie"
-+])
-+AC_SUBST([PIE_LDFLAGS])
- 
- # ================
- # Check for cflags
--- 
-2.14.1
-
diff --git a/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch b/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
new file mode 100644
index 0000000000..093d7cc821
--- /dev/null
+++ b/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
@@ -0,0 +1,34 @@
+From 02b222a335527f1031cc9495d8c5ebc1bc5b1d4e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 11 Nov 2020 15:00:47 +0100
+Subject: [PATCH] quota: Use realloc(3) instead of reallocarray(3)
+
+reallocarray(3) has been added to glibc relatively recently (version
+2.26, from 2017) and apparently not all users run new enough glibc. Just
+use realloc(3) for now since in this case there's no real risk of
+overflow.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+[Retrieved from:
+https://sourceforge.net/p/linuxquota/code/ci/02b222a335527f1031cc9495d8c5ebc1bc5b1d4e]
+---
+ quota.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/quota.c b/quota.c
+index a6ed61f..a60de12 100644
+--- a/quota.c
++++ b/quota.c
+@@ -385,7 +385,7 @@ int main(int argc, char **argv)
+ 			  break;
+ 		  case 259:
+ 			  fscount++;
+-			  fsnames = reallocarray(fsnames, fscount, sizeof(char *));
++			  fsnames = realloc(fsnames, fscount * sizeof(char *));
+ 			  if (!fsnames)
+ 				die(1, _("Not enough memory for filesystem names"));
+ 			  fsnames[fscount - 1] = optarg;
+-- 
+2.28.0
+
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index d9f42e51c7..354a3e2de4 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.05/ (click on info button)
-md5	1c1dbd2cd3d680ccac661239b067e147	quota-4.05.tar.gz
-sha1	d23711f3b204e0a86b8378c32545c95fb149168d	quota-4.05.tar.gz
+# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.06/ (click on info button)
+md5  aef94648438832b684978d46fdf75110  quota-4.06.tar.gz
+sha1  98288699cc14da42f762301c2b6731ec7c777681  quota-4.06.tar.gz
 
 # Locally calculated
-sha256	ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9	quota-4.05.tar.gz
-sha256	35b2d9797b83bce16076da9c3273f264f50b8d02f492ee32cd4c51ba6897bceb	COPYING
+sha256  2f3e03039f378d4f0d97acdb49daf581dcaad64d2e1ddf129495fd579fbd268d  quota-4.06.tar.gz
+sha256  32a5fd41e7a257f7f0373988ea8d45cebdbf376060703c242c11c000751b1203  COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index f4bf9e5c58..18502da9aa 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.05
+QUOTA_VERSION = 4.06
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
-# We're patching configure.ac
-QUOTA_AUTORECONF = YES
-QUOTA_GETTEXTIZE = YES
 QUOTA_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"
 QUOTA_CONF_OPTS = --disable-pie
 
-- 
2.28.0
