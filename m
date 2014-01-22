From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 07:39:01 +0100
Subject: [Buildroot] [git commit] rtmpdump: new package
Message-ID: <20140122063957.91A869C5C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0adc73d6a6ac779c9a6372103490532c0f54a893
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rtmpdump - RTMPDump Real-Time Messaging Protocol API
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Note that this package will only install librtmp in this state.
Hence the name shown librtmp instead of rtmpdump

[Peter: whitespace fixes, use RTMPDUMP_CFLAGS]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/rtmpdump/Config.in   |    9 +++++++
 package/rtmpdump/rtmpdump.mk |   50 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 51ba120..b2b6d35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -692,6 +692,7 @@ source "package/nss-mdns/Config.in"
 source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
+source "package/rtmpdump/Config.in"
 source "package/slirp/Config.in"
 source "package/snmppp/Config.in"
 source "package/thrift/Config.in"
diff --git a/package/rtmpdump/Config.in b/package/rtmpdump/Config.in
new file mode 100644
index 0000000..d13c55b
--- /dev/null
+++ b/package/rtmpdump/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RTMPDUMP
+	bool "librtmp"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_POLARSSL && !BR2_PACKAGE_GNUTLS
+	help
+	  rtmpdump - RTMPDump Real-Time Messaging Protocol API
+	  Only librtmp is installed by this package.
+
+	  http://rtmpdump.mplayerhq.hu
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
new file mode 100644
index 0000000..81fb83f
--- /dev/null
+++ b/package/rtmpdump/rtmpdump.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# rtmpdump
+#
+################################################################################
+
+RTMPDUMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
+RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
+RTMPDUMP_INSTALL_STAGING = YES
+# Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
+# care about librtmp, it's LGPLv2.1+
+RTMPDUMP_LICENSE = LGPLv2.1+
+RTMPDUMP_LICENSE_FILES = librtmp/COPYING
+RTMPDUMP_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+    RTMPDUMP_DEPENDENCIES += gnutls
+    RTMPDUMP_CRYPTO = GNUTLS
+else ifeq ($(BR2_PACKAGE_POLARSSL),y)
+    RTMPDUMP_DEPENDENCIES += polarssl
+    RTMPDUMP_CRYPTO = POLARSSL
+else
+    RTMPDUMP_DEPENDENCIES += openssl
+    RTMPDUMP_CRYPTO = OPENSSL
+endif
+
+RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
+
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+    RTMPDUMP_CFLAGS += -fPIC
+endif
+
+define RTMPDUMP_BUILD_CMDS
+	$(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
+		prefix=/usr \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(RTMPDUMP_CFLAGS)" \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
+		-C $(@D)/librtmp
+endef
+
+define RTMPDUMP_INSTALL_STAGING_CMDS
+	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
+endef
+
+define RTMPDUMP_INSTALL_TARGET_CMDS
+	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
