From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:35:41 -0300
Subject: [Buildroot] [PATCH 1/2] norm: new package
Message-ID: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                           |  1 +
 package/norm/0001-fix-bigendian-build.patch | 17 ++++++++++
 package/norm/Config.in                      | 15 +++++++++
 package/norm/norm.hash                      |  2 ++
 package/norm/norm.mk                        | 50 +++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)
 create mode 100644 package/norm/0001-fix-bigendian-build.patch
 create mode 100644 package/norm/Config.in
 create mode 100644 package/norm/norm.hash
 create mode 100644 package/norm/norm.mk

diff --git a/package/Config.in b/package/Config.in
index 433e9a3..24be023 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ menu "Networking"
 	source "package/lksctp-tools/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/neon/Config.in"
+	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
diff --git a/package/norm/0001-fix-bigendian-build.patch b/package/norm/0001-fix-bigendian-build.patch
new file mode 100644
index 0000000..cf999c2
--- /dev/null
+++ b/package/norm/0001-fix-bigendian-build.patch
@@ -0,0 +1,17 @@
+Fix big-endian build breakage in protolib.
+Patch status: submitted to author via email.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura norm-1.5r6.orig/protolib/include/protoSpace.h norm-1.5r6/protolib/include/protoSpace.h
+--- norm-1.5r6.orig/protolib/include/protoSpace.h	2016-03-08 19:48:21.326357963 -0300
++++ norm-1.5r6/protolib/include/protoSpace.h	2016-03-08 19:48:46.647234075 -0300
+@@ -89,7 +89,7 @@
+                 }
+ #else               
+                 ProtoTree::Endian GetEndian() const
+-                        return ProtoTree::ENDIAN_BIG;
++                    {return ProtoTree::ENDIAN_BIG;}
+                 void SetNode(Node* theNode)
+                     {memcpy(key+sizeof(double), &theNode, sizeof(Node*));}
+                 Node* GetNode() const
diff --git a/package/norm/Config.in b/package/norm/Config.in
new file mode 100644
index 0000000..4944633
--- /dev/null
+++ b/package/norm/Config.in
@@ -0,0 +1,15 @@
+comment "norm needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_NORM
+	bool "norm"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  The NORM protocol is designed to provide end-to-end reliable
+	  transport of bulk data objects or streams over generic IP
+	  multicast routing and forwarding services.
+
+	  http://www.nrl.navy.mil/itd/ncs/products/norm
diff --git a/package/norm/norm.hash b/package/norm/norm.hash
new file mode 100644
index 0000000..4693eed
--- /dev/null
+++ b/package/norm/norm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	20ea2e8dd5d5e1ff1ff91dc7dab6db53a77d7b7183d8cf2425c215fd294f22a7	src-norm-1.5r6.tgz
diff --git a/package/norm/norm.mk b/package/norm/norm.mk
new file mode 100644
index 0000000..42054b9
--- /dev/null
+++ b/package/norm/norm.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# norm
+#
+################################################################################
+
+NORM_VERSION = 1.5r6
+NORM_SITE = http://downloads.pf.itd.nrl.navy.mil/norm/archive
+NORM_SOURCE = src-norm-$(NORM_VERSION).tgz
+NORM_INSTALL_STAGING = YES
+NORM_LICENSE = NRL License
+NORM_LICENSE_FILES = LICENSE.TXT
+
+ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
+NORM_DEPENDENCIES += libnetfilter_queue
+endif
+
+define NORM_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./waf configure --prefix=/usr \
+	)
+endef
+
+define NORM_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		./waf build \
+	)
+endef
+
+# install target doesn't install headers unfortunately...
+define NORM_INSTALL_STAGING_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		DESTDIR=$(STAGING_DIR) \
+		./waf install; \
+		cp -f $(@D)/include/norm* $(STAGING_DIR)/usr/include \
+	)
+endef
+
+define NORM_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		DESTDIR=$(TARGET_DIR) \
+		./waf install \
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.4.10
