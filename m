From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:57:07 +0100
Subject: [Buildroot] [git commit] openntpd: add optional dependency on
 LibreSSL
Message-ID: <20171201205333.A902C7FAAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c817edd7c207b658f5e6d93005b80c9c31f9d06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenNTPD looks for a crypto library with tls_config_set_ca_mem, which
is available in LibreSSL but not OpenSSL. If tls_config_set_ca_mem is
found, crypto support is added to the build.

Because this is not currently checked, crypto support might not be
added due to the order of the build. Add a small check to see if
BR2_PACKAGE_LIBRESSL is selected, and if so, add a dependency for it.

Also add a note about this in the Config.in help section.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/Config.in   | 3 +++
 package/openntpd/openntpd.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 1b856c0..c84d0ba 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_OPENNTPD
 	  to remote NTP servers and can act as NTP server itself,
 	  redistributing the local clock. It just works.
 
+	  Crypto support is available if the LibreSSL library is
+	  enabled.
+
 	  http://www.openntpd.org/
 
 comment "openntpd needs a toolchain w/ NPTL"
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 96d3881..f5a5690 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -11,6 +11,12 @@ OPENNTPD_LICENSE_FILES = COPYING
 # Need to autoreconf for our libtool patch to apply properly
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
