From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 23:10:59 +0100
Subject: [Buildroot] [git commit] neard: fix build with kernel headers 3.1 -
	3.6
Message-ID: <20130217221227.296119AB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcb88a5500f7ce6fd877370b797009bb78e8f014
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

neard uses the linux/nfc.h header which is fairly recent, so we have a
patch that creates linux-nfc.h and uses it if necessary. However, since
the bump to 0.9, neard uses some symbols that are introduced in linux 3.7
so the build fails with headers 3.1 (which introduced nfc.h) to 3.6.

To resolve that, add a check for one of the newly introduced symbols
(that is used by neard).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../neard/neard-fix-missing-linux-nfc-header.patch |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/neard/neard-fix-missing-linux-nfc-header.patch b/package/neard/neard-fix-missing-linux-nfc-header.patch
index b04c5da..377269e 100644
--- a/package/neard/neard-fix-missing-linux-nfc-header.patch
+++ b/package/neard/neard-fix-missing-linux-nfc-header.patch
@@ -8,17 +8,26 @@ As a workaround until all reasonable toolchains get this header
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
+@@ -88,6 +88,12 @@
  AC_SUBST(NETLINK_CFLAGS)
  AC_SUBST(NETLINK_LIBS)
  
-+AC_CHECK_HEADER(linux/nfc.h, [AC_DEFINE(HAVE_LINUX_NFC_H, 1, [Defines if linux/nfc.h header is available])], [], [#include <sys/socket.h>])
++AC_TRY_COMPILE([
++#include <sys/socket.h>
++#include <linux/nfc.h>
++	], [int err[NFC_LLCP_RAW_HEADER_SIZE-2];],
++	[AC_DEFINE(HAVE_LINUX_NFC_H, 1, [Defines if linux/nfc.h header is available])], [])
 +
  AC_ARG_ENABLE(test, AC_HELP_STRING([--enable-test],
  					[enable test/example scripts]),
