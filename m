From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  8 Nov 2017 08:04:59 -0500
Subject: [Buildroot] [PATCH 2/2] openntpd: add check for LibreSSL.
In-Reply-To: <20171108130459.25412-1-aduskett@gmail.com>
References: <20171108130459.25412-1-aduskett@gmail.com>
Message-ID: <20171108130459.25412-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openntp looks for a crypto library with tls_config_set_ca_mem, which is
available in LibreSSL but not OpenSSL. If tls_config_set_ca_mem is found,
crypto support is added to the build.

Because this is not currently checked, crypto support might not be added
due to the order of the build. Add a small check to see if
BR2_PACKAGE_LIBRESSL is selected, and if so, add a dependency for it.

Also add a note about this in the Config.in help section.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openntpd/Config.in   | 3 +++
 package/openntpd/openntpd.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 1b856c03b8..5f8c9e8549 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_OPENNTPD
 	  to remote NTP servers and can act as NTP server itself,
 	  redistributing the local clock. It just works.
 
+	  Note: Cryto support is only available with the LibreSSL ssl
+	  library.
+
 	  http://www.openntpd.org/
 
 comment "openntpd needs a toolchain w/ NPTL"
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index b5a2559008..d53eed29de 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -11,6 +11,12 @@ OPENNTPD_LICENSE_FILES = COPYING
 # Patching include/Makefile.am
 OPENNTPD_AUTORECONF = YES
 
+# Openntpd searches for tls_config_set_ca_mem which is only available
+# in LibreSSL
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+OPENNTPD_DEPENDENCIES += openssl
+endif
+
 # openntpd uses pthread functions for arc4random emulation but forgets
 # to use -pthread
 OPENNTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -pthread"
-- 
2.13.6
