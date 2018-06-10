From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 10 Jun 2018 13:44:48 -0700
Subject: [Buildroot] [RFC PATCH v2 8/9] lld: new package
In-Reply-To: <20180610204449.13646-1-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
 <20180610204449.13646-1-joseph.kogut@gmail.com>
Message-ID: <20180610204449.13646-10-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/lld/Config.in |  3 +++
 package/lld/lld.hash  |  3 +++
 package/lld/lld.mk    | 19 +++++++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/lld/Config.in
 create mode 100644 package/lld/lld.hash
 create mode 100644 package/lld/lld.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 568f47d242..ef6fd32fed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -959,6 +959,7 @@ F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/lld/
 F:	package/python-cython/
 F:	package/python-raven/
 F:	package/python-schedule/
diff --git a/package/Config.in b/package/Config.in
index c2e619b317..e4eb87b574 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1565,6 +1565,7 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
+	source "package/lld/Config.in"
 	source "package/llvm/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
diff --git a/package/lld/Config.in b/package/lld/Config.in
new file mode 100644
index 0000000000..0ad50fd608
--- /dev/null
+++ b/package/lld/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_LLD
+	bool "lld"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
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
index 0000000000..cfaf3dbd29
--- /dev/null
+++ b/package/lld/lld.mk
@@ -0,0 +1,19 @@
+###############################################################################
+#
+# lld
+#
+###############################################################################
+
+LLD_VERSION = 6.0.0
+LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
+LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
+LLD_LICENSE = NCSA
+LLD_LICENSE_FILES = LICENSE.TXT
+LLD_SUPPORTS_IN_SOURCE_BUILD = NO
+
+HOST_LLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+LLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
+
-- 
2.17.1
