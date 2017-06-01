From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:35:46 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libtasn1: security bump
	to version 4.12
Message-ID: <20170601144624.4EE9E8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4174cdd16fc3bbadfdd90c9f6a270eccdbf60e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-7650: Two errors in the "asn1_find_node()" function
(lib/parser_aux.c) within GnuTLS libtasn1 version 4.10 can be exploited to
cause a stacked-based buffer overflow by tricking a user into processing a
specially crafted assignments file via the e.g.  asn1Coding utility.

For more details, see:

https://secuniaresearch.flexerasoftware.com/secunia_research/2017-11/

Or the 1.4.11 release mail (no mail about 1.4.12, but identical to 1.4.11 +
a soname fix):

https://lists.gnu.org/archive/html/help-libtasn1/2017-05/msg00003.html

Remove 0001-configure-don-t-add-Werror-to-build-flags.patch and autoreconf
as that patch is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2fb7cbeb743e343fcc4aa37d6015b0a523c8b16f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...configure-don-t-add-Werror-to-build-flags.patch | 28 ----------------------
 package/libtasn1/libtasn1.hash                     |  2 +-
 package/libtasn1/libtasn1.mk                       |  4 +---
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch b/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
deleted file mode 100644
index 387ba7a..0000000
--- a/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dd091c8af163213e12aa92f61bc4916e0f102633 Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Tue, 26 Jul 2016 08:45:33 +0200
-Subject: [PATCH] configure: don't add -Werror to build flags
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: upstream
-
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7a14e04..066f5fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,8 +70,6 @@ AC_ARG_ENABLE([gcc-warnings],
- )
- 
- if test "$gl_gcc_warnings" = yes; then
--  gl_WARN_ADD([-Werror], [WERROR_CFLAGS])
--
-   nw="$nw -Wsystem-headers"         # Don't let system headers trigger warnings
-   nw="$nw -Wc++-compat"             # We don't care strongly about C++ compilers
-   nw="$nw -Wtraditional"            # Warns on #elif which we use often
--- 
-2.7.3
-
diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 5b2100e..699c140 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6938a9d2ecd65c920	libtasn1-4.9.tar.gz
+sha256	6753da2e621257f33f5b051cc114d417e5206a0818fe0b1ecfd6153f70934753	libtasn1-4.12.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ac99868..8d3daca 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.9
+LIBTASN1_VERSION = 4.12
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ (tests, tools), LGPLv2.1+ (library)
@@ -12,7 +12,5 @@ LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
-# For 0001-configure-don-t-add-Werror-to-build-flags.patch
-LIBTASN1_AUTORECONF = YES
 
 $(eval $(autotools-package))
