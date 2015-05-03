From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 13:33:02 +0200
Subject: [Buildroot] [git commit] bcusdk: needs argp-standalone on uClibc
Message-ID: <20150503113506.26F3F80DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25206d6e26dc4ce9c272e68876f31d0ca7d30e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/181/181f12d3a46ef10113ab47f75ccf57cfc1b6210f/
http://autobuild.buildroot.net/results/25c/25cb21dd5a0dad318c498fcf7a889ae2ce93c697/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bcusdk/Config.in |    1 +
 package/bcusdk/bcusdk.mk |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index 658c592..72deef1 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BCUSDK
 	depends on BR2_USE_MMU # libpthsem
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPTHSEM
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  A free development environment for the Bus Coupling Units of
 	  the European Installation Bus.
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 80c98af..697b5ce 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -20,7 +20,10 @@ BCUSDK_CONF_OPTS = \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr
 
-BCUSDK_DEPENDENCIES = libpthsem
+BCUSDK_DEPENDENCIES = \
+	libpthsem \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+
 
 define BCUSDK_REMOVE_EXAMPLES
 	$(RM) -rf $(TARGET_DIR)/usr/share/bcusdk
