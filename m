From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Nov 2020 22:18:45 +0100
Subject: [Buildroot] [git commit] package/linux-backports: use flex and
 bison to generate kconfig parser
Message-ID: <20201112210807.AC7CE83676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec493ea4899f7be6500f495a32b4150feff355ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream backports package does not define the LEX/YACC Makefile
variables, contrary to the Kernel which is defining those in [1]. The
default "lex" and "yacc" are then used. On some systems, "yacc" is
Berkeley Yacc. Kconfig parser files are using non-Posix Bison
constructs.

Attempting to generate the parser with byacc fails with error:

    yacc: e - line 97 of "zconf.y", syntax error
    %destructor {
    ^

This patch defines the LEX and YACC Makefile variable to use flex and
bison, to fix this issue. The host-bison and host-flex dependencies are
added only if the host does not have them, following the same logic of
the Kernel.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=73a4f6dbe70a1b93c11e2d1d6ca68f3522daf434

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-backports/linux-backports.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 1d7d6e7f00..030d7a2864 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -11,6 +11,14 @@ LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stab
 LINUX_BACKPORTS_LICENSE = GPL-2.0
 LINUX_BACKPORTS_LICENSE_FILES = COPYING
 
+# flex and bison are needed to generate kconfig parser. We use the
+# same logic as the linux kernel (we add host dependencies only if
+# host does not have them). See linux/linux.mk and
+# support/dependencies/check-host-bison-flex.mk.
+LINUX_BACKPORTS_DEPENDENCIES = \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
+
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
 LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
 else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
@@ -33,6 +41,8 @@ LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
 # LINUX_BACKPORTS_MODULE_MAKE_OPTS is used by the kernel-module infra.
 #
 LINUX_BACKPORTS_MAKE_OPTS = \
+	LEX=flex \
+	YACC=bison \
 	BACKPORT_DIR=$(@D) \
 	KLIB_BUILD=$(LINUX_DIR) \
 	KLIB=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
