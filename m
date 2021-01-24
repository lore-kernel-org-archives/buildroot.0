From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:19:10 +0100
Subject: [Buildroot] [git commit] package/sysklogd: bump to verson 2.2.0
Message-ID: <20210124091900.EF37B83547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48622f42152e16d1d306148b220efa05a343f040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Prefer maintainer provided package, not GitHub generated archive
- Local backport of O_CLOEXEC patch not needed anymore, in v2.2.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr:
  - keep the exec-prefix and without-logger option
  - offload the systemd service changes to its own commit
  - adapt commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...U_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch | 44 ----------------------
 package/sysklogd/sysklogd.hash                     |  2 +-
 package/sysklogd/sysklogd.mk                       |  6 +--
 3 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch b/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
deleted file mode 100644
index 684b6b3e4c..0000000000
--- a/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 93117e58016de6f604e67263b5135adbba032367 Mon Sep 17 00:00:00 2001
-From: Joachim Wiberg <troglobit@gmail.com>
-Date: Sun, 30 Aug 2020 11:41:45 +0200
-Subject: [PATCH] Define _GNU_SOURCE, required for O_CLOEXEC on uClibc
-
-When building sysklogd on a uClibc system we must define _GNU_SOURCE to
-get O_CLOEXEC.
-
-Since _GNU_SOURCE is also required for asprintf() with GLIBC, as used by
-the pidfile() replacement function, we drop it from there and rely on
-AM_CPPFLAGS for all sources.
-
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
-Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
----
- lib/pidfile.c   | 1 -
- src/Makefile.am | 2 +-
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/pidfile.c b/lib/pidfile.c
-index a26de73..886a29c 100644
---- a/lib/pidfile.c
-+++ b/lib/pidfile.c
-@@ -31,7 +31,6 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#define _GNU_SOURCE		/* Needed with GLIBC to get asprintf() */
- #include <sys/stat.h>		/* utimensat() */
- #include <sys/time.h>		/* utimensat() on *BSD */
- #include <sys/types.h>
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 9b80a02..1909ada 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -36,7 +36,7 @@ endif
- AM_CFLAGS             = -W -Wall -Wextra
- AM_CFLAGS            += -Wno-unused-result -Wno-unused-parameter -fno-strict-aliasing
- AM_CPPFLAGS           = -DSYSCONFDIR=\"@sysconfdir@\" -DRUNSTATEDIR=\"@runstatedir@\"
--AM_CPPFLAGS          += -D_BSD_SOURCE -D_DEFAULT_SOURCE
-+AM_CPPFLAGS          += -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE
- 
- syslogd_SOURCES       = syslogd.c syslogd.h socket.c socket.h syslog.h
- syslogd_SOURCES      += timer.c timer.h queue.h compat.h
diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 978a670d30..91550aa0dc 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702  sysklogd-2.1.2.tar.gz
+sha256  60546ae50a9f30b31c19ed9a3ad788ce5798025b0f9a0d552c1a04d5eeac494d  sysklogd-2.2.0.tar.gz
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 200738897d..417b5dc68e 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.1.2
-SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
+SYSKLOGD_VERSION = 2.2.0
+SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_CPE_ID_VALID = YES
-# From git
-SYSKLOGD_AUTORECONF = YES
 SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
