From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:35 -0000
Subject: [Buildroot] [git commit] package/xen: bump version to 4.14.0
Message-ID: <20200902161634.5656C85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=514bbb8520493f69a59dcbfe2ea7f8083d3e5a58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the Xen package to the latest release. We can also remove a patch
to change the CFLAGS as it is no longer required.

The hash of the license file is changed, as ZPL-2.0 is no longer
listed as one of the licenses of 3rd party code imported into Xen.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nclude-linux-limits.h-for-XATTR_SIZE_MAX.patch} |  0
 ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 ----------------------
 package/xen/xen.hash                               |  4 +--
 package/xen/xen.mk                                 |  2 +-
 4 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/xen/0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch b/package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
similarity index 100%
rename from package/xen/0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
rename to package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
diff --git a/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
deleted file mode 100644
index fb316739b4..0000000000
--- a/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8aea14bbd20b04b8fffaf35138ebdcbd39e433a3 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 29 Oct 2016 16:35:26 +0200
-Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
-
-When CFLAGS are passed from the environment, the first-level make
-invocation will append -D__OBJECT_FILE__ to it, then call a second
-make invocation, that will have those new CFLAGS in its environment,
-but will also append -D__OBJECT_FILE__ to those.
-
-Then, the compiler fails because __OBEJECT_FILE__ is defined twice.
-
-Just undefine it before defining it again, as a *workaround* to this
-issue.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- xen/Rules.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xen/Rules.mk b/xen/Rules.mk
-index 3090ea7828..d535bf9e2f 100644
---- a/xen/Rules.mk
-+++ b/xen/Rules.mk
-@@ -61,7 +61,7 @@ CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
- $(call cc-option-add,CFLAGS,CC,-Wvla)
- CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
- CFLAGS-$(CONFIG_DEBUG_INFO) += -g
--CFLAGS += '-D__OBJECT_FILE__="$@"'
-+CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
- 
- ifneq ($(clang),y)
- # Clang doesn't understand this command line argument, and doesn't appear to
--- 
-2.22.0
-
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index ab5f9d9083..709eeb3d45 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b97ce363e55b12c992063f4466c43cba0a6386ceb7a747b4dc670311f337ef01  xen-4.13.1.tar.gz
-sha256  36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3  COPYING
+sha256  06839f68ea7620669dbe8b67861213223cc2a7d02ced61b56e5249c50e87f035  xen-4.14.0.tar.gz
+sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 15742b5127..a30e80e5e7 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.13.1
+XEN_VERSION = 4.14.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
