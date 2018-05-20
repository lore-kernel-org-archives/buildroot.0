From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 17:02:17 +0200
Subject: [Buildroot] [git commit branch/next] libpam-tacplus: bump to
 version 1.5.0-beta.2
Message-ID: <20180520164014.431C280737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ed82d44ccdc8f9bfd2d91fd58dcb02cb4656415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Remove LIBPAM_TACPLUS_AUTORECONF_OPTS as m4 directory doesn't exist
  anymore
- Add patch to fix getrandom call (sent upstream)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-getrandom-call-in-magic.c.patch       | 30 ++++++++++++++++++++++
 package/libpam-tacplus/libpam-tacplus.hash         |  3 ++-
 package/libpam-tacplus/libpam-tacplus.mk           |  3 +--
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch b/package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch
new file mode 100644
index 0000000000..bde717f3f0
--- /dev/null
+++ b/package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch
@@ -0,0 +1,30 @@
+From 5b49ec03b165b8d7c69e196bf1c2780274fbe1ee Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 May 2018 15:47:33 +0200
+Subject: [PATCH] Fix getrandom call in magic.c
+
+_GNU_SOURCE must be defined before any includes to be able to use
+getrandom
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+[Upstream status: https://github.com/jeroennijhof/pam_tacplus/pull/118]
+---
+ libtac/lib/magic.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libtac/lib/magic.c b/libtac/lib/magic.c
+index 97aa035..a9cbe86 100644
+--- a/libtac/lib/magic.c
++++ b/libtac/lib/magic.c
+@@ -18,6 +18,7 @@
+  * See `CHANGES' file for revision history.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+-- 
+2.14.1
+
diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
index c8a772322e..ba014347ec 100644
--- a/package/libpam-tacplus/libpam-tacplus.hash
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 747f7ad980a3726ed3abc5fec92e867efa8af8c53caac547cab7eb6af5ce0edf  libpam-tacplus-1.3.9.tar.gz
+sha256 6e1ce4e3194a4d7823a0f0b352485d5028790e4a0974b9a9619f71b07f79a5fa  libpam-tacplus-v1.5.0-beta.2.tar.gz
+sha256 b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index f43e2b9a49..eebe297f79 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBPAM_TACPLUS_VERSION = 1.3.9
+LIBPAM_TACPLUS_VERSION = v1.5.0-beta.2
 LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,$(LIBPAM_TACPLUS_VERSION))
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
 LIBPAM_TACPLUS_DEPENDENCIES = linux-pam
 # Fetching from github, we need to generate the configure script
 LIBPAM_TACPLUS_AUTORECONF = YES
-LIBPAM_TACPLUS_AUTORECONF_OPTS = -I m4
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
 LIBPAM_TACPLUS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
