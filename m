From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2013 09:25:49 +0100
Subject: [Buildroot] [git commit] lftp: new package
Message-ID: <20131205092202.7CA4B9BF2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=940ea28488252f165c774fd1b04f99417b2d0d85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LFTP is a sophisticated ftp/http client, and a file transfer program
supporting a number of network protocols. Like BASH, it has job
control and uses the readline library for input. It has bookmarks,
a built-in mirror command, and can transfer several files in parallel.
It was designed with reliability in mind.

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 ..._fallocate-m4-check-for-cross-compilation.patch |   46 ++++++++++++++
 package/lftp/Config.in                             |   64 ++++++++++++++++++++
 package/lftp/lftp.mk                               |   54 ++++++++++++++++
 4 files changed, 165 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cffd3fb..912fa58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -813,6 +813,7 @@ source "package/iputils/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/knock/Config.in"
+source "package/lftp/Config.in"
 source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
diff --git a/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch b/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch
new file mode 100644
index 0000000..66f8a80
--- /dev/null
+++ b/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch
@@ -0,0 +1,46 @@
+From 450ed0f38159a9944460ecff65793fe6de206df4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
+Date: Mon, 25 Nov 2013 11:03:59 +0100
+Subject: [PATCH] Fix posix_fallocate m4 check for cross-compilation.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If we're cross-compiling, we can't test if the code run, we can only
+test that it compiles and links. If it does, assume posix_fallocate
+works, because cross-compilation for AIX or old glibc is unlikely.
+
+Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
+---
+ m4/lftp.m4 | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/m4/lftp.m4 b/m4/lftp.m4
+index 6d7ad9c..b38364d 100644
+--- a/m4/lftp.m4
++++ b/m4/lftp.m4
+@@ -271,6 +271,21 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
+        i_cv_posix_fallocate_works=yes
+      ], [
+        i_cv_posix_fallocate_works=no
++     ], [
++       dnl * Cross-compilation: we can only test if the code compiles and links.
++       dnl * If it does, assume that it works, because cross-compilation for AIX or old glibc is unlikely.
++       AC_CACHE_VAL([i_cv_posix_fallocate_works],[
++         AC_LINK_IFELSE([
++           #include <fcntl.h>
++       	   int main() {
++             posix_fallocate(0, 0, 0);
++           }
++         ], [
++           i_cv_posix_fallocate_works=yes
++         ], [
++           i_cv_posix_fallocate_works=no
++         ])
++       ])
+      ])
+    ])
+    if test x$i_cv_posix_fallocate_works = xyes; then
+-- 
+1.8.4.4
+
diff --git a/package/lftp/Config.in b/package/lftp/Config.in
new file mode 100644
index 0000000..f4bde79
--- /dev/null
+++ b/package/lftp/Config.in
@@ -0,0 +1,64 @@
+config BR2_PACKAGE_LFTP
+	bool "lftp"
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL
+	help
+	  LFTP is a sophisticated ftp/http client, and a file transfer program
+	  supporting a number of network protocols. Like BASH, it has job
+	  control and uses the readline library for input. It has bookmarks,
+	  a built-in mirror command, and can transfer several files in parallel.
+	  It was designed with reliability in mind.
+
+	  http://lftp.yar.ru/
+
+if BR2_PACKAGE_LFTP
+
+comment "Commands"
+
+config BR2_PACKAGE_LFTP_CMD_MIRROR
+	bool "Mirror command"
+	default y
+	help
+	  Enable mirror command
+
+config BR2_PACKAGE_LFTP_CMD_SLEEP
+	bool "Sleep command"
+	default y
+	help
+	  Enable sleep command
+
+config BR2_PACKAGE_LFTP_CMD_TORRENT
+	bool "Torrent command"
+	help
+	  Enable torrent command
+
+comment "Protocols"
+
+config BR2_PACKAGE_LFTP_PROTO_FISH
+	bool "FISH protocol"
+	help
+	  Enable FISH protocol
+
+config BR2_PACKAGE_LFTP_PROTO_FTP
+	bool "FTP protocol"
+	default y
+	help
+	  Enable FTP protocol
+
+config BR2_PACKAGE_LFTP_PROTO_HTTP
+	bool "HTTP protocol"
+	help
+	  Enable HTTP protocol
+
+config BR2_PACKAGE_LFTP_PROTO_SFTP
+	bool "SFTP protocol"
+	help
+	  Enable SFTP protocol
+
+endif  # BR2_PACKAGE_LFTP
+
+comment "lftp requires a toolchain w/ C++, wchar"
+	depends on !(BR2_USE_WCHAR && BR2_INSTALL_LIBSTDCPP)
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
new file mode 100644
index 0000000..faf9f37
--- /dev/null
+++ b/package/lftp/lftp.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# lftp
+#
+################################################################################
+
+LFTP_VERSION = 4.4.10
+LFTP_SITE    = http://lftp.yar.ru/ftp
+LFTP_LICENSE = GPLv3+
+LFTP_LICENSE_FILES = COPYING
+LFTP_AUTORECONF = YES
+LFTP_DEPENDENCIES  = readline zlib
+
+LFTP_CONF_OPT += --with-modules
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LFTP_DEPENDENCIES += gnutls
+LFTP_CONF_OPT += --with-gnutls
+else
+LFTP_CONF_OPT += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LFTP_DEPENDENCIES += openssl
+LFTP_CONF_OPT += --with-openssl
+else
+LFTP_CONF_OPT += --without-openssl
+endif
+
+# Remove /usr/share/lftp
+define LFTP_REMOVE_DATA
+        $(RM) -fr $(TARGET_DIR)/usr/share/lftp
+endef
+
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_DATA
+
+# Optional commands and protocols
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_MIRROR) += cmd-mirror.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_SLEEP) += cmd-sleep.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_TORRENT) += cmd-torrent.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FISH) += proto-fish.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FTP) += proto-ftp.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_HTTP) += proto-http.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_SFTP) += proto-sftp.so
+
+define LFTP_REMOVE_MODULES
+	for f in $(LFTP_MODULES_TO_REMOVE-) ; do \
+		$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/$$f ; \
+	done
+endef
+
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_MODULES
+
+$(eval $(autotools-package))
