From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:07 +0200
Subject: [Buildroot] [PATCH 11/34] reproducibility/vim: make vim reproducible
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-11-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are three reasons why vim is not reproducible:
- it embeds the build timestamp, fix that by overriding them with
  SOURCE_DATE_EPOCH;
- it embeds the build host and user, fix that by using its configure
  script --with-compiledby option
- it generates an awk script which depends on the version of awk present
  on the build machine, fix that by forcing the interpreter to be
  /usr/bin/awk, it is what is available on buildroot rootfs anyway.
---
 package/vim/vim.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a6b75d0..475fd3c 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -34,6 +34,29 @@ else
 VIM_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+VIM_SOURCE_DATE = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%b %_d %Y'`
+VIM_SOURCE_TIME = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%T'`
+
+VIM_CONF_OPTS += \
+	--with-compiledby=buildroot \
+	CFLAGS="$(TARGET_CFLAGS) -Wno-builtin-macro-redefined -include $(VIM_DIR)/.br_date_override.h"
+
+define VIM_OVERRIDE_DATE_HOOK
+	echo "#define buildroot_stringify(x) #x" > $(VIM_DIR)/.br_date_override.h
+	echo "#define __DATE__ buildroot_stringify($(VIM_SOURCE_DATE))" >> $(VIM_DIR)/.br_date_override.h
+	echo "#define __TIME__ buildroot_stringify($(VIM_SOURCE_TIME))" >> $(VIM_DIR)/.br_date_override.h
+endef
+
+VIM_POST_PATCH_HOOKS += VIM_OVERRIDE_DATE_HOOK
+
+define VIM_FIX_AWK_REFERENCE
+	sed -i 's,^#!.*awk,#!/usr/bin/awk,' $(TARGET_DIR)/usr/share/vim/vim74/tools/mve.awk
+endef
+
+VIM_POST_INSTALL_TARGET_HOOKS += VIM_FIX_AWK_REFERENCE
+endif
+
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
 		$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
-- 
2.7.4
