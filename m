From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 21:48:17 +1300
Subject: [Buildroot] [git commit] sngrep: new package
Message-ID: <20170126084924.D4E0481EA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf09290977a5b43f53479dd52777fde0bb20bf5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sngrep is a tool for displaying SIP calls message flows from terminal.
It supports live capture to display realtime SIP packets and can also
be used as PCAP viewer.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas:
 - ncurses wide char and other sub-options are not needed to build
   sngrep, so they are removed, as well as the wchar
   dependency. ncurses with wchar support is only needed when
   --enable-unicode is passed, but even then, it doesn't work because
   the configure script searches <ncursesw/ncurses.h>, so unicode
   support has been explicitly disabled.
 - add optional dependencies on OpenSSL, GnuTLS and PCRE. This also
   makes sure they are explicitly enabled/disabled depending on the
   configuration.
 - add upstream URL in Config.in file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/sngrep/Config.in   | 14 ++++++++++++++
 package/sngrep/sngrep.hash |  1 +
 package/sngrep/sngrep.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0023e7b..f48b894 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1626,6 +1626,7 @@ endif
 	source "package/shairport-sync/Config.in"
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
+	source "package/sngrep/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
new file mode 100644
index 0000000..4d0d80c
--- /dev/null
+++ b/package/sngrep/Config.in
@@ -0,0 +1,14 @@
+comment "sngrep needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_SNGREP
+	bool "sngrep"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  sngrep is a tool for displaying SIP calls message flows from
+	  terminal.  It supports live capture to display realtime SIP
+	  packets and can also be used as PCAP viewer.
+
+	  https://github.com/irontec/sngrep
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
new file mode 100644
index 0000000..dd75f89
--- /dev/null
+++ b/package/sngrep/sngrep.hash
@@ -0,0 +1 @@
+sha256 30fbfb4f90ed8805194b39683a8a2ed465776ffd60df4482bd029d63b316b3f1 sngrep-v1.4.2.tar.gz
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
new file mode 100644
index 0000000..f504771
--- /dev/null
+++ b/package/sngrep/sngrep.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# sngrep
+#
+################################################################################
+
+SNGREP_VERSION = v1.4.2
+SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
+SNGREP_LICENSE = GPLv3+
+SNGREP_LICENSE_FILES = LICENSE
+SNGREP_AUTORECONF = YES
+SNGREP_DEPENDENCIES = libpcap ncurses
+
+# our ncurses wchar support is not properly detected
+SNGREP_CONF_OPTS += --disable-unicode
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SNGREP_DEPENDENCIES += gnutls
+SNGREP_CONF_OPTS += --with-gnutls
+else
+SNGREP_CONF_OPTS += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SNGREP_DEPENDENCIES += openssl
+SNGREP_CONF_OPTS += --with-openssl
+else
+SNGREP_CONF_OPTS += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+SNGREP_DEPENDENCIES += pcre
+SNGREP_CONF_OPTS += --with-pcre
+else
+SNGREP_CONF_OPTS += --without-pcre
+endif
+
+$(eval $(autotools-package))
