From: Doug Kehn <rdkehn@yahoo.com>
Date: Mon, 18 Jan 2016 09:42:18 -0600
Subject: [Buildroot] [PATCH v3 1/4] package/dhcp: bump version to 4.3.3-P1
In-Reply-To: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1453131741-1613-2-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel builds are not supported because the bind libraries must be
built first.

The embedded bind configure is called as part of dhcp make instead of
dhcp configure. dhcp make environment is expanded to ensure bind
configure has the proper information.

The embedded bind tar-ball is extracted after the source so patches can
be applied to dhcp and bind before the package is built.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v2 -> v3
  - removed RFC tag
  - updated version from 4.3.3 to 4.3.3-P1 (suggested by Richardo)
  - external toolchain support (suggested by Richardo)
Changes v1 -> v2
  - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
---
 package/dhcp/dhcp.hash |  4 ++--
 package/dhcp/dhcp.mk   | 17 ++++++++++++++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index 84e3c63..e2bb6d9 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
-sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
+# Verified from ftp://ftp.isc.org/isc/dhcp/4.3-3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
+sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c05e694..1bc088e 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R12
+DHCP_VERSION = 4.3.3-P1
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
@@ -25,6 +25,21 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
+DHCP_MAKE=$(MAKE1)
+
+# Embedded bind configure is called as part of dhcp make instead of dhcp
+# configure. Pass configure env to make so bind configure has what it needs.
+DHCP_MAKE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	GNU_TARGET_NAME=$(GNU_TARGET_NAME) \
+	GNU_HOST_NAME=$(GNU_HOST_NAME) \
+	BUILD_CC="$(HOSTCC)"
+
+define DHCP_EXTRACT_BIND
+	cd $(@D)/bind; tar -xvf bind.tar.gz
+endef
+DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
-- 
2.7.0
