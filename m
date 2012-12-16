From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 17:56:20 +0100
Subject: [Buildroot] [PATCH 13/19] package/keyutils: new package
In-Reply-To: <cover.1355676845.git.yann.morin.1998@free.fr>
References: <cover.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <1280f35f9f32881fd0158fd3cfda65e83fc953ce.1355676845.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
---
 package/Config.in                                  |    1 +
 package/keyutils/Config.in                         |    7 ++
 .../keyutils-01-memleak-from-realloc.patch         |   51 +++++++++++++++
 package/keyutils/keyutils-02-another-memleak.patch |   32 ++++++++++
 package/keyutils/keyutils-03-cifs.patch            |   15 +++++
 .../keyutils-04-Makefile-for-buildroot.patch       |   65 ++++++++++++++++++++
 .../keyutils/keyutils-05-fix-install-rule.patch    |   19 ++++++
 package/keyutils/keyutils.mk                       |   32 ++++++++++
 8 files changed, 222 insertions(+), 0 deletions(-)
 create mode 100644 package/keyutils/Config.in
 create mode 100644 package/keyutils/keyutils-01-memleak-from-realloc.patch
 create mode 100644 package/keyutils/keyutils-02-another-memleak.patch
 create mode 100644 package/keyutils/keyutils-03-cifs.patch
 create mode 100644 package/keyutils/keyutils-04-Makefile-for-buildroot.patch
 create mode 100644 package/keyutils/keyutils-05-fix-install-rule.patch
 create mode 100644 package/keyutils/keyutils.mk

diff --git a/package/Config.in b/package/Config.in
index 2f67d10..6c16be2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -740,6 +740,7 @@ endif
 source "package/bwm-ng/Config.in"
 source "package/cpuload/Config.in"
 source "package/htop/Config.in"
