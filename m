From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon,  7 Apr 2014 12:00:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/libgc: add Boehm-Demers-Weiser gc
	library
In-Reply-To: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
Message-ID: <1396868422-5757-2-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed for applications like Zile

Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
Signed-off-by: Alex Benn?e <alex@bennee.com>
---
 package/Config.in       |  1 +
 package/libgc/Config.in |  9 +++++++++
 package/libgc/libgc.mk  | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/libgc/Config.in
 create mode 100644 package/libgc/libgc.mk

diff --git a/package/Config.in b/package/Config.in
index e816603..5cdf72b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -786,6 +786,7 @@ source "package/libev/Config.in"
 source "package/libevdev/Config.in"
 source "package/libevent/Config.in"
 source "package/libffi/Config.in"
+source "package/libgc/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
diff --git a/package/libgc/Config.in b/package/libgc/Config.in
new file mode 100644
index 0000000..bac636c
--- /dev/null
+++ b/package/libgc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBGC
+	bool "libgc"
+	help
+          The Boehm-Demers-Weiser conservative garbage collector can be used
+          as a garbage collecting replacement for C malloc or C++ new. It allows
+          you to allocate memory basically as you normally would, without
+          explicitly deallocating memory that is no longer useful.
+
+          http://www.hboehm.info/gc/
diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
new file mode 100644
index 0000000..e5c4609
--- /dev/null
+++ b/package/libgc/libgc.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# Boehm-Demers-Weiser's GC
+#
+################################################################################
+
+LIBGC_VERSION = 7.4.0
+LIBGC_SOURCE = gc-${LIBGC_VERSION}.tar.gz
+LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
+LIBGC_EXTRA_DOWNLOADS = libatomic_ops-${LIBGC_VERSION}.tar.gz
+LIBGC_LICENSE = GPLv1+
+LIBGC_LICENSE_FILES = COPYING
+LIBGC_INSTALL_STAGING = YES
+
+define LIBGC_POST_EXTRACT_INC_LIBATOMIC
+	env
+	mkdir -p $(@D)/libatomic_ops
+	tar -xvf ${BR2_DL_DIR}/libatomic_ops-${LIBGC_VERSION}.tar.gz --strip-components=1 -C $(@D)/libatomic_ops
+endef
+
+LIBGC_POST_EXTRACT_HOOKS += LIBGC_POST_EXTRACT_INC_LIBATOMIC
+
+$(eval $(autotools-package))
-- 
1.9.1
