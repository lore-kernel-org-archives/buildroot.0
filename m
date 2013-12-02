From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2013 08:45:10 +0100
Subject: [Buildroot] [git commit] berkeleydb: add compat option
Message-ID: <20131202102417.1B0489BDF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=287cfe6b21f65dcc93a06700dbedc7bade267c33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add DB 1.85 compatibility layer option, it's needed for arpd in iproute2
and other old apps that haven't moved to the newer API.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/Config.in     |   10 +++++++++-
 package/berkeleydb/berkeleydb.mk |    2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/berkeleydb/Config.in b/package/berkeleydb/Config.in
index a597abb..ff1e386 100644
--- a/package/berkeleydb/Config.in
+++ b/package/berkeleydb/Config.in
@@ -6,8 +6,16 @@ config BR2_PACKAGE_BERKELEYDB
 
 	  http://www.sleepycat.com/products/db.shtml
 
+if BR2_PACKAGE_BERKELEYDB
+
+config BR2_PACKAGE_BERKELEYDB_COMPAT185
+	bool "DB 1.85 compatibility"
+	help
+	  Build and install DB 1.85 compatibility API.
+
 config BR2_PACKAGE_BERKELEYDB_TOOLS
 	bool "install tools"
-	depends on BR2_PACKAGE_BERKELEYDB
 	help
 	  Install berkeleydb tools, mostly useful for debugging purposes.
+
+endif
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 0e3e830..f325020 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -36,7 +36,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx,--disable-cxx) \
 		--disable-java \
 		--disable-tcl \
-		--disable-compat185 \
+		$(if $(BR2_PACKAGE_BERKELEYDB_COMPAT185),--enable-compat185,--disable-compat185) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		--with-pic \
 		--enable-o_direct \
