From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 21 Jun 2018 17:33:39 -0700
Subject: [Buildroot] [RFC PATCH v5 5/6] lld: new package
In-Reply-To: <20180622003340.10859-1-joseph.kogut@gmail.com>
References: <20180622003340.10859-1-joseph.kogut@gmail.com>
Message-ID: <20180622003340.10859-6-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in.host     |  1 +
 package/lld/Config.in.host | 16 ++++++++++++++++
 package/lld/lld.hash       |  3 +++
 package/lld/lld.mk         | 15 +++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/lld/Config.in.host
 create mode 100644 package/lld/lld.hash
 create mode 100644 package/lld/lld.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9116db39cb..7179a70f30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -978,6 +978,7 @@ F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/lld/
 F:	package/python-cython/
 F:	package/python-raven/
 F:	package/python-schedule/
diff --git a/package/Config.in.host b/package/Config.in.host
index d0374d351e..943ceff6e5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -30,6 +30,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
+	source "package/lld/Config.in.host"
 	source "package/llvm/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
diff --git a/package/lld/Config.in.host b/package/lld/Config.in.host
new file mode 100644
index 0000000000..c04b7924fa
--- /dev/null
+++ b/package/lld/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_LLD
+	bool "host lld"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
+	select BR2_PACKAGE_HOST_LLVM
+	help
+	  LLD is a linker from the LLVM project that is a drop-in
+	  replacement for system linkers, and runs much faster than
+	  them. It also provides features that are useful for
+	  toolchain developers.
+
+	  https://lld.llvm.org/
+
+comment "lld needs a toolchain w/ host gcc >= 4.8"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8
diff --git a/package/lld/lld.hash b/package/lld/lld.hash
new file mode 100644
index 0000000000..ce81c7baca
--- /dev/null
+++ b/package/lld/lld.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 6b8c4a833cf30230c0213d78dbac01af21387b298225de90ab56032ca79c0e0b  lld-6.0.0.src.tar.xz
+sha256 f0502d2d0e19748c534ee95ea486c092273303dbef76404c8b17dc8bf6ca441b  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
new file mode 100644
index 0000000000..e82970c844
--- /dev/null
+++ b/package/lld/lld.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# lld
+#
+################################################################################
+
+LLD_VERSION = 6.0.0
+LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
+LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
+LLD_LICENSE = NCSA
+LLD_LICENSE_FILES = LICENSE.TXT
+LLD_SUPPORTS_IN_SOURCE_BUILD = NO
+HOST_LLD_DEPENDENCIES = host-llvm
+
+$(eval $(host-cmake-package))
-- 
2.17.1
