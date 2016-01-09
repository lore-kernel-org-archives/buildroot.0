From: Doug Kehn <rdkehn@yahoo.com>
Date: Sat,  9 Jan 2016 15:59:43 -0600
Subject: [Buildroot] [RFC PATCH 1/3] package/dhcp: bump version to 4.3.3
In-Reply-To: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
References: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1452376785-31174-2-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel builds are not supported because the bind libraries must be built
first.

The embedded bind configure is called as part of dhcp make instead of dhcp
configure. dhcp make environment is expanded to ensure bind configure has the
proper information.

The embedded bind tar-ball is extracted after the source so patches can be
applied to dhcp and bind before the package is built.

I noticed that host ar was being called for target archives. This is fixed up.
(The host ar is/was called for 4.1-ESV-R12 too.)

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/dhcp/dhcp.hash |  4 ++--
 package/dhcp/dhcp.mk   | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index 84e3c63..ae770ce 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
-sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
+# Verified from ftp://ftp.isc.org/isc/dhcp/4.3-3/dhcp-4.3.3.tar.gz.sha256.asc
+sha256	553c4945b09b1c1b904c4780f34f72aaefa2fc8c6556715de0bc9d4e3d255ede	dhcp-4.3.3.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c05e694..bab79c0 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R12
+DHCP_VERSION = 4.3.3
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
@@ -25,6 +25,25 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
+DHCP_MAKE=$(MAKE1)
+
+DHCP_MAKE_ENV = \
+	GNU_TARGET_NAME=$(GNU_TARGET_NAME) \
+	GNU_HOST_NAME=$(GNU_HOST_NAME) \
+	BUILD_CC="$(HOSTCC)"
+
+define DHCP_EXTRACT_BIND
+	cd $(@D)/bind; tar -xvf bind.tar.gz
+endef
+DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
+
+define DHCP_TOOLCHAIN_AR_REF
+	for d in common dhcpctl omapip; do \
+		sed -i 's#^AR.*#AR = $(TARGET_AR)#' $(@D)/$$d/Makefile; \
+	done
+endef
+DHCP_PRE_BUILD_HOOKS += DHCP_TOOLCHAIN_AR_REF
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
-- 
2.6.4
