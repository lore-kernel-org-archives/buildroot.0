From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 15 Feb 2012 22:05:38 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <CAM+bi4s6tQ0RpfqgjGtqpT0ym=WMPvROgyVsxdzKsx0GeKwtHg@mail.gmail.com>
References: <CAM+bi4s6tQ0RpfqgjGtqpT0ym=WMPvROgyVsxdzKsx0GeKwtHg@mail.gmail.com>
Message-ID: <1329339938-14441-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M" <alvaro.gamez@hazent.com>

This patch modifies the definition of DOWNLOAD to receive two arguments.

I think this is the generic solution to the problem, even though it is a
change to the API.

However, by making the second parameter optional, it could be possible to reduce
code. To keep the more generic way, the .mk files that needed to be changed
to the new API are kept with both arguments to the call of the function.

Same thing with the, to my knowledge, unused SOURCE_CHECK_WGET and SCP functions.

The difference is that now $1 stores the full URL of the file, whereas $2
stores the name of the file as we want it to be named after download
complets.

For example, a full copy-paste from Xilinx git:
URL='http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;f=microblazeel-unknown-linux-gnu.tgz;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=HEAD'
FILE='microblazeel-unknown-linux-gnu.tgz'

$(call DOWNLOAD,$(URL),$(FILE))

In case we know for sure the downloaded file is going to have the name we
want, we can omit the second parameter:

URL=ftp://ftp.idsoftware.com/idstuff/doom/doom-$(DOOM_WAD_VERSION).wad.gz
$(call DOWNLOAD,$(URL))

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
[Arnout] Reposting as an in-line patch, for simpler reviewing.
Alvaro, if you use 'git send-email' to send you patches, it is easier
to review and apply them.  See the man page of git send-email for an
explanation how to use it with GMail.
---
 docs/buildroot.html                         |    2 +-
 docs/manual/adding-packages-handwritten.txt |    2 +-
 linux/linux.mk                              |    2 +-
 package/Makefile.package.in                 |   14 +++++++++-----
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
 22 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index ddfb20a..e0f6ad8 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1542,7 +1542,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 11: LIBFOO_TARGET_BINARY:=usr/bin/foo
 12:
 <span id="ex2line13">13: $(DL_DIR)/$(LIBFOO_SOURCE):</span>
-14: 	$(call DOWNLOAD,$(LIBFOO_SITE),$(LIBFOO_SOURCE))
+14: 	$(call DOWNLOAD,$(LIBFOO_SITE)/$(LIBFOO_SOURCE),$(LIBFOO_SOURCE))
 15:
 <span id="ex2line16">16: $(LIBFOO_DIR)/.source: $(DL_DIR)/$(LIBFOO_SOURCE)</span>
 17: 	$(ZCAT) $(DL_DIR)/$(LIBFOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/docs/manual/adding-packages-handwritten.txt b/docs/manual/adding-packages-handwritten.txt
index a9d247c..938885a 100644
--- a/docs/manual/adding-packages-handwritten.txt
+++ b/docs/manual/adding-packages-handwritten.txt
@@ -22,7 +22,7 @@ existing manual makefiles and to help understand how they work.*
 11: LIBFOO_TARGET_BINARY:=usr/bin/foo
 12:
 13: $(DL_DIR)/$(LIBFOO_SOURCE):
-14: 	$(call DOWNLOAD,$(LIBFOO_SITE),$(LIBFOO_SOURCE))
+14: 	$(call DOWNLOAD,$(LIBFOO_SITE)/$(LIBFOO_SOURCE),$(LIBFOO_SOURCE))
 15:
 16: $(LIBFOO_DIR)/.source: $(DL_DIR)/$(LIBFOO_SOURCE)
 17: 	$(ZCAT) $(DL_DIR)/$(LIBFOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/linux/linux.mk b/linux/linux.mk
index ae236d4..d1a05a1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -98,7 +98,7 @@ define LINUX_DOWNLOAD_PATCHES
 	$(if $(LINUX_PATCHES),
 		@$(call MESSAGE,"Download additional patches"))
 	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
-		$(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
+		$(call DOWNLOAD,$(patch),$(notdir $(patch)))$(sep))
 endef
 
 LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 33461b4..3714de0 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -203,11 +203,11 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
+	$(SCP) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)/$(2)
 endef
 
 define SOURCE_CHECK_SCP
-	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1)/$(2),:) > /dev/null
+	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1),:) > /dev/null
 endef
 
 define SHOW_EXTERNAL_DEPS_SCP
@@ -237,12 +237,16 @@ endef
 
 
 define DOWNLOAD_WGET
-	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
+	if test -n "$(2)"; then \
+		test -e $(DL_DIR)/$(2) || \
+		$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1)); \
+	else \
+		$(WGET) $(call qstrip,$(1)) ;\
+	fi
 endef
 
 define SOURCE_CHECK_WGET
