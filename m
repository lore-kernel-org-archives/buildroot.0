From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:58:56 +0200
Subject: [Buildroot] [git commit] package/libssh: add option to enable
 server support
Message-ID: <20190927205701.CB5718F8B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1638f0abbacf463bfecc6cf8d3111c5e8c3538de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds Config.in option for ssh server support.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/Config.in | 9 +++++++++
 package/libssh/libssh.mk | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 3dbfa7d561..a6cf1f8960 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -13,6 +13,15 @@ config BR2_PACKAGE_LIBSSH
 
 	  http://www.libssh.org/
 
+if BR2_PACKAGE_LIBSSH
+
+config BR2_PACKAGE_LIBSSH_SERVER
+	bool "server"
+	help
+	  Enable libssh server support
+
+endif
+
 comment "libssh needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index d5f22c29a0..b8464ed2bf 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -14,12 +14,17 @@ LIBSSH_INSTALL_STAGING = YES
 LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
-	-DWITH_SERVER=OFF \
 	-DWITH_EXAMPLES=OFF
 
 # cmake older than 3.10 require this to avoid try_run() in FindThreads
 LIBSSH_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
+ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
+LIBSSH_CONF_OPTS += -DWITH_SERVER=ON
+else
+LIBSSH_CONF_OPTS += -DWITH_SERVER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBSSH_CONF_OPTS += -DWITH_ZLIB=ON
 LIBSSH_DEPENDENCIES += zlib
