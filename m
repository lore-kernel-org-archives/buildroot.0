From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:20:28 +0200
Subject: [Buildroot] [git commit] pdmenu: new package
Message-ID: <20170902130620.DB4948016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d0c1213a0b51804964fceb909d2cd055cb92add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brock Williams <brock@cottonwoodcomputer.com>
[Thomas:
 - properly handle the NLS cases, by adding two patches
 - use sha256 locally calculated hash for the tarball, add hash for
   the license file
 - fix the license information: it's GPL-2.0 licensed, and the license
   file is doc/COPYING.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...-makeinfo.in-link-with-INTLLIBS-if-needed.patch | 27 ++++++++
 ...toconf-makeinfo.in-support-build-install-.patch | 76 ++++++++++++++++++++++
 package/pdmenu/Config.in                           | 15 +++++
 package/pdmenu/pdmenu.hash                         |  5 ++
 package/pdmenu/pdmenu.mk                           | 15 +++++
 7 files changed, 142 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad52fb7..5cfcc36 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -327,6 +327,9 @@ N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
 
+N:	Brock Williams <brock@cottonwoodcomputer.com>
+F:	package/pdmenu/
+
 N:	Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
 F:	package/pps-tools/
 
diff --git a/package/Config.in b/package/Config.in
index d4db8c2..7ac29fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1838,6 +1838,7 @@ comment "Utilities"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
 	source "package/logsurfer/Config.in"
+	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/ranger/Config.in"
 	source "package/screen/Config.in"
diff --git a/package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch b/package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch
new file mode 100644
index 0000000..78f3e57
--- /dev/null
+++ b/package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch
@@ -0,0 +1,27 @@
+From 319cc3859044214961164ed1f219f2f21ca965af Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 30 Aug 2017 23:04:37 +0200
+Subject: [PATCH] autoconf/makeinfo.in: link with INTLLIBS if needed
+
+gettext may be provided by external libraries, as specified in
+INTLLIBS, so we must include @INTLLIBS@ in the LIBS variable.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ autoconf/makeinfo.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autoconf/makeinfo.in b/autoconf/makeinfo.in
+index ee3054a..6d58d77 100644
+--- a/autoconf/makeinfo.in
++++ b/autoconf/makeinfo.in
+@@ -13,5 +13,5 @@ DEFINES		= -DETCDIR=\"${SYSCONFDIR}/\" -DVER=\"${VER}\" @DEFS@ \
+ 		  $(PROFILE) -D__USE_FIXED_PROTOTYPES__ -D_GNU_SOURCE \
+ 		  -DLOCALEDIR=\"@datadir@/locale\"
+ CFLAGS		= $(DEFINES) @gcc_cflags@ @CFLAGS@
+-LIBS		= @LIBS@ $(EFENCE)
++LIBS		= @LIBS@ @INTLLIBS@ $(EFENCE)
+ INSTALL_PROGRAM	= ${INSTALL}
+-- 
+2.13.5
+
diff --git a/package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch b/package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch
new file mode 100644
index 0000000..1a22aa6
--- /dev/null
+++ b/package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch
@@ -0,0 +1,76 @@
+From 5368bd0cfd0640f5c0ca766d4fda1b3f71c1b013 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 30 Aug 2017 23:07:26 +0200
+Subject: [PATCH] Makefile, autoconf/makeinfo.in: support build/install without
+ gettext
+
+The gettext tool msgfmt may not be available to build the .mo files
+from the .po files, so we handle this case by disabling the
+build/installation of .po files in such a case.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile             | 17 ++++++++++++++---
+ autoconf/makeinfo.in |  1 +
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a708046..3e83ca3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,11 +7,18 @@ OBJFILES	:= $(SRCFILES:%.c=%.o)
+ LANGS		= fr ru es
+ MOS		:= $(addprefix po/, $(addsuffix .mo, $(LANGS)))
+ LOCALEDIR	= $(INSTALL_PREFIX)/usr/share/locale
+-
+-all: pdmenu $(POTFILE) $(MOS)
++TARGETS		= pdmenu
++INSTALL_TARGETS	= install-pdmenu
+ 
+ include makeinfo
+ 
++ifneq ($(MSGFMT),)
++TARGETS += $(POTFILE) $(MOS)
++INSTALL_TARGETS += install-pos
++endif
++
++all: $(TARGETS)
++
+ pdmenu: .dep $(OBJFILES)
+ 	${CC} -o pdmenu $(OBJFILES) $(CFLAGS) $(LIBS)
+ 
+@@ -40,7 +47,9 @@ clean:
+ 	$(MAKE) $(POTFILE) # make sure translators' input is ready
+ 	rm -f $(OBJFILES) pdmenu $(MOS)
+ 
+-install: all
++install: $(INSTALL_TARGETS)
++
++install-pdmenu:
+ 	$(INSTALL) -d $(INSTALL_PREFIX)/$(BINDIR) \
+ 		$(INSTALL_PREFIX)/$(MANDIR)/man1 \
+ 		$(INSTALL_PREFIX)/$(MANDIR)/man5 \
+@@ -56,6 +65,8 @@ install: all
+ 	$(INSTALL) examples/pdmenurc $(INSTALL_PREFIX)/$(SYSCONFDIR)/pdmenurc -m 0644
+ 	$(INSTALL) examples/showdir.pl $(INSTALL_PREFIX)/$(DATADIR)/pdmenu
+ 	cd $(INSTALL_PREFIX)/$(DATADIR)/pdmenu && $(LN_S) -f showdir.pl editdir.pl
++
++install-pos:
+ 	for lang in $(LANGS); do \
+ 		[ ! -d $(LOCALEDIR)/$$lang/LC_MESSAGES/ ] && mkdir -p $(LOCALEDIR)/$$lang/LC_MESSAGES/; \
+ 		install -m 644 po/$$lang.mo $(LOCALEDIR)/$$lang/LC_MESSAGES/pdmenu.mo; \
+diff --git a/autoconf/makeinfo.in b/autoconf/makeinfo.in
+index 6d58d77..069daf8 100644
+--- a/autoconf/makeinfo.in
++++ b/autoconf/makeinfo.in
+@@ -8,6 +8,7 @@ DATADIR		= @datadir@
+ CC		= @CC@
+ INSTALL		= @INSTALL@
+ LN_S		= @LN_S@
++MSGFMT		= @MSGFMT@
+ VER		= @VER@
+ DEFINES		= -DETCDIR=\"${SYSCONFDIR}/\" -DVER=\"${VER}\" @DEFS@ \
+ 		  $(PROFILE) -D__USE_FIXED_PROTOTYPES__ -D_GNU_SOURCE \
+-- 
+2.13.5
+
diff --git a/package/pdmenu/Config.in b/package/pdmenu/Config.in
new file mode 100644
index 0000000..8f35f61
--- /dev/null
+++ b/package/pdmenu/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PDMENU
+	bool "pdmenu"
+	depends on BR2_USE_MMU # slang
+	select BR2_PACKAGE_SLANG
+	help
+	  Pdmenu is a full screen menuing system for Unix. It is
+	  designed to be easy to use, and is suitable as a login shell
+	  for inexperienced users, or it can just be ran at the
+	  command line as a handy menu.
+
+	  Pdmenu features color support and GPM mouse support at the
+	  Linux console. It was developed on Linux, and has now been
+	  compiled on many other unixes without problems.
+
+	  https://joeyh.name/code/pdmenu/
diff --git a/package/pdmenu/pdmenu.hash b/package/pdmenu/pdmenu.hash
new file mode 100644
index 0000000..ab3a666
--- /dev/null
+++ b/package/pdmenu/pdmenu.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 302aa81b8868133ff5a0f3e3e897f71d425bc628c0d7439addb623f12c277bea pdmenu_1.3.4.tar.gz
+
+# License file hash, locally calculated
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 doc/COPYING
diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
new file mode 100644
index 0000000..7835095
--- /dev/null
+++ b/package/pdmenu/pdmenu.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# pdmenu
+#
+################################################################################
+
+PDMENU_VERSION = 1.3.4
+PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
+PDMENU_SITE = http://snapshot.debian.org/archive/debian/20170828T160058Z/pool/main/p/pdmenu
+PDMENU_LICENSE = GPL-2.0
+PDMENU_LICENSE_FILES = doc/COPYING
+PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
+PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
+
+$(eval $(autotools-package))
