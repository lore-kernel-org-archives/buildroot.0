From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Wed,  9 Oct 2019 13:26:51 +0200
Subject: [Buildroot] [PATCH v2 4/9] package/libyang: add package
In-Reply-To: <20191009112656.21232-1-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
Message-ID: <20191009112656.21232-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

LibYANG processes YIN and YANG files. It's a dependency of sysrepo which
is a dependency of Netopeer, a NETCONF/YANG server.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/libyang/Config.in    | 13 +++++++++++++
 package/libyang/libyang.hash |  2 ++
 package/libyang/libyang.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/libyang/Config.in
 create mode 100644 package/libyang/libyang.hash
 create mode 100644 package/libyang/libyang.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05f33eb2c3..3a7b5f3bbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1038,6 +1038,9 @@ F:	package/python-markdown/
 F:	package/python-remi/
 F:	package/python-sip/
 
+N:	Heiko Thiery <heiko.thiery@gmail.com>
+F:	package/libyang/
+
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
 
diff --git a/package/Config.in b/package/Config.in
index e84624ccdf..ca3d4d5d33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1641,6 +1641,7 @@ menu "Networking"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
+	source "package/libyang/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
diff --git a/package/libyang/Config.in b/package/libyang/Config.in
new file mode 100644
index 0000000000..ebe51ff099
--- /dev/null
+++ b/package/libyang/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBYANG
+	bool "libyang"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UCP
+	help
+	  Libyang is YANG data modeling language parser and toolkit
+	  written (and providing API) in C.
+
+	  https://github.com/CESNET/libyang
+
+comment "libyang needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
new file mode 100644
index 0000000000..4989873c8c
--- /dev/null
+++ b/package/libyang/libyang.hash
@@ -0,0 +1,2 @@
+sha256 351f712433d50494aad153bfd4aa92ff50299058428620eabddb7a41d781e756  libyang-v1.0-r3.tar.gz
+sha256 f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
new file mode 100644
index 0000000000..a120f51293
--- /dev/null
+++ b/package/libyang/libyang.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libyang
+#
+################################################################################
+
+LIBYANG_VERSION = v1.0-r3
+LIBYANG_SITE = $(call github,CESNET,libyang,$(LIBYANG_VERSION))
+LIBYANG_LICENSE = BSD-3-Clause
+LIBYANG_LICENSE_FILES = LICENSE
+LIBYANG_INSTALL_STAGING = YES
+LIBYANG_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBYANG_DEPENDENCIES = pcre
+HOST_LIBYANG_DEPENDENCIES = host-pcre
+
+LIBYANG_CONF_OPTS = \
+	-DENABLE_VALGRIND_TESTS=OFF \
+	-DGEN_PYTHON_BINDINGS=OFF
+
+HOST_LIBYANG_CONF_OPTS = \
+	-DENABLE_VALGRIND_TESTS=OFF \
+	-DGEN_PYTHON_BINDINGS=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