+source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
new file mode 100644
index 0000000..9b5a24b
--- /dev/null
+++ b/package/keyutils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KEYUTILS
+	bool "keyutils"
+	help
+	  These tools are used to control the key management system
+	  built into the Linux kernel.
+	  
+	  http://people.redhat.com/~dhowells/keyutils/
diff --git a/package/keyutils/keyutils-01-memleak-from-realloc.patch b/package/keyutils/keyutils-01-memleak-from-realloc.patch
new file mode 100644
index 0000000..0faa9d8
--- /dev/null
+++ b/package/keyutils/keyutils-01-memleak-from-realloc.patch
@@ -0,0 +1,51 @@
+Patch vampirised from Debian's packaging of keyutils-1.4
+
+Author: Michael Gebetsroither <gebi@grml.org>
+Description: Fixed memleak from realloc (Closes: #496466).
+
+diff -Naurp keyutils.orig/keyutils.c keyutils/keyutils.c
+--- keyutils.orig/keyutils.c	2008-08-09 21:46:52.000000000 +0200
++++ keyutils/keyutils.c	2008-08-25 13:38:07.000000000 +0200
+@@ -165,6 +165,24 @@ long keyctl_assume_authority(key_serial_
+ 	return keyctl(KEYCTL_ASSUME_AUTHORITY, id);
+ }
+ 
++
++/*****************************************************************************/
++/*
++ * plain realloc is just crazy
++ */
++static void* __xrealloc(void* ptr, size_t size)
++{
++    void* ret;
++
++    ret = realloc(ptr, size);
++    if(!ret) {
++        free(ptr);
++        return 0;
++    }
++    return ret;
++}
++
++
+ /*****************************************************************************/
+ /*
+  * fetch key description into an allocated buffer
+@@ -194,7 +212,7 @@ int keyctl_describe_alloc(key_serial_t i
+ 			break;
+ 
+ 		buflen = ret;
+-		buf = realloc(buf, buflen);
++		buf = __xrealloc(buf, buflen);
+ 		if (!buf)
+ 			return -1;
+ 	}
+@@ -233,7 +251,7 @@ int keyctl_read_alloc(key_serial_t id, v
+ 			break;
+ 
+ 		buflen = ret;
+-		buf = realloc(buf, buflen + 1);
++		buf = __xrealloc(buf, buflen + 1);
+ 		if (!buf)
+ 			return -1;
+ 	}
diff --git a/package/keyutils/keyutils-02-another-memleak.patch b/package/keyutils/keyutils-02-another-memleak.patch
new file mode 100644
index 0000000..f74fd79
--- /dev/null
+++ b/package/keyutils/keyutils-02-another-memleak.patch
@@ -0,0 +1,32 @@
+Patch vampirised from Debian's packaging of keyutils-1.4
+
+Author: Michael Gebetsroither <gebi@grml.org>
+Description: Fixed another memleak (Closes: #496466).
+
+diff -Naurp keyutils.orig/keyutils.c keyutils/keyutils.c
+--- keyutils.orig/keyutils.c	2008-08-09 21:46:52.000000000 +0200
++++ keyutils/keyutils.c	2008-08-25 13:38:25.000000000 +0200
+@@ -187,8 +187,10 @@ int keyctl_describe_alloc(key_serial_t i
+ 
+ 	for (;;) {
+ 		ret = keyctl_describe(id, buf, buflen);
+-		if (ret < 0)
++		if (ret < 0) {
++            free(buf);
+ 			return -1;
++        }
+ 
+ 		if (buflen >= ret)
+ 			break;
+@@ -226,8 +228,10 @@ int keyctl_read_alloc(key_serial_t id, v
+ 
+ 	for (;;) {
+ 		ret = keyctl_read(id, buf, buflen);
+-		if (ret < 0)
++		if (ret < 0) {
++            free(buf);
+ 			return -1;
++        }
+ 
+ 		if (buflen >= ret)
+ 			break;
diff --git a/package/keyutils/keyutils-03-cifs.patch b/package/keyutils/keyutils-03-cifs.patch
new file mode 100644
index 0000000..b2903f9
--- /dev/null
+++ b/package/keyutils/keyutils-03-cifs.patch
@@ -0,0 +1,15 @@
+Patch vampirised from Debian's packaging of keyutils-1.4
+
+Author: Marcus Meissner <meissner@suse.de>
+Description: Added 2 cifs helpers to request-key.conf (for CIFS DFS support)
+
+diff -Naurp keyutils.orig/request-key.conf keyutils/request-key.conf
+--- keyutils.orig/request-key.conf	2008-09-07 23:53:10.000000000 +0000
++++ keyutils/request-key.conf	2009-02-05 00:53:00.000000000 +0000
+@@ -34,4 +34,6 @@
+ create	user	debug:*		negate		/bin/keyctl negate %k 30 %S
+ create	user	debug:loop:*	*		|/bin/cat
+ create	user	debug:*		*		/usr/share/keyutils/request-key-debug.sh %k %d %c %S
++create	cifs.spnego	*	*		/usr/sbin/cifs.upcall -c %k
++create	dns_resolver	*	*		/usr/sbin/cifs.upcall %k
+ negate	*	*		*		/bin/keyctl negate %k 30 %S
diff --git a/package/keyutils/keyutils-04-Makefile-for-buildroot.patch b/package/keyutils/keyutils-04-Makefile-for-buildroot.patch
new file mode 100644
index 0000000..e10abd5
--- /dev/null
+++ b/package/keyutils/keyutils-04-Makefile-for-buildroot.patch
@@ -0,0 +1,65 @@
+diff -durN keyutils-1.5.5.orig/Makefile keyutils-1.5.5/Makefile
+--- keyutils-1.5.5.orig/Makefile	2011-11-30 16:27:43.000000000 +0100
++++ keyutils-1.5.5/Makefile	2012-08-14 17:06:07.064412101 +0200
+@@ -1,7 +1,5 @@
+-CPPFLAGS	:= -I.
+-CFLAGS		:= -g -Wall -Werror
+-INSTALL		:= install
+-DESTDIR		:=
++CPPFLAGS	+= -I.
++CFLAGS		+= -g -Wall -Werror
+ SPECFILE	:= keyutils.spec
+ NO_GLIBC_KEYERR	:= 0
+ NO_ARLIB	:= 0
+@@ -14,7 +12,7 @@
+ MAN5		:= /usr/share/man/man5
+ MAN8		:= /usr/share/man/man8
+ INCLUDEDIR	:= /usr/include
+-LNS		:= ln -sf
++LNS		:= $(LN) -sf
+ 
+ ###############################################################################
+ #
+@@ -48,29 +46,6 @@
+ 
+ ###############################################################################
+ #
+-# Guess at the appropriate lib directory and word size
+-#
+-###############################################################################
+-LIBDIR		:= $(shell ldd /usr/bin/make | grep '\(/libc\)' | sed -e 's!.*\(/.*\)/libc[.].*!\1!')
+-USRLIBDIR	:= $(patsubst /lib/%,/usr/lib/%,$(LIBDIR))
+-BUILDFOR	:= $(shell file /usr/bin/make | sed -e 's!.*ELF \(32\|64\)-bit.*!\1!')-bit
+-
+-LNS		:= ln -sf
+-
+-ifeq ($(BUILDFOR),32-bit)
+-CFLAGS		+= -m32
+-LIBDIR		:= /lib
+-USRLIBDIR	:= /usr/lib
+-else
+-ifeq ($(BUILDFOR),64-bit)
+-CFLAGS		+= -m64
+-LIBDIR		:= /lib64
+-USRLIBDIR	:= /usr/lib64
+-endif
+-endif
+-
+-###############################################################################
+-#
+ # This is necessary if glibc doesn't know about the key management error codes
+ #
+ ###############################################################################
+@@ -110,10 +85,10 @@
+ 
+ 
+ $(DEVELLIB): $(SONAME)
+-	ln -sf $< $@
++	$(LNS) $< $@
+ 
+ $(SONAME): $(LIBNAME)
+-	ln -sf $< $@
++	$(LNS) $< $@
+ 
+ LIBVERS := -shared -Wl,-soname,$(SONAME) -Wl,--version-script,version.lds
+ 
diff --git a/package/keyutils/keyutils-05-fix-install-rule.patch b/package/keyutils/keyutils-05-fix-install-rule.patch
new file mode 100644
index 0000000..74e5670
--- /dev/null
+++ b/package/keyutils/keyutils-05-fix-install-rule.patch
@@ -0,0 +1,19 @@
+Makefile: fix install rule
+
+Do not link the .so with an absolute path, otherwise it may point to
+the host library.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN keyutils-1.5.5.orig/Makefile keyutils-1.5.5/Makefile
+--- keyutils-1.5.5.orig/Makefile	2012-10-22 20:11:57.188548033 +0200
++++ keyutils-1.5.5/Makefile	2012-10-22 20:14:40.868236838 +0200
+@@ -127,7 +127,7 @@
+ 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
+ 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
+ 	mkdir -p $(DESTDIR)$(USRLIBDIR)
+-	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
++	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
+ 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
+ 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
+ 	$(INSTALL) -D request-key-debug.sh $(DESTDIR)$(SHAREDIR)/request-key-debug.sh
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
new file mode 100644
index 0000000..184b58d
--- /dev/null
+++ b/package/keyutils/keyutils.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# keyutils
+#
+##############################################################
+
+KEYUTILS_VERSION         = 1.5.5
+KEYUTILS_SOURCE          = keyutils-$(KEYUTILS_VERSION).tar.bz2
+KEYUTILS_SITE            = http://people.redhat.com/~dhowells/keyutils
+KEYUTILS_LICENSE         = GPLv2+ LGPLv2.1+
+KEYUTILS_LICENSE_FILES   = LICENCE.GPL LICENCE.LGPL
+KEYUTILS_INSTALL_STAGING = YES
+
+KEYUTILS_MAKE_ENV =     \
+    INSTALL=$(INSTALL)  \
+    LIBDIR=/usr/lib     \
+    USRLIBDIR=/usr/lib  \
+    LN=$(HOSTLN)        \
+
+define KEYUTILS_BUILD_CMDS
+	$(KEYUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define KEYUTILS_INSTALL_STAGING_CMDS
+	$(KEYUTILS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define KEYUTILS_INSTALL_TARGET_CMDS
+	$(KEYUTILS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
