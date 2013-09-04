From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Sep 2013 16:16:55 +0800
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for elf2flt
Message-ID: <1378282615.12336.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ensures elf2flt will be built when BR2_PACKAGE_HOST_ELF2FLT=y before
building other packages.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
I don't have a blackfin platform, only test build this for blackfin.
Without this patch, the first time build will result in ELF binary because
busybox is built before elf2flt.
With this path, the result looks good, it produces BFLT executable for busybox.

 support/dependencies/dependencies.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4a220e0..3b8ea31 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_CCACHE),y)
 DEPENDENCIES_HOST_PREREQ += host-ccache
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ELF2FLT),y)
+DEPENDENCIES_HOST_PREREQ += host-elf2flt
+endif
+
 core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
-- 
1.8.1.2