-  $(WGET) --spider $(call qstrip,$(1))/$(2)
+  $(WGET) --spider $(call qstrip,$(1))
 endef
 
 define SHOW_EXTERNAL_DEPS_WGET
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4e8db71..ed2e72c 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -65,7 +65,7 @@ else
 endif
 
 $(DL_DIR)/$(CUPS_SOURCE):
-	 $(call DOWNLOAD,$(CUPS_SITE),$(CUPS_SOURCE))
+	 $(call DOWNLOAD,$(CUPS_SITE)/$(CUPS_SOURCE),$(CUPS_SOURCE))
 
 $(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
 	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 2942449..c400dea 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -11,7 +11,7 @@ FIS_BINARY:=fis
 FIS_TARGET_BINARY:=sbin/fis
 
 $(DL_DIR)/$(FIS_SOURCE):
-	 $(call DOWNLOAD,$(FIS_SITE),$(FIS_SOURCE))
+	 $(call DOWNLOAD,$(FIS_SITE)/$(FIS_SOURCE),$(FIS_SOURCE))
 
 fis-source: $(DL_DIR)/$(FIS_SOURCE)
 
diff --git a/package/games/doom-wad/doom-wads.mk b/package/games/doom-wad/doom-wads.mk
index bae2420..2e41ef4 100644
--- a/package/games/doom-wad/doom-wads.mk
+++ b/package/games/doom-wad/doom-wads.mk
@@ -10,7 +10,7 @@ DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
 DOOM_WAD_DIR=$(BUILD_DIR)/doom-wad-$(DOOM_WAD_VERSION)
 
 $(DL_DIR)/$(DOOM_WAD_SOURCE):
-	 $(call DOWNLOAD,$(DOOM_WAD_SITE),$(DOOM_WAD_SOURCE))
+	 $(call DOWNLOAD,$(DOOM_WAD_SITE)/$(DOOM_WAD_SOURCE),$(DOOM_WAD_SOURCE))
 
 doom-wad-source: $(DL_DIR)/$(DOOM_WAD_SOURCE)
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f4c8c76..a8a6458 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -18,7 +18,7 @@ LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
 endif
 
 $(DL_DIR)/$(GETTEXT_SOURCE):
-	 $(call DOWNLOAD,$(GETTEXT_SITE),$(GETTEXT_SOURCE))
+	 $(call DOWNLOAD,$(GETTEXT_SITE)/$(GETTEXT_SOURCE),$(GETTEXT_SOURCE))
 
 gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
 
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b68e825..39cee3d 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -18,7 +18,7 @@ MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
 	DynaLoader.pm AutoLoader.pm Carp/Heavy.pm
 endif
 $(DL_DIR)/$(MICROPERL_SOURCE):
-	$(call DOWNLOAD,$(MICROPERL_SITE),$(MICROPERL_SOURCE))
+	$(call DOWNLOAD,$(MICROPERL_SITE)/$(MICROPERL_SOURCE),$(MICROPERL_SOURCE))
 
 $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index dde8f9f..632960e 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -12,7 +12,7 @@ NETKITBASE_BINARY:=inetd/inetd
 NETKITBASE_TARGET_BINARY:=usr/sbin/inetd
 
 $(DL_DIR)/$(NETKITBASE_SOURCE):
-	 $(call DOWNLOAD,$(NETKITBASE_SITE),$(NETKITBASE_SOURCE))
+	 $(call DOWNLOAD,$(NETKITBASE_SITE)/$(NETKITBASE_SOURCE),$(NETKITBASE_SOURCE))
 
 netkitbase-source: $(DL_DIR)/$(NETKITBASE_SOURCE)
 
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index e9f40ca..961ae03 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -12,7 +12,7 @@ NETKITTELNET_BINARY:=telnetd/telnetd
 NETKITTELNET_TARGET_BINARY:=usr/sbin/telnetd
 
 $(DL_DIR)/$(NETKITTELNET_SOURCE):
-	 $(call DOWNLOAD,$(NETKITTELNET_SITE),$(NETKITTELNET_SOURCE))
+	 $(call DOWNLOAD,$(NETKITTELNET_SITE)/$(NETKITTELNET_SOURCE),$(NETKITTELNET_SOURCE))
 
 netkittelnet-source: $(DL_DIR)/$(NETKITTELNET_SOURCE)
 
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index eb944a9..a9ed074 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -11,7 +11,7 @@ NEWT_VERSION=0.51.0
 NEWT_CFLAGS=-Os -g -fPIC
 
 $(DL_DIR)/$(NEWT_SOURCE):
-	$(call DOWNLOAD,$(NEWT_SITE),$(NEWT_SOURCE))
+	$(call DOWNLOAD,$(NEWT_SITE)/$(NEWT_SOURCE),$(NEWT_SOURCE))
 
 $(NEWT_DIR)/.source: $(DL_DIR)/$(NEWT_SOURCE)
 	$(NEWT_CAT) $(DL_DIR)/$(NEWT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 739849f..8f59661 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -12,7 +12,7 @@ TINYHTTPD_BINARY:=httpd
 TINYHTTPD_TARGET_BINARY:=usr/sbin/tinyhttpd
 
 $(DL_DIR)/$(TINYHTTPD_SOURCE):
-	 $(call DOWNLOAD,$(TINYHTTPD_SITE),$(TINYHTTPD_SOURCE))
+	 $(call DOWNLOAD,$(TINYHTTPD_SITE)/$(TINYHTTPD_SOURCE),$(TINYHTTPD_SOURCE))
 
 tinyhttpd-source: $(DL_DIR)/$(TINYHTTPD_SOURCE)
 
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 006b74c..f9035e4 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -10,7 +10,7 @@ TTCP_SOURCE=ttcp$(TTCP_VERSION).c
 TTCP_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
 
 $(DL_DIR)/$(TTCP_SOURCE):
-	 $(call DOWNLOAD,$(TTCP_SOURCE_URL),$(TTCP_SOURCE))
+	 $(call DOWNLOAD,$(TTCP_SOURCE_URL)/$(TTCP_SOURCE),$(TTCP_SOURCE))
 
 $(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
 	-mkdir $(TTCP_DIR)
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 8355a7f..63b97b9 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -12,7 +12,7 @@ UEMACS_BINARY:=em
 UEMACS_TARGET_BINARY:=usr/bin/emacs
 
 $(DL_DIR)/$(UEMACS_SOURCE):
-	 $(call DOWNLOAD,$(UEMACS_SITE),$(UEMACS_SOURCE))
+	 $(call DOWNLOAD,$(UEMACS_SITE)/$(UEMACS_SOURCE),$(UEMACS_SOURCE))
 
 uemacs-source: $(DL_DIR)/$(UEMACS_SOURCE)
 
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 5a8c700..00b1375 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -15,7 +15,7 @@ VPNC_TARGET_BINARY:=$(VPNC_DEST_DIR)/vpnc
 VPNC_TARGET_SCRIPT:=$(TARGET_DIR)/etc/vpnc/default.conf
 
 $(DL_DIR)/$(VPNC_SOURCE):
-	$(call DOWNLOAD,$(VPNC_SITE),$(VPNC_SOURCE))
+	$(call DOWNLOAD,$(VPNC_SITE)/$(VPNC_SOURCE),$(VPNC_SOURCE))
 
 $(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
 	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 68db2f7..7c3fb01 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -18,7 +18,7 @@ XFSPROGS_STRIP_LIBDEP:= \
 	repair/xfs_repair quota/xfs_quota
 
 $(DL_DIR)/$(XFSPROGS_SOURCE):
-	 $(call DOWNLOAD,$(XFSPROGS_SITE),$(XFSPROGS_SOURCE))
+	 $(call DOWNLOAD,$(XFSPROGS_SITE)/$(XFSPROGS_SOURCE),$(XFSPROGS_SOURCE))
 
 xfsprogs-source: $(DL_DIR)/$(XFSPROGS_SOURCE)
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 5eb7505..4938fd2 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -172,7 +172,7 @@ endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(call DOWNLOAD,$(GCC_SITE),$(GCC_SOURCE))
+	$(call DOWNLOAD,$(GCC_SITE)/$(GCC_SOURCE),$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 56faf49..2278f2e 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -24,7 +24,7 @@ endif
 GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
 
 $(DL_DIR)/$(GDB_SOURCE):
-	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))
+	$(call DOWNLOAD,$(GDB_SITE)/$(GDB_SOURCE),$(GDB_SOURCE))
 
 gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 72c6007..7bc7627 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -81,7 +81,7 @@ $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
 	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
 endif
-	$(call DOWNLOAD,$(LINUX_HEADERS_SITE),$(LINUX_HEADERS_SOURCE))
+	$(call DOWNLOAD,$(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE),$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 2ac4973..26f3846 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -225,10 +225,10 @@ endif
 # components than usual.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1),$(TOOLCHAIN_EXTERNAL_SOURCE_1))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1),$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2),$(TOOLCHAIN_EXTERNAL_SOURCE_2))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2)/$(TOOLCHAIN_EXTERNAL_SOURCE_2),$(TOOLCHAIN_EXTERNAL_SOURCE_2))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
@@ -251,7 +251,7 @@ endif
 else
 # Download and extraction of a toolchain
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE),$(TOOLCHAIN_EXTERNAL_SOURCE))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE)/$(TOOLCHAIN_EXTERNAL_SOURCE),$(TOOLCHAIN_EXTERNAL_SOURCE))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index ee474bb..a8f3a96 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -67,7 +67,7 @@ UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_ARM_TYPE))
 UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
+	$(call DOWNLOAD,$(UCLIBC_SITE)/$(UCLIBC_SOURCE),$(UCLIBC_SOURCE))
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
-- 
1.7.8.3
