From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri,  3 Jul 2020 21:44:36 -0300
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump version to
 LTS_02_2020_Ref01
Message-ID: <20200704004436.21509-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:

- Add missing hash file.
- Add new libraries to the install target.
- Apply patch to fix build with musl (MR sent upstream in [1]).
- Since there is no maintainer for this package, I can help maintain it,
so add the package to the DEVELOPERS file.

[1] https://github.com/Azure/azure-c-shared-utility/pull/456

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                                    |  1 +
 ...0001-Fix-redirection-of-errno-header.patch | 32 +++++++++++++++++++
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  5 +++
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk    | 12 ++++---
 4 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch
 create mode 100644 package/azure-iot-sdk-c/azure-iot-sdk-c.hash

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b6a346a05d3..d67c75033fdd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2304,6 +2304,7 @@ N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
 F:	package/aoetools/
+F:	package/azure-iot-sdk-c/
 F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
diff --git a/package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch b/package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch
new file mode 100644
index 000000000000..efc3d3326540
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch
@@ -0,0 +1,32 @@
+From 9ff62052a9490c96366d97096a039dca30702b2d Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Fri, 3 Jul 2020 21:09:20 -0300
+Subject: [PATCH] Fix redirection of errno header
+
+The POSIX correct header to include is <errno.h>.
+
+The glibc silently redirects incorrect includes, but musl libc prints
+a warning:
+   #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ c-utility/pal/linux/socket_async_os.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/c-utility/pal/linux/socket_async_os.h b/c-utility/pal/linux/socket_async_os.h
+index bd59e487c099..1797089851e3 100644
+--- a/c-utility/pal/linux/socket_async_os.h
++++ b/c-utility/pal/linux/socket_async_os.h
+@@ -10,7 +10,7 @@
+ #include <sys/select.h>
+ #include <netinet/in.h>
+ #include <netinet/tcp.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <netdb.h>
+-- 
+2.17.1
+
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
new file mode 100644
index 000000000000..e9c3cf427965
--- /dev/null
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  36f41f4f59eb0b4a61e7d64ba8fabb4bcc66ab21473688273cd45c2a7b65bb49  azure-iot-sdk-c-LTS_02_2020_Ref01.tar.gz
+
+# Hash for license files:
+sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index f63297844db5..caca857591de 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = 2018-12-13
+AZURE_IOT_SDK_C_VERSION = LTS_02_2020_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
@@ -29,6 +29,8 @@ AZURE_IOT_SDK_C_LIBS += \
 	iothub_service_client/libiothub_service_client.a \
 	serializer/libserializer.a \
 	umqtt/libumqtt.a \
+	deps/uhttp/libuhttp.a \
+	deps/umock-c/libumock_c.a \
 	libparson.a
 else
 AZURE_IOT_SDK_C_LIBS += \
@@ -42,12 +44,14 @@ AZURE_IOT_SDK_C_LIBS += \
 	iothub_client/libiothub_client_mqtt_transport.so \
 	iothub_service_client/libiothub_service_client.so \
 	serializer/libserializer.so \
-	umqtt/libumqtt.so.1.1.11 \
+	umqtt/libumqtt.so.1.1.12 \
+	deps/uhttp/libuhttp.so \
+	deps/umock-c/libumock_c.so \
 	libparson.so
 
 define AZURE_IOT_SDK_C_CREATE_SYMLINKS
-	ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so.1
-	ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so
+	ln -sf libumqtt.so.1.1.12 $(1)/usr/lib/libumqtt.so.1
+	ln -sf libumqtt.so.1.1.12 $(1)/usr/lib/libumqtt.so
 endef
 endif
 
-- 
2.17.1
