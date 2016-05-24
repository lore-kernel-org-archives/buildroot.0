From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 May 2016 17:10:19 -0300
Subject: [Buildroot] [PATCH v2] dosfstools: security bump to version 4.0
Message-ID: <1464120619-9107-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

CVE-2015-8872 - if the third to last entry was written on a FAT12
filesystem with an odd number of clusters, the second to last entry
would be corrupted. This corruption may also lead to invalid memory
accesses when the corrupted entry becomes out of bounds and is used
late.

CVE-2016-4804 - the variable used for storing the FAT size (in bytes)
was an unsigned int. Since the size in sectors read from the BPB was not
sufficiently checked, this could end up being zero after multiplying it
with the sector size while some offsets still stayed excessive.
Ultimately it would cause segfaults when accessing FAT entries for which
no memory was allocated.

Converted package to autotools infra to match upstream.

The install options are now removals, enabled compatibilty symlinks and
exec-prefix set to / to match previous install names/locations.

Accounted for optional udev usage.

Dropped musl compatibility patch since it's upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Change for v2: drop double rm -f as pointed by Yann.

 .../0001-mkfs.fat-fix-incorrect-int-type.patch     | 45 ----------------
 package/dosfstools/dosfstools.hash                 |  2 +-
 package/dosfstools/dosfstools.mk                   | 63 ++++++++--------------
 3 files changed, 24 insertions(+), 86 deletions(-)
 delete mode 100644 package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch

diff --git a/package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch b/package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
deleted file mode 100644
index 34ebc24..0000000
--- a/package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7a589ef6dab52ad32a296939f0ed2acb4d76b2a7 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 16 Aug 2015 15:55:43 +0200
-Subject: [PATCH] mkfs.fat: fix incorrect int type
-
-u_int32_t is not a stanard type, while uint32_t is. This fixes builds
-with the musl C library, which only defines so-called "clean" headers;
-build failures are like (back-quotes and elision manually added for
-readability):
-
-    http://autobuild.buildroot.org/results/a09/a0923d7f6d4dbae02eba4c5024bbdae3a52aa85a/build-end.log
-
-    /home/peko/autobuild/instance-1/output/host/usr/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE \
-        -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_GNU_SOURCE -D_LARGEFILE_SOURCE \
-        -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -c -o mkfs.fat.o src/mkfs.fat.c
-    src/mkfs.fat.c: In function 'main':
-    src/mkfs.fat.c:1415:18: error: 'u_int32_t' undeclared (first use in this function)
-         volume_id = (u_int32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec); [...]
-                      ^
-    src/mkfs.fat.c:1415:18: note: each undeclared identifier is reported only once for each
-    function it appears in
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Upstream status: applied: https://github.com/dosfstools/dosfstools/pull/9
----
- src/mkfs.fat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mkfs.fat.c b/src/mkfs.fat.c
-index b38d116..dddbe24 100644
---- a/src/mkfs.fat.c
-+++ b/src/mkfs.fat.c
-@@ -1412,7 +1412,7 @@ int main(int argc, char **argv)
- 
-     gettimeofday(&create_timeval, NULL);
-     create_time = create_timeval.tv_sec;
--    volume_id = (u_int32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec);	/* Default volume ID = creation time, fudged for more uniqueness */
-+    volume_id = (uint32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec);	/* Default volume ID = creation time, fudged for more uniqueness */
-     check_atari();
- 
-     printf("mkfs.fat " VERSION " (" VERSION_DATE ")\n");
--- 
-1.9.1
-
diff --git a/package/dosfstools/dosfstools.hash b/package/dosfstools/dosfstools.hash
index f852195..777b8d9 100644
--- a/package/dosfstools/dosfstools.hash
+++ b/package/dosfstools/dosfstools.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2	dosfstools-3.0.28.tar.xz
+sha256	9037738953559d1efe04fc5408b6846216cc0138f7f9d32de80b6ec3c35e7daf	dosfstools-4.0.tar.xz
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index b7f7d96..8014dd0 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,65 +4,48 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.28
+DOSFSTOOLS_VERSION = 4.0
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
+DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 
 # Avoid target dosfstools dependencies, no host-libiconv
 HOST_DOSFSTOOLS_DEPENDENCIES =
 
-DOSFSTOOLS_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+DOSFSTOOLS_CONF_OPTS += --with-udev
+DOSFSTOOLS_DEPENDENCIES += udev
+else
+DOSFSTOOLS_CONF_OPTS += --without-udev
+endif
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
+DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
 DOSFSTOOLS_DEPENDENCIES += libiconv
-DOSFSTOOLS_LDLIBS += -liconv
 endif
 
-define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(DOSFSTOOLS_CFLAGS)" LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
-endef
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
-define DOSFSTOOLS_INSTALL_FATLABEL
-	$(INSTALL) -D -m 755 $(@D)/fatlabel $(TARGET_DIR)/sbin/fatlabel
-	ln -sf fatlabel $(TARGET_DIR)/sbin/dosfslabel
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
+define DOSFSTOOLS_REMOVE_FATLABEL
+	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
 endef
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),y)
-define DOSFSTOOLS_INSTALL_FSCK_FAT
-	$(INSTALL) -D -m 755 $(@D)/fsck.fat $(TARGET_DIR)/sbin/fsck.fat
-	ln -fs fsck.fat $(TARGET_DIR)/sbin/dosfsck
-	ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.msdos
-	ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.vfat
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
+define DOSFSTOOLS_REMOVE_FSCK_FAT
+	rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
 endef
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),y)
-define DOSFSTOOLS_INSTALL_MKFS_FAT
-	$(INSTALL) -D -m 755 $(@D)/mkfs.fat $(TARGET_DIR)/sbin/mkfs.fat
-	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkdosfs
-	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos
-	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
+define DOSFSTOOLS_REMOVE_MKFS_FAT
+	rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
 endef
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
 endif
 
-define DOSFSTOOLS_INSTALL_TARGET_CMDS
-	$(DOSFSTOOLS_INSTALL_FATLABEL)
-	$(DOSFSTOOLS_INSTALL_FSCK_FAT)
-	$(DOSFSTOOLS_INSTALL_MKFS_FAT)
-endef
-
-define HOST_DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define HOST_DOSFSTOOLS_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.3
