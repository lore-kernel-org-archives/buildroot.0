From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Fri, 10 Jan 2014 17:50:20 -0200
Subject: [Buildroot] [PATCH 1/3] wiringpi: new package
Message-ID: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wiringpi has a really poor build system wrt cross-compiling and has no
official release. These are the patches needed to cross-compile it in
its latest revision.

This patch set was made hoping it would be merged by upstream. Therefore
it's conservative on the changes. However the feedback was that
"cross-compiling is wrong and you should fork it if you want to do so".

I don't really want to fork it, but I think it's doable to maintain a
patch set like this in buildroot.

Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
---
 package/Config.in                                  |   1 +
 package/wiringpi/0001-Do-not-call-ldconfig.patch   |  84 +++++++++
 package/wiringpi/0002-Fix-typo-in-makefiles.patch  | 187 +++++++++++++++++++++
 ...verride-build-variables-from-command-line.patch |  94 +++++++++++
 package/wiringpi/0004-Add-gitignore-file.patch     |  23 +++
 ...er-includes-from-source-instead-of-system.patch |  41 +++++
 .../0006-Use-relative-links-on-install-rules.patch |  41 +++++
 .../0007-Link-gpio-binary-to-local-libraries.patch |  59 +++++++
 .../0008-Do-not-try-to-change-gpio-ownership.patch |  27 +++
 package/wiringpi/0008-tmp.patch                    |  25 +++
 package/wiringpi/Config.in                         |  17 ++
 package/wiringpi/wiringpi.mk                       |  28 +++
 12 files changed, 627 insertions(+)
 create mode 100644 package/wiringpi/0001-Do-not-call-ldconfig.patch
 create mode 100644 package/wiringpi/0002-Fix-typo-in-makefiles.patch
 create mode 100644 package/wiringpi/0003-Do-not-override-build-variables-from-command-line.patch
 create mode 100644 package/wiringpi/0004-Add-gitignore-file.patch
 create mode 100644 package/wiringpi/0005-Prefer-includes-from-source-instead-of-system.patch
 create mode 100644 package/wiringpi/0006-Use-relative-links-on-install-rules.patch
 create mode 100644 package/wiringpi/0007-Link-gpio-binary-to-local-libraries.patch
 create mode 100644 package/wiringpi/0008-Do-not-try-to-change-gpio-ownership.patch
 create mode 100644 package/wiringpi/0008-tmp.patch
 create mode 100644 package/wiringpi/Config.in
 create mode 100644 package/wiringpi/wiringpi.mk

diff --git a/package/Config.in b/package/Config.in
index 38db5de..748ddbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -581,6 +581,7 @@ source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
 source "package/tslib/Config.in"
 source "package/urg/Config.in"
