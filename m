From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 27 Sep 2017 15:25:24 -0300
Subject: [Buildroot] [PATCH v2] coreutils: use single binary in symlink
	method, with merged usr
In-Reply-To: <1506529411-26172-1-git-send-email-casantos@datacom.ind.br>
References: <1506529411-26172-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1506536724-10603-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symlink method is faster, since there is no shell fork/exec, and
provides extra space savings. Keep using the shebang method without
merged usr, because it makes easier to move binaries into other
directories.

Change-Id: Iad19df24a7428f8a3c0d87d62da57c659b0378d1
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/coreutils/coreutils.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6a8a31b..4b9dc99 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,7 +14,7 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs \
+COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
@@ -101,9 +101,15 @@ COREUTILS_CONF_OPTS += --with-openssl=yes
 COREUTILS_DEPENDENCIES += openssl
 endif
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),)
+# Build as a single binary for some neat space savings. Use the symlink method
+# with merged usr. Otherwise use the shebang method since it allows us to move
+# binaries into other directories whereas for symlink that wouldn't be so easy.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
+else
+COREUTILS_CONF_OPTS += --enable-single-binary=shebangs
 define COREUTILS_CLEANUP_BIN
-	# some things go in root rather than usr
+	# some things go in /bin rather than /usr/bin
 	for f in $(COREUTILS_BIN_PROGS); do \
 		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
 	done
-- 
2.7.5
