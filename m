From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 23:07:16 +0200
Subject: [Buildroot] [git commit] Bump version of ltrace
Message-ID: <20120403210721.C8A69969F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4e2d3bd7318e6581266d09d0183d404c5833f3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace-0.5.3-configure-fixes.patch  |  128 --------------------
 package/ltrace/ltrace-0.5.3-susv3-legacy.patch     |   20 ---
 ...nning-in-ARM-arch_-dis-en-able_breakpoint.patch |   67 ++++++++++
 package/ltrace/ltrace.mk                           |   40 +------
 4 files changed, 72 insertions(+), 183 deletions(-)

diff --git a/package/ltrace/ltrace-0.5.3-configure-fixes.patch b/package/ltrace/ltrace-0.5.3-configure-fixes.patch
deleted file mode 100644
index 8d95883..0000000
--- a/package/ltrace/ltrace-0.5.3-configure-fixes.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-Fix several issues with the configure script:
-
- * Allow option values to contains equal signs, like
-   CC="/foo/arm-linux-gcc --sysroot=/foobar/usr"
-
- * Parse the option before doing the tests so that CC/CFLAGS can be
-   used during the tests.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure |   72 +++++++++++++++++++++++++++++++-------------------------------
- 1 file changed, 37 insertions(+), 35 deletions(-)
-
-Index: ltrace-0.5.3/configure
-===================================================================
---- ltrace-0.5.3.orig/configure
-+++ ltrace-0.5.3/configure
-@@ -6,6 +6,38 @@
-   exit 1
- fi
- 
-+CC=gcc
-+CPPFLAGS=' -I /usr/include/libelf'
-+CFLAGS='-g -O2'
-+LIBS='-lelf '
-+INSTALL='/usr/bin/install -c'
-+iquote='-iquote '
-+iquoteend=''
-+
-+prefix=/usr/local
-+sysconfdir='${prefix}/etc'
-+bindir='${prefix}/bin'
-+mandir='${prefix}/share/man'
-+docdir='${prefix}/share/doc/ltrace'
-+for x_option
-+do
-+  if test -n "$x_prev"; then
-+    eval $x_prev=\$x_option
-+    x_prev=
-+    continue
-+  fi
-+  case $x_option in
-+    --*=* | *=*)
-+      x_var=`echo $x_option | sed 's/^--//' | sed 's/=.*//'`
-+      x_val=`echo $x_option | sed 's/^[^=]*=//'`
-+      eval $x_var=\"$x_val\"
-+      ;;
-+    --*)
-+      x_prev=`echo $x_option | sed 's/^--//'`
-+      ;;
-+  esac
-+done
-+
- echo -n "checking package name... "
- PACKAGE_NAME='ltrace'
- echo $PACKAGE_NAME
-@@ -30,9 +62,10 @@
-   return cplus_demangle();
- }
- EOF
--if gcc conftest.c -liberty 2>/dev/null
-+if $CC $CFLAGS conftest.c -liberty 2>/dev/null
- then
-   HAVE_LIBIBERTY=1
-+  LIBS="$LIBS -liberty"
-   echo "yes"
- else
-   unset HAVE_LIBIBERTY
-@@ -48,9 +81,10 @@
-   return __cxa_demangle();
- }
- EOF
--if gcc conftest.c -lsupc++ 2>/dev/null
-+if $CC $CFLAGS conftest.c -lsupc++ 2>/dev/null
- then
-   HAVE_LIBSUPC__=1
-+  LIBS="$LIBS -lsupc++"
-   echo "yes"
- else
-   unset HAVE_LIBSUPC__
-@@ -67,7 +101,7 @@
-   return 0;
- }
- EOF
--if gcc conftest.c 2>/dev/null
-+if $CC $CFLAGS conftest.c 2>/dev/null
- then
-   HAVE_ELF_C_READ_MMAP=1
-   echo "yes"
-@@ -77,38 +111,6 @@
- fi
- rm -f conftest.c a.out
- 
--CC=gcc
--CPPFLAGS=' -I /usr/include/libelf'
--CFLAGS='-g -O2'
--LIBS='-lelf -lsupc++ -liberty '
--INSTALL='/usr/bin/install -c'
--iquote='-iquote '
--iquoteend=''
--
--prefix=/usr/local
--sysconfdir='${prefix}/etc'
--bindir='${prefix}/bin'
--mandir='${prefix}/share/man'
--docdir='${prefix}/share/doc/ltrace'
--for x_option
--do
--  if test -n "$x_prev"; then
--    eval $x_prev=\$x_option
--    x_prev=
--    continue
--  fi
--  case $x_option in
--    --*=* | *=*)
--      x_var=`echo $x_option | sed 's/^--//' | sed 's/=.*//'`
--      x_val=`echo $x_option | sed 's/^.*=//'`
--      eval $x_var=$x_val
--      ;;
--    --*)
--      x_prev=`echo $x_option | sed 's/^--//'`
--      ;;
--  esac
--done
--
- echo "configure: creating Makefile"
- #
- # Makefile.in -> Makefile
diff --git a/package/ltrace/ltrace-0.5.3-susv3-legacy.patch b/package/ltrace/ltrace-0.5.3-susv3-legacy.patch
deleted file mode 100644
index 4c9bb8a..0000000
--- a/package/ltrace/ltrace-0.5.3-susv3-legacy.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Use the strchr() function instead of the legacy index() function.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- read_config_file.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: ltrace-0.5.3/read_config_file.c
-===================================================================
---- ltrace-0.5.3.orig/read_config_file.c
-+++ ltrace-0.5.3/read_config_file.c
-@@ -83,7 +83,7 @@
- 
- 	while (tmp->name) {
- 		if (!strncmp(*str, tmp->name, strlen(tmp->name))
--				&& index(" ,()#*;012345[", *(*str + strlen(tmp->name)))) {
-+				&& strchr(" ,()#*;012345[", *(*str + strlen(tmp->name)))) {
- 			*str += strlen(tmp->name);
- 			return lookup_prototype(tmp->pt);
- 		}
diff --git a/package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch b/package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch
new file mode 100644
index 0000000..c005932
--- /dev/null
+++ b/package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch
@@ -0,0 +1,67 @@
+From c46448f4e5a4c124fbc75ca9b14697212e676893 Mon Sep 17 00:00:00 2001
+From: Michael K. Edwards <m.k.edwards@gmail.com>
+Date: Mon, 7 Mar 2011 16:15:48 +0000
+Subject: [PATCH] fix type punning in ARM arch_(dis|en)able_breakpoint
+
+---
+ sysdeps/linux-gnu/arm/breakpoint.c |   26 ++++++++++++++++++--------
+ 1 files changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/sysdeps/linux-gnu/arm/breakpoint.c b/sysdeps/linux-gnu/arm/breakpoint.c
+index 4a5ab92..4e17940 100644
+--- a/sysdeps/linux-gnu/arm/breakpoint.c
++++ b/sysdeps/linux-gnu/arm/breakpoint.c
+@@ -35,10 +35,15 @@ arch_enable_breakpoint(pid_t pid, Breakpoint *sbp) {
+ 	debug(1, "arch_enable_breakpoint(%d,%p)", pid, sbp->addr);
+ 
+ 	for (i = 0; i < 1 + ((BREAKPOINT_LENGTH - 1) / sizeof(long)); i++) {
+-		long a = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
+-		unsigned char *bytes = (unsigned char *)&a;
++		union _ { long l; unsigned char b[SIZEOF_LONG]; };
++		union _ orig, current;
++		unsigned char *bytes = current.b;
++		for (j = 0; j < sizeof(long); j++) {
++			orig.b[j] = sbp->orig_value[i * sizeof(long) + j];
++		}
++		current.l = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
+ 
+-		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", a, *(long *)&sbp->orig_value, sbp->thumb_mode);
++		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", current.l, orig.l, sbp->thumb_mode);
+ 		for (j = 0; j < sizeof(long) && i * sizeof(long) + j < BREAKPOINT_LENGTH; j++) {
+ 
+ 			sbp->orig_value[i * sizeof(long) + j] = bytes[j];
+@@ -49,7 +54,7 @@ arch_enable_breakpoint(pid_t pid, Breakpoint *sbp) {
+ 				bytes[j] = thumb_break_insn[i * sizeof(long) + j];
+ 			}
+ 		}
+-		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), a);
++		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), current.l);
+ 	}
+ }
+ 
+@@ -60,13 +65,18 @@ arch_disable_breakpoint(pid_t pid, const Breakpoint *sbp) {
+ 	debug(1, "arch_disable_breakpoint(%d,%p)", pid, sbp->addr);
+ 
+ 	for (i = 0; i < 1 + ((BREAKPOINT_LENGTH - 1) / sizeof(long)); i++) {
+-		long a = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
+-		unsigned char *bytes = (unsigned char *)&a;
++		union _ { long l; unsigned char b[SIZEOF_LONG]; };
++		union _ orig, current;
++		unsigned char *bytes = current.b;
++		for (j = 0; j < sizeof(long); j++) {
++			orig.b[j] = sbp->orig_value[i * sizeof(long) + j];
++		}
++		current.l = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
+ 
+-		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", a, *(long *)&sbp->orig_value, sbp->thumb_mode);
++		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", current.l, orig.l, sbp->thumb_mode);
+ 		for (j = 0; j < sizeof(long) && i * sizeof(long) + j < BREAKPOINT_LENGTH; j++) {
+ 			bytes[j] = sbp->orig_value[i * sizeof(long) + j];
+ 		}
+-		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), a);
++		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), current.l);
+ 	}
+ }
+-- 
+1.7.4.1
+
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 23094c8..8c0a145 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -3,40 +3,10 @@
 # ltrace
 #
 #############################################################
