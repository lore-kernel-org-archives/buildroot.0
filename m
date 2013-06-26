From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:26:07 +0200
Subject: [Buildroot] [RFCv2 12/19] gcc-final: new package
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 136 +++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 package/gcc/gcc-final/gcc-final.mk

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
new file mode 100644
index 0000000..8969877
--- /dev/null
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -0,0 +1,136 @@
+#############################################################
+#
+# gcc-final
+#
+#############################################################
+
+GCC_FINAL_VERSION = $(GCC_VERSION)
+GCC_FINAL_SITE    = $(GCC_SITE)
+GCC_FINAL_SOURCE  = $(GCC_SOURCE)
+
+HOST_GCC_FINAL_DEPENDENCIES = \
+	$(HOST_GCC_COMMON_DEPENDENCIES) \
+	uclibc
+
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+HOST_GCC_FINAL_POST_EXTRACT_CMDS += HOST_GCC_FINAL_XTENSA_OVERLAY_EXTRACT
+endif
+
+HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_FINAL_SUBDIR = build
+
+define HOST_GCC_FINAL_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -s ../configure $(@D)/build/configure
+endef
+
+HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_FINAL_CONFIGURE_SYMLINK
+
+# Languages supported by the cross-compiler
+GCC_FINAL_CROSS_LANGUAGES-y = c
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_GCC_CROSS_FORTRAN) += fortran
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_GCC_CROSS_OBJC)    += objc
+GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
+
+HOST_GCC_FINAL_CONF_OPT = \
+	$(HOST_GCC_COMMON_CONF_OPT) \
+	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
+	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
+
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+HOST_GCC_FINAL_CONF_OPT += --enable-libgomp
+else
+HOST_GCC_FINAL_CONF_OPT += --disable-libgomp
+endif
+
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+HOST_GCC_FINAL_CONF_OPT += --enable-shared
+else
+HOST_GCC_FINAL_CONF_OPT += --disable-shared
+endif
+
+# End with user-provided options, so that they can override previously
+# defined options.
+HOST_GCC_FINAL_CONF_OPT += \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+
+# Handle lib64
+define HOST_GCC_FINAL_HANDLE_LIB64
+	if [ -d "$(STAGING_DIR)/lib64" ]; then \
+		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
+			mkdir -p "$(STAGING_DIR)/lib"; \
+		fi; \
+		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
+		rmdir "$(STAGING_DIR)/lib64"; \
+		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
+	fi
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_HANDLE_LIB64
+
+# Make sure we have 'cc'
+define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
+	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
+		ln -snf $(GNU_TARGET_NAME)-gcc \
+			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
+	fi
+	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
+	fi
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
+
+# Create <arch>-linux-<tool> symlinks
+define HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
+	(cd $(HOST_DIR)/usr/bin; for i in $(GNU_TARGET_NAME)-*; do \
+		ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
+	done)
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
+
+# Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
+# libgcc_s to be installed in /lib and not /usr/lib. We add +x on
+# libgcc_s to ensure it will be stripped.
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+define HOST_GCC_FINAL_INSTALL_LIBGCC
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
+		$(STAGING_DIR)/lib/
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
+		$(TARGET_DIR)/lib/
+	chmod +x $(TARGET_DIR)/lib/libgcc_s.so.1
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
+endif
+
+# Handle the installation of libraries in /usr/lib
+HOST_GCC_FINAL_USR_LIBS =
+
+ifeq ($(BR2_GCC_SHARED_LIBGCC)$(BR2_INSTALL_LIBSTDCPP),yy)
+HOST_GCC_FINAL_USR_LIBS += libstdc++
+endif
+
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+HOST_GCC_FINAL_USR_LIBS += libgomp
+endif
+
+ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
+define HOST_GCC_FINAL_INSTALL_USR_LIBS
+	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+			$(STAGING_DIR)/usr/lib/ ; \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+			$(TARGET_DIR)/usr/lib/ ; \
+	done
+endef
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
+endif
+
+
+$(eval $(host-autotools-package))
-- 
1.8.1.2
