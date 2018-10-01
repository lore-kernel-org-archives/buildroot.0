From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 21:34:56 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] boot/uboot: needs
 bison/flex even for the legacy buildsystem
Message-ID: <20181001193433.705EA8B468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e211503c8cc15bdf57984a0fb38cb9c9a4531773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

When using the legacy buildsystem, the kconfig parser may still be used,
as reported by Thomas:

    >>> uboot 2018.09 Configuring
    ...]
     HOSTCC  scripts/basic/fixdep
     HOSTCC  scripts/kconfig/conf.o
     YACC    scripts/kconfig/zconf.tab.c
    bin/sh: 1: bison: not found
    ake[3]: *** [scripts/kconfig/zconf.tab.c] Error 127
    ake[3]: *** Waiting for unfinished jobs....
     LEX     scripts/kconfig/zconf.lex.c
    bin/sh: 1: flex: not found

However, in that case, the kconfig parser is only generated during the
'configure' step, so we can add bison/flex as standard dependencies.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e7b2a7dfffa0d22208b67b9c09018617a67c1d80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a19cb72458..451f8c5d72 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -447,6 +447,9 @@ endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 endif # BR2_TARGET_UBOOT && BR_BUILDING
 
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
+UBOOT_DEPENDENCIES += \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
