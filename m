From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Wed, 24 Oct 2018 12:59:36 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/davici: new package
Message-ID: <20181024175936.27574-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds davici which is an alternative implementation of the
VICI client protocal used by Strongswan.  It targets better integration
with software stacks and uses a asynchronous, non-blocking API that can
be integrated in third-party main dispatching loops without the use of
threads.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
Supersedes: https://patchwork.ozlabs.org/patch/972496/
---
 package/Config.in          |  1 +
 package/davici/Config.in   | 18 ++++++++++++++++++
 package/davici/davici.hash |  3 +++
 package/davici/davici.mk   | 20 ++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/davici/Config.in
 create mode 100644 package/davici/davici.hash
 create mode 100644 package/davici/davici.mk

diff --git a/package/Config.in b/package/Config.in
index fd86e37a52..56f3b8ff92 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1480,6 +1480,7 @@ menu "Networking"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
 	source "package/daq/Config.in"
+	source "package/davici/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/davici/Config.in b/package/davici/Config.in
new file mode 100644
index 0000000000..9dfa0ec130
--- /dev/null
+++ b/package/davici/Config.in
@@ -0,0 +1,18 @@
+comment "davici needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_DAVICI
+	bool "davici"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_STRONGSWAN
+	help
+	  davici is an alternative implementation of the VICI
+	  client protocol, targeting better integration in other
+	  software stacks.
+
+	  https://github.com/strongswan/davici
diff --git a/package/davici/davici.hash b/package/davici/davici.hash
new file mode 100644
index 0000000000..257e902ce7
--- /dev/null
+++ b/package/davici/davici.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d3e5e806ecca841d7e133a3df768062df59f4b4c76bf98e0f90aa8064721b3bd  davici-v1.3.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/davici/davici.mk b/package/davici/davici.mk
new file mode 100644
index 0000000000..ab9d2ba176
--- /dev/null
+++ b/package/davici/davici.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# davici
+#
+################################################################################
+
+DAVICI_VERSION = v1.3
+DAVICI_SITE = $(call github,strongswan,davici,$(DAVICI_VERSION))
+DAVICI_LICENSE = LGPL-2.1
+DAVICI_LICENSE_FILES = COPYING
+DAVICI_DEPENDENCIES = strongswan
+DAVICI_INSTALL_STAGING=YES
+DAVICI_AUTORECONF = YES
+
+define DAVICI_CREATE_M4
+	mkdir -p $(@D)/m4
+endef
+DAVICI_POST_PATCH_HOOKS += DAVICI_CREATE_M4
+
+$(eval $(autotools-package))
-- 
2.18.0
