From: Mark Corbin <mark@dibsco.co.uk>
Date: Sat,  2 Jan 2021 16:56:55 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/chrony: bump to version 4.0
Message-ID: <20210102165655.23697-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update chrony to version 4.0 and add/remove configuration of
features as necessary.

Remove support for readline. Add support for nettle and
gnutls (required for NTS support). Add pkg-config support (for
nss, nettle and gnutls).

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
Changes v1 -> v2:
  - add/remove configuration features as necessary (Peter)
---
 package/chrony/chrony.hash |  4 ++--
 package/chrony/chrony.mk   | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 57ce91ac80..87e0cf8ea0 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,4 +1,4 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/08/msg00000.html
-sha256  1ba82f70db85d414cd7420c39858e3ceca4b9eb8b028cbe869512c3a14a2dca7  chrony-3.5.1.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/10/msg00000.html
+sha256  be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625  chrony-4.0.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f8938a80f5..ef459ad38b 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.5.1
+CHRONY_VERSION = 4.0
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
+CHRONY_DEPENDENCIES = host-pkgconf
 
 CHRONY_CONF_OPTS = \
 	--host-system=Linux \
 	--host-machine=$(BR2_ARCH) \
 	--prefix=/usr \
-	--without-readline \
 	--without-tomcrypt \
 	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
 
@@ -24,7 +24,7 @@ CHRONY_CONF_OPTS += --without-libcap
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
-CHRONY_DEPENDENCIES += host-pkgconf libnss
+CHRONY_DEPENDENCIES += libnss
 else
 CHRONY_CONF_OPTS += --without-nss
 endif
@@ -48,6 +48,18 @@ ifeq ($(BR2_PACKAGE_PPS_TOOLS),y)
 CHRONY_DEPENDENCIES += pps-tools
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+CHRONY_DEPENDENCIES += gnutls
+else
+CHRONY_CONF_OPTS += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+CHRONY_DEPENDENCIES += nettle
+else
+CHRONY_CONF_OPTS += --without-nettle
+endif
+
 define CHRONY_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPTS)
 endef
-- 
2.17.1
