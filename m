From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 23:09:08 +0200
Subject: [Buildroot] [git commit] package/btrfs-progs: install to staging
	directory
Message-ID: <20160727214127.10FFA81E0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b372804be2d60f8f4cef17ae835de8a3aae00c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other packages when building against btrfs-progs require headers in the
staging directory under /usr/include/btrfs. This patch enables
installing btrfs-progs to the staging directory to enable other packages
to build against the btrfs-progs headers.

Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas: take into account the BR2_STATIC_LIBS case, by adding the
relevant BTRFS_PROGS_INSTALL_STAGING_OPTS variable, as well as a patch
to make sure "install-static" installs the static library and the
headers.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-install-static-library-and-headers-in-in.patch | 45 ++++++++++++++++++++++
 package/btrfs-progs/btrfs-progs.mk                 |  2 +
 2 files changed, 47 insertions(+)

diff --git a/package/btrfs-progs/0004-Makefile.in-install-static-library-and-headers-in-in.patch b/package/btrfs-progs/0004-Makefile.in-install-static-library-and-headers-in-in.patch
new file mode 100644
index 0000000..e6e9eab
--- /dev/null
+++ b/package/btrfs-progs/0004-Makefile.in-install-static-library-and-headers-in-in.patch
@@ -0,0 +1,45 @@
+From 2c2c2d992c3b298793983317588f73cf41675652 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 27 Jul 2016 22:49:58 +0200
+Subject: [PATCH] Makefile.in: install static library and headers in
+ install-static
+
+Currently, the install-static target only installs the statically
+compiled tools. However, some programs outside of btrfs-progs (for
+example docker) link with the btrfs libraries. If such programs want
+to link statically against the btrfs-progs library, then this library
+should be installed by "install-static". Indeed, "make install" cannot
+be used if the support for shared library is not enabled.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 8450ab3..0d3b490 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -183,7 +183,7 @@ test: test-fsck test-convert test-misc
+ # NOTE: For static compiles, you need to have all the required libs
+ # 	static equivalent available
+ #
+-static: $(progs_static)
++static: $(progs_static) $(libs_static)
+ 
+ version.h: version.sh version.h.in configure.ac
+ 	@echo "    [SH]     $@"
+@@ -346,6 +346,10 @@ install-static: $(progs_static) $(INSTALLDIRS)
+ 	for p in $(progs_static) ; do \
+ 		$(INSTALL) -D -m755 $$p $(DESTDIR)$(bindir)/`basename $$p .static` ; \
+ 	done
++	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
++	$(INSTALL) $(libs_static) $(DESTDIR)$(libdir)
++	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)
++	$(INSTALL) -m644 $(headers) $(DESTDIR)$(incdir)
+ 
+ $(INSTALLDIRS):
+ 	@echo "Making install in $(patsubst install-%,%,$@)"
+-- 
+2.7.4
+
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 2c3dc50..8768057 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -11,11 +11,13 @@ BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
+BTRFS_PROGS_INSTALL_STAGING = YES
 
 # Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
 BTRFS_PROGS_MAKE_OPTS = static
 BTRFS_PROGS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
+BTRFS_PROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 endif
 
 $(eval $(autotools-package))
