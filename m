From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:58:24 +0100
Subject: [Buildroot] [git commit] keepalived: bump to version 2.0.10
Message-ID: <20181202071557.ACE8C814B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75d2073e033bc9d4180ff8c94a4504f1b9d8d9d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- This version adds support for ipset version 7, see:
  https://github.com/acassen/keepalived/commit/b7a98f9265ffb5927c4d54c9a30726c76e65bb52
- Remove patch and AUTORECONF = YES, an alternative solution has been
  implemented, see:
  https://github.com/acassen/keepalived/commit/9bd10d8168b8e3c14bca61e504e64ed8c2b1eb8d
- Disable hardening option (enabled by default):
  https://github.com/acassen/keepalived/commit/5a65e1eb552bd973da35d7153b922682360a5ad2

Fixes:
 - http://autobuild.buildroot.org/results/b730e8b25c1d3343b7a6d73f6d3b82b13692578b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-do-not-force-PIE.patch       | 38 ----------------------
 package/keepalived/keepalived.hash                 |  2 +-
 package/keepalived/keepalived.mk                   |  5 ++-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/keepalived/0001-configure.ac-do-not-force-PIE.patch b/package/keepalived/0001-configure.ac-do-not-force-PIE.patch
deleted file mode 100644
index b51a4e334b..0000000000
--- a/package/keepalived/0001-configure.ac-do-not-force-PIE.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4da31a615412e15f7658d21770708e8084be149c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 4 Apr 2018 22:29:45 +0200
-Subject: [PATCH] configure.ac: do not force PIE
-
-PIE is not necessarily supported on all architectures, so leave it up
-to the user to pass the appropriate CFLAGS/LDFLAGS if he wants to use
-PIE.
-
-This fixes the build on the m68k and Microblaze architecture:
-
-  http://autobuild.buildroot.net/results/a536f5947b3b70fdaecad1af5542572c504ad046/
-  http://autobuild.buildroot.net/results/0ffbf1e8d181c9463847a5b2be6f9baa18face24/
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/acassen/keepalived/pull/830
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c344f07e..06545c91 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -233,8 +233,8 @@ AC_SUBST(ARFLAGS)
- # AC_PROG_LIBTOOL
- 
- KA_CPPFLAGS="$kernelinc"
--KA_CFLAGS="-Wall -Wunused -Wstrict-prototypes -Wextra -g -O2 -fPIE -D_GNU_SOURCE"
--KA_LDFLAGS="-pie"
-+KA_CFLAGS="-Wall -Wunused -Wstrict-prototypes -Wextra -g -O2 -D_GNU_SOURCE"
-+KA_LDFLAGS=""
- KA_LIBS=
- NEED_LIBDL=No
- #KA_LIBTOOLFLAGS =
--- 
-2.14.3
-
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index ed7d2fb0a0..3ad3e6e6ac 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	4e2d7cc01a6ee29a3955f5c622d47704ba7d9dd758189f15e9def016a2d1faa3  keepalived-1.4.2.tar.gz
+sha256	40e0e55afed9ca313d621a9c5878579696fafb5504dab521aadaf20ba6e7f597  keepalived-2.0.10.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index ed80a79f8a..584da6bb48 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 1.4.2
+KEEPALIVED_VERSION = 2.0.10
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
-# 0001-configure.ac-do-not-force-PIE.patch
-KEEPALIVED_AUTORECONF = YES
+KEEPALIVED_CONF_OPTS = --disable-hardening
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
