From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:48 +0200
Subject: [Buildroot] [PATCH v8 05/12] e2fsprogs: use libblkid and libuuid
	from util-linux for host
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

We have a host-util-linux, so we can use it to provide libblkid and
libuuid. This makes it consistent with the target package.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in.host |  1 +
 package/e2fsprogs/e2fsprogs.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
index de9148e31d..7591bbcb7e 100644
--- a/package/e2fsprogs/Config.in.host
+++ b/package/e2fsprogs/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_E2FSPROGS
 	bool "host e2fsprogs"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  The EXT2/3/4 file system utilities.
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 896f01414d..5231a97f9c 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,14 +10,21 @@ E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2F
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
+
+# Use libblkid and libuuid from util-linux for host and target packages.
+# This prevents overriding them with e2fsprogs' ones, which may cause
+# problems for other packages.
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-# we don't have a host-util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
+HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
-HOST_E2FSPROGS_CONF_OPTS += --disable-defrag --disable-fuse2fs
+HOST_E2FSPROGS_CONF_OPTS = \
+	--disable-defrag \
+	--disable-fuse2fs \
+	--disable-libblkid \
+	--disable-libuuid
 
 E2FSPROGS_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
-- 
2.11.0
