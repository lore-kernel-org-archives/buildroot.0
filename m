From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Nov 2018 11:55:56 +0100
Subject: [Buildroot] [PATCH next v4 5/6] Makefile: define
 TARGET_DIR_WARNING_FILE relative to TARGET_DIR
In-Reply-To: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181114105557.12599-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 7e9870ce32d6329d9e3d602247fbe1709a2275a4 ("core: introduce
intermediate BASE_TARGET_DIR variable"), the definition of
TARGET_DIR_WARNING_FILE was changed to use $(BASE_TARGET_DIR) instead
of $(TARGET_DIR).

However, this change is incompatible with per-package directories, and
is in fact not needed.

With per-package directories, using $(BASE_TARGET_DIR) means that
TARGET_DIR_WARNING_FILE is
output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM. Due to this, when
skeleton-init-common or skeleton-custom attempt to install it, it
fails, because it should be installed to their package per-package
target directory, and not the global output/target folder that doesn't
exist yet. The failure looks like this:

/usr/bin/install -m 0644 support/misc/target-dir-warning.txt /home/thomas/projets/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
/usr/bin/install: cannot create regular file '/home/thomas/projets/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM': No such file or directory
make[1]: *** [package/pkg-generic.mk:336: /home/thomas/projets/buildroot/output/build/skeleton-init-common/.stamp_target_installed] Error 1

TARGET_DIR_WARNING_FILE is used in three places:

 - In skeleton-custom.mk and skeleton-init-common.mk, where as
   explained above, using $(TARGET_DIR) fixes the use of
   $(TARGET_DIR_WARNING_FILE) in the context of per-package target
   directories.

 - In fs/common.mk, where it is used as argument to $(notdir ...) to
   retrieve just the name of the warning file. So in this case, we
   really don't care about the path of the file, just its name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 24c803872d..23032988a5 100644
--- a/Makefile
+++ b/Makefile
@@ -468,7 +468,7 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE = $(BASE_TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE = $(HOST_DIR)/bin/ccache
-- 
2.19.1
