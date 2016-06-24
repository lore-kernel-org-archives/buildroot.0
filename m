From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 17:32:06 -0400
Subject: [Buildroot] [PATCH 4/7] v3-libselinux: bump to version 2.5
In-Reply-To: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
References: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466803929-5513-4-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, glibc 2.22 will fail to compile against the default flag -D_FILE_OFFSET_BITS64
This option is now overwritten in libselinux.mk to ensure that toolchains compiled against glibc 2.22
will build the new version of the package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/libselinux.hash | 2 +-
 package/libselinux/libselinux.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 861c327..a4c3440 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 57aad47c06b7ec18a76e8d9870539277a84cb40109cfdcf70ed3260bdb04447a libselinux-2.1.13.tar.gz
+sha256 94c9e97706280bedcc288f784f67f2b9d3d6136c192b2c9f812115edba58514f libselinux-2.5.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index d4b96c4..f2757ab 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.1.13
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSELINUX_VERSION = 2.5
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
@@ -13,8 +13,10 @@ LIBSELINUX_DEPENDENCIES = libsepol pcre
 
 LIBSELINUX_INSTALL_STAGING = YES
 
+#Because Glibc 2.22 fails to compile against -D_FILE_OFFSET_BITS64, CFLAGS have to be specified manually.
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 	ARCH=$(KERNEL_ARCH)
 
-- 
2.7.4
