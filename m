From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:13 +0200
Subject: [Buildroot] [PATCH 9/9] exim: add new package
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-10-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in                                  |    1 +
 package/exim/Config.in                             |    9 ++
 package/exim/Local-Makefile                        |   15 +++
 package/exim/S86exim                               |   26 ++++++
 .../exim/exim-Build-buildconfig-for-the-host.patch |   23 +++++
 ...n-t-make-backup-copies-of-installed-files.patch |   40 +++++++++
 ...ip-version-check-and-symlink-installation.patch |   40 +++++++++
 package/exim/exim-configure                        |   90 ++++++++++++++++++++
 package/exim/exim.mk                               |   49 +++++++++++
 9 files changed, 293 insertions(+), 0 deletions(-)
 create mode 100644 package/exim/Config.in
 create mode 100644 package/exim/Local-Makefile
 create mode 100644 package/exim/S86exim
 create mode 100644 package/exim/exim-Build-buildconfig-for-the-host.patch
 create mode 100644 package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
 create mode 100644 package/exim/exim-Skip-version-check-and-symlink-installation.patch
 create mode 100644 package/exim/exim-configure
 create mode 100644 package/exim/exim.mk

diff --git a/package/Config.in b/package/Config.in
index 4a8c120..f77a703 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ source "package/dhcpdump/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
+source "package/exim/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
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
index 0000000..01089d2
--- /dev/null
+++ b/package/exim/Local-Makefile
@@ -0,0 +1,15 @@
+BIN_DIRECTORY=/usr/sbin
+CONFIGURE_FILE=/etc/exim/configure
+EXIM_USER=ref:cyrus
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
index 0000000..0b3e18f
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
+	echo $"Usage: $0 {start|stop|restart}"
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
diff --git a/package/exim/exim-configure b/package/exim/exim-configure
new file mode 100644
index 0000000..e0ed879
--- /dev/null
+++ b/package/exim/exim-configure
@@ -0,0 +1,90 @@
+### exim configuration ###
+
+domainlist local_domains = :@
+
+domainlist relay_to_domains =
+hostlist   relay_from_hosts = 127.0.0.1
+
+acl_smtp_rcpt = acl_check_rcpt
+acl_smtp_data = acl_check_data
+
+never_users = root
+
+# disable rfc1413 ident requests
+rfc1413_hosts = *
+rfc1413_query_timeout = 0s
+
+ignore_bounce_errors_after = 2h
+timeout_frozen_after = 5h
+
+
+### ACL ###
+
+begin acl
+
+acl_check_rcpt:
+  # Accept if the source is local SMTP (i.e. not over TCP/IP). We do this by
+  # testing for an empty sending host field.
+  accept  hosts = :
+          control = dkim_disable_verify
+
+  # Avoid unusual characters in addresses
+  deny    message       = Restricted characters in address
+          domains       = +local_domains
+          local_parts   = ^[.] : ^.*[@%!/|]
+  deny    message       = Restricted characters in address
+          domains       = !+local_domains
+          local_parts   = ^[./|] : ^.*[@%!] : ^.*/\\.\\./
+
+  # Accept mail to postmaster in any local domain
+  accept  local_parts   = postmaster
+          domains       = +local_domains
+
+  # Deny unless the sender address can be verified.
+
+  # Accept if the message comes from one of the hosts for which we are an
+  # outgoing relay.
+  accept  hosts         = +relay_from_hosts
+          control       = submission
+          control       = dkim_disable_verify
+
+  # Accept if the message arrived over an authenticated connection.
+  accept  authenticated = *
+          control       = submission
+          control       = dkim_disable_verify
+
+  # Insist that any other recipient address that we accept is either in one of
+  # our local domains, or is in a domain for which we explicitly allow
+  # relaying. Any other domain is rejected as being unacceptable for relaying.
+  require message = relay not permitted
+          domains = +local_domains : +relay_to_domains
+
+  # We also require all accepted addresses to be verifiable.
+  require verify = recipient
+
+  accept
+
+
+acl_check_data:
+  accept
+
+
+### ROUTERS ###
+
+begin routers
+
+cyrus_vdom:
+  driver = accept
+  domains = +local_domains
+  transport = cyrus_lmtp
+  no_more
+
+
+### TRANSPORTS ###
+
+begin transports
+
+cyrus_lmtp:
+  driver = lmtp
+  socket = /var/imap/socket/lmtp
+  batch_max = 20
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
new file mode 100644
index 0000000..a12f5a2
--- /dev/null
+++ b/package/exim/exim.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# exim
+#
+#############################################################
+
+EXIM_VERSION = 4.76
+EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
+EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
+EXIM_DEPENDENCIES = pcre berkeleydb
+
+# These echos seem to be the sanest way to feed CC and CFLAGS to exim
+define EXIM_CONFIGURE_CMDS
+	install -D package/exim/Local-Makefile $(@D)/Local/Makefile
+	echo "CC=$(TARGET_CC)" >>$(@D)/Local/Makefile
+	echo "CFLAGS=$(TARGET_CFLAGS)" >>$(@D)/Local/Makefile
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
+	$(INSTALL) -D -m 755 package/exim/S86exim \
+		$(TARGET_DIR)/etc/init.d/S86exim
+	[ -f ${TARGET_DIR}/etc/exim/configure ] || \
+		install -D -m 644 package/exim/exim-configure \
+			${TARGET_DIR}/etc/exim/configure
+	DESTDIR=${TARGET_DIR} INSTALL_ARG="-no_chown -no_symlink" build=br \
+	  $(MAKE1) -C $(@D) install
+	chmod u+s ${TARGET_DIR}/usr/sbin/exim
+endef
+
+ifeq ($(BR2_PACKAGE_CYRUS_IMAPD),y)
+ifneq ($(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_LMTP_SOCKET)),)
+# Configure lmtp delivery to cyrus-imapd
+define EXIM_TWEAK_LMTP_SOCKET
+	$(SED) '/^[^#]*socket.*=/s~=.*~= $(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_LMTP_SOCKET))~' \
+		${TARGET_DIR}/etc/exim/configure
+endef
+EXIM_POST_INSTALL_TARGET_HOOKS += EXIM_TWEAK_LMTP_SOCKET
+endif
+endif
+
+$(eval $(call GENTARGETS,package,exim))
-- 
1.7.4.1
