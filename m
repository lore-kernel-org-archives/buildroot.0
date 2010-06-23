From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] module-init-tools: bump version
	+ convert to autotools
Message-ID: <20100623092836.238CD81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dcc08e84a5e94e7ffaf52ec4374821e56bb20a34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "remove-index" patch is no longer needed, the newer version of
module-init-tools correctly uses strchr().

The "module-init-tools" patch, whose main purpose was to disable the
generation of man pages (it requires docbook2man), is replaced by a
simpler implementation,
module-init-tools-3.11-add-manpages-config-option.patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nit-tools-3.11-add-manpages-config-option.patch |   47 ++++++++++++
 .../module-init-tools-remove-index.patch           |   12 ---
 package/module-init-tools/module-init-tools.mk     |   80 +++-----------------
 package/module-init-tools/module-init-tools.patch  |   77 -------------------
 4 files changed, 57 insertions(+), 159 deletions(-)
 create mode 100644 package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch
 delete mode 100644 package/module-init-tools/module-init-tools-remove-index.patch
 delete mode 100644 package/module-init-tools/module-init-tools.patch

diff --git a/package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch b/package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch
new file mode 100644
index 0000000..28f51de
--- /dev/null
+++ b/package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch
@@ -0,0 +1,47 @@
+Disable manual pages generation when docbook2man is not available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am  |    7 ++++++-
+ configure.ac |    7 +++----
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+Index: module-init-tools-3.11/Makefile.am
+===================================================================
+--- module-init-tools-3.11.orig/Makefile.am
++++ module-init-tools-3.11/Makefile.am
+@@ -39,7 +39,12 @@
+ MAN5 = modprobe.conf.5 modules.dep.5 depmod.conf.5 modprobe.d.5
+ MAN8 = depmod.8 insmod.8 lsmod.8 rmmod.8 modprobe.8 modinfo.8
+ SGML = $(addprefix doc/,  $(MAN5:%.5=%.sgml) $(MAN8:%.8=%.sgml))
+-dist_man_MANS = $(MAN5) $(MAN8)
++
++if HAVE_DOCBOOKTOMAN
++MANPAGES  = $(MAN5) $(MAN8)
++endif
++dist_man_MANS = $(MANPAGES)
++
+ # If they haven't overridden mandir, fix it (never /man!)
+ mandir =$(shell if [ @mandir@ = $(prefix)/man ]; then if [ $(prefix) = / ]; then echo /usr/share/man; else echo $(prefix)/share/man; fi; else echo @mandir@; fi)
+ 
+Index: module-init-tools-3.11/configure.ac
+===================================================================
+--- module-init-tools-3.11.orig/configure.ac
++++ module-init-tools-3.11/configure.ac
+@@ -29,13 +29,12 @@
+ AC_PROG_CC
+ AC_PROG_RANLIB
+ 
+-AC_CHECK_PROGS(DOCBOOKTOMAN, docbook-to-man docbook2man, [no],)
+-if test x"$DOCBOOKTOMAN" = xno
++AC_CHECK_PROGS(DOCBOOKTOMAN, docbook-to-man docbook2man)
++if test x"$DOCBOOKTOMAN" = x
+ then
+ 	AC_MSG_WARN([docbook2man not found])
+-	# fail with a meaningfull error if $DOCBOOKTOMAN called by the makefile
+-	DOCBOOKTOMAN=docbook2man
+ fi
++AM_CONDITIONAL([HAVE_DOCBOOKTOMAN], [test "x$DOCBOOKTOMAN" != "x"])
+  
+ # Delay adding the zlib_flags until after AC_PROG_CC, so we can distinguish
+ # between a broken cc and a working cc but missing libz.a.
diff --git a/package/module-init-tools/module-init-tools-remove-index.patch b/package/module-init-tools/module-init-tools-remove-index.patch
deleted file mode 100644
index 1a2da28..0000000
--- a/package/module-init-tools/module-init-tools-remove-index.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ur module-init-tools-3.2.2/modprobe.c module-init-tools-3.2.2-patched/modprobe.c
---- module-init-tools-3.2.2/modprobe.c	2005-12-01 17:42:09.000000000 -0600
-+++ module-init-tools-3.2.2-patched/modprobe.c	2006-12-04 19:50:50.353237649 -0600
-@@ -270,7 +270,7 @@
- 	char *modname;
- 
- 	/* Ignore lines without : or which start with a # */
--	ptr = index(line, ':');
-+	ptr = strchr(line, ':');
- 	if (ptr == NULL || line[strspn(line, "\t ")] == '#')
- 		return 0;
- 
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 8adb684..3e8b06b 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -3,77 +3,17 @@
 # module-init-tools
 #
 #############################################################
