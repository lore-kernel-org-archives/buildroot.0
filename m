From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri,  1 May 2020 10:43:40 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/xerces: add disable network
 option
Message-ID: <20200501154340.27763-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add the option to compile xerces without network
support.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/xerces/Config.in | 9 +++++++++
 package/xerces/xerces.mk | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 2edc4346b5..bc5c725799 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -6,5 +6,14 @@ config BR2_PACKAGE_XERCES
 
 	  http://xerces.apache.org/xerces-c/
 
+if BR2_PACKAGE_XERCES
+
+config BR2_PACKAGE_XERCES_DISABLE_NETWORK
+	bool "Disable network support"
+	help
+	  Disable network support in xerces
+
+endif
+
 comment "xerces-c++ needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index c75a8b0d35..f98b1066a4 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -31,7 +31,9 @@ XERCES_CONF_ENV += LIBS=-liconv
 XERCES_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_XERCES_DISABLE_NETWORK),y)
+XERCES_CONF_OPTS += -Dnetwork:BOOL=OFF
+else ifeq ($(BR2_PACKAGE_LIBCURL),y)
 XERCES_CONF_OPTS += -Dnetwork-accessor=curl
 XERCES_DEPENDENCIES += libcurl
 else
-- 
2.17.1
