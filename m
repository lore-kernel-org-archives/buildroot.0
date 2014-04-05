From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 18:31:51 +0200
Subject: [Buildroot] [git commit] exim: new package
Message-ID: <20140405163218.694F89C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74396948333f93278eaae5b3227d95cb830efee7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use $(INSTALL) instead of install
 - add AR and RANLIB variables in the local makefiles, so that the
   cross toolchain ar and ranlib utilities are used instead of the
   native ones.
 - move the init script initialization to the EXIM_INSTALL_INIT_SYSV
   variable.
 - Use parenthesis instead of curly braces to reference TARGET_DIR.]

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/exim/Config.in                             |    9 ++++
 package/exim/Local-Makefile                        |   15 ++++++
 package/exim/S86exim                               |   26 +++++++++++
 .../exim/exim-Build-buildconfig-for-the-host.patch |   23 ++++++++++
 ...n-t-make-backup-copies-of-installed-files.patch |   40 +++++++++++++++++
 ...ip-version-check-and-symlink-installation.patch |   40 +++++++++++++++++
 package/exim/exim.mk                               |   46 ++++++++++++++++++++
 8 files changed, 200 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e816603..945c7ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,6 +897,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/exim/Config.in"
 source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
diff --git a/package/exim/Config.in b/package/exim/Config.in
new file mode 100644
index 0000000..70038a2
--- /dev/null
+++ b/package/exim/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_EXIM
+	bool "exim"
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  Exim is a message transfer agent (MTA) developed at the University of
+	  Cambridge for use on Unix systems connected to the Internet.
+
+	  http://www.exim.org/
diff --git a/package/exim/Local-Makefile b/package/exim/Local-Makefile
new file mode 100644
index 0000000..191f0e0
--- /dev/null
+++ b/package/exim/Local-Makefile
@@ -0,0 +1,15 @@
+BIN_DIRECTORY=/usr/sbin
+CONFIGURE_FILE=/etc/exim/configure
+EXIM_USER=ref:exim
+EXIM_GROUP=mail
+SPOOL_DIRECTORY=/var/spool/exim
+ROUTER_ACCEPT=yes
+TRANSPORT_LMTP=yes
+LOOKUP_DBM=yes
+LOOKUP_LSEARCH=yes
+PCRE_LIBS=-lpcre
+FIXED_NEVER_USERS=root
+HEADERS_CHARSET="ISO-8859-1"
+HAVE_ICONV=no
+SYSLOG_LOG_PID=yes
+TMPDIR="/tmp"
diff --git a/package/exim/S86exim b/package/exim/S86exim
new file mode 100644
index 0000000..8c01b29
--- /dev/null
+++ b/package/exim/S86exim
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# Start/stop exim
+#
+
+PIDFILE=/var/lock/exim/exim-daemon.pid
+
+case "$1" in
+  start)
+	echo "Starting exim..."
+	start-stop-daemon -S -x exim -- -bd
+	;;
+  stop)
+	echo -n "Stopping exim..."
+	start-stop-daemon -K -o -p $PIDFILE
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/exim/exim-Build-buildconfig-for-the-host.patch b/package/exim/exim-Build-buildconfig-for-the-host.patch
new file mode 100644
index 0000000..a926fbd
--- /dev/null
+++ b/package/exim/exim-Build-buildconfig-for-the-host.patch
@@ -0,0 +1,23 @@
+buildconfig is meant to be executed on the host, so it has to be compiled
+using $(HOSTCC), not $(CC).
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ OS/Makefile-Base |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/OS/Makefile-Base b/OS/Makefile-Base
+index 29a6ad3..420ba60 100644
+--- a/OS/Makefile-Base
++++ b/OS/Makefile-Base
+@@ -114,8 +114,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
+ 
+ # Targets for special-purpose configuration header builders
+ buildconfig: buildconfig.c
+-	@echo "$(CC) buildconfig.c"
+-	$(FE)$(CC) $(CFLAGS) $(INCLUDE) -o buildconfig buildconfig.c $(LIBS)
++	@echo "$(HOSTCC) buildconfig.c"
++	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c $(LIBS)
+ 
+ 
+ # Target for the exicyclog utility script
diff --git a/package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
new file mode 100644
index 0000000..0cdaa74
--- /dev/null
+++ b/package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
@@ -0,0 +1,40 @@
+If exim had already been installed, the install script makes backup
+copies of the pre-existing executables with a ".0" suffix.
+
+This leads to useless duplicated files on the target, so disable this
+piece of code.
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ scripts/exim_install |   18 +++++++++---------
+ 1 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/scripts/exim_install b/scripts/exim_install
+index 616ab3c..e68e7d5 100755
+--- a/scripts/exim_install
++++ b/scripts/exim_install
+@@ -344,15 +344,15 @@ while [ $# -gt 0 ]; do
+ 
+   else
+     if ../scripts/newer ${name} ${BIN_DIRECTORY}/${name}; then
+-      if [ -f ${BIN_DIRECTORY}/${name} ]; then
+-        echo ${CP} ${BIN_DIRECTORY}/${name} ${BIN_DIRECTORY}/${name}.O
+-        ${real} ${CP} ${BIN_DIRECTORY}/${name} ${BIN_DIRECTORY}/${name}.O
+-        if [ $? -ne 0 ]; then
+-          echo $com ""
+-          echo $com "*** Exim installation ${ver}failed ***"
+-          exit 1
+-        fi
+-      fi
++#      if [ -f ${BIN_DIRECTORY}/${name} ]; then
++#        echo ${CP} ${BIN_DIRECTORY}/${name} ${BIN_DIRECTORY}/${name}.O
++#        ${real} ${CP} ${BIN_DIRECTORY}/${name} ${BIN_DIRECTORY}/${name}.O
++#        if [ $? -ne 0 ]; then
++#          echo $com ""
++#          echo $com "*** Exim installation ${ver}failed ***"
++#          exit 1
++#        fi
++#      fi
+       echo ${CP} ${name} ${BIN_DIRECTORY}
+       ${real} ${CP} ${name} ${BIN_DIRECTORY}
+       if [ $? -ne 0 ]; then
diff --git a/package/exim/exim-Skip-version-check-and-symlink-installation.patch b/package/exim/exim-Skip-version-check-and-symlink-installation.patch
new file mode 100644
index 0000000..94d21ae
--- /dev/null
+++ b/package/exim/exim-Skip-version-check-and-symlink-installation.patch
@@ -0,0 +1,40 @@
+The exim install script installs a binary named exim-<version>, plus a symlink
+to it named exim.
+In order to achieve this "feature" (of dubious usefulness) it runs the
+executable (on the host) and then filters its output to grab the version number.
+This clearly cannot work if the executable is cross-compiled, so get rid of all
+of it and just install an executable file called exim.
+
+Inspired by:
+http://patch-tracker.debian.org/patch/series/view/exim4/4.76-2/35_install.dpatch
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ scripts/exim_install |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/exim_install b/scripts/exim_install
+index e68e7d5..487a4e1 100755
+--- a/scripts/exim_install
++++ b/scripts/exim_install
+@@ -59,6 +59,8 @@ while [ $# -gt 0 ] ; do
+   shift
+ done
+ 
++do_symlink=no
++
+ # Get the values of BIN_DIRECTORY, CONFIGURE_FILE, INFO_DIRECTORY, NO_SYMLINK,
+ # SYSTEM_ALIASES_FILE, and EXE from the global Makefile (in the build
+ # directory). EXE is empty except in the Cygwin environment. In each case, keep
+@@ -218,8 +220,9 @@ while [ $# -gt 0 ]; do
+   # The exim binary is handled specially
+ 
+   if [ $name = exim${EXE} ]; then
+-    version=exim-`./exim -bV -C /dev/null | \
+-      awk '/Exim version/ { OFS=""; print $3,"-",substr($4,2,length($4)-1) }'`${EXE}
++    version=exim
++#    version=exim-`./exim -bV -C /dev/null | \
++#      awk '/Exim version/ { OFS=""; print $3,"-",substr($4,2,length($4)-1) }'`${EXE}
+ 
+     if [ "${version}" = "exim-${EXE}" ]; then
+       echo $com ""
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
new file mode 100644
index 0000000..3e8404b
--- /dev/null
+++ b/package/exim/exim.mk
@@ -0,0 +1,46 @@
+#############################################################
+#
+# exim
+#
+#############################################################
+
+EXIM_VERSION = 4.82
+EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
+EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
+EXIM_LICENSE = GPLv2+
+EXIM_LICENSE_FILES = LICENCE
+EXIM_DEPENDENCIES = pcre berkeleydb
+
+# These echos seem to be the sanest way to feed CC and CFLAGS to exim
+define EXIM_CONFIGURE_CMDS
+	$(INSTALL) -m 0644 -D package/exim/Local-Makefile $(@D)/Local/Makefile
+	echo "CC=$(TARGET_CC)" >>$(@D)/Local/Makefile
+	echo "CFLAGS=$(TARGET_CFLAGS)" >>$(@D)/Local/Makefile
+	echo "AR=$(TARGET_AR) cq" >>$(@D)/Local/Makefile
+	echo "RANLIB=$(TARGET_RANLIB)" >>$(@D)/Local/Makefile
+	echo "HOSTCC=$(HOSTCC)" >>$(@D)/Local/Makefile
+	echo "HOSTCFLAGS=$(HOSTCFLAGS)" >>$(@D)/Local/Makefile
+endef
+
+# "The -j (parallel) flag must not be used with make"
+# (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
+define EXIM_BUILD_CMDS
+	build=br $(MAKE1) -C $(@D)
+endef
+
+define EXIM_INSTALL_TARGET_CMDS
+	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
+	  $(MAKE1) -C $(@D) install
+	chmod u+s $(TARGET_DIR)/usr/sbin/exim
+endef
+
+define EXIM_USERS
+exim 88 mail 8 * - - - exim
+endef
+
+define EXIM_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/exim/S86exim \
+		$(TARGET_DIR)/etc/init.d/S86exim
+endef
+
+$(eval $(generic-package))
