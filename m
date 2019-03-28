From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:46:56 +0100
Subject: [Buildroot] [git commit] package/netsniff-ng: allow to build with
 uclibc but w/o mausezahn
Message-ID: <20190328174433.9302F87F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0f98d5800b288500752ef51b969d9a3cb92e897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mausezahn can't be build with uclibc because uclibc does not provide
ceill() function, so it does not allow to build all netsniff-ng's
tools with uclibc.

Fix it by moving mausezahn under separate config option, which has own
dependencies and packages selection (libnet & libcli).

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
[Thomas:
 - use the allbutmausezahn and install_allbutmausezahn targets inside
   of enumerating all the tools in the .mk file
 - stick to a "config" instead of introducing a "menuconfig"]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsniff-ng/Config.in      | 25 ++++++++++++++++++-------
 package/netsniff-ng/netsniff-ng.mk | 19 ++++++++++++++-----
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index c4803b2fa2..5d1407baac 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -1,16 +1,12 @@
 config BR2_PACKAGE_NETSNIFF_NG
 	bool "netsniff-ng"
-	# Build with uClibc fails due to missing ceill()
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBCLI
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
-	select BR2_PACKAGE_LIBNET
 	help
 	  netsniff-ng is a free, performant Linux network analyzer and
 	  networking toolkit. If you will, the Swiss army knife for
@@ -18,7 +14,22 @@ config BR2_PACKAGE_NETSNIFF_NG
 
 	  http://netsniff-ng.org
 
-comment "netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0"
+if BR2_PACKAGE_NETSNIFF_NG
+
+config BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN
+	bool "mausezahn"
+	default y
+	# Build with uClibc fails due to missing ceill()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_LIBCLI
+	select BR2_PACKAGE_LIBNET
+
+comment "mausezahn needs glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
+endif
+
+comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HAS_THREADS  || \
+			!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 77d8921425..8dd06b6fb7 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -13,9 +13,16 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
 NETSNIFF_NG_CONF_ENV = \
 	NACL_INC_DIR=/dev/null \
 	NACL_LIB_DIR=/dev/null
-NETSNIFF_NG_DEPENDENCIES = \
-	libnl libpcap libcli libnetfilter_conntrack \
-	liburcu libnet
+NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
+
+ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
+NETSNIFF_NG_DEPENDENCIES += libcli libnet
+NETSNIFF_NG_BUILD_MAKE_TARGET = all
+NETSNIFF_NG_INSTALL_MAKE_TARGET = install
+else
+NETSNIFF_NG_BUILD_MAKE_TARGET = allbutmausezahn
+NETSNIFF_NG_INSTALL_MAKE_TARGET = install_allbutmausezahn
+endif
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 NETSNIFF_NG_DEPENDENCIES += geoip
@@ -41,12 +48,14 @@ define NETSNIFF_NG_CONFIGURE_CMDS
 endef
 
 define NETSNIFF_NG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(NETSNIFF_NG_BUILD_MAKE_TARGET)
 endef
 
 define NETSNIFF_NG_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
+		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install \
+			-C $(@D) $(NETSNIFF_NG_INSTALL_MAKE_TARGET)
 endef
 
 $(eval $(generic-package))
