From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:19:18 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/selinux-python: always build
 sepolgen
In-Reply-To: <20191009221918.28091-1-arnout@mind.be>
References: <20191009221918.28091-1-arnout@mind.be>
Message-ID: <20191009221918.28091-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The selinux-python package has two suboptions, audit2allow and sepolgen.
If neither of them is selected, nothing gets installed, which is not so
nice. Since audit2allow selects sepolgen, sepolgen will always be
installed if anything is installed. Therefore, it makes no sense to have
a separate option for sepolgen.

Remove the BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN and always install
sepolgen. With this, it's more logical to move the unconditional
addition of sepolgen to SELINUX_PYTHON_MAKE_DIRS before audit2allow.

Remove selecting BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN from the legacy
handling of BR2_PACKAGE_SEPOLGEN. It already selects
BR2_PACKAGE_SELINUX_PYTHON, so sepolgen is implied.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                         |  1 -
 package/selinux-python/Config.in         | 14 ++++----------
 package/selinux-python/selinux-python.mk |  6 ++----
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a670f0f0e..feb0a7d819 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1693,7 +1693,6 @@ config BR2_PACKAGE_SEPOLGEN
 	bool "sepolgen package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_SELINUX_PYTHON
-	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	help
 	  Sepolgen is no longer a individual package, but instead has
 	  been moved into the selinux-python package by the SELinux
diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 5b6cbc80e3..5a561fda3b 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -7,8 +7,10 @@ config BR2_PACKAGE_SELINUX_PYTHON
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  A set of SELinux tools written in python that help with
-	  managing a system with SELinux enabled. If no packages are
-	  selected nothing will actually be built.
+	  managing a system with SELinux enabled.
+
+	  The sepolgen program is always installed. It allows to
+	  generate an initial SELinux policy module template.
 
 	  https://github.com/SELinuxProject/selinux/wiki
 
@@ -17,7 +19,6 @@ if BR2_PACKAGE_SELINUX_PYTHON
 config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	bool "audit2allow"
 	select BR2_PACKAGE_CHECKPOLICY
-	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	select BR2_PACKAGE_SEMODULE_UTILS
 	help
 	  This module installs two programs:
@@ -28,13 +29,6 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	  audit2why - translates SELinux audit messages into a
 	  description of why the access was denied (audit2allow -w)
 
-config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
-	bool "sepolgen"
-	select BR2_PACKAGE_SEMODULE_UTILS
-	help
-	  This package contains a Python module that allows you to
-	  generate an initial SELinux policy module template.
-
 endif
 
 comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 978bee7c88..ebd91d5ab3 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -24,15 +24,13 @@ SELINUX_PYTHON_MAKE_OPTS += \
 	PYTHONLIBDIR="usr/lib/python$(PYTHON_VERSION_MAJOR)"
 endif
 
+SELINUX_PYTHON_MAKE_DIRS = sepolgen/src/sepolgen
+
 ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
 SELINUX_PYTHON_DEPENDENCIES += checkpolicy
 SELINUX_PYTHON_MAKE_DIRS += audit2allow
 endif
 
-ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN),y)
-SELINUX_PYTHON_MAKE_DIRS += sepolgen/src/sepolgen
-endif
-
 define SELINUX_PYTHON_BUILD_CMDS
 	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
 		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
-- 
2.21.0
