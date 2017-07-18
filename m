From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:58:04 +0200
Subject: [Buildroot] [git commit] httping: fix build without host-gettext
Message-ID: <20170718215402.0887282145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=807721ea9d8238cb6bd203b1d5495fa888a26653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 654de6512554c (httping: use the new gettext logic), host-gettext
is not a dependency of httping. This breaks the build because the httping
Makefile calls msgfmt unconditionally. Add a patch that allows build without
translation files generation.

Fixes:
http://autobuild.buildroot.net/results/73e/73e624775617d1b95da7d4ef666612af5bceef61/
http://autobuild.buildroot.net/results/2bf/2bff43d7b749b4daf32868bddbae94b510949bf8/
http://autobuild.buildroot.net/results/8a6/8a69659afa21f467ca5de7915363cebf0fc7aff2/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0002-Makefile-allow-build-without-gettext.patch | 48 ++++++++++++++++++++++
 package/httping/httping.mk                         |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/package/httping/0002-Makefile-allow-build-without-gettext.patch b/package/httping/0002-Makefile-allow-build-without-gettext.patch
new file mode 100644
index 0000000..aec1de4
--- /dev/null
+++ b/package/httping/0002-Makefile-allow-build-without-gettext.patch
@@ -0,0 +1,48 @@
+From fe7d6c5a0e5dfe129f228498037393d23d6ae890 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 18 Jul 2017 19:09:03 +0300
+Subject: [PATCH] Makefile: allow build without gettext
+
+The msgfmt command is part of the gettext package, and is used to generate
+binary translation files. When gettext is not installed, build fails.
+Translation files are not always needed on size constrained embedded targets.
+Add an option to disable translation files generation using the NO_GETTEXT
+variable.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/flok99/httping/pull/36
+
+ Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 46127f4cdde1..160cc1794ec8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -55,7 +55,9 @@ MKDIR=/bin/mkdir
+ ARCHIVE=/bin/tar cf -
+ COMPRESS=/bin/gzip -9
+ 
++ifneq ($(NO_GETTEXT),yes)
+ TRANSLATIONS=nl.mo ru.mo
++endif
+ 
+ OBJS=gen.o http.o io.o error.o utils.o main.o tcp.o res.o socks5.o kalman.o cookies.o help.o colors.o
+ 
+@@ -118,10 +120,12 @@ install: $(TARGET) $(TRANSLATIONS)
+ ifneq ($(DEBUG),yes)
+ 	$(STRIP) $(DESTDIR)/$(BINDIR)/$(TARGET)
+ endif
++ifneq ($(NO_GETTEXT),yes)
+ 	mkdir -p $(DESTDIR)/$(PREFIX)/share/locale/nl/LC_MESSAGES
+ 	cp nl.mo $(DESTDIR)/$(PREFIX)/share/locale/nl/LC_MESSAGES/httping.mo
+ 	mkdir -p $(DESTDIR)/$(PREFIX)/share/locale/ru/LC_MESSAGES
+ 	cp ru.mo $(DESTDIR)/$(PREFIX)/share/locale/ru/LC_MESSAGES/httping.mo
++endif
+ 
+ 
+ makefile.inc:
+-- 
+2.13.2
+
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 649c643..955ee31 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -22,7 +22,8 @@ HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
 	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
 	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
-	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
+	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
+	NO_GETTEXT=$(if $(BR2_SYSTEM_ENABLE_NLS),no,yes)
 
 define HTTPING_BUILD_CMDS
 	$(HTTPING_MAKE_OPTS) LDFLAGS="$(HTTPING_LDFLAGS)" \
