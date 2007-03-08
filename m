From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Mar 2007 17:38:26 +0100
Subject: [Buildroot] [RFC/PATCH 2/3] fix buildroot sed handling on Mac
	OS X
In-Reply-To: <45E17186.2080208@cs.helsinki.fi>
References: <45E17186.2080208@cs.helsinki.fi>
Message-ID: <20070308163826.GD1389@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 25, 2007 at 01:22:46PM +0200, Heikki Lindholm wrote:
>Include a patch for GNU sed that allows building it on Mac OS X and
>remove a spurious --prefix from sed.mk.
>
>-- Heikki Lindholm
>

>diff -Nru buildroot/package/sed/configure.patch buildroot-devel/package/sed/configure.patch
>--- buildroot/package/sed/configure.patch	1970-01-01 02:00:00.000000000 +0200
>+++ buildroot-devel/package/sed/configure.patch	2007-02-23 14:04:16.000000000 +0200
>@@ -0,0 +1,29 @@
>+diff -Nru sed-4.1.5.orig/configure sed-4.1.5/configure
>+--- sed-4.1.5.orig/configure	2006-02-03 11:24:40.000000000 +0200
>++++ sed-4.1.5/configure	2007-02-23 14:03:55.000000000 +0200
>+@@ -10147,8 +10147,6 @@
>+     LINGUAS="${LINGUAS-%UNSET%}"
>+ 
>+ 
>+-  install_sh="$install_sh"
>+-
>+ _ACEOF
>+ 
>+ 
>+@@ -11265,14 +11263,10 @@
>+       esac
>+     done ;;
>+     gettext-fix )
>+-  sed -e '/^mkinstalldirs *=/a\' \
>+-      -e "install_sh=$install_sh" \
>+-      -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
>++  sed -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
>+       intl/Makefile > intl/Makefile.tmp
>+   mv intl/Makefile.tmp intl/Makefile
>+-  sed -e '/^mkinstalldirs *=/a\' \
>+-      -e "install_sh=$install_sh" \
>+-      -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
>++  sed -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
>+       po/Makefile > po/Makefile.tmp
>+   mv po/Makefile.tmp po/Makefile ;;
>+   esac

It is not immediately apparent to me why you need this patch. Please
elaborate.

>diff -Nru buildroot/package/sed/sed.mk buildroot-devel/package/sed/sed.mk
>--- buildroot/package/sed/sed.mk	2007-02-22 10:50:29.000000000 +0200
>+++ buildroot-devel/package/sed/sed.mk	2007-02-24 17:05:12.000000000 +0200
>@@ -18,6 +18,7 @@
> HOST_SED_DIR:=$(TOOL_BUILD_DIR)
> SED:=$(HOST_SED_DIR)/bin/sed -i -e
> HOST_SED_TARGET=$(shell package/sed/sedcheck.sh)
>+HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
> 
> $(DL_DIR)/$(SED_SOURCE):
> 	mkdir -p $(DL_DIR)
>@@ -35,13 +36,13 @@
> 	mkdir -p $(TOOL_BUILD_DIR)
> 	mkdir -p $(HOST_SED_DIR)/bin;
> 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
>+	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
> 	touch $(SED_DIR1)/.unpacked
> 
> $(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
> 	(cd $(SED_DIR1); rm -rf config.cache; \
> 		./configure \
> 		--prefix=$(HOST_SED_DIR) \
>-		--prefix=/usr \
> 	);
> 	touch $(SED_DIR1)/.configured
> 
>@@ -62,17 +63,10 @@
> 		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; fi
> 
> use-sed-host-binary:
>-	@if [ -x /usr/bin/sed ] ; then \
>-		SED="/usr/bin/sed" ; \
>-	else \
>-		if [ -x /bin/sed ] ; then \
>-			SED="/bin/sed" ; \
>-		fi \
>-	fi ; \
>-	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
>+	@if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \

Please do not hide away these commands.

> 		mkdir -p "$(HOST_SED_DIR)/bin"; \
> 		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
>-		ln -sf "$$SED" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
>+		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
> 	fi
> 
> host-sed: $(HOST_SED_TARGET)
