From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 12:53:03 +0200
Subject: [Buildroot] [git commit] BR2_FORTIFY*: toolchain wrapper limitation
 note
Message-ID: <20181020113218.69A8A83AB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=394bdd11fc1f741c88c89f0e71571d87a29ab627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A note is added to tie off the discussion on why moving _FORTIFY_SOURCE
related flags into the toolchain wrapper doesn't currently work.

 - Currently -D_FORTIFY_SOURCE and optimizations are passed through
   CFLAGS

 - Packages like linux-tools ignore CFLAGS entirely and some
   autotools toolchain testing cases dependent on not using
   CFLAGS.

 - If FORTIFY_SOURCE is passed through the wrapper, then linux-tools
   will no longer be able to ignore it, because it's enforced at a
   lower-level and since the optimization -Os/g/1/2/3 are via CFLAGS,
   there is no optimization flag set.  Therefore linux-tools will do
   all its configuration tests with FORTIFY_SOURCE forcefully enabled
   at the wrapper level, but no optimization enabled, and consequently
   tests will fail.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc0eecf1d5..44761b79c5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -143,6 +143,15 @@ endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+# By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.
+# Therefore, we need to pass _FORTIFY_SOURCE and the optimization level
+# through the same mechanism, i.e currently through CFLAGS. Passing
+# _FORTIFY_SOURCE through the wrapper and the optimization level
+# through CFLAGS would not work, because CFLAGS are sometimes
+# ignored/overridden by packages, but the flags passed by the wrapper
+# are enforced: this would cause _FORTIFY_SOURCE to be used without any
+# optimization level, leading to a build / configure failure. So we keep
+# passing _FORTIFY_SOURCE and the optimization level both through CFLAGS.
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
