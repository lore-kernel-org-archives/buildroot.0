From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
Date: Wed, 27 Apr 2016 15:12:44 +0200
Subject: [Buildroot] [PATCH v3] i7z: new package
In-Reply-To: <5qd6vcx7kl.ln2@ID-313208.user.individual.net>
References: <5qd6vcx7kl.ln2@ID-313208.user.individual.net>
Message-ID: <1461762764-8559-1-git-send-email-vincent.stehle@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"A better i7 (and now i3, i5) reporting tool for Linux."

i7z can print out the C-states and temperature for i3, i5 and i7 based Core
processors from Intel (including Nehalems, Sandy Bridge and Ivy Bridge).

https://github.com/ajaiantilal/i7z

Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---


Date: Wed, 27 Apr 2016 11:36:37 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
> please add a comment like this to inform users why the package is not
> available:

Hi Bernd,

Good idea, thanks. Here it is!

Vincent.


Changes in v3 after Bernd's review:
- Add a menu comment about dependency on toolchain with threads

Changes in v2 after Bernd's review:
- Change URL
- Depend on pthread


 package/Config.in     |  1 +
 package/i7z/Config.in | 17 +++++++++++++++++
 package/i7z/i7z.hash  |  2 ++
 package/i7z/i7z.mk    | 22 ++++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/i7z/Config.in
 create mode 100644 package/i7z/i7z.hash
 create mode 100644 package/i7z/i7z.mk

diff --git a/package/Config.in b/package/Config.in
index e860f72..2967244 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ endif
 	source "package/hwdata/Config.in"
 	source "package/hwloc/Config.in"
 	source "package/i2c-tools/Config.in"
+	source "package/i7z/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/input-tools/Config.in"
 	source "package/intel-microcode/Config.in"
diff --git a/package/i7z/Config.in b/package/i7z/Config.in
new file mode 100644
index 0000000..5c7803b
--- /dev/null
+++ b/package/i7z/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_I7Z
+	bool "i7z"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	help
+	  "A better i7 (and now i3, i5) reporting tool for Linux."
+
+	  i7z can print out the C-states and temperature for i3, i5 and i7
+	  based Core processors from Intel (including Nehalems, Sandy Bridge
+	  and Ivy Bridge).
+
+	  https://github.com/ajaiantilal/i7z
+
+comment "i7z needs a toolchain w/ threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/i7z/i7z.hash b/package/i7z/i7z.hash
new file mode 100644
index 0000000..1bcf2c6
--- /dev/null
+++ b/package/i7z/i7z.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 e127bddf850e7febd39cef2d2b13dca5fe19cc2a1bb1099d72b683be5d8bd1c0 i7z-5023138d7c35c4667c938b853e5ea89737334e92.tar.gz
diff --git a/package/i7z/i7z.mk b/package/i7z/i7z.mk
new file mode 100644
index 0000000..e21fd9f
--- /dev/null
+++ b/package/i7z/i7z.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# i7z
+#
+################################################################################
+
+I7Z_VERSION = 5023138d7c35c4667c938b853e5ea89737334e92
+I7Z_SITE = $(call github,ajaiantilal,i7z,$(I7Z_VERSION))
+I7Z_LICENSE = GPLv2
+I7Z_LICENSE_FILES = COPYING
+I7Z_DEPENDENCIES = ncurses
+
+define I7Z_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define I7Z_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+		DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.8.0.rc3
