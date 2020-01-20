From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 20 Jan 2020 09:33:58 -0300
Subject: [Buildroot] [PATCH] package/libpam-tacplus: bump to version 1.5.1
Message-ID: <20200120123358.24267-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Remove all patches, already applied upstream.
- Let PAM module be installed at the default place ($libdir/security).

Fixes:
  http://autobuild.buildroot.net/results/cf15b09bd7501c017a4e8cf9fb80857197d4a433/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Supersedes: https://patchwork.ozlabs.org/patch/1221036/
---
 .../0001-Fix-getrandom-call-in-magic.c.patch  | 30 --------------
 ...Fix-compilation-of-tacc.c-with-GCC-8.patch | 39 -------------------
 package/libpam-tacplus/libpam-tacplus.hash    |  2 +-
 package/libpam-tacplus/libpam-tacplus.mk      |  4 +-
 4 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch
 delete mode 100644 package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch

diff --git a/package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch b/package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch
deleted file mode 100644
index bde717f3f0..0000000000
--- a/package/libpam-tacplus/0001-Fix-getrandom-call-in-magic.c.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5b49ec03b165b8d7c69e196bf1c2780274fbe1ee Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 May 2018 15:47:33 +0200
-Subject: [PATCH] Fix getrandom call in magic.c
-
-_GNU_SOURCE must be defined before any includes to be able to use
-getrandom
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-[Upstream status: https://github.com/jeroennijhof/pam_tacplus/pull/118]
----
- libtac/lib/magic.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libtac/lib/magic.c b/libtac/lib/magic.c
-index 97aa035..a9cbe86 100644
---- a/libtac/lib/magic.c
-+++ b/libtac/lib/magic.c
-@@ -18,6 +18,7 @@
-  * See `CHANGES' file for revision history.
-  */
- 
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #include <sys/types.h>
--- 
-2.14.1
-
diff --git a/package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch b/package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch
deleted file mode 100644
index 2f87b92767..0000000000
--- a/package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4c9635b03d0acf140f65004be9d4822297ee5a35 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.com.br>
-Date: Mon, 10 Dec 2018 17:27:16 -0200
-Subject: [PATCH] Fix compilation of tacc.c with GCC 8
-
-GCC 8 demands that the size of the string copied by strncpy be smaller
-than the size of the destination to keep space for the trailibg '\0':
-
-tacc.c:378:3: error: 'strncpy' specified bound 4 equals destination size [-Werror=stringop-truncation]
-   strncpy(utmpx.ut_id, tty + C_STRLEN("tty"), sizeof(utmpx.ut_id));
-
-Ensure that no more than sizeof(utmpx.ut_id) - 1 characters are copied
-and that a trailing '\0' is stored.
-
-Fixes:
-  http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30/
-
-Signed-off-by: Carlos Santos <casantos@datacom.com.br>
----
- tacc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tacc.c b/tacc.c
-index f61e2d7..3c1a40c 100644
---- a/tacc.c
-+++ b/tacc.c
-@@ -375,7 +375,8 @@ int main(int argc, char **argv) {
- 		utmpx.ut_type = USER_PROCESS;
- 		utmpx.ut_pid = getpid();
- 		xstrcpy(utmpx.ut_line, tty, sizeof(utmpx.ut_line));
--		strncpy(utmpx.ut_id, tty + C_STRLEN("tty"), sizeof(utmpx.ut_id));
-+		strncpy(utmpx.ut_id, tty + C_STRLEN("tty"), sizeof(utmpx.ut_id) - 1);
-+		utmpx.ut_id[sizeof(utmpx.ut_id) - 1] = '\0';
- 		xstrcpy(utmpx.ut_host, "dialup", sizeof(utmpx.ut_host));
- 		utmpx.ut_tv.tv_sec = tv.tv_sec;
- 		utmpx.ut_tv.tv_usec = tv.tv_usec;
--- 
-2.14.5
-
diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
index a40c6a014b..b1cd053f12 100644
--- a/package/libpam-tacplus/libpam-tacplus.hash
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6e1ce4e3194a4d7823a0f0b352485d5028790e4a0974b9a9619f71b07f79a5fa  libpam-tacplus-1.5.0-beta.2.tar.gz
+sha256 82f204b949b2a55d0711b314c6e3b213bd1c0c1ee0d9ba15680570db22bff2d8  libpam-tacplus-1.5.1.tar.gz
 sha256 b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index 9922199420..f69d275cb6 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAM_TACPLUS_VERSION = 1.5.0-beta.2
+LIBPAM_TACPLUS_VERSION = 1.5.1
 LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
@@ -14,7 +14,5 @@ LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
 LIBPAM_TACPLUS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
-LIBPAM_TACPLUS_CONF_OPTS = \
-	--enable-pamdir=/lib/security
 
 $(eval $(autotools-package))
-- 
2.18.2
