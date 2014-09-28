From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 19:25:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: New package
In-Reply-To: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1411925137-11284-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                |    1 +
 package/dovecot-pigeonhole/Config.in             |    9 +++++++
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk |   31 ++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/dovecot-pigeonhole/Config.in
 create mode 100644 package/dovecot-pigeonhole/dovecot-pigeonhole.mk

diff --git a/package/Config.in b/package/Config.in
index 39084cc..8eeead6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -931,6 +931,7 @@ endmenu
 
 menu "Mail"
 	source "package/dovecot/Config.in"
+	source "package/dovecot-pigeonhole/Config.in"
 	source "package/exim/Config.in"
 	source "package/fetchmail/Config.in"
 	source "package/heirloom-mailx/Config.in"
diff --git a/package/dovecot-pigeonhole/Config.in b/package/dovecot-pigeonhole/Config.in
new file mode 100644
index 0000000..44320dd
--- /dev/null
+++ b/package/dovecot-pigeonhole/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DOVECOT_PIGEONHOLE
+	bool "dovecot-pigeonhole"
+	depends on BR2_PACKAGE_DOVECOT
+	help
+	  Pigeonhole is the name of the project that adds support for the Sieve
+	  language (RFC 5228) and the ManageSieve protocol (RFC 5804) to the
+	  Dovecot Secure IMAP Server.
+
+	  http://pigeonhole.dovecot.org
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
new file mode 100644
index 0000000..a55d2ec
--- /dev/null
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# dovecot-pigeonhole
+#
+################################################################################
+
+DOVECOT_PIGEONHOLE_VERSION = 0.4.3
+DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
+DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
+DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
+DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
+DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
+
+DOVECOT_PIGEONHOLE_CONF_OPT = \
+	--with-dovecot=$(STAGING_DIR)/usr/lib \
+	--with-moduledir=/usr/lib \
+	--libexecdir=/usr/bin/dovecot \
+	--sysconfdir=/etc \
+	--localstatedir=/var
+
+define DOVECOT_PIGEONHOLE_POST_CONFIGURE
+	for i in $$(find $(@D) -name "Makefile"); do \
+		$(SED) 's%^pkglibdir =.*%pkglibdir = \$$(libdir)%' $$i; \
+		$(SED) 's%^pkglibexecdir =.*%pkglibexecdir = \$$(libexecdir)%' $$i; \
+		$(SED) 's%^sieve_plugindir =.*%sieve_plugindir = \$$(moduledir)%' $$i; \
+	done
+endef
+
+DOVECOT_PIGEONHOLE_POST_CONFIGURE_HOOKS += DOVECOT_PIGEONHOLE_POST_CONFIGURE
+
+$(eval $(autotools-package))
-- 
1.7.10.4
