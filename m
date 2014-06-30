From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 30 Jun 2014 21:26:21 +0400
Subject: [Buildroot] [PATCH] uclibc: clean-up test suite build command
Message-ID: <1404149181-18586-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting from uClibc 0.9.32 this cleaned-up command builds tests flawlessly.
For 0.9.31 it lead to build failure, but assuming there're close to zero
users who is going to test outdated uClibc library on obsolete
(in Buildroot) AVR32 architecture I thin it worth applying.

Still it's possible to have 2 variants at the same time until AVR32 is not gone:
1. Old implementation used strictly for uClibc 0.9.31
2. New implementation for all other versions

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/uclibc/uclibc.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index caa5553..0cbd3c8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -484,12 +484,10 @@ endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_BUILD_TEST_SUITE
-	$(MAKE1) -C $(@D)/test \
+	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
-		ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
 		UCLIBC_ONLY=1 \
-		TEST_INSTALLED_UCLIBC=1 \
-		compile
+		test_compile
 endef
 endif
 
-- 
1.9.3
