From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 12:13:47 +0200
Subject: [Buildroot] [git commit] monkey: new package
Message-ID: <20150630102332.ADD8281790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=372113ff935ca0fba607c5455dbadd5f410efa24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Monkey is a small, fast and lightweight open source Web Server for
GNU/Linux.  It has been designed with focus in embedded devices,
therefore its scalable by nature having a low memory and CPU
consumption and an excellent performance.

[Thomas:
  - Add missing dependency on !BR2_STATIC_LIBS (the source code uses
    dlopen) and BR2_USE_MMU (the source code uses fork)
  - Slightly adjust/reword the description of the
    BR2_PACKAGE_MONKEY_SHARED option.
  - Remove all the complicated installation logic for the target, and
    just use "make install" instead.
  - Pass --no-backtrace when uClibc is used, otherwise the build fails
    because <execinfo.h> is not available in uClibc.
  - Pass $(TARGET_CONFIGURE_OPTS) in the environment of the configure
    script., otherwise monkey gets built for the host and not for the
    target.
  - Add a post install target hook to remove a broken symlink
    libmonkey.so installed by Monkey's Makefile when the shared
    library is not enabled.
  - Use TARGET_MAKE_ENV when calling make, just because we should.
  - Pass --malloc-libc so that the libc malloc() is used instead of
    the builtin jemalloc allocator, which requires more work to
    cross-compile properly.
  - Add missing empty line after the .mk header and before the first
    variable definition.]

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/monkey/Config.in   |   23 ++++++++++++++
 package/monkey/monkey.hash |    3 ++
 package/monkey/monkey.mk   |   69 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c2f6524..477cc47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1226,6 +1226,7 @@ endif
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
+	source "package/monkey/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
diff --git a/package/monkey/Config.in b/package/monkey/Config.in
new file mode 100644
index 0000000..001c415
--- /dev/null
+++ b/package/monkey/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_MONKEY
+	bool "monkey"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_USE_MMU # fork()
+	help
+	  Monkey Server is a fast and lightweight web server for Linux platforms.
+
+	  http://monkey-project.com/
+
+if BR2_PACKAGE_MONKEY
+
+config BR2_PACKAGE_MONKEY_SHARED
+	bool "install shared library"
+	help
+	  Build Monkey as a shared library in addition to stand-alone
+	  server
+
+endif
+
+comment "monkey needs an toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
new file mode 100644
index 0000000..6c7eada
--- /dev/null
+++ b/package/monkey/monkey.hash
@@ -0,0 +1,3 @@
+# md5 from http://monkey-project.com/releases/1.5/monkey-1.5.6.tar.gz.md5, sha256 locally computed:
+md5    9699e4c9ea6ce6b989907c252ae80254 				monkey-1.5.6.tar.gz
+sha256 7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22	monkey-1.5.6.tar.gz
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
new file mode 100644
index 0000000..2344f8c
--- /dev/null
+++ b/package/monkey/monkey.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# monkey
+#
+################################################################################
+
+MONKEY_VERSION_MAJOR = 1.5
+MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
+MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
+MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
+MONKEY_LICENCE = Apache-2.0
+MONKEY_LICENCE_FILE = LICENSE
+
+# This package has a configure script, but it's not using
+# autoconf/automake, so we're using the generic-package
+# infrastructure.
+
+MONKEY_CONF_OPTS = \
+	--prefix=/usr \
+	--sysconfdir=/etc/monkey \
+	--datadir=/var/www \
+	--mandir=/usr/share/man \
+	--logdir=/var/log \
+	--pidfile=/var/run \
+	--plugdir=/usr/lib/monkey \
+	--malloc-libc
+
+# --uclib-mode is not a typo
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+MONKEY_CONF_OPTS += --uclib-mode --no-backtrace
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+MONKEY_CONF_OPTS += --musl-mode
+endif
+
+ifeq ($(BR2_PACKAGE_MONKEY_SHARED),y)
+MONKEY_CONF_OPTS += --enable-shared
+MONKEY_INSTALL_STAGING = YES
+else
+# Even without --enable-shared, the monkey build system leaves a
+# broken libmonkey.so symbolic link.
+define MONKEY_REMOVE_DANGLING_SYMLINK
+	$(RM) -f $(TARGET_DIR)/usr/lib/libmonkey.so
+endef
+MONKEY_POST_INSTALL_TARGET_HOOKS += MONKEY_REMOVE_DANGLING_SYMLINK
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+MONKEY_CONF_OPT += --debug
+endif
+
+define MONKEY_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MONKEY_CONF_OPTS))
+endef
+
+define MONKEY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define MONKEY_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define MONKEY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
