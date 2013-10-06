From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:40:25 +0200
Subject: [Buildroot] [git commit] pv: fix build issue with some toolchains
Message-ID: <20131006184800.1B85E9B92C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1980bf056e16c604c1f33ce9771d725da096cfe7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While 'pv' uses autoconf, it does not use automake for its
makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
using 'ld' directly doesn't work well with some toolchain
configuration, as the ld default emulation may not necessarily be the
correct one. By passing custom values for LD and LDFLAGS, we ensure
that 'gcc' is used to do these partial linking steps.

Fixes the following build failures (x86-64 and mips64) :

  http://autobuild.buildroot.org/results/9ac/9aca276a220ad1460e5b32bd042dd4c93649baf3/build-end.log
  http://autobuild.buildroot.org/results/910/91044c01dcc3c4150aa6e74f5964fff27b9dac79/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/pv.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index a8b2651..00502d3 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -9,6 +9,15 @@ PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
 PV_LICENSE_FILES = doc/COPYING
-PV_MAKE_OPT = LD=$(TARGET_LD) # otherwise 'ld' is used
+
+# While 'pv' uses autoconf, it does not use automake for its
+# makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
+# using 'ld' directly doesn't work well with some toolchain
+# configuration, as the ld default emulation may not necessarily be
+# the correct one. By passing the below values for LD and LDFLAGS, we
+# ensure that 'gcc' is used to do these partial linking steps.
+PV_MAKE_OPT = \
+	LD=$(TARGET_CC) \
+	LDFLAGS="-Wl,-r -nostdlib"
 
 $(eval $(autotools-package))
