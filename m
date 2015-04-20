From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Apr 2015 12:10:18 +0300
Subject: [Buildroot] [PATCH v2] uclibc: clean-up test suite build command
Message-ID: <1429521018-11517-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting from uClibc 0.9.32 "test_compile" target builds tests flawlessly.
For 0.9.31 it lead to build failure, but now when AVR32 support was dropped
I think this change worth applying.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---

This is just a re-send of v1 (https://patchwork.ozlabs.org/patch/365705/)
so no changes at all.

It still applies flawlessly on current master.

I build tested it on ARC and ARM. Note on ARM uClibc tests
(BR2_UCLIBC_INSTALL_TEST_SUITE) will be only compiled without errors
with uClibc-ng (BR2_UCLIBC_VERSION_NG), either BR2_UCLIBC_VERSION_0_9_33
or BR2_UCLIBC_VERSION_SNAPSHOT will fail on testsuite compilation but
that has nothing to do with current patch I think.

---
 package/uclibc/uclibc.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 72a46d9..c599379 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -395,12 +395,10 @@ endef
 
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
2.1.0
