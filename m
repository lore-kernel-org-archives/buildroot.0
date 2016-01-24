From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 13:54:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/ulogd: fix musl build
Message-ID: <1453640065-31280-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Adding -D_GNU_SOURCE to CFLAGS was inspired by
https://gitlab.labs.nic.cz/turris/turris-os-packages/commit/cd3f916b4c6b1929621c568a81db82f2936da1d4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ulogd/0001-musl-compat.patch | 65 ++++++++++++++++++++++++++++++++++++
 package/ulogd/ulogd.mk               |  2 ++
 2 files changed, 67 insertions(+)
 create mode 100644 package/ulogd/0001-musl-compat.patch

diff --git a/package/ulogd/0001-musl-compat.patch b/package/ulogd/0001-musl-compat.patch
new file mode 100644
index 0000000..a656812
--- /dev/null
+++ b/package/ulogd/0001-musl-compat.patch
@@ -0,0 +1,65 @@
+Fix musl build
+
+Downloaded from
+https://github.com/openwrt/packages/blob/master/net/ulogd/patches/100-musl-compat.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+--- a/src/ulogd.c
++++ b/src/ulogd.c
+@@ -83,7 +83,7 @@ static char *ulogd_logfile = NULL;
+ static const char *ulogd_configfile = ULOGD_CONFIGFILE;
+ static const char *ulogd_pidfile = NULL;
+ static int ulogd_pidfile_fd = -1;
+-static FILE syslog_dummy;
++static int ulogd_use_syslog = 0;
+ 
+ static int info_mode = 0;
+ 
+@@ -427,7 +427,7 @@ void __ulogd_log(int level, char *file,
+ 	if (level < loglevel_ce.u.value)
+ 		return;
+ 
+-	if (logfile == &syslog_dummy) {
++	if (ulogd_use_syslog) {
+ 		/* FIXME: this omits the 'file' string */
+ 		va_start(ap, format);
+ 		vsyslog(ulogd2syslog_level(level), format, ap);
+@@ -950,7 +950,7 @@ static int logfile_open(const char *name
+ 		logfile = stdout;
+ 	} else if (!strcmp(name, "syslog")) {
+ 		openlog("ulogd", LOG_PID, LOG_DAEMON);
+-		logfile = &syslog_dummy;
++		ulogd_use_syslog = 1;
+ 	} else {
+ 		logfile = fopen(ulogd_logfile, "a");
+ 		if (!logfile) {
+@@ -1240,7 +1240,7 @@ static void sigterm_handler(int signal)
+ 	unload_plugins();
+ #endif
+ 
+-	if (logfile != NULL  && logfile != stdout && logfile != &syslog_dummy) {
++	if (logfile != NULL  && logfile != stdout) {
+ 		fclose(logfile);
+ 		logfile = NULL;
+ 	}
+@@ -1262,7 +1262,7 @@ static void signal_handler(int signal)
+ 	switch (signal) {
+ 	case SIGHUP:
+ 		/* reopen logfile */
+-		if (logfile != stdout && logfile != &syslog_dummy) {
++		if (logfile != NULL && logfile != stdout) {
+ 			fclose(logfile);
+ 			logfile = fopen(ulogd_logfile, "a");
+  			if (!logfile) {
+--- a/filter/raw2packet/ulogd_raw2packet_BASE.c
++++ b/filter/raw2packet/ulogd_raw2packet_BASE.c
+@@ -42,6 +42,7 @@
+ #include <ulogd/ulogd.h>
+ #include <ulogd/ipfix_protocol.h>
+ #include <netinet/if_ether.h>
++#include <linux/types.h>
+ #include <string.h>
+ 
+ enum input_keys {
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7730198..6e7a430 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -14,6 +14,8 @@ ULOGD_DEPENDENCIES = host-pkgconf \
 ULOGD_LICENSE = GPLv2
 ULOGD_LICENSE_FILES = COPYING
 
+ULOGD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-- 
2.7.0.rc3
