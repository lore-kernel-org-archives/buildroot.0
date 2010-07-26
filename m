From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] ltrace: convert to gentargets
	and bump to 0.5.3
Message-ID: <20100726225418.B108A82DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=192c9b1829cf63704abd9736738b85a6582fd88a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove unneeded 0.5 USE_DEMANGLE patch]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace-0.5-00-susv3-legacy.patch    |   11 --
 ...ltrace-0.5-fix-build-without-USE_DEMANGLE.patch |   27 ----
 package/ltrace/ltrace-0.5.3-configure-fixes.patch  |  128 ++++++++++++++++++++
 package/ltrace/ltrace-0.5.3-susv3-legacy.patch     |   20 +++
 package/ltrace/ltrace.mk                           |   90 ++++-----------
 5 files changed, 170 insertions(+), 106 deletions(-)
 delete mode 100644 package/ltrace/ltrace-0.5-00-susv3-legacy.patch
 delete mode 100644 package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch
 create mode 100644 package/ltrace/ltrace-0.5.3-configure-fixes.patch
 create mode 100644 package/ltrace/ltrace-0.5.3-susv3-legacy.patch

diff --git a/package/ltrace/ltrace-0.5-00-susv3-legacy.patch b/package/ltrace/ltrace-0.5-00-susv3-legacy.patch
deleted file mode 100644
index 7518124..0000000
--- a/package/ltrace/ltrace-0.5-00-susv3-legacy.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ltrace-0.5.orig/read_config_file.c	2006-02-20 22:48:07.000000000 +0100
-+++ ltrace-0.5/read_config_file.c	2007-10-02 12:18:21.000000000 +0200
-@@ -57,7 +57,7 @@
- 
- 	while (tmp->name) {
- 		if (!strncmp(*str, tmp->name, strlen(tmp->name))
--		    && index(" ,)#", *(*str + strlen(tmp->name)))) {
-+		    && strchr(" ,)#", *(*str + strlen(tmp->name)))) {
- 			*str += strlen(tmp->name);
- 			return tmp->pt;
- 		}
diff --git a/package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch b/package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch
deleted file mode 100644
index 180f688..0000000
--- a/package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-[PATCH] ltrace: fix build when USE_DEMANGLE isn't enabled
-
-summary.c unconditionally calls my_demangle(), which is only available
-when USE_DEMANGLE is enabled (which requires libiberty).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- summary.c |    5 +++++
- 1 file changed, 5 insertions(+)
-
-Index: ltrace-0.5/summary.c
-===================================================================
---- ltrace-0.5.orig/summary.c
-+++ ltrace-0.5/summary.c
-@@ -83,7 +83,12 @@ void show_summary(void)
- 		       (int)entries[i].tv.tv_sec, (int)entries[i].tv.tv_usec,
- 		       (unsigned long int)(c / entries[i].count),
- 		       entries[i].count,
-+#ifdef USE_DEMANGLE
- 		       opt_C ? my_demangle(entries[i].name) : entries[i].name);
-+#else
-+		       entries[i].name);
-+#endif
-+
- 	}
- 	printf
- 	    ("------ ----------- ----------- --------- --------------------\n");
diff --git a/package/ltrace/ltrace-0.5.3-configure-fixes.patch b/package/ltrace/ltrace-0.5.3-configure-fixes.patch
new file mode 100644
index 0000000..8d95883
--- /dev/null
+++ b/package/ltrace/ltrace-0.5.3-configure-fixes.patch
@@ -0,0 +1,128 @@
+Fix several issues with the configure script:
+
+ * Allow option values to contains equal signs, like
+   CC="/foo/arm-linux-gcc --sysroot=/foobar/usr"
+
+ * Parse the option before doing the tests so that CC/CFLAGS can be
+   used during the tests.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure |   72 +++++++++++++++++++++++++++++++-------------------------------
+ 1 file changed, 37 insertions(+), 35 deletions(-)
+
+Index: ltrace-0.5.3/configure
+===================================================================
+--- ltrace-0.5.3.orig/configure
++++ ltrace-0.5.3/configure
+@@ -6,6 +6,38 @@
+   exit 1
+ fi
+ 
++CC=gcc
++CPPFLAGS=' -I /usr/include/libelf'
++CFLAGS='-g -O2'
++LIBS='-lelf '
++INSTALL='/usr/bin/install -c'
++iquote='-iquote '
++iquoteend=''
++
++prefix=/usr/local
++sysconfdir='${prefix}/etc'
++bindir='${prefix}/bin'
++mandir='${prefix}/share/man'
++docdir='${prefix}/share/doc/ltrace'
++for x_option
++do
++  if test -n "$x_prev"; then
++    eval $x_prev=\$x_option
++    x_prev=
++    continue
++  fi
++  case $x_option in
++    --*=* | *=*)
++      x_var=`echo $x_option | sed 's/^--//' | sed 's/=.*//'`
++      x_val=`echo $x_option | sed 's/^[^=]*=//'`
++      eval $x_var=\"$x_val\"
++      ;;
++    --*)
++      x_prev=`echo $x_option | sed 's/^--//'`
++      ;;
++  esac
++done
++
+ echo -n "checking package name... "
+ PACKAGE_NAME='ltrace'
+ echo $PACKAGE_NAME
+@@ -30,9 +62,10 @@
+   return cplus_demangle();
+ }
+ EOF
+-if gcc conftest.c -liberty 2>/dev/null
++if $CC $CFLAGS conftest.c -liberty 2>/dev/null
+ then
+   HAVE_LIBIBERTY=1
++  LIBS="$LIBS -liberty"
+   echo "yes"
+ else
+   unset HAVE_LIBIBERTY
+@@ -48,9 +81,10 @@
+   return __cxa_demangle();
+ }
+ EOF
+-if gcc conftest.c -lsupc++ 2>/dev/null
++if $CC $CFLAGS conftest.c -lsupc++ 2>/dev/null
+ then
+   HAVE_LIBSUPC__=1
++  LIBS="$LIBS -lsupc++"
+   echo "yes"
+ else
+   unset HAVE_LIBSUPC__
+@@ -67,7 +101,7 @@
+   return 0;
+ }
+ EOF
+-if gcc conftest.c 2>/dev/null
++if $CC $CFLAGS conftest.c 2>/dev/null
+ then
+   HAVE_ELF_C_READ_MMAP=1
+   echo "yes"
+@@ -77,38 +111,6 @@
+ fi
+ rm -f conftest.c a.out
+ 
+-CC=gcc
+-CPPFLAGS=' -I /usr/include/libelf'
+-CFLAGS='-g -O2'
+-LIBS='-lelf -lsupc++ -liberty '
+-INSTALL='/usr/bin/install -c'
+-iquote='-iquote '
+-iquoteend=''
+-
+-prefix=/usr/local
+-sysconfdir='${prefix}/etc'
+-bindir='${prefix}/bin'
+-mandir='${prefix}/share/man'
+-docdir='${prefix}/share/doc/ltrace'
+-for x_option
+-do
+-  if test -n "$x_prev"; then
+-    eval $x_prev=\$x_option
+-    x_prev=
+-    continue
+-  fi
+-  case $x_option in
+-    --*=* | *=*)
+-      x_var=`echo $x_option | sed 's/^--//' | sed 's/=.*//'`
+-      x_val=`echo $x_option | sed 's/^.*=//'`
+-      eval $x_var=$x_val
+-      ;;
+-    --*)
+-      x_prev=`echo $x_option | sed 's/^--//'`
+-      ;;
+-  esac
+-done
+-
+ echo "configure: creating Makefile"
+ #
+ # Makefile.in -> Makefile
diff --git a/package/ltrace/ltrace-0.5.3-susv3-legacy.patch b/package/ltrace/ltrace-0.5.3-susv3-legacy.patch
new file mode 100644
index 0000000..4c9bb8a
--- /dev/null
+++ b/package/ltrace/ltrace-0.5.3-susv3-legacy.patch
@@ -0,0 +1,20 @@
+Use the strchr() function instead of the legacy index() function.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ read_config_file.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: ltrace-0.5.3/read_config_file.c
+===================================================================
+--- ltrace-0.5.3.orig/read_config_file.c
++++ ltrace-0.5.3/read_config_file.c
+@@ -83,7 +83,7 @@
+ 
+ 	while (tmp->name) {
+ 		if (!strncmp(*str, tmp->name, strlen(tmp->name))
+-				&& index(" ,()#*;012345[", *(*str + strlen(tmp->name)))) {
++				&& strchr(" ,()#*;012345[", *(*str + strlen(tmp->name)))) {
+ 			*str += strlen(tmp->name);
+ 			return lookup_prototype(tmp->pt);
+ 		}
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 4a6811d..9808240 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -3,13 +3,11 @@
 # ltrace
 #
 #############################################################
-LTRACE_VERSION=0.5
-LTRACE_SOURCE=ltrace_$(LTRACE_VERSION).orig.tar.gz
-LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-3.1.diff.gz
-LTRACE_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/ltrace
-LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
-LTRACE_BINARY=ltrace
-LTRACE_TARGET_BINARY=usr/bin/ltrace
+LTRACE_VERSION      = 0.5.3
+LTRACE_SOURCE       = ltrace_$(LTRACE_VERSION).orig.tar.gz
+LTRACE_PATCH        = ltrace_$(LTRACE_VERSION)-2.1.diff.gz
+LTRACE_SITE         = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/ltrace
+LTRACE_DEPENDENCIES = libelf
 
 # ltrace uses arch=ppc for powerpc
 LTRACE_ARCH:=$(KERNEL_ARCH:powerpc=ppc)
@@ -17,71 +15,27 @@ ifeq ("$(strip $(ARCH))","armeb")
 LTRACE_ARCH:=arm
 endif
 
-$(DL_DIR)/$(LTRACE_SOURCE):
-	$(call DOWNLOAD,$(LTRACE_SITE),$(LTRACE_SOURCE))
+define LTRACE_CONFIGURE_CMDS
+	(cd $(@D) ; ./configure 		\
+		--prefix=/usr			\
+		CC='$(TARGET_CC)' 		\
+		CFLAGS='$(TARGET_CFLAGS)')
+endef
 
-ifneq ($(LTRACE_PATCH),)
-LTRACE_PATCH_FILE:=$(DL_DIR)/$(LTRACE_PATCH)
-$(LTRACE_PATCH_FILE):
-	$(call DOWNLOAD,$(LTRACE_SITE),$(LTRACE_PATCH))
+define LTRACE_BUILD_CMDS
+	$(MAKE) -C $(@D) ARCH=$(LTRACE_ARCH)
+endef
 
-else
-LTRACE_PATCH_FILE:=
-endif
-
-$(LTRACE_DIR)/.patched: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_PATCH_FILE)
-	$(ZCAT) $(DL_DIR)/$(LTRACE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(LTRACE_PATCH),)
-	$(ZCAT) $(LTRACE_PATCH_FILE) | patch -p1 -d $(LTRACE_DIR)
-endif
-	toolchain/patch-kernel.sh $(LTRACE_DIR) package/ltrace ltrace\*.patch
-	$(CONFIG_UPDATE) $(@D)
-	chmod +x $(LTRACE_DIR)/configure
-	touch $@
-
-$(LTRACE_DIR)/.configured: $(LTRACE_DIR)/.patched
-	(cd $(LTRACE_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(LTRACE_DIR)/$(LTRACE_BINARY): $(LTRACE_DIR)/.configured
-	$(MAKE) ARCH=$(LTRACE_ARCH) -C $(LTRACE_DIR)
-
-$(TARGET_DIR)/$(LTRACE_TARGET_BINARY): $(LTRACE_DIR)/$(LTRACE_BINARY)
-	#$(MAKE) DESTDIR=$(TARGET_DIR) ARCH=$(LTRACE_ARCH)  -C $(LTRACE_DIR) install
-	$(INSTALL) -D $(LTRACE_DIR)/$(LTRACE_BINARY) $@
 ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	$(INSTALL) -D $(LTRACE_DIR)/ltrace.1 \
+define LTRACE_INSTALL_DOCUMENTATION
+	$(INSTALL) -D $(@D)/ltrace.1 \
 		$(TARGET_DIR)/usr/share/man/man1/ltrace.1
+endef
 endif
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-ltrace: libelf $(TARGET_DIR)/$(LTRACE_TARGET_BINARY)
 
-ltrace-source: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_PATCH_FILE)
+define LTRACE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/ltrace $(TARGET_DIR)/usr/bin
+	$(LTRACE_INSTALL_DOCUMENTATION)
+endef
 
-ltrace-clean:
-	-$(MAKE) -C $(LTRACE_DIR) clean
-	rm -f $(LTRACE_DIR)/$(LTRACE_BINARY) \
-		$(TARGET_DIR)/usr/share/man/man1/ltrace.1*
-
-ltrace-dirclean:
-	rm -rf $(LTRACE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LTRACE),y)
-TARGETS+=ltrace
-endif
+$(eval $(call GENTARGETS,package,ltrace))
-- 
1.7.1