-MODULE_INIT_TOOLS_VERSION=3.2.2
+MODULE_INIT_TOOLS_VERSION=3.11
 MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
-MODULE_INIT_TOOLS_CAT:=$(BZCAT)
 MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
-MODULE_INIT_TOOLS_DIR=$(BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
-MODULE_INIT_TOOLS_DIR2=$(TOOLCHAIN_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
-MODULE_INIT_TOOLS_BINARY=depmod
-MODULE_INIT_TOOLS_TARGET_BINARY=$(TARGET_DIR)/sbin/$(MODULE_INIT_TOOLS_BINARY)
+MODULE_INIT_TOOLS_CONF_OPT = \
+	--disable-static-utils \
+	--disable-builddir \
+	--program-transform-name=''
 
-STRIPPROG=$(STRIPCMD)
+# module-init-tools-3.11-add-manpages-config-option.patch is modifying
+# configure.ac and Makefile.am
+MODULE_INIT_TOOLS_AUTORECONF=YES
+HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
 
-$(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE):
-	$(call DOWNLOAD,$(MODULE_INIT_TOOLS_SITE),$(MODULE_INIT_TOOLS_SOURCE))
-
-$(MODULE_INIT_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
-	$(MODULE_INIT_TOOLS_CAT) $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR) package/module-init-tools \*.patch
-	$(CONFIG_UPDATE) $(MODULE_INIT_TOOLS_DIR)
-	touch $(MODULE_INIT_TOOLS_DIR)/.unpacked
-
-$(MODULE_INIT_TOOLS_DIR)/.configured: $(MODULE_INIT_TOOLS_DIR)/.unpacked
-	(cd $(MODULE_INIT_TOOLS_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		INSTALL=$(MODULE_INIT_TOOLS_DIR)/install-sh \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--sysconfdir=/etc \
-		--program-transform-name='' \
-	)
-	touch $(MODULE_INIT_TOOLS_DIR)/.configured
-
-$(MODULE_INIT_TOOLS_DIR)/$(MODULE_INIT_TOOLS_BINARY): $(MODULE_INIT_TOOLS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(MODULE_INIT_TOOLS_DIR)
-	touch -c $(MODULE_INIT_TOOLS_DIR)/$(MODULE_INIT_TOOLS_BINARY)
-
-ifeq ($(BR2_PACKAGE_MODUTILS),y)
-$(MODULE_INIT_TOOLS_TARGET_BINARY): \
-	$(MODULE_INIT_TOOLS_DIR)/$(MODULE_INIT_TOOLS_BINARY) \
-	modutils
-else
-$(MODULE_INIT_TOOLS_TARGET_BINARY): \
-	$(MODULE_INIT_TOOLS_DIR)/$(MODULE_INIT_TOOLS_BINARY)
-endif
-ifeq ($(BR2_PACKAGE_MODUTILS),y)
-	$(MAKE) prefix=$(TARGET_DIR) -C $(MODULE_INIT_TOOLS_DIR) moveold
-endif
-	STRIPPROG='$(STRIPPROG)' \
-	$(MAKE) prefix=$(TARGET_DIR) -C $(MODULE_INIT_TOOLS_DIR) install-exec
-	rm -Rf $(TARGET_DIR)/usr/man
-	rm -f $(TARGET_DIR)/sbin/generate-modprobe.conf
-	rm -f $(TARGET_DIR)/sbin/insmod.static
-	touch -c $(MODULE_INIT_TOOLS_TARGET_BINARY)
-
-module-init-tools: $(MODULE_INIT_TOOLS_TARGET_BINARY)
-
-module-init-tools-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(MODULE_INIT_TOOLS_DIR) uninstall
-	-$(MAKE) -C $(MODULE_INIT_TOOLS_DIR) clean
-
-module-init-tools-dirclean:
-	rm -rf $(MODULE_INIT_TOOLS_DIR)
-
-#############################################################
-#
-## Toplevel Makefile options
-#
-##############################################################
-ifeq ($(BR2_PACKAGE_MODULE_INIT_TOOLS),y)
-TARGETS+=module-init-tools
-endif
+$(eval $(call AUTOTARGETS,package,module-init-tools))
diff --git a/package/module-init-tools/module-init-tools.patch b/package/module-init-tools/module-init-tools.patch
deleted file mode 100644
index 456ef10..0000000
--- a/package/module-init-tools/module-init-tools.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-diff -aur module-init-tools-3.1~orig/Makefile.in module-init-tools-3.1~patched/Makefile.in
---- module-init-tools-3.1~orig/Makefile.in	2004-11-15 01:59:48.000000000 +0100
-+++ module-init-tools-3.1~patched/Makefile.in	2005-03-22 22:10:26.843808464 +0100
-@@ -613,7 +613,7 @@
- check-am: all-am
- 	$(MAKE) $(AM_MAKEFLAGS) check-TESTS
- check: check-am
--all-am: Makefile $(PROGRAMS) $(SCRIPTS) $(MANS)
-+all-am: Makefile $(PROGRAMS) $(SCRIPTS) 
- 
- installdirs:
- 	$(mkinstalldirs) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(man5dir) $(DESTDIR)$(man8dir)
-@@ -760,17 +760,10 @@
- 
- release: check clean tarball testsuite
- 
--moveold: check-for-sbin check-for-old move-old-targets
--
--check-for-sbin:
--	if [ "`echo $(DESTDIR)$(sbindir) | tr -s / /`" = /sbin ]; then :;    \
--	else								     \
--		echo moveold usually only makes sense when installing into /sbin; \
--		exit 1;							     \
--	fi
-+moveold: move-old-targets
- 
- check-for-old:
--	if [ -f /sbin/lsmod.old ]; then					\
-+	if [ -f $(sbindir)/lsmod.old ]; then			\
- 		echo Someone already moved old versions. >&2; exit 1;	\
- 	fi
- 
-@@ -778,27 +771,28 @@
- # RedHat 8.0 doesn't ship with readlink by default.  Use ls -l.
- # Also, make symlink from /bin to /sbin for lsmod (FHS compliant).
- move-old-targets:
-+	if [ ! -f $(sbindir)/lsmod.old ]; then \
- 	for f in lsmod modprobe rmmod depmod insmod modinfo; do		    \
--	    if [ -L /sbin/$$f ]; then					    \
--		ln -sf `ls -l /sbin/$$f | sed 's/.* -> //'`.old /sbin/$$f;  \
-+  	  if [ -L $(sbindir)/$$f ]; then			    \
-+		ln -sf `ls -l $(sbindir)/$$f | sed 's/.* -> //'`.old  $(sbindir)/$$f;  \
- 	    fi;								    \
--	    mv /sbin/$$f /sbin/$$f.old;					    \
--	    if [ -f /usr/share/man/man8/$$f.8.gz ]; then		    \
--		mv /usr/share/man/man8/$$f.8.gz				    \
--			/usr/share/man/man8/$$f.old.8.gz;		    \
--	    elif [ -f /usr/share/man/man8/$$f.8.bz2 ]; then		    \
--	        mv /usr/share/man/man8/$$f.8.bz2			    \
--			/usr/share/man/man8/$$f.old.8.bz2;		    \
--	    else							    \
--	        mv /usr/share/man/man8/$$f.8 /usr/share/man/man8/$$f.old.8; \
-+  	  mv  $(sbindir)/$$f  $(sbindir)/$$f.old;	    \
-+	    if [ -f $(prefix)/usr/share/man/man8/$$f.8.gz ]; then	    \
-+		mv $(prefix)/usr/share/man/man8/$$f.8.gz		    \
-+			$(prefix)/usr/share/man/man8/$$f.old.8.gz;	    \
-+	    elif [ -f $(prefix)/usr/share/man/man8/$$f.8.bz2 ]; then	    \
-+	        mv $(prefix)/usr/share/man/man8/$$f.8.bz2		    \
-+			$(prefix)/usr/share/man/man8/$$f.old.8.bz2;	    \
-+	    elif [ -f $(prefix)/usr/share/man/man8/$$f.8 ]; then	    \
-+	        mv $(prefix)/usr/share/man/man8/$$f.8 /usr/share/man/man8/$$f.old.8; \
- 	    fi;								    \
--	done
-+	done; \
- 	for f in kallsyms ksyms; do					    \
--	    if [ -L /sbin/$$f ]; then					    \
--		ln -sf `ls -l /sbin/$$f | sed 's/.* -> //'`.old /sbin/$$f;  \
-+	    if [ -L $(sbindir)/$$f ]; then			    \
-+		ln -sf `ls -l $(sbindir)/$$f | sed 's/.* -> //'`.old $(sbindir)/$$f;  \
- 	    fi;								    \
--	done
--	ln -s /sbin/lsmod.old /bin/lsmod.old
-+	done; \
-+	fi
- 
- # For installs in /usr/local/sbin
- links:
-- 
1.7.1
