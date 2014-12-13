From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 13 Dec 2014 19:44:54 +0100
Subject: [Buildroot] [PATCH 1/1] liblinear: new package
Message-ID: <1418496294-20519-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 .../0001-blas-don-t-overwrite-ar-options.patch     | 35 ++++++++++++++++++++++
 package/liblinear/Config.in                        |  7 +++++
 package/liblinear/liblinear.mk                     | 26 ++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
 create mode 100644 package/liblinear/Config.in
 create mode 100644 package/liblinear/liblinear.mk

diff --git a/package/Config.in b/package/Config.in
index 48be2df..511271c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -901,6 +901,7 @@ menu "Other"
 	source "package/libgc/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
+	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
new file mode 100644
index 0000000..5d1ef3f
--- /dev/null
+++ b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
@@ -0,0 +1,35 @@
+From cae4c3b80fee0f3637d70f6d33946888c8105637 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 13 Dec 2014 17:16:58 +0100
+Subject: [PATCH 1/1] blas: don't overwrite ar options
+
+ar's rcv options get lost when AR is passed on
+the command line.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ blas/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/blas/Makefile b/blas/Makefile
+index 895fd24..78cec9a 100644
+--- a/blas/Makefile
++++ b/blas/Makefile
+@@ -1,4 +1,4 @@
+-AR     = ar rcv
++AR     = ar
+ RANLIB = ranlib 
+ 
+ HEADERS = blas.h blasp.h
+@@ -8,7 +8,7 @@ CFLAGS = $(OPTFLAGS)
+ FFLAGS = $(OPTFLAGS)
+ 
+ blas: $(FILES) $(HEADERS)
+-	$(AR) blas.a $(FILES)  
++	$(AR) rcv blas.a $(FILES)  
+ 	$(RANLIB) blas.a
+ 
+ clean:
+-- 
+1.9.3
+
diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
new file mode 100644
index 0000000..08e8365
--- /dev/null
+++ b/package/liblinear/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBLINEAR
+	bool "liblinear"
+	help
+	  liblinear is a linear classifier for data with millions of instances and
+	  features.
+
+	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
new file mode 100644
index 0000000..7120659
--- /dev/null
+++ b/package/liblinear/liblinear.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# liblinear
+#
+################################################################################
+
+LIBLINEAR_VERSION = 1.96
+LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear/$(LIBLINEAR_VERSION_MAJOR)
+LIBLINEAR_LICENSE = BSD-3c
+LIBLINEAR_LICENSE_FILES = COPYING
+
+define LIBLINEAR_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) lib
+endef
+
+# We don't install programs train and predict which are used for training and
+# testing.
+LIBLINEAR_INSTALL_TARGET = NO
+LIBLINEAR_INSTALL_STAGING = YES
+
+define LIBLINEAR_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/linear.h $(STAGING_DIR)/usr/include/linear.h
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.2 $(STAGING_DIR)/usr/lib/liblinear.so.2
+endef
+
+$(eval $(generic-package))
-- 
1.9.3
