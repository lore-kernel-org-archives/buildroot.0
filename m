From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Aug 2016 16:00:01 +0200
Subject: [Buildroot] [PATCH] package/ustr: don't run ldconfig (and certainly
	not concurrently)
Message-ID: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ustr Makefile.in (as introduced by the Debian patch we apply), is
probably not parallel-safe:

  402 install: install-opt install-dbg
  403
  404 install-opt: install-dirs install-opt-lib install-common
  405
  406 install-dbg: install-dirs install-dbg-lib install-common
  407
  408 install-opt-lib install-dbg-lib install-common: install-dirs
  [--SNIP--]
  424 install-opt-lib: $(OPT_LIB_STATIC) $(OPT_LIB_SHARED) ustr.pc
  425         @echo Installing files
  426         install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
  427         install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
  428         -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
  429         ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
  430         -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
  431         ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
  432         -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
  433         ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
  434         $(LDCONFIG) -n $(DESTDIR)$(libdir)
  435         install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
  436
  437 install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
  438         @echo Installing files
  439         install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
  440         install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
  441         -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
  442         ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
  443         -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
  444         ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
  445         -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
  446         ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
  447         $(LDCONFIG) -n $(DESTDIR)$(libdir)
  448         install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc

As Thomas already noticed [0], the two interesting rules above are not
dependent one on the other, so can be run in parallel. So, while one is
doing its rm'n'ln dance, the other can be running an ldconfig, which has
the side effect of creating the missing symlinks. So, we can see this
sequence:

    install-opt-lib:                        install-dbg-lib:
                                                ldconfig
        rm -f .../$(OPT_LIB_SHAREDEV)            \
                                                  `-> symlink(..., .../$(OPT_LIB_SHAREDEV))
        ln -s .../$(OPT_LIB_SHAREDEV)

In this case, ldconfig uses the opportunity-window between the rm and
the ln to create the link; so the ln does not work, as the target
already exist.

We fix that in three ways:

  - first, no need to run ldconfig at all in Buildroot, we just pass
    LDCONFIG=/bin/true ;

  - second, no need to run LDCONFIG more than once, so we patch ustr to
    only run it once, once all libs have been installed;

  - third, we patch ustr to use ln -f to redo the symlink if it already
    exists.

Fixes (hopefully, since I was not even able to reproduce the failure):
    http://autobuild.buildroot.org/?reason=ustr-1.0.4
    http://autobuild.buildroot.org/results/936/93626f55625ed7900c147bfd79ff7802366639b1/
    http://autobuild.buildroot.org/results/18b/18b6ec537da9e9055f58a8649c0719dc64df1bcf/
    [...]

[0] http://lists.busybox.net/pipermail/buildroot/2016-May/161923.html

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/ustr/0001-run-ldconfig-only-once.patch | 34 ++++++++++++++++++++++
 package/ustr/0002-ln-force.patch               | 39 ++++++++++++++++++++++++++
 package/ustr/ustr.mk                           |  2 ++
 3 files changed, 75 insertions(+)
 create mode 100644 package/ustr/0001-run-ldconfig-only-once.patch
 create mode 100644 package/ustr/0002-ln-force.patch

diff --git a/package/ustr/0001-run-ldconfig-only-once.patch b/package/ustr/0001-run-ldconfig-only-once.patch
new file mode 100644
index 0000000..594f985
--- /dev/null
+++ b/package/ustr/0001-run-ldconfig-only-once.patch
@@ -0,0 +1,34 @@
+Makefile: run ldconfig only once
+
+No need to run ldconfig for each library we install; we can run it once,
+when both libs are installed.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ustr-1.0.4.orig/Makefile.in ustr-1.0.4/Makefile.in
+--- ustr-1.0.4.orig/Makefile.in	2016-08-13 15:24:18.644185100 +0200
++++ ustr-1.0.4/Makefile.in	2016-08-13 15:25:46.437325978 +0200
+@@ -400,6 +400,7 @@
+ 		@echo Done all dbg
+ 
+ install: install-opt install-dbg
++		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 
+ install-opt: install-dirs install-opt-lib install-common
+ 
+@@ -431,7 +432,6 @@
+ 		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+ 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
+ 		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
+-		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
+ 
+ install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
+@@ -444,7 +444,6 @@
+ 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+ 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
+ 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
+-		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
+ 
+ install-common:
diff --git a/package/ustr/0002-ln-force.patch b/package/ustr/0002-ln-force.patch
new file mode 100644
index 0000000..18afe4d
--- /dev/null
+++ b/package/ustr/0002-ln-force.patch
@@ -0,0 +1,39 @@
+Makefile: forcibly create library symlinks
+
+Aboids failures when the symlink already exists (it is re-symlinked).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ustr-1.0.4.orig/Makefile.in ustr-1.0.4/Makefile.in
+--- ustr-1.0.4.orig/Makefile.in	2016-08-13 15:54:40.220043291 +0200
++++ ustr-1.0.4/Makefile.in	2016-08-13 15:55:25.600641886 +0200
+@@ -427,11 +427,11 @@
+ 		install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
+ 		install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
+ 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
+-		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
++		ln -fs $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
+ 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
++		ln -fs $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+ 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
+-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
++		ln -fs $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
+ 
+ install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
+@@ -439,11 +439,11 @@
+ 		install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
+ 		install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
+ 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+-		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
++		ln -fs $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+ 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
++		ln -fs $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+ 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
+-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
++		ln -fs $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
+ 
+ install-common:
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 174f055..1d629ab 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -23,5 +23,7 @@ USTR_INSTALL_STAGING = YES
 # 'all-shared' to the default 'all' rule.
 USTR_MAKE_OPTS = all all-shared
 
+USTR_MAKE_OPTS += LDCONFIG=/bin/true
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.7.4
