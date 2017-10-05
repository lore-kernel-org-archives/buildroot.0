From: =?UTF-8?q?B=C3=A9la=20Becker?= <bela.becker@pcbdesign.hu>
Date: Thu,  5 Oct 2017 13:33:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiio: add binding for python3
Message-ID: <20171005113325.11715-1-bela.becker@pcbdesign.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python3 support was added to libiio in version 0.10.
This commit adds the option to compile libiio bindings if python3 was
selected instead of python.

Signed-off-by: B?la Becker <bela.becker@pcbdesign.hu>
---
 package/libiio/Config.in | 2 +-
 package/libiio/libiio.mk | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 75f6f3a847..baa163126a 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -96,7 +96,7 @@ config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
 
 config BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON
 	bool "Install Python bindings"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Install the Python bindings.
 
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index d066ae0314..0b13064085 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -60,7 +60,11 @@ LIBIIO_DEPENDENCIES += avahi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBIIO_DEPENDENCIES += python
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBIIO_DEPENDENCIES += python3
+endif
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=OFF
-- 
2.11.0