+source "package/wiringpi/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/wiringpi/0001-Do-not-call-ldconfig.patch b/package/wiringpi/0001-Do-not-call-ldconfig.patch
new file mode 100644
index 0000000..5455b5e8
--- /dev/null
+++ b/package/wiringpi/0001-Do-not-call-ldconfig.patch
@@ -0,0 +1,84 @@
+From 7835204d98b973ac9f489ba14e6dea7547791254 Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Sat, 28 Dec 2013 18:26:09 -0200
+Subject: [PATCH 1/8] Do not call ldconfig
+
+This is wrong to do when cross-compiling and better done in the build
+script for easy of use.
+---
+ build             | 3 +++
+ devLib/Makefile   | 2 --
+ wiringPi/Makefile | 2 --
+ 3 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/build b/build
+index e17cf18..04e1615 100755
+--- a/build
++++ b/build
+@@ -39,6 +39,7 @@ if [ x$1 = "xuninstall" ]; then
+   echo -n "DevLib:   " ; sudo make uninstall
+   cd ../gpio
+   echo -n "gpio:     " ; sudo make uninstall
++  sudo ldconfig
+   exit
+ fi
+ 
+@@ -59,6 +60,7 @@ fi
+     make
+     check_make_ok
+     sudo make install
++    sudo ldconfig
+   fi
+   check_make_ok
+ 
+@@ -74,6 +76,7 @@ fi
+     make
+     check_make_ok
+     sudo make install
++    sudo ldconfig
+   fi
+   check_make_ok
+ 
+diff --git a/devLib/Makefile b/devLib/Makefile
+index a3c0d42..e81246f 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -95,7 +95,6 @@ install:	$(DYNAMIC) install-headers
+ 	@install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
+ 	@ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)	$(DESTDIR)/lib/libwiringPiDev.so
+-	@ldconfig
+ 
+ .PHONEY:	install-static
+ install-static:	$(STATIC) install-headers
+@@ -115,7 +114,6 @@ uninstall:
+ 	@rm -f $(DESTDIR)$(PREFIX)/include/lcd.h
+ 	@rm -f $(DESTDIR)$(PREFIX)/include/piGlow.h
+ 	@rm -f $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.*
+-	@ldconfig
+ 
+ 
+ .PHONEY:	depend
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index 619a3dc..5351594 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -122,7 +122,6 @@ install:	$(DYNAMIC) install-headers
+ 	@install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
+ 	@ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)	$(DESTDIR)/lib/libwiringPi.so
+-	@ldconfig
+ 
+ .PHONEY:	install-static
+ install-static:	$(STATIC) install-headers
+@@ -157,7 +156,6 @@ uninstall:
+ 	@rm -f $(DESTDIR)$(PREFIX)/include/pcf8591.h
+ 	@rm -f $(DESTDIR)$(PREFIX)/include/sn3218.h
+ 	@rm -f $(DESTDIR)$(PREFIX)/lib/libwiringPi.*
+-	@ldconfig
+ 
+ 
+ .PHONEY:	depend
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0002-Fix-typo-in-makefiles.patch b/package/wiringpi/0002-Fix-typo-in-makefiles.patch
new file mode 100644
index 0000000..3145aa5
--- /dev/null
+++ b/package/wiringpi/0002-Fix-typo-in-makefiles.patch
@@ -0,0 +1,187 @@
+From d87fbc10e372139736029009f0574e228776f205 Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Sat, 28 Dec 2013 18:26:13 -0200
+Subject: [PATCH 2/8] Fix typo in makefiles
+
+It's PHONY, not PHONEY.
+---
+ devLib/Makefile   | 14 +++++++-------
+ gpio/Makefile     | 10 +++++-----
+ pins/Makefile     |  2 +-
+ wiringPi/Makefile | 14 +++++++-------
+ 4 files changed, 20 insertions(+), 20 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index e81246f..2481150 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -65,18 +65,18 @@ $(DYNAMIC):	$(OBJ)
+ 	@echo [Compile] $<
+ 	@$(CC) -c $(CFLAGS) $< -o $@
+ 
+-.PHONEY:	clean
++.PHONY:	clean
+ clean:
+ 	@echo "[Clean]"
+ 	@rm -f $(OBJ) $(OBJ_I2C) *~ core tags Makefile.bak libwiringPiDev.*
+ 
+-.PHONEY:	tags
++.PHONY:	tags
+ tags:	$(SRC)
+ 	@echo [ctags]
+ 	@ctags $(SRC)
+ 
+ 
+-.PHONEY:	install-headers
++.PHONY:	install-headers
+ install-headers:
+ 	@echo "[Install Headers]"
+ 	@install -m 0755 -d			$(DESTDIR)$(PREFIX)/include
+@@ -89,20 +89,20 @@ install-headers:
+ 	@install -m 0644 lcd.h			$(DESTDIR)$(PREFIX)/include
+ 	@install -m 0644 piGlow.h		$(DESTDIR)$(PREFIX)/include
+ 
+-.PHONEY:	install
++.PHONY:	install
+ install:	$(DYNAMIC) install-headers
+ 	@echo "[Install Dynamic Lib]"
+ 	@install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
+ 	@ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)	$(DESTDIR)/lib/libwiringPiDev.so
+ 
+-.PHONEY:	install-static
++.PHONY:	install-static
+ install-static:	$(STATIC) install-headers
+ 	@echo "[Install Static Lib]"
+ 	@install -m 0755 -d			$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPiDev.a	$(DESTDIR)$(PREFIX)/lib
+ 
+-.PHONEY:	uninstall
++.PHONY:	uninstall
+ uninstall:
+ 	@echo "[UnInstall]"
+ 	@rm -f $(DESTDIR)$(PREFIX)/include/ds1302.h
+@@ -116,7 +116,7 @@ uninstall:
+ 	@rm -f $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.*
+ 
+ 
+-.PHONEY:	depend
++.PHONY:	depend
+ depend:
+ 	makedepend -Y $(SRC)
+ 
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 8fa12d5..de57e0a 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -52,17 +52,17 @@ gpio:	$(OBJ)
+ 	@echo [Compile] $<
+ 	@$(CC) -c $(CFLAGS) $< -o $@
+ 
+-.PHONEY:	clean
++.PHONY:	clean
+ clean:
+ 	@echo "[Clean]"
+ 	@rm -f $(OBJ) gpio *~ core tags *.bak
+ 
+-.PHONEY:	tags
++.PHONY:	tags
+ tags:	$(SRC)
+ 	@echo [ctags]
+ 	@ctags $(SRC)
+ 
+-.PHONEY:	install
++.PHONY:	install
+ install:
+ 	@echo "[Install]"
+ 	@cp gpio		$(DESTDIR)$(PREFIX)/bin
+@@ -71,13 +71,13 @@ install:
+ 	@mkdir -p		$(DESTDIR)$(PREFIX)/man/man1
+ 	@cp gpio.1		$(DESTDIR)$(PREFIX)/man/man1
+ 
+-.PHONEY:	uninstall
++.PHONY:	uninstall
+ uninstall:
+ 	@echo "[UnInstall]"
+ 	@rm -f $(DESTDIR)$(PREFIX)/bin/gpio
+ 	@rm -f $(DESTDIR)$(PREFIX)/man/man1/gpio.1
+ 
+-.PHONEY:	depend
++.PHONY:	depend
+ depend:
+ 	makedepend -Y $(SRC)
+ 
+diff --git a/pins/Makefile b/pins/Makefile
+index 5e200c2..fd34ee9 100644
+--- a/pins/Makefile
++++ b/pins/Makefile
+@@ -13,6 +13,6 @@ pdf:	pins.dvi
+ 	@dvipdf pins.dvi
+ 
+ 
+-.PHONEY:	clean
++.PHONY:	clean
+ clean:
+ 	@rm -f *.dvi *.aux *.log *.ps *.toc *.bak *~
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index 5351594..800b94d 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -77,18 +77,18 @@ $(DYNAMIC):	$(OBJ)
+ 	@echo [Compile] $<
+ 	@$(CC) -c $(CFLAGS) $< -o $@
+ 
+-.PHONEY:	clean
++.PHONY:	clean
+ clean:
+ 	@echo "[Clean]"
+ 	@rm -f $(OBJ) $(OBJ_I2C) *~ core tags Makefile.bak libwiringPi.*
+ 
+-.PHONEY:	tags
++.PHONY:	tags
+ tags:	$(SRC)
+ 	@echo [ctags]
+ 	@ctags $(SRC)
+ 
+ 
+-.PHONEY:	install-headers
++.PHONY:	install-headers
+ install-headers:
+ 	@echo "[Install Headers]"
+ 	@install -m 0755 -d			$(DESTDIR)$(PREFIX)/include
+@@ -116,20 +116,20 @@ install-headers:
+ 	@install -m 0644 pcf8591.h		$(DESTDIR)$(PREFIX)/include
+ 	@install -m 0644 sn3218.h		$(DESTDIR)$(PREFIX)/include
+ 
+-.PHONEY:	install
++.PHONY:	install
+ install:	$(DYNAMIC) install-headers
+ 	@echo "[Install Dynamic Lib]"
+ 	@install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
+ 	@ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)	$(DESTDIR)/lib/libwiringPi.so
+ 
+-.PHONEY:	install-static
++.PHONY:	install-static
+ install-static:	$(STATIC) install-headers
+ 	@echo "[Install Static Lib]"
+ 	@install -m 0755 -d			$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPi.a		$(DESTDIR)$(PREFIX)/lib
+ 
+-.PHONEY:	uninstall
++.PHONY:	uninstall
+ uninstall:
+ 	@echo "[UnInstall]"
+ 	@rm -f $(DESTDIR)$(PREFIX)/include/wiringPi.h
+@@ -158,7 +158,7 @@ uninstall:
+ 	@rm -f $(DESTDIR)$(PREFIX)/lib/libwiringPi.*
+ 
+ 
+-.PHONEY:	depend
++.PHONY:	depend
+ depend:
+ 	makedepend -Y $(SRC) $(SRC_I2C)
+ 
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0003-Do-not-override-build-variables-from-command-line.patch b/package/wiringpi/0003-Do-not-override-build-variables-from-command-line.patch
new file mode 100644
index 0000000..b2f4dcb
--- /dev/null
+++ b/package/wiringpi/0003-Do-not-override-build-variables-from-command-line.patch
@@ -0,0 +1,94 @@
+From c016993d789ef8082520b16289adc7a50ebfe3ce Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Sat, 28 Dec 2013 18:26:16 -0200
+Subject: [PATCH 3/8] Do not override build variables from command line
+
+Allow to set DEBUG, CC and PREFIX as arguments to make. This allows us
+to easily set another compiler, prefix, flags and so on. It also stops
+setting DESTDIR, since this shouldn't be touched in the makefile, but
+honoured while installing.
+---
+ devLib/Makefile   | 13 ++++++-------
+ gpio/Makefile     |  7 +++----
+ wiringPi/Makefile | 11 +++++------
+ 3 files changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index 2481150..a620b71 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -23,18 +23,17 @@
+ DYN_VERS_MAJ=2
+ DYN_VERS_MIN=0
+ 
+-VERSION=$(DYN_VERS_MAJ).$(DYN_VERS_MIN)
+-DESTDIR=/usr
+-PREFIX=/local
++VERSION  =$(DYN_VERS_MAJ).$(DYN_VERS_MIN)
++PREFIX  ?= /usr/local
+ 
+ STATIC=libwiringPiDev.a
+ DYNAMIC=libwiringPiDev.so.$(VERSION)
+ 
+ #DEBUG	= -g -O0
+-DEBUG	= -O2
+-CC	= gcc
+-INCLUDE	= -I.
+-CFLAGS	= $(DEBUG) -Wformat=2 -Wall $(INCLUDE) -Winline -pipe -fPIC
++DEBUG	?= -O2
++CC	?= gcc
++INCLUDE	 = -I.
++CFLAGS	 = $(DEBUG) -Wformat=2 -Wall $(INCLUDE) -Winline -pipe -fPIC
+ 
+ LIBS    =
+ 
+diff --git a/gpio/Makefile b/gpio/Makefile
+index de57e0a..da629fe 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -23,12 +23,11 @@
+ #    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
+ #################################################################################
+ 
+-DESTDIR=/usr
+-PREFIX=/local
++PREFIX  ?= /usr/local
+ 
+ #DEBUG	= -g -O0
+-DEBUG	= -O2
+-CC	= gcc
++DEBUG	?= -O2
++CC	?= gcc
+ INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
+ CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
+ 
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index 800b94d..f88c9d1 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -24,17 +24,16 @@
+ DYN_VERS_MAJ=2
+ DYN_VERS_MIN=0
+ 
+-VERSION=$(DYN_VERS_MAJ).$(DYN_VERS_MIN)
+-DESTDIR=/usr
+-PREFIX=/local
++VERSION  =$(DYN_VERS_MAJ).$(DYN_VERS_MIN)
++PREFIX  ?= /usr/local
+ 
+ STATIC=libwiringPi.a
+ DYNAMIC=libwiringPi.so.$(VERSION)
+ 
+ #DEBUG	= -g -O0
+-DEBUG	= -O2
+-CC	= gcc
+-INCLUDE	= -I.
++DEBUG	?= -O2
++CC	?= gcc
++INCLUDE  = -I.
+ DEFS	= -D_GNU_SOURCE
+ CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
+ 
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0004-Add-gitignore-file.patch b/package/wiringpi/0004-Add-gitignore-file.patch
new file mode 100644
index 0000000..081d5be
--- /dev/null
+++ b/package/wiringpi/0004-Add-gitignore-file.patch
@@ -0,0 +1,23 @@
+From 5f677acf115e1aa36d32a93164aa669d73c40fbf Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Sat, 28 Dec 2013 18:26:20 -0200
+Subject: [PATCH 4/8] Add gitignore file
+
+---
+ .gitignore | 4 ++++
+ 1 file changed, 4 insertions(+)
+ create mode 100644 .gitignore
+
+diff --git a/.gitignore b/.gitignore
+new file mode 100644
+index 0000000..d20b9b6
+--- /dev/null
++++ b/.gitignore
+@@ -0,0 +1,4 @@
++*.o
++*.so
++*.so.*
++/gpio/gpio
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0005-Prefer-includes-from-source-instead-of-system.patch b/package/wiringpi/0005-Prefer-includes-from-source-instead-of-system.patch
new file mode 100644
index 0000000..11dd47e
--- /dev/null
+++ b/package/wiringpi/0005-Prefer-includes-from-source-instead-of-system.patch
@@ -0,0 +1,41 @@
+From 326cabab71c3b7c71bb7759e2da03f487a74dfba Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Sat, 28 Dec 2013 18:34:37 -0200
+Subject: [PATCH 5/8] Prefer includes from source instead of system
+
+We might not have the headers installed or have an older version. Always
+prefer the includes from the source file.
+---
+ devLib/Makefile | 2 +-
+ gpio/Makefile   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index a620b71..dc7801f 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -32,7 +32,7 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
+ #DEBUG	= -g -O0
+ DEBUG	?= -O2
+ CC	?= gcc
+-INCLUDE	 = -I.
++INCLUDE	 = -I. -I../wiringPi
+ CFLAGS	 = $(DEBUG) -Wformat=2 -Wall $(INCLUDE) -Winline -pipe -fPIC
+ 
+ LIBS    =
+diff --git a/gpio/Makefile b/gpio/Makefile
+index da629fe..7148bf1 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -28,7 +28,7 @@ PREFIX  ?= /usr/local
+ #DEBUG	= -g -O0
+ DEBUG	?= -O2
+ CC	?= gcc
+-INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
++INCLUDE	= -I../wiringPi -I../devLib -I$(DESTDIR)$(PREFIX)/include
+ CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
+ 
+ LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0006-Use-relative-links-on-install-rules.patch b/package/wiringpi/0006-Use-relative-links-on-install-rules.patch
new file mode 100644
index 0000000..5359b07
--- /dev/null
+++ b/package/wiringpi/0006-Use-relative-links-on-install-rules.patch
@@ -0,0 +1,41 @@
+From 741a55e34c9360407e3c7e9b5ff82d1b6135ba3e Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Sat, 28 Dec 2013 18:46:04 -0200
+Subject: [PATCH 6/8] Use relative links on install rules
+
+We need relative links since the place in which we are installing may
+not be the final place due to DESTDIR.
+---
+ devLib/Makefile   | 2 +-
+ wiringPi/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index dc7801f..1a94c0a 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -93,7 +93,7 @@ install:	$(DYNAMIC) install-headers
+ 	@echo "[Install Dynamic Lib]"
+ 	@install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
+-	@ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)	$(DESTDIR)/lib/libwiringPiDev.so
++	@ln -sf libwiringPiDev.so.$(VERSION)	$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so
+ 
+ .PHONY:	install-static
+ install-static:	$(STATIC) install-headers
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index f88c9d1..7679dc2 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -120,7 +120,7 @@ install:	$(DYNAMIC) install-headers
+ 	@echo "[Install Dynamic Lib]"
+ 	@install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	@install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
+-	@ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)	$(DESTDIR)/lib/libwiringPi.so
++	@ln -sf libwiringPi.so.$(VERSION)	$(DESTDIR)$(PREFIX)/lib/libwiringPi.so
+ 
+ .PHONY:	install-static
+ install-static:	$(STATIC) install-headers
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0007-Link-gpio-binary-to-local-libraries.patch b/package/wiringpi/0007-Link-gpio-binary-to-local-libraries.patch
new file mode 100644
index 0000000..fa1c869
--- /dev/null
+++ b/package/wiringpi/0007-Link-gpio-binary-to-local-libraries.patch
@@ -0,0 +1,59 @@
+From 36502d94f2845e97ac8a56fedd5c95f3d3dd6a8c Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Mon, 30 Dec 2013 13:18:36 -0200
+Subject: [PATCH 7/8] Link gpio binary to local libraries
+
+The system libraries might be older or non-existent. Link to the locally
+built libraries instead.
+
+Also do not override LDFLAGS, but rather append to this variable.
+---
+ devLib/Makefile   | 1 +
+ gpio/Makefile     | 4 ++--
+ wiringPi/Makefile | 1 +
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index 1a94c0a..7004ddb 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -59,6 +59,7 @@ $(STATIC):	$(OBJ)
+ $(DYNAMIC):	$(OBJ)
+ 	@echo "[Link (Dynamic)]"
+ 	@$(CC) -shared -Wl,-soname,libwiringPiDev.so -o libwiringPiDev.so.$(VERSION) -lpthread $(OBJ)
++	@ln -sf libwiringPiDev.so.$(VERSION) libwiringPiDev.so
+ 
+ .c.o:
+ 	@echo [Compile] $<
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 7148bf1..8e80762 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -28,10 +28,10 @@ PREFIX  ?= /usr/local
+ #DEBUG	= -g -O0
+ DEBUG	?= -O2
+ CC	?= gcc
+-INCLUDE	= -I../wiringPi -I../devLib -I$(DESTDIR)$(PREFIX)/include
++INCLUDE	= -I../wiringPi -I../devLib
+ CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
+ 
+-LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
++LDFLAGS	+= -L../wiringPi -L../devLib
+ LIBS    = -lwiringPi -lwiringPiDev -lpthread -lm
+ 
+ # May not need to  alter anything below this line
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index 7679dc2..a60cc0e 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -71,6 +71,7 @@ $(STATIC):	$(OBJ)
+ $(DYNAMIC):	$(OBJ)
+ 	@echo "[Link (Dynamic)]"
+ 	@$(CC) -shared -Wl,-soname,libwiringPi.so -o libwiringPi.so.$(VERSION) -lpthread $(OBJ)
++	@ln -sf libwiringPi.so.$(VERSION) libwiringPi.so
+ 
+ .c.o:
+ 	@echo [Compile] $<
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0008-Do-not-try-to-change-gpio-ownership.patch b/package/wiringpi/0008-Do-not-try-to-change-gpio-ownership.patch
new file mode 100644
index 0000000..46ca9c3
--- /dev/null
+++ b/package/wiringpi/0008-Do-not-try-to-change-gpio-ownership.patch
@@ -0,0 +1,27 @@
+From 16baf307dfd1b5c5b4cd58bd52a717125e595c90 Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Mon, 30 Dec 2013 18:27:24 -0200
+Subject: [PATCH 8/8] Do not try to change gpio ownership
+
+---
+ gpio/Makefile | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 8e80762..c21f2b7 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -64,9 +64,7 @@ tags:	$(SRC)
+ .PHONY:	install
+ install:
+ 	@echo "[Install]"
+-	@cp gpio		$(DESTDIR)$(PREFIX)/bin
+-	@chown root.root	$(DESTDIR)$(PREFIX)/bin/gpio
+-	@chmod 4755		$(DESTDIR)$(PREFIX)/bin/gpio
++	@install gpio -m 0755 	$(DESTDIR)$(PREFIX)/bin/gpio
+ 	@mkdir -p		$(DESTDIR)$(PREFIX)/man/man1
+ 	@cp gpio.1		$(DESTDIR)$(PREFIX)/man/man1
+ 
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/0008-tmp.patch b/package/wiringpi/0008-tmp.patch
new file mode 100644
index 0000000..10d4396
--- /dev/null
+++ b/package/wiringpi/0008-tmp.patch
@@ -0,0 +1,25 @@
+From fb72d08215b9f9af0d58951794f314f1ff6de04d Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.de.marchi@gmail.com>
+Date: Mon, 30 Dec 2013 17:08:37 -0200
+Subject: [PATCH 8/8] tmp
+
+---
+ gpio/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 387f28c..55704fa 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -45,7 +45,7 @@ all:		gpio
+ 
+ gpio:	$(OBJ)
+ 	@echo [Link]
+-	@$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
++	$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
+ 	
+ .c.o:
+ 	@echo [Compile] $<
+-- 
+1.8.5.2
+
diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
new file mode 100644
index 0000000..1e7433a
--- /dev/null
+++ b/package/wiringpi/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_WIRINGPI
+	bool "wiringpi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_RPI_USERLAND
+	help
+	  WiringPi is a GPIO access library written in C for the BCM2835
+	  used in the Raspberry Pi.
+
+	  WiringPi includes a command-line utility gpio which can be
+	  used to program and setup the GPIO pins. You can use this to
+	  read and write the pins and even use it to control them from
+	  shell scripts.
+
+	  http://wiringpi.com/
+
+comment "wiringpi needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
new file mode 100644
index 0000000..8e448ea
--- /dev/null
+++ b/package/wiringpi/wiringpi.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# wiringpi
+#
+################################################################################
+
+WIRINGPI_VERSION = f18c8f7204d6354220fd6754578b3daa43734e1b
+WIRINGPI_SITE = git://git.drogon.net/wiringPi
+
+WIRINGPI_LICENSE = LGPLv3
+WIRINGPI_LICENSE_FILES = COPYING.LESSER
+
+PREFIX = /usr
+
+define WIRINGPI_BUILD_CMDS
+	env
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) $(MAKE) -C $(@D)/wiringPi
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) $(MAKE) -C $(@D)/devLib
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/gpio
+endef
+
+define WIRINGPI_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/wiringPi install
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/devLib install
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/gpio install
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.2
