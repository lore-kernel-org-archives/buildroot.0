From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:58 +0200
Subject: [Buildroot] [PATCH 21/21] FOO: tentative target and host virt
	packages
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <e747107039b46170ebe818191b860cc98e5b9932.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

NOT TO BE APPLIED. Just samples to test virtual packages.

NOT SOB by me
---
 package/Config.in            |  4 ++++
 package/foo-prov/Config.in   | 15 +++++++++++++++
 package/foo-prov/foo-prov.mk | 13 +++++++++++++
 package/foo-user/Config.in   |  7 +++++++
 package/foo-user/foo-user.mk | 16 ++++++++++++++++
 package/foo-virt/Config.in   | 13 +++++++++++++
 package/foo-virt/foo-virt.mk |  2 ++
 7 files changed, 70 insertions(+)
 create mode 100644 package/foo-prov/Config.in
 create mode 100644 package/foo-prov/foo-prov.mk
 create mode 100644 package/foo-user/Config.in
 create mode 100644 package/foo-user/foo-user.mk
 create mode 100644 package/foo-virt/Config.in
 create mode 100644 package/foo-virt/foo-virt.mk

diff --git a/package/Config.in b/package/Config.in
index 49daa33..ff65356 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,5 +1,9 @@
 menu "Target packages"
 
+source "package/foo-virt/Config.in"
+source "package/foo-prov/Config.in"
+source "package/foo-user/Config.in"
+
 source "package/busybox/Config.in"
 
 menu "Audio and video applications"
diff --git a/package/foo-prov/Config.in b/package/foo-prov/Config.in
new file mode 100644
index 0000000..17aec2c
--- /dev/null
+++ b/package/foo-prov/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FOO_PROV
+    bool "foo-prov"
+    select BR2_PACKAGE_HAS_FOO_VIRT
+
+config BR2_PACKAGE_PROVIDES_FOO_VIRT
+    depends on BR2_PACKAGE_FOO_PROV
+    default "foo-prov"
+
+#config BR2_PACKAGE_HOST_FOO_PROV
+#    bool "host-foo-prov"
+#    select BR2_PACKAGE_HAS_HOST_FOO_VIRT
+#
+#config BR2_PACKAGE_PROVIDES_HOST_FOO_VIRT
+#    depends on BR2_PACKAGE_FOO_PROV
+#    default "host-foo-prov"
diff --git a/package/foo-prov/foo-prov.mk b/package/foo-prov/foo-prov.mk
new file mode 100644
index 0000000..68d3afe
--- /dev/null
+++ b/package/foo-prov/foo-prov.mk
@@ -0,0 +1,13 @@
+FOO_PROV_VERSION = 1.1.2.3.5.8
+FOO_PROV_SOURCE =
+HOST_FOO_PROV_SOURCE =
+
+define FOO_PROV_BUILD_CMDS
+	@echo FOO_PROV build cmd
+endef
+define HOST_FOO_PROV_BUILD_CMDS
+	@echo HOST_FOO_PROV build cmd
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/foo-user/Config.in b/package/foo-user/Config.in
new file mode 100644
index 0000000..7107a9e
--- /dev/null
+++ b/package/foo-user/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FOO_USER
+    bool "foo-user"
+    depends on BR2_PACKAGE_HAS_FOO_VIRT
+
+#config BR2_PACKAGE_HOST_FOO_USER
+#    bool "host-foo-user"
+#    depends on BR2_PACKAGE_HAS_HOST_FOO_VIRT
diff --git a/package/foo-user/foo-user.mk b/package/foo-user/foo-user.mk
new file mode 100644
index 0000000..7601215
--- /dev/null
+++ b/package/foo-user/foo-user.mk
@@ -0,0 +1,16 @@
+FOO_USER_VERSION = 1.2.3
+FOO_USER_SOURCE =
+HOST_FOO_USER_SOURCE =
+
+FOO_USER_DEPENDENCIES = foo-virt host-foo-user
+define FOO_USER_BUILD_CMDS
+	@echo FOO_USER build cmd
+endef
+
+HOST_FOO_USER_DEPENDENCIES = host-foo-virt
+define HOST_FOO_USER_BUILD_CMDS
+	@echo HOST_FOO_USER build cmd
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/foo-virt/Config.in b/package/foo-virt/Config.in
new file mode 100644
index 0000000..f786c7e
--- /dev/null
+++ b/package/foo-virt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HAS_FOO_VIRT
+    bool
+
+config BR2_PACKAGE_PROVIDES_FOO_VIRT
+    depends on BR2_PACKAGE_HAS_FOO_VIRT
+    string
+
+#config BR2_PACKAGE_HAS_HOST_FOO_VIRT
+#    bool
+#
+#config BR2_PACKAGE_PROVIDES_HOST_FOO_VIRT
+#    depends on BR2_PACKAGE_HAS_HOST_FOO_VIRT
+#    string
diff --git a/package/foo-virt/foo-virt.mk b/package/foo-virt/foo-virt.mk
new file mode 100644
index 0000000..b00af5b
--- /dev/null
+++ b/package/foo-virt/foo-virt.mk
@@ -0,0 +1,2 @@
+$(eval $(virtual-package))
+$(eval $(host-virtual-package))
-- 
1.8.3.2
