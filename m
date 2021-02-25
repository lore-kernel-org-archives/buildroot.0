From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 25 Feb 2021 11:53:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: add optional duktape
 dependency
Message-ID: <20210225105355.43547-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Duktape allows the user to enable JavaScript scripting support.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/gerbera/Config.in  |  3 +++
 package/gerbera/gerbera.mk | 11 ++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index b734de95de..a252dff9a9 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -20,6 +20,9 @@ config BR2_PACKAGE_GERBERA
 	  A free media server.
 	  Stream your media to devices on your home network.
 
+	  Select BR2_PACKAGE_DUKTAPE if you want to enable JavaScript for
+	  scripting.
+
 	  https://gerbera.io
 
 comment "gerbera needs a toolchain w/ C++, threads, wchar, gcc >= 8"
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 6e36377798..ccb3b2eeb5 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -16,15 +16,20 @@ GERBERA_DEPENDENCIES = \
 	sqlite \
 	util-linux \
 	zlib
-GERBERA_CONF_OPTS = \
-	-DWITH_DEBUG=OFF \
-	-DWITH_JS=OFF
+GERBERA_CONF_OPTS = -DWITH_DEBUG=OFF
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
+ifeq ($(BR2_PACKAGE_DUKTAPE),y)
+GERBERA_DEPENDENCIES += duktape
+GERBERA_CONF_OPTS += -DWITH_JS=ON
+else
+GERBERA_CONF_OPTS += -DWITH_JS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_EXIV2),y)
 GERBERA_DEPENDENCIES += exiv2
 GERBERA_CONF_OPTS += -DWITH_EXIV2=ON
-- 
2.30.1
