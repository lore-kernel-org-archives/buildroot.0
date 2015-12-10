From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 19:53:19 +0100
Subject: [Buildroot] [PATCH 7/7] package/xtables-addons: require kernel
	modules from Kconfig
In-Reply-To: <cover.1449771844.git.yann.morin.1998@free.fr>
References: <cover.1449771844.git.yann.morin.1998@free.fr>
Message-ID: <94c80013dc21effd198e7fe4b21ddf5f1d41e8fe.1449771844.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xtables-addons/Config.in         | 1 +
 package/xtables-addons/xtables-addons.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
index a687618..4538519 100644
--- a/package/xtables-addons/Config.in
+++ b/package/xtables-addons/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_XTABLES_ADDONS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # extensions are .so
 	select BR2_PACKAGE_IPTABLES
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  Xtables-addons is the successor to patch-o-matic(-ng).
 	  Likewise, it contains extensions that were not, or are not yet,
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 66e7386..b4e5992 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -16,12 +16,6 @@ XTABLES_ADDONS_CONF_OPTS = \
 	--with-xtables="$(STAGING_DIR)/usr" \
 	--with-xtlibdir="/usr/lib/xtables"
 
-# We're building a kernel module without using the kernel-module infra,
-# so we need to tell we want module support in the kernel
-ifeq ($(BR2_PACKAGE_XTABLES_ADDONS),y)
-LINUX_NEEDS_MODULES = y
-endif
-
 # geoip helpers need perl with modules and unzip so disable
 define XTABLES_DISABLE_GEOIP_HELPERS
 	$(SED) 's/ geoip//' $(@D)/Makefile.in
-- 
1.9.1
