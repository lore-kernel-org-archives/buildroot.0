From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:06 -0700
Subject: [Buildroot] [PATCH 08/12] package/polkit: add host variant
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Building a host variant of polkit ensures that building the new version of the
udisks package succeeds on distributions that do not provide a new enough
version of Polkit.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/polkit.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 3ae42b2312..5f9914482a 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -14,6 +14,9 @@ POLKIT_INSTALL_STAGING = YES
 POLKIT_DEPENDENCIES = \
 	libglib2 host-intltool expat spidermonkey $(TARGET_NLS_DEPENDENCIES)
 
+HOST_POLKIT_DEPENDENCIES = \
+	host-libglib2 host-intltool host-expat host-spidermonkey
+
 # spidermonkey needs C++11
 POLKIT_CONF_ENV = \
 	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
@@ -26,6 +29,17 @@ POLKIT_CONF_OPTS = \
 	--disable-libelogind \
 	--disable-libsystemd-login
 
+# The only reason for building the host polkit is to build udisks.
+# As such, only the bare minimum is enabled.
+HOST_POLKIT_CONF_OPTS = \
+	--with-os-type=unknown \
+	--disable-man-pages \
+	--disable-examples \
+	--disable-libelogind \
+	--disable-libsystemd-login \
+	--disable-introspection \
+	--with-authfw=shadow
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POLKIT_CONF_OPTS += --enable-introspection
 POLKIT_DEPENDENCIES += gobject-introspection
@@ -57,3 +71,4 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 endef
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.26.2
