From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 16:14:08 +0200
Subject: [Buildroot] [git commit] libshout: new package
Message-ID: <20141017142530.583A0B328B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=798f725cc5e16aa7b2253f608a8aff5a74498d7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix Config.in indentation, license, needs host-pkgconf, optionally
 use libtheora and speex]
Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/libshout/Config.in   |   10 ++++++++++
 package/libshout/libshout.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 93e148d..4c6685a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -807,6 +807,7 @@ menu "Networking"
 	source "package/librsync/Config.in"
 	source "package/libsocketcan/Config.in"
 	source "package/libshairplay/Config.in"
+	source "package/libshout/Config.in"
 	source "package/libsoup/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
diff --git a/package/libshout/Config.in b/package/libshout/Config.in
new file mode 100644
index 0000000..9029342
--- /dev/null
+++ b/package/libshout/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBSHOUT
+	bool "libshout"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  Libshout is a library for communicating with and sending data to an
+	  icecast server.  It handles the socket connection, the timing of the
+	  data, and prevents bad data from getting to the icecast server.
+
+	  http://icecast.org/download/
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
new file mode 100644
index 0000000..1166f58
--- /dev/null
+++ b/package/libshout/libshout.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libshout
+#
+################################################################################
+
+LIBSHOUT_VERSION = 2.3.1
+LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
+LIBSHOUT_LICENSE = LGPLv2+
+LIBSHOUT_LICENSE_FILES = COPYING
+LIBSHOUT_INSTALL_STAGING = YES
+LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
+
+ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
+LIBSHOUT_CONF_OPTS += --enable-theora
+LIBSHOUT_DEPENDENCIES += libtheora
+else
+LIBSHOUT_CONF_OPTS += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+LIBSHOUT_CONF_OPT += --enable-speex
+LIBSHOUT_DEPENDENCIES += speex
+else
+LIBSHOUT_CONF_OPTS += --disable-speex
+endif
+
+$(eval $(autotools-package))
