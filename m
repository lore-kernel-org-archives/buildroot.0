From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 12:18:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/vim
Message-ID: <20081006191812.21D253C765@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 12:18:11 -0700 (Mon, 06 Oct 2008)
New Revision: 23605

Log:
vim:
-Apply patches from list
 (http://buildroot.uclibc.org/lists/buildroot/2008-July/009846.html
  http://buildroot.uclibc.org/lists/buildroot/2008-August/010104.html)
-add more vim patches
-Switch to http vs ftp since ftp is slow
-Fix configure.patch to apply cleanly after patch update


Modified:
   trunk/buildroot/package/editors/vim/configure.patch
   trunk/buildroot/package/editors/vim/patches
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/editors/vim/configure.patch
===================================================================
--- trunk/buildroot/package/editors/vim/configure.patch	2008-10-06 19:14:41 UTC (rev 23604)
+++ trunk/buildroot/package/editors/vim/configure.patch	2008-10-06 19:18:11 UTC (rev 23605)
@@ -4427,51 +4427,6 @@
  case `uname` in
      OS/390)	OS390Unix="yes";
  										if test "$CC" = "cc"; then
-@@ -3601,30 +4143,30 @@
- 		  exit 1
- 		fi
- 		CFLAGS="$CFLAGS -D_ALL_SOURCE"; LDFLAGS="$LDFLAGS -Wl,EDIT=NO"
--		echo "$as_me:$LINENO: result: yes" >&5
--echo "${ECHO_T}yes" >&6
-+		{ echo "$as_me:$LINENO: result: yes" >&5
-+echo "${ECHO_T}yes" >&6; }
- 		;;
-     *)		OS390Unix="no";
--		echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6
-+		{ echo "$as_me:$LINENO: result: no" >&5
-+echo "${ECHO_T}no" >&6; }
- 		;;
- esac
- fi
- 
- 
- 
--echo "$as_me:$LINENO: checking --with-features argument" >&5
--echo $ECHO_N "checking --with-features argument... $ECHO_C" >&6
-+{ echo "$as_me:$LINENO: checking --with-features argument" >&5
-+echo $ECHO_N "checking --with-features argument... $ECHO_C" >&6; }
- 
--# Check whether --with-features or --without-features was given.
-+# Check whether --with-features was given.
- if test "${with_features+set}" = set; then
--  withval="$with_features"
--  features="$withval"; echo "$as_me:$LINENO: result: $features" >&5
--echo "${ECHO_T}$features" >&6
--else
--  features="normal"; echo "$as_me:$LINENO: result: Defaulting to normal" >&5
--echo "${ECHO_T}Defaulting to normal" >&6
--fi;
-+  withval=$with_features; features="$withval"; { echo "$as_me:$LINENO: result: $features" >&5
-+echo "${ECHO_T}$features" >&6; }
-+else
-+  features="normal"; { echo "$as_me:$LINENO: result: Defaulting to normal" >&5
-+echo "${ECHO_T}Defaulting to normal" >&6; }
-+fi
-+
- 
- dovimdiff=""
- dogvimdiff=""
 @@ -3652,109 +4194,109 @@
  _ACEOF
   dovimdiff="installvimdiff";

Modified: trunk/buildroot/package/editors/vim/patches
===================================================================
--- trunk/buildroot/package/editors/vim/patches	2008-10-06 19:14:41 UTC (rev 23604)
+++ trunk/buildroot/package/editors/vim/patches	2008-10-06 19:18:11 UTC (rev 23605)
@@ -112,7 +112,7 @@
 122
 123
 125
-126
+126ne
 127
 130
 131
@@ -231,3 +231,70 @@
 250
 251
 252
+253
+254
+255
+256
+257
+258
+259
+260
+261
+262
+263
+264
+265
+266
+267
+268
+269
+270
+271
+272
+273
+274
+276
+277
+279
+284
+286
+287
+289
+290
+292
+293
+294
+295
+296
+297
+298
+299
+300
+301
+302
+303
+304
+305
+306
+307
+308
+309
+310
+311
+313
+314
+315
+316
+317
+318
+319
+320
+322
+323
+324
+325
+326
+327
+328
+329
+330

Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2008-10-06 19:14:41 UTC (rev 23604)
+++ trunk/buildroot/package/editors/vim/vim.mk	2008-10-06 19:18:11 UTC (rev 23605)
@@ -5,30 +5,24 @@
 #############################################################
 VIM_VERSION:=7.1
 VIM_SOURCE:=vim-$(VIM_VERSION).tar.bz2
-VIM_EXTRA:=vim-$(VIM_VERSION)-extra.tar.gz
-VIM_SITE:=ftp://ftp.vim.org/pub/vim
+VIM_SITE:=http://ftp.vim.org/pub/vim
 VIM_SOURCE_SITE:=$(VIM_SITE)/unix
-VIM_EXTRA_SITE:=$(VIM_SITE)/extra
 VIM_PATCH_SITE:=$(VIM_SITE)/patches/7.1
 VIM_DIR:=$(BUILD_DIR)/vim71
-VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -s 's:\([0-9]\{3\}\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
+VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -s 's:\(.\+\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
 VIM_CONFIG_H:=$(VIM_DIR)/src/auto/config.h
 VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk
 
 $(DL_DIR)/$(VIM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(VIM_SOURCE_SITE)/$(VIM_SOURCE)
 
-$(DL_DIR)/$(VIM_EXTRA):
-	$(WGET) -P $(DL_DIR) $(VIM_EXTRA_SITE)/$(VIM_EXTRA)
-
 $(DL_DIR)/vim/%:
 	$(WGET) -P $(DL_DIR)/vim/ $(VIM_PATCH_SITE)/$*
 
-vim-source: $(DL_DIR)/$(VIM_SOURCE) $(DL_DIR)/$(VIM_EXTRA) $(VIM_PATCHES)
+vim-source: $(DL_DIR)/$(VIM_SOURCE) $(VIM_PATCHES)
 
 $(VIM_DIR)/.unpacked: $(DL_DIR)/$(VIM_SOURCE)
 	$(BZCAT) $(DL_DIR)/$(VIM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(ZCAT) $(DL_DIR)/$(VIM_EXTRA) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(VIM_DIR)/.patched: $(VIM_DIR)/.unpacked
@@ -36,7 +30,7 @@
 		echo "Patching with $$i"; \
 		cd $(VIM_DIR); \
 		patch -p0 < $$i) \
-    done;
+	done
 	toolchain/patch-kernel.sh $(VIM_DIR) package/editors/vim/ \*.patch
 	touch $@
 
@@ -79,7 +73,7 @@
 		make DESTDIR=$(TARGET_DIR) installvimbin; \
 		make DESTDIR=$(TARGET_DIR) installlinks; \
 	)
-ifeq ($(R2_PACKAGE_VIM_RUNTIME),y)
+ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 	(cd $(VIM_DIR)/src; \
 		make DESTDIR=$(TARGET_DIR) installrtbase; \
 		make DESTDIR=$(TARGET_DIR) installmacros; \
