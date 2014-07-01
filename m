From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 15:04:04 +0200
Subject: [Buildroot] [git commit] uclibc: disable parallel build for uClibc
	0.9.31
Message-ID: <20140701130717.C91749D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a530b6ed312a69dabdc98a1e10795238fd4d1e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 8337bb6..e20f92f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -481,8 +481,20 @@ define UCLIBC_BUILD_TEST_SUITE
 endef
 endif
 
+# In uClibc 0.9.31 parallel building is broken so we have to disable it
+# Fortunately uClibc 0.9.31 is only used by AVR32 and in its turn AVR32 is
+# about to be removed from buildroot.
+#
+# So as soon as AVR32 is removed please revert this patch so instead of
+# UCLIBC_MAKE normal "MAKE" is used in UCLIBC_BUILD_CMDS
+ifeq ($(BR2_UCLIBC_VERSION_0_9_31),y)
+	UCLIBC_MAKE = $(MAKE1)
+else
+	UCLIBC_MAKE = $(MAKE)
+endif
+
 define UCLIBC_BUILD_CMDS
-	$(MAKE) -C $(@D) \
+	$(UCLIBC_MAKE) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX= \
 		DEVEL_PREFIX=/ \
