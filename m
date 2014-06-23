From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 23 Jun 2014 09:19:18 -0500
Subject: [Buildroot] [PATCH v2 1/1] atftp: new package
Message-ID: <1403533158-3547-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

Changes v1 -> v2:
 - Added dependancies to IPv6 and threads (suggested by Thomas P.)
 - Added more config options along with else cases for pcr and readline
   (suggested by Thomas P.)
 - Fixed pure static builds (suggested by Thomas P.)
     Patch submitted upstream at https://sourceforge.net/p/atftp/bugs/3/
---
 package/Config.in                                  |    1 +
 ...file.am-link-against-libpthread-for-atftp.patch |   26 +++++++++++++++++++
 package/atftp/Config.in                            |   15 +++++++++++
 package/atftp/atftp.mk                             |   27 ++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch
 create mode 100644 package/atftp/Config.in
 create mode 100644 package/atftp/atftp.mk

diff --git a/package/Config.in b/package/Config.in
index 498630f..5bb93b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ menu "Networking applications"
 	source "package/argus/Config.in"
 	source "package/arptables/Config.in"
 	source "package/autossh/Config.in"
+	source "package/atftp/Config.in"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
 	source "package/bcusdk/Config.in"
diff --git a/package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch b/package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch
new file mode 100644
index 0000000..e879df5
--- /dev/null
+++ b/package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch
@@ -0,0 +1,26 @@
+Makefile.am: link against libpthread for atftp
+
+atftp client needs to link against libpthread as static builds do not
+work otherwise.
+
+Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e59592f..200829a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -28,7 +28,7 @@ noinst_HEADERS   = argz.h logger.h options.h stats.h tftp.h tftp_def.h tftp_io.h
+ 		   tftpd.h tftpd_pcre.h tftpd_mtftp.h
+ 
+ bin_PROGRAMS     = atftp
+-atftp_LDADD      = $(LIBTERMCAP) $(LIBREADLINE)
++atftp_LDADD      = $(LIBTERMCAP) $(LIBREADLINE) $(LIBPTHREAD)
+ atftp_SOURCES    = tftp.c tftp_io.c logger.c options.c tftp_def.c tftp_file.c \
+ 		   argz.c tftp_mtftp.c
+ 
+-- 
+1.9.1
+
diff --git a/package/atftp/Config.in b/package/atftp/Config.in
new file mode 100644
index 0000000..23acf6f
--- /dev/null
+++ b/package/atftp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_ATFTP
+	bool "atftp"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  atftp is a client/server implementation of the TFTP
+	  protocol that implements RFCs 1350, 2090, 2347, 2348,
+	  and 2349. The server is multi-threaded and the client
+	  presents a friendly interface using libreadline.
+
+	  http://sourceforge.net/projects/atftp/
+
+comment "atftp needs a toolchain w/ threads, IPv6"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
new file mode 100644
index 0000000..1d6a7c3
--- /dev/null
+++ b/package/atftp/atftp.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# atftp
+#
+################################################################################
+
+ATFTP_VERSION  = 0.7.1
+ATFTP_SITE = http://sourceforge.net/projects/atftp/files/
+ATFTP_LICENSE = GPLv2+
+ATFTP_LICENSE_FILES = LICENSE
+ATFTP_CONF_OPT = --disable-libwrap --disable-mtftp
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+ATFTP_DEPENDENCIES += readline
+ATFTP_CONF_OPT += --enable-libreadline
+else
+ATFTP_CONF_OPT += --disable-libreadline
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+ATFTP_DEPENDENCIES += pcre
+ATFTP_CONF_OPT += --enable-libpcre
+else
+ATFTP_CONF_OPT += --disable-libpcre
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
