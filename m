From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:35:38 +0100
Subject: [Buildroot] [git commit] support/kconfig: ppply upstream nconfig
 ncurses/ncursesw fix
Message-ID: <20180115203626.92E6D81304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8aa4ee2b02abe2a04b15ee3ef53887ade9a4afc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot's "make nconfig" command stopped working a while ago on
Gentoo systems. Running the command would result in a crash.

The issue is caused by lxdialog's cflags which are also used to build
nconfig; It would detect *ncursesw* and turn on WIDECHAR support --
but the Makefile would still link to plain *ncurses* while building
nconfig (which was built without WIDECHAR support).

This would cause a crash after using *wattrset* on a WINDOW instance.
WIDECHAR *wattrset* would try to set the _color member in the WINDOW
struct which does not exist in the NON-WIDECHAR ncurses instance. It
would end up clobbering data outside the struct (usually _line entries).

An upstream patch fixes the issue, so we're applying it to Buildroot's
kconfig.

Signed-off-by: Guillermo A. Amaral <g@maral.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/Makefile                           |  3 +-
 ...onfig-nconfig-fix-multi-byte-UTF-handling.patch | 45 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/Makefile b/support/kconfig/Makefile
index 7eb4071..af62023 100644
--- a/support/kconfig/Makefile
+++ b/support/kconfig/Makefile
@@ -220,7 +220,8 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
 HOSTLOADLIBES_nconf	= $(shell \
-				pkg-config --libs menu panel ncurses 2>/dev/null \
+				pkg-config --libs menuw panelw ncursesw 2>/dev/null \
+				|| pkg-config --libs menu panel ncurses 2>/dev/null \
 				|| echo "-lmenu -lpanel -lncurses"  )
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
diff --git a/support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch b/support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
new file mode 100644
index 0000000..3ca48d0
--- /dev/null
+++ b/support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
@@ -0,0 +1,45 @@
+From 7285996aa0006d671bb01f0d35991d254b2b2b01 Mon Sep 17 00:00:00 2001
+From: Brian Norris <computersforpeace@gmail.com>
+Date: Wed, 4 Jun 2014 00:52:31 -0700
+Subject: kconfig: nconfig: fix multi-byte UTF handling
+
+Currently, Kconfig descriptions that use multi-byte UTF-8 characters
+(such as MTD_NAND_CAFE) will have their menu entries dropped from the
+'make nconfig' ncurses menu, and all subsequent entries in the same
+window will be omitted. This seems to be due to the ncurses 'menu'
+library, which does not traditionally handle UTF-8 >8-bit characters
+properly.
+
+The ncursesw library ('w' is for "wide") is written to handle these
+UTF-8 characters, and is practically a drop-in replacement at the source
+level. Use it by default, if available.
+
+Link: https://bugzilla.kernel.org/show_bug.cgi?id=43067
+Signed-off-by: Brian Norris <computersforpeace@gmail.com>
+Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Martin Walch <walch.martin@web.de>
+Acked-by: Sam Ravnborg <sam@ravnborg.org>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+---
+ scripts/kconfig/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+(limited to 'scripts/kconfig/Makefile')
+
+diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
+index e7bf38e..c059385 100644
+--- a/scripts/kconfig/Makefile
++++ b/scripts/kconfig/Makefile
+@@ -191,7 +191,8 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
+ HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
+ 
+ HOSTLOADLIBES_nconf	= $(shell \
+-				pkg-config --libs menu panel ncurses 2>/dev/null \
++				pkg-config --libs menuw panelw ncursesw 2>/dev/null \
++				|| pkg-config --libs menu panel ncurses 2>/dev/null \
+ 				|| echo "-lmenu -lpanel -lncurses"  )
+ $(obj)/qconf.o: $(obj)/.tmp_qtcheck
+ 
+-- 
+cgit v1.1
+
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index e25375e..1a53ba9 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -7,3 +7,4 @@
 15-fix-qconf-moc-rule.patch
 16-fix-space-to-de-select-options.patch
 17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
+18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
