From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Aug 2020 20:36:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/thermald: disable werror
In-Reply-To: <20200817183612.2826191-1-fontaine.fabrice@gmail.com>
References: <20200817183612.2826191-1-fontaine.fabrice@gmail.com>
Message-ID: <20200817183612.2826191-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/80a126c225a9e9cbfdc30882c4ce00517d853d8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....ac-allow-the-user-to-disable-Werror.patch | 51 +++++++++++++++++++
 package/thermald/thermald.mk                  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 package/thermald/0001-configure.ac-allow-the-user-to-disable-Werror.patch

diff --git a/package/thermald/0001-configure.ac-allow-the-user-to-disable-Werror.patch b/package/thermald/0001-configure.ac-allow-the-user-to-disable-Werror.patch
new file mode 100644
index 0000000000..3aea5d4247
--- /dev/null
+++ b/package/thermald/0001-configure.ac-allow-the-user-to-disable-Werror.patch
@@ -0,0 +1,51 @@
+From 65afca34f76f6e3c955569988c0de3a6f8be8710 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 17 Aug 2020 09:49:15 +0200
+Subject: [PATCH] configure.ac: allow the user to disable -Werror
+
+This will fix the following build failure which is related to glib:
+
+In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gthread.h:32:0,
+                 from /home/buildroot/autobuild/run/instance-1/output-1/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
+                 from /home/buildroot/autobuild/run/instance-1/output-1/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:32,
+                 from src/thermald.h:70,
+                 from src/thd_dbus_interface.cpp:25:
+src/thd_dbus_interface.cpp: In function 'GType pref_object_get_type()':
+/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gatomic.h:128:15: error: variable 'gapg_temp_atomic' set but not used [-Werror=unused-but-set-variable]
+     gpointer *gapg_temp_atomic = (gpointer *)(atomic);                       \
+               ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/80a126c225a9e9cbfdc30882c4ce00517d853d8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/intel/thermal_daemon/pull/251]
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0e81ebc..71aeb54 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -95,7 +95,6 @@ for flag in \
+     -Wall \
+     -Wclobbered \
+     -Wempty-body \
+-    -Werror \
+     -Wformat \
+     -Wignored-qualifiers \
+     -Wmissing-field-initializers \
+@@ -111,6 +110,9 @@ for flag in \
+ done
+ ], [AC_MSG_ERROR([AX_CHECK_COMPILE_FLAG not found, you'll need to install autoconf-archive])])
+ 
++AC_ARG_ENABLE(werror, AS_HELP_STRING([--disable-werror], [Disable -Werror]))
++AS_IF([test "x$enable_werror" != "xno"], [CXXFLAGS="$CXXFLAGS -Werror"])
++
+ AC_CONFIG_FILES([Makefile
+                  docs/Makefile
+                  docs/version.xml
+-- 
+2.27.0
+
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 3c0356a04d..27e657a56d 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -15,6 +15,7 @@ THERMALD_DEPENDENCIES = \
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
 THERMALD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+THERMALD_CONF_OPTS = --disable-werror
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 THERMALD_DEPENDENCIES += systemd
-- 
2.27.0
