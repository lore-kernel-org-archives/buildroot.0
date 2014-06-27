From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 27 Jun 2014 16:07:24 +0400
Subject: [Buildroot] [PATCH] uclibc: enable multiple jobs for building
Message-ID: <1403870844-15258-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason uClibc got built with only 1 job (MAKE1).

Compilation with multiple jobs on modern multi-threaded host CPUs allows to save
significant amount of time on toolchain building.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b42fe55..3957960 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -484,7 +484,7 @@ endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_BUILD_TEST_SUITE
-	$(MAKE1) -C $(@D)/test \
+	$(MAKE) -C $(@D)/test \
 		$(UCLIBC_MAKE_FLAGS) \
 		ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
 		UCLIBC_ONLY=1 \
@@ -494,13 +494,13 @@ endef
 endif
 
 define UCLIBC_BUILD_CMDS
-	$(MAKE1) -C $(@D) \
+	$(MAKE) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX= \
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
 		all
-	$(MAKE1) -C $(@D)/utils \
+	$(MAKE) -C $(@D)/utils \
 		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" hostutils
 	$(UCLIBC_BUILD_TEST_SUITE)
-- 
1.9.3
