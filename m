From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Oct 2017 22:19:39 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/kodi: use package
	host-openjdk-bootstrap to provide JDK
In-Reply-To: <20171003201939.8382-1-bernd.kuhls@t-online.de>
References: <20171003201939.8382-1-bernd.kuhls@t-online.de>
Message-ID: <20171003201939.8382-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed BR2_PACKAGE_KODI_OPENJDK (Baruch)

 package/kodi/Config.in | 3 ++-
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fc7eafa41a..8bce77d7e4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -46,7 +46,8 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
-	select BR2_NEEDS_HOST_JAVA
+	select BR2_NEEDS_HOST_JAVA if !(BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")
+	select BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP if (BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_FFMPEG
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 28fe256b65..9a3247dbbc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -156,6 +156,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP),y)
+KODI_CONF_ENV = \
+	JAVA_HOME=$(HOST_OPENJDK_BOOTSTRAP_DIR) \
+	PATH=$(HOST_OPENJDK_BOOTSTRAP_DIR)/bin:$(BR_PATH)
+KODI_DEPENDENCIES += host-openjdk-bootstrap
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
 KODI_DEPENDENCIES += mysql
-- 
2.11.0
