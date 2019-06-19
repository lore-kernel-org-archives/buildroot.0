From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:51:21 +0200
Subject: [Buildroot] [git commit] package/dnsmasq: bump version to 2.80
Message-ID: <20190619115127.2E47A82283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26c876cd072bcceb67e11b4d173bd848f89476c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also automatically enable UBus support when UBus itself is enabled.

Signed-off-by: Jan Willem Janssen <j.w.janssen@lxtreme.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/dnsmasq.hash | 1 +
 package/dnsmasq/dnsmasq.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 322f8df5cc..18a539277e 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking pgp signature
 # http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.79.tar.xz.asc
 sha256	78ad74f5ca14fd85a8bac93f764cd9d60b27579e90eabd3687ca7b030e67861f	dnsmasq-2.79.tar.xz
+sha256	cdaba2785e92665cf090646cba6f94812760b9d7d8c8d0cfb07ac819377a63bb	dnsmasq-2.80.tar.xz
 # Locally calculated
 sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 79c5619966..366cebf012 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.79
+DNSMASQ_VERSION = 2.80
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
@@ -67,6 +67,11 @@ define DNSMASQ_INSTALL_DBUS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UBUS),y)
+DNSMASQ_DEPENDENCIES += ubus
+DNSMASQ_COPTS += -DHAVE_UBUS
+endif
+
 define DNSMASQ_FIX_PKGCONFIG
 	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
 		$(DNSMASQ_DIR)/Makefile
