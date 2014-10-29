From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Oct 2014 21:14:05 +0100
Subject: [Buildroot] [PATCH v6 2/3] package/dovecot-pigeonhole: New package
In-Reply-To: <1414613646-24490-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414613646-24490-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1414613646-24490-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
v6: bump version to 0.4.4
v5: no changes
v4: no changes
v3: DOVECOT_PIGEONHOLE_CONF_OPT -> DOVECOT_PIGEONHOLE_CONF_OPTS
v2: - package moved to new Dovecot dependency submenu
    - removed cruft from CONV_OPT not needed for buildroot (Thomas)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/Config.in             |    8 ++++++++
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk |   16 ++++++++++++++++
 package/dovecot/Config.in                        |    2 ++
 3 files changed, 26 insertions(+)
 create mode 100644 package/dovecot-pigeonhole/Config.in
 create mode 100644 package/dovecot-pigeonhole/dovecot-pigeonhole.mk

diff --git a/package/dovecot-pigeonhole/Config.in b/package/dovecot-pigeonhole/Config.in
new file mode 100644
index 0000000..83f5287
--- /dev/null
+++ b/package/dovecot-pigeonhole/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DOVECOT_PIGEONHOLE
+	bool "dovecot-pigeonhole"
+	help
+	  Pigeonhole is the name of the project that adds support for the Sieve
+	  language (RFC 5228) and the ManageSieve protocol (RFC 5804) to the
+	  Dovecot Secure IMAP Server.
+
+	  http://pigeonhole.dovecot.org
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
new file mode 100644
index 0000000..15f421c
--- /dev/null
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# dovecot-pigeonhole
+#
+################################################################################
+
+DOVECOT_PIGEONHOLE_VERSION = 0.4.4
+DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
+DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
+DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
+DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
+DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
+
+DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
+
+$(eval $(autotools-package))
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index c692402..9c0ecc8 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -49,6 +49,8 @@ config BR2_PACKAGE_DOVECOT_ZLIB
 	help
 	  Enable zlib support.
 
+source package/dovecot-pigeonhole/Config.in
+
 endif # BR2_PACKAGE_DOVECOT
 
 comment "dovecot needs a toolchain w/ ipv6"
-- 
1.7.10.4
