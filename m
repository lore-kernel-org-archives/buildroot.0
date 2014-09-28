From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:51:07 +0200
Subject: [Buildroot] [git commit] openssl: Add patch to fix compilation with
	musl libc
Message-ID: <20140928205919.BA8949D795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0400322f2d4e28faa98e31815921f54106aeb2e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl-004-musl-termios.patch |   46 ++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl-004-musl-termios.patch b/package/openssl/openssl-004-musl-termios.patch
new file mode 100644
index 0000000..66631d1
--- /dev/null
+++ b/package/openssl/openssl-004-musl-termios.patch
@@ -0,0 +1,46 @@
+http://rt.openssl.org/Ticket/Display.html?id=3123
+
+From:	 Kevin Bortis <pkgs@bortis.ch>
+
+The attached patch fixes issues with musl libc on linux. musl does
+implement the POSIX 2008 standard termios.h on linux and does not
+include the non standard interface termio.h.
+
+The problem with dlinfo does no longer exists, since musl has
+implemented the required interface.
+
+This closes #2823 for me.
+
+Tested version:
+musl libc: 0.9.13
+openssl git: 1769dfab06dcf93a1c310ca7ea9531afcc448d0a
+
+Comparison of termios.h implementation on linux:
+
+glibc 2.17: does implement termios.h, passes make test
+musl 0.9.13: does implement termios.h, passes make test
+uClibc 0.9.33.2: does implement termios.h, not tested
+dietlibc 0.33: does implement termios.h, not tested
+
+I don't know the reason why termio.h is prefered on linux, since
+termios.h is generally prefered and implemented by all major libc
+implementations.
+
+Regards
+Kevin
+
+--- a/crypto/ui/ui_openssl.c	2013-09-08 11:00:10.130572803 +0200
++++ b/crypto/ui/ui_openssl.c	2013-09-08 11:29:35.806580447 +0200
+@@ -190,9 +190,9 @@
+ # undef  SGTTY
+ #endif
+ 
+-#if defined(linux) && !defined(TERMIO)
+-# undef  TERMIOS
+-# define TERMIO
++#if defined(linux)
++# define TERMIOS
++# undef  TERMIO
+ # undef  SGTTY
+ #endif
+ 
