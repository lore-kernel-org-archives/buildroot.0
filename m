From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:32:05 +0200
Subject: [Buildroot] [git commit] libpthsem: add libpth compatibility option
Message-ID: <20140723213300.1FC4B9D2CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0592c9f6581d4446d12acfd9a27b5cf18875625
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the BR2_PACKAGE_LIBPTHSEM_COMPAT option to the
libpthsem package, in order to enable the compatibility with the pth
library, which is useful to support gnupg2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpthsem/Config.in    |   10 ++++++++++
 package/libpthsem/libpthsem.mk |    7 +++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index ae1c78f..932acec 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -7,3 +7,13 @@ config BR2_PACKAGE_LIBPTHSEM
 	  version, with support for semaphores added.
 
 	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
+
+if BR2_PACKAGE_LIBPTHSEM
+
+config BR2_PACKAGE_LIBPTHSEM_COMPAT
+	bool "libpth compatibility"
+	help
+	  This option enables the compatibility with the original
+	  libpth library.
+
+endif
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index dbfab34..040229e 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -14,4 +14,11 @@ LIBPTHSEM_INSTALL_STAGING = YES
 LIBPTHSEM_DEPENDENCIES = argp-standalone
 LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
 
+ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
+LIBPTHSEM_CONF_OPT += --enable-compat
+LIBPTHSEM_CONFIG_SCRIPTS += pth-config
+else
+LIBPTHSEM_CONF_OPT += --disable-compat
+endif
+
 $(eval $(autotools-package))
