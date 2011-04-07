From: Allan W. Nielsen <a@awn.dk>
Date: Thu,  7 Apr 2011 14:52:17 +0200
Subject: [Buildroot] [PATCH 2/2] fglrx: Binary ATI kernel module added
	(version 11-2)
In-Reply-To: <1302180737-18612-1-git-send-email-a@awn.dk>
References: <1302180737-18612-1-git-send-email-a@awn.dk>
Message-ID: <1302180737-18612-3-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Config.in                                  |    5 ++
 package/fglrx/Config.in                            |    7 +++
 .../fglrx/fglrx-11-2-fix-gcc-version-detect.patch  |   30 ++++++++++++++
 package/fglrx/fglrx.mk                             |   42 ++++++++++++++++++++
 4 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 package/fglrx/Config.in
 create mode 100644 package/fglrx/fglrx-11-2-fix-gcc-version-detect.patch
 create mode 100644 package/fglrx/fglrx.mk

diff --git a/package/Config.in b/package/Config.in
index ea39570..7d8b35d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,4 +499,9 @@ source "package/vim/Config.in"
 endif
 endmenu
 
+menu "Linux kernel modules"
+depends on BR2_LINUX_KERNEL
+source "package/fglrx/Config.in"
+endmenu
+
 endmenu
diff --git a/package/fglrx/Config.in b/package/fglrx/Config.in
new file mode 100644
index 0000000..3395862
--- /dev/null
+++ b/package/fglrx/Config.in
@@ -0,0 +1,7 @@
+
+config BR2_PACKAGE_FGLRX
+	bool "fglrx"
+	depends on BR2_LINUX_KERNEL && (BR2_x86_64 || BR2_i386)
+	help 
+	  Build the ATI binary kernel module
+
diff --git a/package/fglrx/fglrx-11-2-fix-gcc-version-detect.patch b/package/fglrx/fglrx-11-2-fix-gcc-version-detect.patch
new file mode 100644
index 0000000..259daaa
--- /dev/null
+++ b/package/fglrx/fglrx-11-2-fix-gcc-version-detect.patch
@@ -0,0 +1,30 @@
+--- A/common/lib/modules/fglrx/build_mod/2.6.x/Makefile	2011-02-02 19:39:49.000000000 +0100
++++ B/common/lib/modules/fglrx/build_mod/2.6.x/Makefile	2011-03-28 15:05:41.656418668 +0200
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
diff --git a/package/fglrx/fglrx.mk b/package/fglrx/fglrx.mk
new file mode 100644
index 0000000..ddc873b
--- /dev/null
+++ b/package/fglrx/fglrx.mk
@@ -0,0 +1,42 @@
+FGLRX_VERSION=11-2
+FGLRX_SOURCE:=ati-driver-installer-$(FGLRX_VERSION)-x86.x86_64.run
+FGLRX_SITE:=http://www2.ati.com/drivers/linux/
+
+FGLRX_DIR:=$(BUILD_DIR)/fglrx-$(FGLRX_VERSION)
+
+FGLRX_DEPENDENCIES=linux
+
+FGLRX_MAKE_FLAGS = LIBIP_PREFIX=../../../../../../arch/x86_64/lib/modules/fglrx/build_mod \
+	MODFLAGS="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=0 -DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space -D__SMP__" \
+	CFLAGS_MODULE="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=0 -DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space -D__SMP__" \
+	KVER=$(LINUX26_VERSION_PROBED) \
+	KDIR=$(LINUX26_DIR) \
+	PAGE_ATTR_FIX=0 \
+	$(LINUX26_MAKE_FLAGS)
+
+define FGLRX_EXTRACT_CMDS
+	sh $(DL_DIR)/$(FGLRX_SOURCE) --extract $(@D)
+endef
+
+define FGLRX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/common/lib/modules/fglrx/build_mod/2.6.x $(FGLRX_MAKE_FLAGS)
+endef
+
+define FGLRX_INSTALL_TARGET_CMDS
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
+endef
+
+
+$(eval $(call GENTARGETS,package,fglrx))
+
-- 
1.7.3.4
