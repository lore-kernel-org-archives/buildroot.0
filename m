From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 30 Jun 2014 18:30:20 +0400
Subject: [Buildroot] [PATCH] uclibc: disable parallel build for uClibc 0.9.31
Message-ID: <1404138620-7929-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is only required for uClibc 0.9.31 and this veriosn is only used by
AVR32 so could be safely removed together with AVR32.

Even 0.9.32 builds well in parallel (at least on x86) so IMHO there's no need
in >= 0.9.33, just disable for a particular broken version.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/uclibc/uclibc.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 28a8a08..af3a4d4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -493,8 +493,20 @@ define UCLIBC_BUILD_TEST_SUITE
 endef
 endif
 
+# In uClibc 0.9.31 parallel building is broken so we have to disable it
+# Fortunately uClibc 0.9.31 is only used by AVR32 and in its turn AVR32 is
+# about to be removed from buildroot.
+#
+# So as soon as AVR32 is removed please revert this patch so instead of
+# MAKE_UCLIBC normal "MAKE" is used in UCLIBC_BUILD_CMDS
+ifeq ($(BR2_UCLIBC_VERSION_0_9_31),y)
+	MAKE_UCLIBC = $(MAKE1)
+else
+	MAKE_UCLIBC = $(MAKE)
+endif
+
 define UCLIBC_BUILD_CMDS
-	$(MAKE) -C $(@D) \
+	$(MAKE_UCLIBC) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX= \
 		DEVEL_PREFIX=/ \
-- 
1.9.3
