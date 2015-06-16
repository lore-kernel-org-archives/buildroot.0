From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 16 Jun 2015 16:06:25 +0200
Subject: [Buildroot] [PATCH] lftp: bump version to 4.6.2
Message-ID: <1434463585-65095-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-Remove-unused-libraries-path.patch has now been applied upstream,
so remove it from Buildroot.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 .../lftp/0001-Remove-unused-libraries-path.patch   | 46 ----------------------
 package/lftp/lftp.hash                             |  2 +-
 package/lftp/lftp.mk                               |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/lftp/0001-Remove-unused-libraries-path.patch

diff --git a/package/lftp/0001-Remove-unused-libraries-path.patch b/package/lftp/0001-Remove-unused-libraries-path.patch
deleted file mode 100644
index 3521ec8..0000000
--- a/package/lftp/0001-Remove-unused-libraries-path.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 30e575f18416d67732be1e0350ee727b72b2d225 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 27 Dec 2014 20:56:56 +0100
-Subject: [PATCH] Remove unused libraries path
-
-When building proto modules the path to library files is
-specified with -L$(DESTDIR)$(pkgverlibdir) which point to
-directory that doesn't exist.
-
-Also, when cross-compiling and $(DESTDIR) is empty,
-$(pkgverlibdir) contains a path to the host libraries
-(/usr/lib/lftp/4.5.5) which is considered unsafe.
-
-Anyway, those -L are not needed: by the time where
-proto modules gets built/linked, no libraries are
-installed in this location.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/Makefile.am | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index d715d0a..0e221cf 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -59,11 +59,11 @@ liblftp_pty_la_LDFLAGS     = -avoid-version -rpath $(pkgverlibdir)
- liblftp_network_la_LDFLAGS = -avoid-version -rpath $(pkgverlibdir) $(OPENSSL_LDFLAGS)
- liblftp_network_la_LIBADD  = $(SOCKSLIBS) $(OPENSSL_LIBS) $(LIBGNUTLS_LIBS) $(GNULIB)
- 
--proto_ftp_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
--proto_http_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la $(EXPAT_LIBS) $(ZLIB)
--proto_fish_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
--proto_sftp_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
--cmd_torrent_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
-+proto_ftp_la_LIBADD  = liblftp-network.la
-+proto_http_la_LIBADD = liblftp-network.la $(EXPAT_LIBS) $(ZLIB)
-+proto_fish_la_LIBADD = liblftp-network.la liblftp-pty.la
-+proto_sftp_la_LIBADD = liblftp-network.la liblftp-pty.la
-+cmd_torrent_la_LIBADD  = liblftp-network.la
- 
- liblftp_tasks_la_SOURCES = PollVec.cc PollVec.h SMTask.cc SMTask.h ProcWait.cc\
-  ProcWait.h GetPass.cc GetPass.h ConnectionSlot.cc ConnectionSlot.h\
--- 
-1.9.3
-
diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 328d545..a832087 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d1eea1ed98d05e050b909d5a90e8c7f345c84781b91af36d944fb2f33eba35bf  lftp-4.6.1.tar.xz
+sha256  1e61d5c94b06c333309185e86cfce0729e45e3f69f7496c58d61093b135c8bb9  lftp-4.6.2.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 7494ea2..54b1c6c 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.6.1
+LFTP_VERSION = 4.6.2
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
-- 
2.1.4