-LTRACE_VERSION      = 0.5.3
-LTRACE_SOURCE       = ltrace_$(LTRACE_VERSION).orig.tar.gz
-LTRACE_PATCH        = ltrace_$(LTRACE_VERSION)-2.1.diff.gz
-LTRACE_SITE         = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/ltrace
-LTRACE_MAKE         = $(MAKE1)
+LTRACE_VERSION      = 0.6.0
+LTRACE_SITE         = git://anonscm.debian.org/collab-maint/ltrace.git
 LTRACE_DEPENDENCIES = libelf
+LTRACE_AUTORECONF   = YES
+LTRACE_CONF_OPT     += --disable-werror
 
-# ltrace uses arch=ppc for powerpc
-LTRACE_ARCH:=$(KERNEL_ARCH:powerpc=ppc)
-ifeq ("$(strip $(ARCH))","armeb")
-LTRACE_ARCH:=arm
-endif
-
-define LTRACE_CONFIGURE_CMDS
-	(cd $(@D) ; ./configure 		\
-		--prefix=/usr			\
-		CC='$(TARGET_CC)' 		\
-		CFLAGS='$(TARGET_CFLAGS)')
-endef
-
-define LTRACE_BUILD_CMDS
-	$(MAKE) -C $(@D) ARCH=$(LTRACE_ARCH)
-endef
-
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-define LTRACE_INSTALL_DOCUMENTATION
-	$(INSTALL) -D $(@D)/ltrace.1 \
-		$(TARGET_DIR)/usr/share/man/man1/ltrace.1
-endef
-endif
-
-define LTRACE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/ltrace $(TARGET_DIR)/usr/bin
-	$(LTRACE_INSTALL_DOCUMENTATION)
-endef
-
-$(eval $(call GENTARGETS))
+$(eval $(call AUTOTARGETS))
