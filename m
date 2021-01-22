From: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 22 Jan 2021 16:43:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/sysklogd: bump to verson 2.2.0
In-Reply-To: <20210122154333.1927190-1-troglobit@gmail.com>
References: <20210122154333.1927190-1-troglobit@gmail.com>
Message-ID: <20210122154333.1927190-2-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Prefer maintainer provided package, not GitHub generated archive
- Local backport of O_CLOEXEC patch not needed anymore, in v2.2.0
- Install to /usr, with config in /etc and logs in /var
- Update systemd unit file
  - New daemon path, /usr/sbin
  - Add support for /etc/default/syslogd, same as SysV init script

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...RCE_required_for_O_CLOEXEC_on_uClibc.patch | 44 -------------------
 package/sysklogd/sysklogd.hash                |  2 +-
 package/sysklogd/sysklogd.mk                  |  8 ++--
 package/sysklogd/syslogd.service              |  3 +-
 4 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch

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
index 200738897d..fc54ab6936 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,14 +4,12 @@
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
-SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
+SYSKLOGD_CONF_OPTS =  --prefix=/usr --sysconfdir=/etc --localstatedir=/var
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
index 1bf1bb3bd9..0e14369596 100644
--- a/package/sysklogd/syslogd.service
+++ b/package/sysklogd/syslogd.service
@@ -3,7 +3,8 @@ Description=System Logging Service
 Requires=syslog.socket
 
 [Service]
-ExecStart=/sbin/syslogd -m 0 -F
+EnvironmentFile=-/etc/default/syslogd
+ExecStart=/usr/sbin/syslogd -m 0 -F $SYSLOGD_ARGS
 StandardOutput=null
 Restart=on-failure
 
-- 
2.25.1
