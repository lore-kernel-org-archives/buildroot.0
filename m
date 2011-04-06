From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 13:20:45 +0200
Subject: [Buildroot] [PATCH] fglrx: Added package for ATI's binary device
	driver
In-Reply-To: <1302088845-15193-1-git-send-email-a@awn.dk>
References: <1302088845-15193-1-git-send-email-a@awn.dk>
Message-ID: <1302088845-15193-2-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 TODO:
   - Change the install script to work for 32bit systems as well as for 64bit
   - This package sould require that the target system is x86

Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 Makefile                                       |    1 +
 linux/Config.in                                |    2 +
 linux/fglrx/Config.in                          |    4 ++
 linux/fglrx/change-gcc-version-detection.patch |   30 +++++++++++
 linux/fglrx/fglrx.mk                           |   62 ++++++++++++++++++++++++
 5 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 linux/fglrx/Config.in
 create mode 100644 linux/fglrx/change-gcc-version-detection.patch
 create mode 100644 linux/fglrx/fglrx.mk

diff --git a/Makefile b/Makefile
index 02a5c36..026dc4d 100644
--- a/Makefile
+++ b/Makefile
@@ -324,6 +324,7 @@ include package/*/*.mk
 include boot/common.mk
 include target/Makefile.in
 include linux/linux.mk
+include linux/*/*.mk
 
 TARGETS+=target-finalize
 
