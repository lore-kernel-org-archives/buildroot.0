From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 26 Jun 2016 18:39:11 -0400
Subject: [Buildroot] [PATCH v6 4/6] libselinux: bump to version 2.5
In-Reply-To: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466980753-667-5-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, if a user is using glibc 2.22, the default CFLAG
D_FILE_OFFSET_BITS=64 will cause a compile error.  This flag is now
removed from the CFLAGS in the make file to ensure that toolchains
compiled against glibc 2.22 will build the new version of the package
properly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v3 - v6:
 - Patch series version bump.

Changes v2 -> v3:
 - Changed logic to use filter-out instead of specifying cflags manually.

Changes v1 -> v2:
 - Reverted depends on in the config file.
 - Added manual cflags.


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
index d4b96c4..6f94173 100644
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
 
+# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22.
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 	ARCH=$(KERNEL_ARCH)
 
-- 
2.7.4
