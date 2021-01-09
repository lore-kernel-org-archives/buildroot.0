From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Jan 2021 11:33:53 +0100
Subject: [Buildroot] [PATCH] package/libclc: switch to using LLVM's monorepo
Message-ID: <20210109103353.2860299-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LLVM project has switched to using a monorepo to host all their
components. The separate, individual repositories have been closed
late 2020 / early 2021. The libclc repository is no longer.

Switch to using the libclc source from the llvm monorepo; switch to
using the github helper, to avoid a huge git clone (still 115MiB
instead of the previous 172KiB...).

Finding the corresponding commit was made easy because the commit
logs embed a reference to the svn revision the git commit is made
from (and comparing with a local git clone of the previous repo).

Adapt the build commands and license location accordingly; switch
to the new, two-space separator in the hash file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 package/libclc/libclc.hash |  4 ++--
 package/libclc/libclc.mk   | 15 +++++++--------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
index 29728fbc76..f685fe7354 100644
--- a/package/libclc/libclc.hash
+++ b/package/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5ea2cd2fa7fa1474d3e0580064e7a22014ef8d64dbbd7c546277fa4beb5acf86 libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060.tar.gz
-sha256 3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479 LICENSE.TXT
+sha256  b025a5fb23c78deee144e4a7fee76bedca46e327d99695484a2a2cbf7f2192f9  libclc-2abbe2f09119ccad8ad96841ea4632a9c8a8f04d.tar.gz
+sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  libclc/LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
index 630616905c..e2b20695b2 100644
--- a/package/libclc/libclc.mk
+++ b/package/libclc/libclc.mk
@@ -5,11 +5,10 @@
 ################################################################################
 
 # Use the latest commit from release_90 branch.
-LIBCLC_VERSION = d1cbc92e2ceee59963f5c3a576382e5bba31f060
-LIBCLC_SITE = https://git.llvm.org/git/libclc
-LIBCLC_SITE_METHOD = git
+LIBCLC_VERSION = 2abbe2f09119ccad8ad96841ea4632a9c8a8f04d
+LIBCLC_SITE = $(call github,llvm,llvm-project,$(LIBCLC_VERSION))
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
-LIBCLC_LICENSE_FILES = LICENSE.TXT
+LIBCLC_LICENSE_FILES = libclc/LICENSE.TXT
 
 LIBCLC_DEPENDENCIES = host-clang host-llvm
 LIBCLC_INSTALL_STAGING = YES
@@ -28,19 +27,19 @@ LIBCLC_CONF_OPTS = \
 	--with-cxx-compiler=$(HOSTCXX_NOCCACHE)
 
 define LIBCLC_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
+	cd $(@D)/libclc && $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS)
 endef
 
 define LIBCLC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libclc
 endef
 
 define LIBCLC_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libclc DESTDIR=$(TARGET_DIR) install
 endef
 
 define LIBCLC_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libclc DESTDIR=$(STAGING_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.25.1
