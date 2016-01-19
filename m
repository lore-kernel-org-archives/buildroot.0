From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Tue, 19 Jan 2016 16:19:49 +0000
Subject: [Buildroot] [PATCH] package/radlib: New package
Message-ID: <1453220389.3109.32.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

radlib is a rapid application development library for unix
multi-process applications. It uses SYS V IPC facilities and
FIFOs to provide an RTOS-like, event-driven, distributed
framework. Processes may be run as daemons or have a controlling
terminal.

Signed-off-by: Ray Kinsella <ray.kinsella at intel.com<mailto:ray.kinsella@intel.com>>
---
 package/Config.in                                |   1 +
 package/radlib/0001-cross_compile_link_bug.patch | 163 +++++++++++++++++++++++
 package/radlib/Config.in                         |  22 +++
 package/radlib/radlib.hash                       |   1 +
 package/radlib/radlib.mk                         |  30 +++++
 5 files changed, 217 insertions(+)
 create mode 100644 package/radlib/0001-cross_compile_link_bug.patch
 create mode 100644 package/radlib/Config.in
 create mode 100644 package/radlib/radlib.hash
 create mode 100644 package/radlib/radlib.mk

diff --git a/package/Config.in b/package/Config.in
index b04c690..b971494 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1216,6 +1216,7 @@ endif
        source "package/protobuf-c/Config.in"
        source "package/qhull/Config.in"
        source "package/qlibc/Config.in"
+        source "package/radlib/Config.in"
        source "package/startup-notification/Config.in"
        source "package/tz/Config.in"
        source "package/tzdata/Config.in"
