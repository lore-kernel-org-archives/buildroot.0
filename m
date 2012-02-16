From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Thu, 16 Feb 2012 19:15:07 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <201202160040.17980.arnout@mind.be>
References: <201202160040.17980.arnout@mind.be>
Message-ID: <28274ce277a8bde9abca815749513b2066845497.1329415985.git.alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M." <alvaro.gamez@hazent.com>

This modifies the definition of DOWNLOAD to receive two arguments:
the first one is the full URL of the file to download, whereas the second
(and optional) is the name the file will have once downloaded.

Same thing with the SOURCE_CHECK_WGET and SCP functions.

All calls to these functions have been changed to the shortest form of
the new API.

Signed-off-by: Alvaro G. M. <alvaro.gamez@hazent.com>
---
 docs/manual/adding-packages-handwritten.txt |    2 +-
 linux/linux.mk                              |    2 +-
 package/Makefile.package.in                 |   23 ++++++++++++++---------
 package/cups/cups.mk                        |    2 +-
 package/fis/fis.mk                          |    2 +-
 package/games/doom-wad/doom-wads.mk         |    2 +-
 package/gettext/gettext.mk                  |    2 +-
 package/microperl/microperl.mk              |    2 +-
 package/netkitbase/netkitbase.mk            |    2 +-
 package/netkittelnet/netkittelnet.mk        |    2 +-
 package/newt/newt.mk                        |    2 +-
 package/tinyhttpd/tinyhttpd.mk              |    2 +-
 package/ttcp/ttcp.mk                        |    2 +-
 package/uemacs/uemacs.mk                    |    2 +-
 package/vpnc/vpnc.mk                        |    2 +-
 package/xfsprogs/xfsprogs.mk                |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk             |    2 +-
 toolchain/gdb/gdb.mk                        |    2 +-
 toolchain/kernel-headers/kernel-headers.mk  |    2 +-
 toolchain/toolchain-external/ext-tool.mk    |    6 +++---
 toolchain/uClibc/uclibc.mk                  |    2 +-
 21 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/docs/manual/adding-packages-handwritten.txt b/docs/manual/adding-packages-handwritten.txt
index a9d247c..583f303 100644
--- a/docs/manual/adding-packages-handwritten.txt
+++ b/docs/manual/adding-packages-handwritten.txt
@@ -22,7 +22,7 @@ existing manual makefiles and to help understand how they work.*
 11: LIBFOO_TARGET_BINARY:=usr/bin/foo
 12:
 13: $(DL_DIR)/$(LIBFOO_SOURCE):
-14: 	$(call DOWNLOAD,$(LIBFOO_SITE),$(LIBFOO_SOURCE))
+14: 	$(call DOWNLOAD,$(LIBFOO_SITE)/$(LIBFOO_SOURCE))
 15:
 16: $(LIBFOO_DIR)/.source: $(DL_DIR)/$(LIBFOO_SOURCE)
 17: 	$(ZCAT) $(DL_DIR)/$(LIBFOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/linux/linux.mk b/linux/linux.mk
index ae236d4..58cbe8e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -98,7 +98,7 @@ define LINUX_DOWNLOAD_PATCHES
 	$(if $(LINUX_PATCHES),
 		@$(call MESSAGE,"Download additional patches"))
 	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
-		$(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
+		$(call DOWNLOAD,$(patch))$(sep))
 endef
 
 LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 33461b4..78fe3cc 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -203,11 +203,11 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
+	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2)
 endef
 
 define SOURCE_CHECK_SCP
-	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1)/$(2),:) > /dev/null
+	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1),:) > /dev/null
 endef
 
 define SHOW_EXTERNAL_DEPS_SCP
@@ -237,12 +237,17 @@ endef
 
 
 define DOWNLOAD_WGET
-	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
+	if test -n "$(2)"; then \
+		test -e $(DL_DIR)/$(2) || \
+		$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1)); \
+	else \
+		test -e $(DL_DIR)/$(call notdir,$(1)) || \
+		$(WGET) -P $(DL_DIR) $(call qstrip,$(1)) ;\
+	fi
 endef
 
 define SOURCE_CHECK_WGET
-  $(WGET) --spider $(call qstrip,$(1))/$(2)
+  $(WGET) --spider $(call qstrip,$(1))
 endef
 
 define SHOW_EXTERNAL_DEPS_WGET
@@ -290,11 +295,11 @@ define DOWNLOAD
 			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
 			scp) $($(DL_MODE)_SCP) && exit ;; \
 			hg) $($(DL_MODE)_HG) && exit ;; \
