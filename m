From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 16 Feb 2013 18:02:47 +0100
Subject: [Buildroot] [PATCH] neard: fix build with kernel headers 3.1 - 3.6
Message-ID: <1361034167-10068-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

neard uses the linux/nfc.h header which is fairly recent, so we have a
patch that creates linux-nfc.h and uses it if necessary. However, since
the bump to 0.9, neard uses some symbols that are introduced in linux 3.7
so the build fails with headers 3.1 (which introduced nfc.h) to 3.6.

To resolve that, add a check for one of the newly introduced symbols
(that is used by neard).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Probably wanted for 2013.02.

I selected the symbol to check for with 'git log -p v3.7 include/linux/nfc.h'
in the kernel.
---
 package/neard/neard-fix-missing-linux-nfc-header.patch |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/neard/neard-fix-missing-linux-nfc-header.patch b/package/neard/neard-fix-missing-linux-nfc-header.patch
index b04c5da..cb9a701 100644
--- a/package/neard/neard-fix-missing-linux-nfc-header.patch
+++ b/package/neard/neard-fix-missing-linux-nfc-header.patch
@@ -8,17 +8,23 @@ As a workaround until all reasonable toolchains get this header
 included, add a configure check in neard to test whether this header
 is available or not, and if not, use our own private copy of it.
 
+Since symbols from the v3.7 kernel header are used, but linux/nfc.h
+already exists since the v3.1 kernel, check for one of the most
+recently added symbols: NFC_LLCP_RAW_HEADER_SIZE.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 
 Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -88,6 +88,8 @@
+@@ -88,6 +88,9 @@
  AC_SUBST(NETLINK_CFLAGS)
  AC_SUBST(NETLINK_LIBS)
  
-+AC_CHECK_HEADER(linux/nfc.h, [AC_DEFINE(HAVE_LINUX_NFC_H, 1, [Defines if linux/nfc.h header is available])], [], [#include <sys/socket.h>])
++AC_TRY_COMPILE([#include <linux/nfc.h>], [int err[[NFC_LLCP_RAW_HEADER_SIZE-2]];],
++	[AC_DEFINE(HAVE_LINUX_NFC_H, 1, [Defines if linux/nfc.h header is available])], [])
 +
  AC_ARG_ENABLE(test, AC_HELP_STRING([--enable-test],
  					[enable test/example scripts]),
-- 
1.7.10.4
