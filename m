From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Sep 2013 09:59:11 +0200
Subject: [Buildroot] [PATCH v4 1/3] package: add toolchain dependency to
	inner-generic-package
In-Reply-To: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1379404753-3471-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the dependency from the target toolchain explicit.
This way we can buid from command line a package that use
innger-generic-package right after the configuration phase, example:

	make clean <package-name>

This is a step forward top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile                 | 2 +-
 package/pkg-autotools.mk | 3 ++-
 package/pkg-generic.mk   | 6 +++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 3367a6a..2465bc9 100644
--- a/Makefile
+++ b/Makefile
@@ -398,7 +398,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 toolchain: prepare dirs dependencies $(BASE_TARGETS)
 
-world: toolchain $(TARGETS_ALL)
+world: $(TARGETS_ALL)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b0eddde..aafa396 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -202,7 +202,8 @@ endef
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
+				host-toolchain $(1),\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bfc4dc1..d7efcd3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -307,7 +307,11 @@ endif
 $(2)_REDISTRIBUTE		?= YES
 
 
-$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
+	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($$($(2)_TYPE),target)
+$(2)_DEPENDENCIES += toolchain
+endif
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
-- 
1.8.4
