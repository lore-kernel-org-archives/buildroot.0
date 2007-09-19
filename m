From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 05:20:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgcrypt
Message-ID: <20070919122053.4675CA4D19@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 05:20:52 -0700 (Wed, 19 Sep 2007)
New Revision: 19888

Log:
- fix incorrect setting of $ac_cv_sys_symbol_underscore.
  There is no reason not to AC_COMPILE and use the set cross-nm to look for
  the symbol mangling scheme. Thus it is incorrect to check for cross compilation
  in the GNUPG_SYS_SYMBOL_UNDERSCORE check.
- fix bug when configuring (has to wipe config.cache !)


Added:
   trunk/buildroot/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
   trunk/buildroot/package/libgcrypt/libgcrypt-01-reconfigure.patch

Modified:
   trunk/buildroot/package/libgcrypt/libgcrypt.mk


Changeset:
Added: trunk/buildroot/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch	                        (rev 0)
+++ trunk/buildroot/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch	2007-09-19 12:20:52 UTC (rev 19888)
@@ -0,0 +1,24 @@
+diff -u libgcrypt-1.2.4.oorig/acinclude.m4 libgcrypt-1.2.4/acinclude.m4
+--- libgcrypt-1.2.4.oorig/acinclude.m4	2005-07-29 15:45:48.000000000 +0200
++++ libgcrypt-1.2.4/acinclude.m4	2007-09-19 13:33:19.000000000 +0200
+@@ -99,12 +99,14 @@
+     i386-emx-os2 | i[3456]86-pc-os2*emx | i386-pc-msdosdjgpp)
+         ac_cv_sys_symbol_underscore=yes
+         ;;
+-    *)
+-      if test "$cross_compiling" = yes; then
+-         ac_cv_sys_symbol_underscore=yes
+-      else
+-         tmp_do_check="yes"
+-      fi
++    *) if test -z "$ac_cv_sys_symbol_underscore"; then
++         if test "$cross_compiling" = yes && 
++         then
++           ac_cv_sys_symbol_underscore=yes
++         else
++           tmp_do_check="yes"
++         fi
++        fi
+        ;;
+ esac
+ if test "$tmp_do_check" = "yes"; then

Added: trunk/buildroot/package/libgcrypt/libgcrypt-01-reconfigure.patch
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt-01-reconfigure.patch	                        (rev 0)
+++ trunk/buildroot/package/libgcrypt/libgcrypt-01-reconfigure.patch	2007-09-19 12:20:52 UTC (rev 19888)
@@ -0,0 +1,17 @@
+--- libgcrypt-1.2.4.oorig/configure	2007-09-19 13:40:48.000000000 +0200
++++ libgcrypt-1.2.4/configure	2007-09-19 13:41:44.000000000 +0200
+@@ -27370,12 +27370,13 @@
+     i386-emx-os2 | i345686-pc-os2*emx | i386-pc-msdosdjgpp)
+         ac_cv_sys_symbol_underscore=yes
+         ;;
+-    *)
++    *)if test -z "$ac_cv_sys_symbol_underscore";then
+       if test "$cross_compiling" = yes; then
+          ac_cv_sys_symbol_underscore=yes
+       else
+          tmp_do_check="yes"
+       fi
++      fi
+        ;;
+ esac
+ if test "$tmp_do_check" = "yes"; then

Modified: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-09-19 10:31:14 UTC (rev 19887)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-09-19 12:20:52 UTC (rev 19888)
@@ -18,12 +18,16 @@
 	$(BZCAT) $(DL_DIR)/$(LIBGCRYPT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBGCRYPT_DIR) package/libgcrypt/ libgcrypt\*.patch
 	$(CONFIG_UPDATE) $(LIBGCRYPT_DIR)
+	# This is incorrectly hardwired to yes for cross-compiles with no
+	# sane way to pass pre-existing knowledge so fix it with the chainsaw..
+	$(SED) '/GNUPG_SYS_SYMBOL_UNDERSCORE/d' $(LIBGCRYPT_DIR)/configure
 	touch $@
 
 $(LIBGCRYPT_DIR)/.configured: $(LIBGCRYPT_DIR)/.source
-	(cd $(LIBGCRYPT_DIR); \
+	(cd $(LIBGCRYPT_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		ac_cv_sys_symbol_underscore=no \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -41,7 +45,6 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--disable-optimization \
-		--with-capabilities \
 	)
 	touch $@
 
