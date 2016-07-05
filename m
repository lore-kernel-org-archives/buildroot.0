From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 11:12:01 +0200
Subject: [Buildroot] [git commit] jemalloc: new package
Message-ID: <20160705091250.B64AF821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6cdb4dd3e32a6de61118cec6237aa75f2a83754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides jemalloc, a malloc(3) implementation that
emphasizes fragmentation avoidance and scalable concurrency support.

A host variant is added as it will be used by rust.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[Thomas:
 - remove trailing slash (noticed by Romain Naour)
 - add !BR2_STATIC_LIBS dependency (noticed by Romain Naour).]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/jemalloc/Config.in     | 11 +++++++++++
 package/jemalloc/jemalloc.hash |  2 ++
 package/jemalloc/jemalloc.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1575e55..11fcdad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1243,6 +1243,7 @@ menu "Other"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
+	source "package/jemalloc/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libbsd/Config.in"
diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
new file mode 100644
index 0000000..ff74387
--- /dev/null
+++ b/package/jemalloc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_JEMALLOC
+	bool "jemalloc"
+	depends on !BR2_STATIC_LIBS
+	help
+	 This library providing a malloc(3) implementation that emphasizes
+	 fragmentation avoidance and scalable concurrency support.
+
+	 http://www.canonware.com/jemalloc/
+
+comment "jemalloc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
new file mode 100644
index 0000000..c24a273
--- /dev/null
+++ b/package/jemalloc/jemalloc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b216ddaeb901697fe38bd30ea02d7505a4b60e8979092009f95cfda860d46acb jemalloc-4.2.0.tar.bz2
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
new file mode 100644
index 0000000..72ba11f
--- /dev/null
+++ b/package/jemalloc/jemalloc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# jemalloc
+#
+################################################################################
+
+JEMALLOC_VERSION = 4.2.0
+JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
+JEMALLOC_SITE = http://www.canonware.com/download/jemalloc
+JEMALLOC_LICENSE = BSD-2c
+JEMALLOC_LICENSE_FILES = COPYING
+JEMALLOC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
