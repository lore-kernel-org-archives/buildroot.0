From: Shawn J. Goff <shawn7400@gmail.com>
Date: Fri, 12 Apr 2013 12:53:00 -0400
Subject: [Buildroot] [PATCH] eliminate double slashes caused by _SITEs
	ending in a slash
Message-ID: <1365785580-1868-1-git-send-email-shawn7400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Shawn J. Goff" <shawn7400@gmail.com>

When a FOO_SITE variable ends in a slash and gets joined with a
FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
has a double slash. While double-slashes are fine in unix paths, they
are reserved in URIs - the part following '//' must be an authority.

Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
---
 package/perl/perl.mk                       | 2 +-
 package/pkg-generic.mk                     | 4 ++--
 toolchain/gdb/gdb.mk                       | 2 +-
 toolchain/kernel-headers/kernel-headers.mk | 2 +-
 toolchain/toolchain-external/ext-tool.mk   | 4 ++--
 toolchain/uClibc/uclibc.mk                 | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f3c73dd..2c317ec 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -22,7 +22,7 @@ PERL_CROSS_SOURCE  = perl-5.$(PERL_VERSION_MAJOR).0-cross-$(PERL_CROSS_VERSION).
 # together with perl
 
 define PERL_CROSS_DOWNLOAD
-	$(call DOWNLOAD,$(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE))
+	$(call DOWNLOAD,$(PERL_CROSS_SITE:/=)/$(PERL_CROSS_SOURCE))
 endef
 PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6fcd359..3246973 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -32,8 +32,8 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
-	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_PATCH)))
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
+	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_PATCH)))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 4b8fe3a..e34a31c 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -19,7 +19,7 @@ endif
 GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
 
 $(DL_DIR)/$(GDB_SOURCE):
-	$(call DOWNLOAD,$(GDB_SITE)/$(GDB_SOURCE))
+	$(call DOWNLOAD,$(GDB_SITE:/=)/$(GDB_SOURCE))
 
 gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 568c192..7f2976e 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -76,7 +76,7 @@ $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
 	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
 endif
-	$(call DOWNLOAD,$(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE))
+	$(call DOWNLOAD,$(LINUX_HEADERS_SITE:/=)/$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 8ce0a84..f176f3e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -279,10 +279,10 @@ endif
 # components than usual.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 055267c..279d2b6 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -62,7 +62,7 @@ UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
 endif
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	$(call DOWNLOAD,$(UCLIBC_SITE)/$(UCLIBC_SOURCE))
+	$(call DOWNLOAD,$(UCLIBC_SITE:/=)/$(UCLIBC_SOURCE))
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
-- 
1.8.1.5
