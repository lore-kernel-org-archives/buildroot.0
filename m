From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  3 Oct 2013 14:10:40 +0200
Subject: [Buildroot] [PATCH v7 1/6] package: add toolchain dependency to
	inner-generic-package
In-Reply-To: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380802245-16978-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the dependency from the target toolchain explicit.
This way we can buid from command line a package that use
innger-generic-package right after the configuration phase, example:

	make clean <package-name>

Also remove TARGETS_ALL because the only purpose was to add toolchain
dependency so it's superseded by this commit.

To prevent circular dependency add the new variable <pkgname>_TOOLCHAIN
for not adding the toolchain dependency for toolchain packages.

This is a step forward top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

f
---
 Makefile                               | 8 ++------
 package/linux-headers/linux-headers.mk | 1 +
 package/pkg-autotools.mk               | 3 ++-
 package/pkg-generic.mk                 | 8 ++++++--
 package/uclibc/uclibc.mk               | 1 +
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index c170ca2..44dc584 100644
--- a/Makefile
+++ b/Makefile
@@ -363,7 +363,6 @@ TARGETS+=target-post-image
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
-TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
 # visible in Kconfig and hence not added to a variable like TARGETS.
@@ -386,9 +385,6 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
-# all targets depend on the crosscompiler and it's prerequisites
-$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
-
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -401,11 +397,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 toolchain: prepare dirs dependencies $(BASE_TARGETS)
 
-world: toolchain $(TARGETS_ALL)
+world: $(TARGETS)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
+	$(BASE_TARGETS) $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 30d3076..865b36d 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -16,6 +16,7 @@ endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
 LINUX_HEADERS_INSTALL_STAGING = YES
+LINUX_HEADERS_TOOLCHAIN = YES
 
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 9523529..f58570d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -209,7 +209,8 @@ endef
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
+				host-toolchain $(1),\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bfc4dc1..2dc743b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -305,9 +305,13 @@ ifndef $(2)_REDISTRIBUTE
 endif
 
 $(2)_REDISTRIBUTE		?= YES
+$(2)_TOOLCHAIN			?= NO
 
-
-$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
+	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($$($(2)_TYPE)$$($(2)_TOOLCHAIN),targetNO)
+$(2)_DEPENDENCIES += toolchain
+endif
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3993d9b..8efebc6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -17,6 +17,7 @@ UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
 endif
 
 UCLIBC_INSTALL_STAGING = YES
+UCLIBC_TOOLCHAIN = YES
 
 # Before uClibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-- 
1.8.4
