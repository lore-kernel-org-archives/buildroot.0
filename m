From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Aug 2016 19:08:00 +0200
Subject: [Buildroot] [PATCH 2/2] iproute2: use @D instead of IPROUTE2_DIR
In-Reply-To: <1470416880-16148-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470416880-16148-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470416880-16148-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We more generally use $(@D) instead of $(pkg_DIR) to refer to the
package source directory, so this commit updates iproute2 to also use
$(@D) everywhere.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index edc17ad..09e68c5 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -27,13 +27,13 @@ ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 define IPROUTE2_WITH_IPTABLES
 	# Makefile is busted so it never passes IPT_LIB_DIR properly
-	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
+	$(SED) "s/-DIPT/-DXT/" $(@D)/tc/Makefile
 endef
 else
 define IPROUTE2_WITH_IPTABLES
 	# em_ipset needs xtables, but configure misdetects it
-	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
-	echo "TC_CONFIG_XT:=n" >>$(IPROUTE2_DIR)/Config
+	echo "TC_CONFIG_IPSET:=n" >>$(@D)/Config
+	echo "TC_CONFIG_XT:=n" >>$(@D)/Config
 endef
 endif
 
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 IPROUTE2_DEPENDENCIES += berkeleydb
 else
 define IPROUTE2_DISABLE_ARPD
-	echo "HAVE_BERKELEY_DB:=n" >> $(IPROUTE2_DIR)/Config
+	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/Config
 endef
 endif
 
-- 
2.7.4