-			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
+			*) if test -n "$(2)" ; then $(call $(DL_MODE)_WGET,$(1)/$(2),$(2)); else $(call $(DL_MODE)_WGET,$(1)); fi && exit ;; \
 		esac ; \
 	fi ; \
 	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
+		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
 	fi ; \
 	exit 1
 endef
@@ -318,8 +323,8 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE)))
-	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
+	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_PATCH)))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4e8db71..9efd6e9 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -65,7 +65,7 @@ else
 endif
 
 $(DL_DIR)/$(CUPS_SOURCE):
-	 $(call DOWNLOAD,$(CUPS_SITE),$(CUPS_SOURCE))
+	 $(call DOWNLOAD,$(CUPS_SITE)/$(CUPS_SOURCE))
 
 $(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
 	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 2942449..0975f3f 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -11,7 +11,7 @@ FIS_BINARY:=fis
 FIS_TARGET_BINARY:=sbin/fis
 
 $(DL_DIR)/$(FIS_SOURCE):
-	 $(call DOWNLOAD,$(FIS_SITE),$(FIS_SOURCE))
+	 $(call DOWNLOAD,$(FIS_SITE)/$(FIS_SOURCE))
 
 fis-source: $(DL_DIR)/$(FIS_SOURCE)
 
diff --git a/package/games/doom-wad/doom-wads.mk b/package/games/doom-wad/doom-wads.mk
index bae2420..c0bf4fb 100644
--- a/package/games/doom-wad/doom-wads.mk
+++ b/package/games/doom-wad/doom-wads.mk
@@ -10,7 +10,7 @@ DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
 DOOM_WAD_DIR=$(BUILD_DIR)/doom-wad-$(DOOM_WAD_VERSION)
 
 $(DL_DIR)/$(DOOM_WAD_SOURCE):
-	 $(call DOWNLOAD,$(DOOM_WAD_SITE),$(DOOM_WAD_SOURCE))
+	 $(call DOWNLOAD,$(DOOM_WAD_SITE)/$(DOOM_WAD_SOURCE))
 
 doom-wad-source: $(DL_DIR)/$(DOOM_WAD_SOURCE)
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f4c8c76..f3605da 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -18,7 +18,7 @@ LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
 endif
 
 $(DL_DIR)/$(GETTEXT_SOURCE):
-	 $(call DOWNLOAD,$(GETTEXT_SITE),$(GETTEXT_SOURCE))
+	 $(call DOWNLOAD,$(GETTEXT_SITE)/$(GETTEXT_SOURCE))
 
 gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
 
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b68e825..ae442a0 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -18,7 +18,7 @@ MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
 	DynaLoader.pm AutoLoader.pm Carp/Heavy.pm
 endif
 $(DL_DIR)/$(MICROPERL_SOURCE):
-	$(call DOWNLOAD,$(MICROPERL_SITE),$(MICROPERL_SOURCE))
+	$(call DOWNLOAD,$(MICROPERL_SITE)/$(MICROPERL_SOURCE))
 
 $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index dde8f9f..83991f2 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -12,7 +12,7 @@ NETKITBASE_BINARY:=inetd/inetd
 NETKITBASE_TARGET_BINARY:=usr/sbin/inetd
 
 $(DL_DIR)/$(NETKITBASE_SOURCE):
-	 $(call DOWNLOAD,$(NETKITBASE_SITE),$(NETKITBASE_SOURCE))
+	 $(call DOWNLOAD,$(NETKITBASE_SITE)/$(NETKITBASE_SOURCE))
 
 netkitbase-source: $(DL_DIR)/$(NETKITBASE_SOURCE)
 
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index e9f40ca..ff05318 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -12,7 +12,7 @@ NETKITTELNET_BINARY:=telnetd/telnetd
 NETKITTELNET_TARGET_BINARY:=usr/sbin/telnetd
 
 $(DL_DIR)/$(NETKITTELNET_SOURCE):
-	 $(call DOWNLOAD,$(NETKITTELNET_SITE),$(NETKITTELNET_SOURCE))
+	 $(call DOWNLOAD,$(NETKITTELNET_SITE)/$(NETKITTELNET_SOURCE))
 
 netkittelnet-source: $(DL_DIR)/$(NETKITTELNET_SOURCE)
 
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index eb944a9..ac450e0 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -11,7 +11,7 @@ NEWT_VERSION=0.51.0
 NEWT_CFLAGS=-Os -g -fPIC
 
 $(DL_DIR)/$(NEWT_SOURCE):
-	$(call DOWNLOAD,$(NEWT_SITE),$(NEWT_SOURCE))
+	$(call DOWNLOAD,$(NEWT_SITE)/$(NEWT_SOURCE))
 
 $(NEWT_DIR)/.source: $(DL_DIR)/$(NEWT_SOURCE)
 	$(NEWT_CAT) $(DL_DIR)/$(NEWT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 739849f..0f95d06 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -12,7 +12,7 @@ TINYHTTPD_BINARY:=httpd
 TINYHTTPD_TARGET_BINARY:=usr/sbin/tinyhttpd
 
 $(DL_DIR)/$(TINYHTTPD_SOURCE):
-	 $(call DOWNLOAD,$(TINYHTTPD_SITE),$(TINYHTTPD_SOURCE))
+	 $(call DOWNLOAD,$(TINYHTTPD_SITE)/$(TINYHTTPD_SOURCE))
 
 tinyhttpd-source: $(DL_DIR)/$(TINYHTTPD_SOURCE)
 
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 006b74c..1acf120 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -10,7 +10,7 @@ TTCP_SOURCE=ttcp$(TTCP_VERSION).c
 TTCP_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
 
 $(DL_DIR)/$(TTCP_SOURCE):
-	 $(call DOWNLOAD,$(TTCP_SOURCE_URL),$(TTCP_SOURCE))
+	 $(call DOWNLOAD,$(TTCP_SOURCE_URL)/$(TTCP_SOURCE))
 
 $(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
 	-mkdir $(TTCP_DIR)
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 8355a7f..62b0911 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -12,7 +12,7 @@ UEMACS_BINARY:=em
 UEMACS_TARGET_BINARY:=usr/bin/emacs
 
 $(DL_DIR)/$(UEMACS_SOURCE):
-	 $(call DOWNLOAD,$(UEMACS_SITE),$(UEMACS_SOURCE))
+	 $(call DOWNLOAD,$(UEMACS_SITE)/$(UEMACS_SOURCE))
 
 uemacs-source: $(DL_DIR)/$(UEMACS_SOURCE)
 
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 5a8c700..d8d9654 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -15,7 +15,7 @@ VPNC_TARGET_BINARY:=$(VPNC_DEST_DIR)/vpnc
 VPNC_TARGET_SCRIPT:=$(TARGET_DIR)/etc/vpnc/default.conf
 
 $(DL_DIR)/$(VPNC_SOURCE):
-	$(call DOWNLOAD,$(VPNC_SITE),$(VPNC_SOURCE))
+	$(call DOWNLOAD,$(VPNC_SITE)/$(VPNC_SOURCE))
 
 $(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
 	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 68db2f7..52fec09 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -18,7 +18,7 @@ XFSPROGS_STRIP_LIBDEP:= \
 	repair/xfs_repair quota/xfs_quota
 
 $(DL_DIR)/$(XFSPROGS_SOURCE):
-	 $(call DOWNLOAD,$(XFSPROGS_SITE),$(XFSPROGS_SOURCE))
+	 $(call DOWNLOAD,$(XFSPROGS_SITE)/$(XFSPROGS_SOURCE))
 
 xfsprogs-source: $(DL_DIR)/$(XFSPROGS_SOURCE)
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 5eb7505..d9547fb 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -172,7 +172,7 @@ endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(call DOWNLOAD,$(GCC_SITE),$(GCC_SOURCE))
+	$(call DOWNLOAD,$(GCC_SITE)/$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 56faf49..b5c085b 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -24,7 +24,7 @@ endif
 GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
 
 $(DL_DIR)/$(GDB_SOURCE):
-	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))
+	$(call DOWNLOAD,$(GDB_SITE)/$(GDB_SOURCE))
 
 gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 72c6007..c464c37 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -81,7 +81,7 @@ $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
 	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
 endif
-	$(call DOWNLOAD,$(LINUX_HEADERS_SITE),$(LINUX_HEADERS_SOURCE))
+	$(call DOWNLOAD,$(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 2ac4973..8f75fcf 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -225,10 +225,10 @@ endif
 # components than usual.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1),$(TOOLCHAIN_EXTERNAL_SOURCE_1))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2),$(TOOLCHAIN_EXTERNAL_SOURCE_2))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
@@ -251,7 +251,7 @@ endif
 else
 # Download and extraction of a toolchain
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE),$(TOOLCHAIN_EXTERNAL_SOURCE))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE)/$(TOOLCHAIN_EXTERNAL_SOURCE))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index ee474bb..32cbe46 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -67,7 +67,7 @@ UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_ARM_TYPE))
 UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
+	$(call DOWNLOAD,$(UCLIBC_SITE)/$(UCLIBC_SOURCE))
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
-- 
1.7.9
