From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 26 Mar 2013 17:33:56 +0800
Subject: [Buildroot] [PATCH 5/7] package: Introduce package-specific
	BINFMT_FLAT options.
In-Reply-To: <1364290438-13987-1-git-send-email-sonic.adi@gmail.com>
References: <1364290438-13987-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1364290438-13987-5-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Add new option <PKG>_FLAT_STACKSIZE. The document needs to be updated.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/pkg-autotools.mk |    5 +++++
 package/pkg-generic.mk   |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 890506b..09bdc7b 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -82,6 +82,11 @@ $(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
+ifeq ($(BR2_TARGET_ABI_FLAT),y)
+ ifneq ($$($(2)_FLAT_STACKSIZE),)
+  $(2)_CONF_ENV			+= LDFLAGS="$(TARGET_LDFLAGS) -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)"
+ endif
+endif
 
 #
 # Configure step. Only define it if not already defined by the package
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 57b0fd0..5ce32f9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -303,6 +303,11 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+ifeq ($(BR2_TARGET_ABI_FLAT),y)
+ ifneq ($$($(2)_FLAT_STACKSIZE),)
+  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
+ endif
+endif
 
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
-- 
1.7.0.4
