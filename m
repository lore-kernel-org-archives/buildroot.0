From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 26 Apr 2017 19:48:02 +0200
Subject: [Buildroot] [PATCH] binutils: fix bfin compile error
Message-ID: <20170426174802.GA30776@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer gcc requires even lower optimization, only with -O0 we
can successfully compile binutils for the target.

Fixes:
  http://autobuild.buildroot.net/results/fb95cd7f7fcc532d036ed8f13853bc6f9a64d1b3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/binutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 03fd3a5..72e2d0b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -64,10 +64,10 @@ HOST_BINUTILS_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true install
 
-# gcc bug with Os/O2/O3, PR77311
+# gcc bug with Os/O1/O2/O3, PR77311
 # error: unable to find a register to spill in class 'CCREGS'
 ifeq ($(BR2_bfin),y)
-BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
 endif
 
 # Workaround a build issue with -Os for ARM Cortex-M cpus.
-- 
2.1.4
