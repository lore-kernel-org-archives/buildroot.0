From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 17:46:57 +0200
Subject: [Buildroot] [PATCH 2/2] msmtp: new package
In-Reply-To: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9e08699205fdbcb212100ec3fb7597004c526456.1334677614.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/msmtp/Config.in |   10 ++++++++++
 package/msmtp/msmtp.mk  |   28 ++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/msmtp/Config.in
 create mode 100644 package/msmtp/msmtp.mk

diff --git a/package/Config.in b/package/Config.in
index 1fb6c4a..f3d26d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -479,6 +479,7 @@ source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mii-diag/Config.in"
 source "package/mrouted/Config.in"
+source "package/msmtp/Config.in"
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
diff --git a/package/msmtp/Config.in b/package/msmtp/Config.in
new file mode 100644
index 0000000..385ad90
--- /dev/null
+++ b/package/msmtp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MSMTP
+	bool "msmtp"
+	help
+	  msmtp is an SMTP client. In the default mode, it transmits a
+	  mail to an SMTP server (for example at a free mail provider)
+	  which takes care of further delivery.
+
+	  Note that msmtp is licensed under GPLv3.
+
+	  http://msmtp.sourceforge.net/
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
new file mode 100644
index 0000000..2c71229
--- /dev/null
+++ b/package/msmtp/msmtp.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# msmtp
+#
+#############################################################
+
+MSMTP_VERSION = 1.4.27
+MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
+MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.bz2
+
+MSMTP_DEPENDENCIES += host-pkg-config
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MSMTP_CONF_OPT += --with-ssl=openssl
+MSMTP_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+MSMTP_CONF_OPT += --with-ssl=gnutls
+MSMTP_DEPENDENCIES += gnutls
+else
+MSMTP_CONF_OPT += --with-ssl=no
+endif
+
+MSMTP_CONF_OPT += \
+	--without-libidn \
+	--without-libgsasl \
+	--without-gnome-keyring
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.4.1
