From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 15 Sep 2015 12:01:45 +1200
Subject: [Buildroot] [PATCHv2] micropython: new package
In-Reply-To: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
Message-ID: <1442275305-10690-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micro Python is a lean and fast implementation of the Python 3
programming language that is optimised to run on a microcontroller.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---

Hi Buildroot,
    
Thought you might be interested in mircopython a minimal python 3
implementation. It's designed for micro controllers but is also well suited
to other general purpose embedded CPUs.
    
Cheers,
Chris
    
Changes since v1:
- Add dependency on host-pkgconf.
- Use $(TARGET_MAKE_ENV) in make invocation for micropython
  (micropython-lib doesn't need it because it doesn't use anything setup by
  it).
- Override PREFIX to install to /usr/bin instead of /usr/local/bin
- Update/add some comments.

 package/Config.in                          |  2 ++
 package/micropython-lib/Config.in          |  7 +++++++
 package/micropython-lib/micropython-lib.mk | 15 +++++++++++++++
 package/micropython/Config.in              |  8 ++++++++
 package/micropython/micropython.mk         | 27 +++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 package/micropython-lib/Config.in
 create mode 100644 package/micropython-lib/micropython-lib.mk
 create mode 100644 package/micropython/Config.in
 create mode 100644 package/micropython/micropython.mk

diff --git a/package/Config.in b/package/Config.in
index fc35f12..986fe16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,8 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/lutok/Config.in"
+	source "package/micropython/Config.in"
+	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
new file mode 100644
index 0000000..a7e017b
--- /dev/null
+++ b/package/micropython-lib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MICROPYTHON_LIB
+	bool "micropython-lib"
+	depends on BR2_PACKAGE_MICROPYTHON
+	help
+	  Core Python libraries ported to MicroPython.
+
+	  http://micropython.org
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
new file mode 100644
index 0000000..8eb3c1f
--- /dev/null
+++ b/package/micropython-lib/micropython-lib.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# micropython-lib
+#
+################################################################################
+MICROPYTHON_LIB_VERSION = v0.5
+MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
+MICROPYTHON_LIB_LICENSE = various
+MICROPYTHON_LIB_LICENSE_FILES = LICENSE
+
+define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/lib/micropython install
+endef
+
+$(eval $(generic-package))
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
new file mode 100644
index 0000000..ec47463
--- /dev/null
+++ b/package/micropython/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MICROPYTHON
+	bool "micropython"
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Micro Python is a lean and fast implementation of the Python 3
+	  programming language that is optimised to run on a microcontroller.
+
+	  http://micropython.org
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
new file mode 100644
index 0000000..16dc263
--- /dev/null
+++ b/package/micropython/micropython.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# micropython
+#
+################################################################################
+MICROPYTHON_VERSION = v1.4.5
+MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
+MICROPYTHON_LICENSE = MIT
+MICROPYTHON_LICENSE_FILES = LICENSE
+MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+
+# Use fallback implementation for exception handling on architectures that
+# don't have explicit support.
+ifeq ($(BR2_powerpc),y)
+MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
+endif
+
+define MICROPYTHON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		DESTDIR=$(TARGET_DIR) \
+		PREFIX=$(TARGET_DIR)/usr \
+		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