diff --git a/linux/Config.in b/linux/Config.in
index f7d7f88..db96ab7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -153,6 +153,8 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+source "linux/fglrx/Config.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/fglrx/Config.in b/linux/fglrx/Config.in
new file mode 100644
index 0000000..c775147
--- /dev/null
+++ b/linux/fglrx/Config.in
@@ -0,0 +1,4 @@
+
+config BR2_LINUX_MODULE_FGLRX
+	bool "Build the ATI binary kernel module"
+	depends on BR2_LINUX_KERNEL
diff --git a/linux/fglrx/change-gcc-version-detection.patch b/linux/fglrx/change-gcc-version-detection.patch
new file mode 100644
index 0000000..188becd
--- /dev/null
+++ b/linux/fglrx/change-gcc-version-detection.patch
@@ -0,0 +1,30 @@
+--- common/lib/modules/fglrx/build_mod/2.6.x/Makefile	2011-02-02 19:39:49.000000000 +0100
++++ common/lib/modules/fglrx/build_mod/2.6.x/Makefile	2011-03-28 15:05:41.656418668 +0200
+@@ -24,7 +24,7 @@
+ # NEGLIGENCE OR OTHERWISE) ARISING  IN  ANY  WAY  OUT  OF  THE  USE  OF  THIS
+ # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-GCC_VER_MAJ      = $(shell $(CC) --version | head -n 1 | sed -e 's/[^0-9. ]//g;s/^ *//;s/^\(.\)\..*$$/\1/')
++GCC_VER_MAJ      = $(shell $(CC) --version | head -n 1 | perl -pe "s/^.+?(\d+)[^ ]+$$/\1/g" )
+ 
+ LIBIP_PREFIX   ?= ..
+ 
+@@ -75,7 +75,7 @@
+ 	KVER        = $(shell uname -r)
+ endif
+ 
+-KDIR            = /lib/modules/$(KVER)/build
++KDIR           ?= /lib/modules/$(KVER)/build
+ PWD             = $(shell pwd)
+ 
+ fglrx-cfiles    = ${fglrx-c-objs:.o=.c}
+@@ -85,6 +85,9 @@
+ kmod_build:: $(fglrx-libs) $(fglrx-cfiles) $(fglrx-hdrs) $(drm-hdrs)
+ 	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
+ 
++modules_install: kmod_build
++	$(MAKE) INSTALL_MOD_PATH=$(INSTALL_MOD_PATH) INSTALL_MOD_DIR=kernel -C $(KDIR) M=$(PWD) modules_install
++
+ %.c:
+        @ln -s ../$@
+  
diff --git a/linux/fglrx/fglrx.mk b/linux/fglrx/fglrx.mk
new file mode 100644
index 0000000..6cf075e
--- /dev/null
+++ b/linux/fglrx/fglrx.mk
@@ -0,0 +1,62 @@
+FGLRX_VERSION=11-2
+FGLRX_SOURCE:=ati-driver-installer-$(FGLRX_VERSION)-x86.x86_64.run
+FGLRX_SITE:=http://www2.ati.com/drivers/linux/
+
+FGLRX_DIR:=$(BUILD_DIR)/fglrx-$(FGLRX_VERSION)
+
+FGLRX_MAKE_FLAGS = LIBIP_PREFIX=../../../../../../arch/x86_64/lib/modules/fglrx/build_mod \
+	MODFLAGS="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=0 -DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space -D__SMP__" \
+	CFLAGS_MODULE="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=0 -DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space -D__SMP__" \
+	KVER=$(LINUX26_VERSION_PROBED) \
+	KDIR=$(LINUX26_DIR) \
+	PAGE_ATTR_FIX=0 \
+	$(LINUX26_MAKE_FLAGS)
+
+$(FGLRX_DIR)/.stamp_downloaded:
+	@$(call MESSAGE,"Downloading FGLRX")
+	$(call DOWNLOAD,$(FGLRX_SITE),$(FGLRX_SOURCE))
+	mkdir -p $(@D)
+	touch $@
+
+$(FGLRX_DIR)/.stamp_extracted: $(FGLRX_DIR)/.stamp_downloaded
+	@$(call MESSAGE,"Extracting FGLRX")
+	sh $(DL_DIR)/$(FGLRX_SOURCE) --extract $(@D)
+	mkdir -p $(@D)
+	$(Q)touch $@
+
+# Patch
+$(FGLRX_DIR)/.stamp_patched: $(FGLRX_DIR)/.stamp_extracted
+	@$(call MESSAGE,"Patching kernel")
+	pwd
+	patch -d $(@D) -p0 < linux/fglrx/change-gcc-version-detection.patch
+	$(Q)touch $@
+
+# Compiling
+$(FGLRX_DIR)/.stamp_compiled: $(FGLRX_DIR)/.stamp_patched
+	@$(call MESSAGE,"Compiling FGLRX")
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/common/lib/modules/fglrx/build_mod/2.6.x $(FGLRX_MAKE_FLAGS)
+	$(Q)touch $@
+
+# Installation
+# TODO, need to be fixed for bits version
+fglrx: $(FGLRX_DIR)/.stamp_installed
+$(FGLRX_DIR)/.stamp_installed: $(FGLRX_DIR)/.stamp_compiled
+	@$(call MESSAGE,"Installing FGLRX")
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/common/lib/modules/fglrx/build_mod/2.6.x $(FGLRX_MAKE_FLAGS) modules_install
+	cp -r $(@D)/common/etc/ati $(TARGET_DIR)/etc/.
+	cp -r $(@D)/common/usr/X11R6/bin/* $(TARGET_DIR)/usr/bin/.
+	cp -r $(@D)/common/usr/sbin/* $(TARGET_DIR)/usr/sbin/.
+	cp    $(@D)/arch/x86_64/usr/X11R6/lib64/lib* $(TARGET_DIR)/usr/lib/.
+	mkdir -p $(TARGET_DIR)/usr/lib/dri
+	cp -f $(@D)/arch/x86_64/usr/X11R6/lib64/modules/dri/* $(TARGET_DIR)/usr/lib/dri.
+	cp -r $(@D)/arch/x86_64/usr/X11R6/bin/* $(TARGET_DIR)/usr/bin/.
+	cp -r $(@D)/arch/x86_64/usr/lib64/* $(TARGET_DIR)/usr/lib/.
+	cp -r $(@D)/arch/x86_64/usr/share/ati $(TARGET_DIR)/usr/share/.
+	cp -r $(@D)/arch/x86_64/usr/sbin/* $(TARGET_DIR)/usr/sbin/.
+	(cd $(@D)/xpic_64a/usr/X11R6/lib64; find . -type f | cpio -pu --make-directories --verbose $(TARGET_DIR)/usr/lib/xorg )
+	$(Q)touch $@
+
+ifeq ($(BR2_LINUX_MODULE_FGLRX),y)
+TARGETS+=fglrx
+endif
+
-- 
1.7.3.4
