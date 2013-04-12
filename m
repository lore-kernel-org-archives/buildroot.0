From: Shawn J. Goff <shawn7400@gmail.com>
Date: Fri, 12 Apr 2013 15:40:30 -0400
Subject: [Buildroot] [PATCH v2] eliminate double slashes caused by FOO_SITE
	ending in a slash
In-Reply-To: <1365785580-1868-1-git-send-email-shawn7400@gmail.com>
References: <1365785580-1868-1-git-send-email-shawn7400@gmail.com>
Message-ID: <1365795630-3915-1-git-send-email-shawn7400@gmail.com>
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
---
 package/perl/perl.mk                       | 2 +-
 package/pkg-generic.mk                     | 4 ++--
 toolchain/gcc/gcc-uclibc-4.x.mk            | 4 ++--
 toolchain/kernel-headers/kernel-headers.mk | 6 +++---
 toolchain/toolchain-external/ext-tool.mk   | 4 ++--
 toolchain/uClibc/uclibc.mk                 | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 66f7daa..42512f8 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -25,7 +25,7 @@ PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 # together with perl
 
 define PERL_CROSS_DOWNLOAD
-	$(call DOWNLOAD,$(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE))
+	$(call DOWNLOAD,$(PERL_CROSS_SITE:/=)/$(PERL_CROSS_SOURCE))
 endef
 PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 901bcf7..e6bc955 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -39,8 +39,8 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		done ; \
 	fi
 endif
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$(p))$(sep))
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
+	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 9d131d5..fc11ad4 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -30,7 +30,7 @@ ifneq ($(GCC_SNAP_DATE),)
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
  GCC_SITE:=ftp://www.at91.com/pub/buildroot/
 else
- GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
+ GCC_SITE:=$(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
 
 GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
@@ -212,7 +212,7 @@ endif
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
 	$(Q)$(call MESSAGE,"Downloading gcc")
-	$(call DOWNLOAD,$(GCC_SITE)/$(GCC_SOURCE))
+	$(call DOWNLOAD,$(GCC_SITE:/=)/$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 7ce6264..adf7bc4 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -27,9 +27,9 @@ EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
 
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
 ifeq ($(findstring x2.6.,x$(DEFAULT_KERNEL_HEADERS)),x2.6.)
-LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v2.6/
 else
-LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v3.x/
 endif
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
@@ -71,7 +71,7 @@ ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
 	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
 endif
 	$(Q)$(call MESSAGE,"Downloading kernel headers")
-	$(call DOWNLOAD,$(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE))
+	$(call DOWNLOAD,$(LINUX_HEADERS_SITE:/=)/$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 5c5935c..afdbc5b 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -299,10 +299,10 @@ endif
 # components than usual.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2:/=:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 113dc79..2249651 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -63,7 +63,7 @@ endif
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(Q)$(call MESSAGE,"Downloading uClibc")
-	$(call DOWNLOAD,$(UCLIBC_SITE)/$(UCLIBC_SOURCE))
+	$(call DOWNLOAD,$(UCLIBC_SITE:/=)/$(UCLIBC_SOURCE))
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
-- 
1.8.1.5
