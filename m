From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 22:25:45 +0100
Subject: [Buildroot] [git commit] xtensa: add -mlongcalls to CFLAGS for
	xtensa
Message-ID: <20121210212803.C44EF99949@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7ccd30afbd989085be834b23ac2ea997c50b883
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The longcalls option allows calls across a greater range of addresses.

This option may degrade both code size and performance, but
the linker can generally optimize away the unnecessary overhead
when a call ends up within range

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8dea51e..4281773 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -56,6 +56,15 @@ TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
+# Use longcalls option for Xtensa globally.
+# The 'longcalls' option allows calls across a greater range of addresses,
+# and is required for some packages. While this option can degrade both
+# code size and performance, the linker can usually optimize away the
+# overhead when a call ends up within a certain range.
+ifeq ($(BR2_xtensa),y)
+TARGET_ABI += -mlongcalls
+endif
+
 STAGING_DIR=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot
 
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
