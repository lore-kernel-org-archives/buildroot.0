From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 17:39:05 +0200
Subject: [Buildroot] [PATCH v2 2/2] coreutils: use single binary in symlink
 method
In-Reply-To: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
References: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180401153905.14483-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

The symlink method is faster, since there is no shell fork/exec, and
provides extra space savings.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas: use the symlinks method not only for the merged /usr case,
but also in the non-merged case to be consistent, and therefore adjust
the logic that was moving the shell wrappers to a logic that recreates
the symlinks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 8880e77dcc..4ef888829f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,7 +14,7 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs \
+COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
@@ -103,9 +103,10 @@ endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
 define COREUTILS_CLEANUP_BIN
-	# some things go in root rather than usr
+	# some things go in /bin rather than /usr/bin
 	$(foreach f,$(COREUTILS_BIN_PROGS), \
-		mv -f $(TARGET_DIR)/usr/bin/$(f) $(TARGET_DIR)/bin/$(f)
+		rm -f $(TARGET_DIR)/usr/bin/$(f) && \
+		ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
 	)
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
-- 
2.14.3
