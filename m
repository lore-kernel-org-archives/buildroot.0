From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:52 +0200
Subject: [Buildroot] [PATCH 6/8 v3] package/uclibc: use the generic help
	rules
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <ad00f3ac185c89666d8939ad540b4bf6bdf251af.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that the uclibc-menuconfig rule was guarded behind
BR2_TOOLCHAIN_BUILDROOT, which is wrong since we can build
glibc or musl toolchains too...

This is de facto fixed by moving the help text to the uClibc package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                 | 3 ---
 package/uclibc/uclibc.mk | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index bb3d588..f007db2 100644
--- a/Makefile
+++ b/Makefile
@@ -941,9 +941,6 @@ help:
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
 		$($(p)_HELP_CMDS)$(sep))
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
-endif
 ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-menuconfig     - Run barebox menuconfig'
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index cf343a4..aa5fc79 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,6 +11,10 @@ UCLIBC_LICENSE = LGPLv2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
 UCLIBC_INSTALL_STAGING = YES
 
+define UCLIBC_HELP_CMDS
+	$(call print-help,uclibc-menuconfig,Run uClibc menuconfig)
+endef
+
 # uclibc is part of the toolchain so disable the toolchain dependency
 UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.7.4
