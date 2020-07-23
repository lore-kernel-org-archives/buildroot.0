From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:05 -0700
Subject: [Buildroot] [PATCH 07/12] package/spidermonkey: add host variant
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

New versions of udisks require an updated version of polkit to build the
udisks policy file. If a user builds on a distribution that does not include
polkit, or a distribution such as CentOS7 which provides a polkit version too
old to use spidermonkey, compiling fails.

Building a host variant of polkit is necessary to fix this issue, which
requires a host variant of spidermonkey.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/spidermonkey/spidermonkey.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/spidermonkey/spidermonkey.mk b/package/spidermonkey/spidermonkey.mk
index 50afdc1758..b65bd5ca9e 100644
--- a/package/spidermonkey/spidermonkey.mk
+++ b/package/spidermonkey/spidermonkey.mk
@@ -20,6 +20,11 @@ SPIDERMONKEY_DEPENDENCIES = \
 	libnspr \
 	zlib
 
+HOST_SPIDERMONKEY_DEPENDENCIES = \
+	host-python \
+	host-libnspr \
+	host-zlib
+
 SPIDERMONKEY_CONF_ENV = \
 	PYTHON="$(HOST_DIR)/bin/python2"
 
@@ -35,6 +40,17 @@ SPIDERMONKEY_CONF_OPTS = \
 	--with-system-nspr \
 	--with-nspr-exec-prefix="$(STAGING_DIR)/usr"
 
+# The only reason to build the host variant is to build the host variant of
+# polkit. As such, only the bare minimum is selected.
+HOST_SPIDERMONKEY_CONF_OPTS = \
+	--host=$(GNU_HOST_NAME) \
+	--target=$(GNU_HOST_NAME) \
+	--disable-jemalloc \
+	--enable-shared-js \
+	--with-system-zlib \
+	--with-system-nspr \
+	--with-nspr-exec-prefix="$(HOST_DIR)/usr"
+
 ifeq ($(BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS),y)
 SPIDERMONKEY_CONF_OPTS += --enable-ion
 else
@@ -62,3 +78,4 @@ endef
 SPIDERMONKEY_POST_INSTALL_TARGET_HOOKS += SPIDERMONKEY_CLEANUP
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.26.2
