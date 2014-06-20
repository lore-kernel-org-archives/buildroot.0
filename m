From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 20 Jun 2014 15:57:37 -0500
Subject: [Buildroot] [PATCH 1/1] atftp: new package
Message-ID: <1403297857-3987-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/Config.in       |    1 +
 package/atftp/Config.in |    9 +++++++++
 package/atftp/atftp.mk  |   22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/atftp/Config.in
 create mode 100644 package/atftp/atftp.mk

diff --git a/package/Config.in b/package/Config.in
index f43e985..cd78ccb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -895,6 +895,7 @@ menu "Networking applications"
 	source "package/argus/Config.in"
 	source "package/arptables/Config.in"
 	source "package/autossh/Config.in"
+	source "package/atftp/Config.in"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
 	source "package/bcusdk/Config.in"
diff --git a/package/atftp/Config.in b/package/atftp/Config.in
new file mode 100644
index 0000000..65c14d8
--- /dev/null
+++ b/package/atftp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ATFTP
+	bool "atftp"
+	help
+	  atftp is a client/server implementation of the TFTP
+	  protocol that implements RFCs 1350, 2090, 2347, 2348,
+	  and 2349. The server is multi-threaded and the client
+	  presents a friendly interface using libreadline.
+
+	  http://sourceforge.net/projects/atftp/
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
new file mode 100644
index 0000000..27fa0df
--- /dev/null
+++ b/package/atftp/atftp.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# atftp
+#
+################################################################################
+
+ATFTP_VERSION  = 0.7.1
+ATFTP_SITE = http://sourceforge.net/projects/atftp/files/
+ATFTP_LICENSE = GPLv2
+ATFTP_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+ATFTP_DEPENDENCIES += readline
+ATFTP_CONF_OPT += --enable-libreadline
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+ATFTP_DEPENDENCIES += pcre
+ATFTP_CONF_OPT += --enable-libpcre
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
