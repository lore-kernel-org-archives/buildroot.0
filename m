From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon,  4 May 2020 15:25:58 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/xerces: add enable network option
Message-ID: <20200504202558.24654-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add the option to compile xerces with network
enabled by default so it can be unselected to compile
without network support.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v2: - updated change logic for enable network instead of
      disable network
---
 package/xerces/Config.in | 10 ++++++++++
 package/xerces/xerces.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 2edc4346b5..a9b102bd5e 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -6,5 +6,15 @@ config BR2_PACKAGE_XERCES
 
 	  http://xerces.apache.org/xerces-c/
 
+if BR2_PACKAGE_XERCES
+
+config BR2_PACKAGE_XERCES_ENABLE_NETWORK
+	bool "Enable network support"
+	default y
+	help
+	  Enable network support in xerces
+
+endif
+
 comment "xerces-c++ needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index c75a8b0d35..a73537fb3e 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -31,12 +31,16 @@ XERCES_CONF_ENV += LIBS=-liconv
 XERCES_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_XERCES_ENABLE_NETWORK),y)
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 XERCES_CONF_OPTS += -Dnetwork-accessor=curl
 XERCES_DEPENDENCIES += libcurl
 else
 XERCES_CONF_OPTS += -Dnetwork-accessor=socket
 endif
+else
+XERCES_CONF_OPTS += -Dnetwork:BOOL=OFF
+endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XERCES_CONF_OPTS += -Dthreads=ON
-- 
2.17.1