diff --git a/package/radlib/0001-cross_compile_link_bug.patch b/package/radlib/0001-cross_compile_link_bug.patch
new file mode 100644
index 0000000..a532f93
--- /dev/null
+++ b/package/radlib/0001-cross_compile_link_bug.patch
@@ -0,0 +1,163 @@
+diff -Naur a/debug/Makefile.am b/debug/Makefile.am
+--- a/debug/Makefile.am        2016-01-12 14:33:24.655252603 +0000
++++ b/debug/Makefile.am        2016-01-12 14:33:37.858601971 +0000
+@@ -27,8 +27,8 @@
+ endif
+
+ # define library directories
+-raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
+-INCLUDES         += -I$(prefix)/include -I/usr/include
++raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib
++INCLUDES         += -I$(prefix)/include
+
+ if MYSQL
+ raddebug_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
+@@ -39,6 +39,6 @@
+ endif
+ endif
+
+-if CROSSCOMPILE
+-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
+-endif
++#if CROSSCOMPILE
++#raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
++#endif
+diff -Naur a/debug/Makefile.in b/debug/Makefile.in
+--- a/debug/Makefile.in        2016-01-12 14:33:24.655252603 +0000
++++ b/debug/Makefile.in        2016-01-12 14:34:05.062321796 +0000
+@@ -43,7 +43,7 @@
+ @MYSQL_TRUE at am__append_4 = -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
+ @MYSQL_FALSE@@PGRESQL_TRUE at am__append_5 = -L$(prefix)/pgsql/lib
+ @MYSQL_FALSE@@PGRESQL_TRUE at am__append_6 = -I$(prefix)/pgsql/include
+- at CROSSCOMPILE_TRUE@am__append_7 = $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
++#@CROSSCOMPILE_TRUE at am__append_7 = $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
+ subdir = debug
+ DIST_COMMON = $(srcdir)/Makefile.am $(srcdir)/Makefile.in
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+@@ -198,7 +198,7 @@
+
+ # define include directories
+ INCLUDES = -I$(top_srcdir)/h -D_GNU_SOURCE -I$(prefix)/include \
+-      -I/usr/include $(am__append_6)
++      $(am__append_6)
+
+ # define the sources
+ raddebug_SOURCES = \
+diff -Naur a/msgRouter/Makefile.am b/msgRouter/Makefile.am
+--- a/msgRouter/Makefile.am    2016-01-12 14:33:24.656252630 +0000
++++ b/msgRouter/Makefile.am    2016-01-12 14:33:37.859601998 +0000
+@@ -27,8 +27,8 @@
+ endif
+
+ # define library directories
+-radmrouted_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
+-INCLUDES           += -I$(prefix)/include -I/usr/include
++radmrouted_LDFLAGS = -L../src/.libs -L$(prefix)/lib
++INCLUDES           += -I$(prefix)/include
+
+ if MYSQL
+ radmrouted_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
+@@ -39,6 +39,6 @@
+ endif
+ endif
+
+-if CROSSCOMPILE
+-radmrouted_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
+-endif
++#if CROSSCOMPILE
++#radmrouted_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
++#endif
+diff -Naur a/msgRouter/Makefile.in b/msgRouter/Makefile.in
+--- a/msgRouter/Makefile.in    2016-01-12 14:33:24.655252603 +0000
++++ b/msgRouter/Makefile.in    2016-01-12 14:34:16.740630810 +0000
+@@ -43,7 +43,7 @@
+ @MYSQL_TRUE at am__append_4 = -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
+ @MYSQL_FALSE@@PGRESQL_TRUE at am__append_5 = -L$(prefix)/lib -L$(prefix)/pgsql/lib
+ @MYSQL_FALSE@@PGRESQL_TRUE at am__append_6 = -I$(prefix)/pgsql/include
+- at CROSSCOMPILE_TRUE@am__append_7 = $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
++#@CROSSCOMPILE_TRUE at am__append_7 = $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
+ subdir = msgRouter
+ DIST_COMMON = $(srcdir)/Makefile.am $(srcdir)/Makefile.in
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+@@ -198,7 +198,7 @@
+
+ # define include directories
+ INCLUDES = -I$(top_srcdir)/h -D_GNU_SOURCE -I$(prefix)/include \
+-      -I/usr/include $(am__append_6)
++      $(am__append_6)
+
+ # define the sources
+ radmrouted_SOURCES = \
+diff -Naur a/src/Makefile.am b/src/Makefile.am
+--- a/src/Makefile.am  2016-01-12 14:33:24.643252285 +0000
++++ b/src/Makefile.am  2016-01-12 14:35:06.261941170 +0000
+@@ -14,8 +14,7 @@
+
+ if MYSQL
+ MY_INCLUDES   = \
+-              -I$(prefix)/include/mysql \
+-              -I/usr/include/mysql
++              -I$(prefix)/include/mysql
+ MY_SOURCES    = \
+               $(top_srcdir)/database/mysql/my_database.c \
+               $(top_srcdir)/src/raddatabase.c
+@@ -24,8 +23,7 @@
+ endif
+ if PGRESQL
+ PG_INCLUDES   = \
+-              -I$(prefix)/include \
+-              -I/usr/include
++              -I$(prefix)/include
+ PG_SOURCES    = \
+               $(top_srcdir)/database/postgresql/pg_database.c \
+               $(top_srcdir)/src/raddatabase.c
+@@ -34,9 +32,6 @@
+               $(top_srcdir)/database/postgresql/_pg-types.h
+ endif
+ if SQLITE
+-SQ_INCLUDES   = \
+-              -I$(prefix)/include \
+-              -I/usr/include
+ SQ_SOURCES    = \
+               $(top_srcdir)/src/radsqlite.c
+ SQLITE_HDRS   = \
+@@ -46,11 +41,9 @@
+ # define include directories
+ INCLUDES = \
+               -I$(top_srcdir)/h \
+-              -I$(prefix)/include \
+               -D_GNU_SOURCE \
+               $(MY_INCLUDES) \
+-              $(PG_INCLUDES) \
+-              $(SQ_INCLUDES)
++              $(PG_INCLUDES)
+
+
+
+diff -Naur a/src/Makefile.in b/src/Makefile.in
+--- a/src/Makefile.in  2016-01-12 14:33:24.640252206 +0000
++++ b/src/Makefile.in  2016-01-12 14:34:38.655210681 +0000
+@@ -300,7 +300,6 @@
+ lib_LTLIBRARIES = librad.la
+ @MYSQL_TRUE at MY_INCLUDES = \
+ @MYSQL_TRUE@          -I$(prefix)/include/mysql \
+- at MYSQL_TRUE@          -I/usr/include/mysql
+
+ @MYSQL_TRUE at MY_SOURCES = \
+ @MYSQL_TRUE@          $(top_srcdir)/database/mysql/my_database.c \
+@@ -311,7 +310,6 @@
+
+ @PGRESQL_TRUE at PG_INCLUDES = \
+ @PGRESQL_TRUE@                -I$(prefix)/include \
+- at PGRESQL_TRUE@                -I/usr/include
+
+ @PGRESQL_TRUE at PG_SOURCES = \
+ @PGRESQL_TRUE@                $(top_srcdir)/database/postgresql/pg_database.c \
+@@ -323,7 +321,6 @@
+
+ @SQLITE_TRUE at SQ_INCLUDES = \
+ @SQLITE_TRUE@         -I$(prefix)/include \
+- at SQLITE_TRUE@         -I/usr/include
+
+ @SQLITE_TRUE at SQ_SOURCES = \
+ @SQLITE_TRUE@         $(top_srcdir)/src/radsqlite.c
diff --git a/package/radlib/Config.in b/package/radlib/Config.in
new file mode 100644
index 0000000..2ca1617
--- /dev/null
+++ b/package/radlib/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_RADLIB
+       bool "radlib"
+       select BR2_PACKAGE_SQLITE
+       select BR2_PACKAGE_SQLITE_NO_SYNC
+       help
+         radlib is a rapid application development library for unix
+         multi-process applications. It uses SYS V IPC facilities and
+         FIFOs to provide an RTOS-like, event-driven, distributed framework.
+         Processes may be run as daemons or have a controlling terminal.
+
+         http://sourceforge.net/projects/radlib/
+
+if BR2_PACKAGE_RADLIB
+
+config BR2_PACKAGE_RADLIB_MYSQL$
+       bool "Enable MYSQL support in Radlib"
+       select BR2_PACKAGE_MYSQL
+       help$
+         radlib supports multiple database backends
+         selecting this option enables the mysql backend.
+
+endif
diff --git a/package/radlib/radlib.hash b/package/radlib/radlib.hash
new file mode 100644
index 0000000..ccbd532
--- /dev/null
+++ b/package/radlib/radlib.hash
@@ -0,0 +1 @@
+sha256  82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66  radlib-2.12.0.tar.gz
diff --git a/package/radlib/radlib.mk b/package/radlib/radlib.mk
new file mode 100644
index 0000000..3dc48f8
--- /dev/null
+++ b/package/radlib/radlib.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# RADLib
+#
+################################################################################
+
+RADLIB_VERSION = 2.12.0
+RADLIB_SOURCE = radlib-$(RADLIB_VERSION).tar.gz
+RADLIB_SITE = http://downloads.sourceforge.net/radlib
+RADLIB_INSTALL_STAGING = YES
+RADLIB_LICENSE = BSD 2 Clause
+RADLIB_LICENSE_FILES = COPYING
+RADLIB_DEPENDENCIES += sqlite
+
+RADLIB_CONF_OPTS += --enable-sqlite --prefix=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
+RADLIB_CONF_OPTS += --enable-mysql
+endif
+
+define RADLIB_INSTALL_STAGING_CMDS
+       $(MAKE) exec_prefix=$(STAGING_DIR) install -C $(@D)/
+endef
+
+define RADLIB_INSTALL_TARGET_CMDS
+       $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)/
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
--
2.4.3
