From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:35 +0200
Subject: [Buildroot] [PATCH 01/50] package/busybox: backport upstream patch
 to fix install-noclobber
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <2222ddf7fb0c17011ad26da66ff6fa5664f66240.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we shoehorn the noclobber option with a sed call, but
upstream has applied a set of 4 patches that adds support to do
an install without clobbering.

Backport those patches, and use the new install rule.

Note that the 3rd and 6th patches do not seem like they would be usefull
to backport, but a user may well have a custom config that enables shell
wrappers, or installs no wrapper (to install then at runtime), so it
still makes sense to backport them (especially since the 3rd was part of
the noclobber series upstream, and the 6th, a fix of it).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...tall-respect-noclobber-for-script-wrapper.patch | 62 +++++++++++++++++++++
 ...stall-accept-more-than-one-install-option.patch | 63 +++++++++++++++++++++
 ...m-add-rule-to-install-without-cloberring-.patch | 29 ++++++++++
 ...lets-install-don-t-try-to-install-nothing.patch | 65 ++++++++++++++++++++++
 package/busybox/busybox.mk                         |  8 +--
 5 files changed, 220 insertions(+), 7 deletions(-)
 create mode 100644 package/busybox/0003-applets-install-respect-noclobber-for-script-wrapper.patch
 create mode 100644 package/busybox/0004-applets-install-accept-more-than-one-install-option.patch
 create mode 100644 package/busybox/0005-build-system-add-rule-to-install-without-cloberring-.patch
 create mode 100644 package/busybox/0006-applets-install-don-t-try-to-install-nothing.patch

diff --git a/package/busybox/0003-applets-install-respect-noclobber-for-script-wrapper.patch b/package/busybox/0003-applets-install-respect-noclobber-for-script-wrapper.patch
new file mode 100644
index 0000000000..9ac3186ccb
--- /dev/null
+++ b/package/busybox/0003-applets-install-respect-noclobber-for-script-wrapper.patch
@@ -0,0 +1,62 @@
+From 84be5ce0d814780918771727e494fe4a2eb46636 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 28 Dec 2017 23:49:47 +0100
+Subject: [PATCH] applets/install: respect noclobber for script wrappers too
+
+Simplify the handling of --noclobber so that it applies to all types of
+installation types, even to script wrappers.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ applets/install.sh | 20 ++++++++------------
+ 1 file changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/applets/install.sh b/applets/install.sh
+index f6c097e57..4b70df96e 100755
+--- a/applets/install.sh
++++ b/applets/install.sh
+@@ -77,6 +77,10 @@ install -m 755 busybox "$prefix/bin/busybox" || exit 1
+ for i in $h; do
+ 	appdir=`dirname "$i"`
+ 	app=`basename "$i"`
++	if [ "$noclobber" = "1" ] && [ -e "$prefix/$i" ]; then
++		echo "  $prefix/$i already exists"
++		continue
++	fi
+ 	mkdir -p "$prefix/$appdir" || exit 1
+ 	if [ "$scriptwrapper" = "y" ]; then
+ 		if [ "$swrapall" != "y" ] && [ "$i" = "/bin/sh" ]; then
+@@ -90,12 +94,8 @@ for i in $h; do
+ 	elif [ "$binaries" = "y" ]; then
+ 		# Copy the binary over rather
+ 		if [ -e $sharedlib_dir/$app ]; then
+-			if [ "$noclobber" = "0" ] || [ ! -e "$prefix/$i" ]; then
+-				echo "   Copying $sharedlib_dir/$app to $prefix/$i"
+-				cp -pPR $sharedlib_dir/$app $prefix/$i || exit 1
+-			else
+-				echo "  $prefix/$i already exists"
+-			fi
++			echo "   Copying $sharedlib_dir/$app to $prefix/$i"
++			cp -pPR $sharedlib_dir/$app $prefix/$i || exit 1
+ 		else
+ 			echo "Error: Could not find $sharedlib_dir/$app"
+ 			exit 1
+@@ -123,12 +123,8 @@ for i in $h; do
+ 			;;
+ 			esac
+ 		fi
+-		if [ "$noclobber" = "0" ] || [ ! -e "$prefix/$i" ]; then
+-			echo "  $prefix/$i -> $bb_path"
+-			ln $linkopts "$bb_path" "$prefix/$i" || exit 1
+-		else
+-			echo "  $prefix/$i already exists"
+-		fi
++		echo "  $prefix/$i -> $bb_path"
++		ln $linkopts "$bb_path" "$prefix/$i" || exit 1
+ 	fi
+ done
+ 
+-- 
+2.14.1
+
diff --git a/package/busybox/0004-applets-install-accept-more-than-one-install-option.patch b/package/busybox/0004-applets-install-accept-more-than-one-install-option.patch
new file mode 100644
index 0000000000..8bfb5d73fa
--- /dev/null
+++ b/package/busybox/0004-applets-install-accept-more-than-one-install-option.patch
@@ -0,0 +1,63 @@
+From 952d5a6024e7b2a6d5a351a8d1329bd985da3c76 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 28 Dec 2017 23:49:48 +0100
+Subject: [PATCH] applets/install: accept more than one install option
+
+Currently, it is impossible to pass more than one option to the isntall
+script, so it totally prevents using --noclobber.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ applets/install.sh | 28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/applets/install.sh b/applets/install.sh
+index 4b70df96e..ae99381d7 100755
+--- a/applets/install.sh
++++ b/applets/install.sh
+@@ -8,6 +8,7 @@ if [ -z "$prefix" ]; then
+ 	echo "usage: applets/install.sh DESTINATION [--symlinks/--hardlinks/--binaries/--scriptwrapper]"
+ 	exit 1
+ fi
++shift # Keep only remaining options
+ 
+ # Source the configuration
+ . ./.config
+@@ -21,18 +22,21 @@ scriptwrapper="n"
+ binaries="n"
+ cleanup="0"
+ noclobber="0"
+-case "$2" in
+-	--hardlinks)     linkopts="-f";;
+-	--symlinks)      linkopts="-fs";;
+-	--binaries)      binaries="y";;
+-	--scriptwrapper) scriptwrapper="y";swrapall="y";;
+-	--sw-sh-hard)    scriptwrapper="y";linkopts="-f";;
+-	--sw-sh-sym)     scriptwrapper="y";linkopts="-fs";;
+-	--cleanup)       cleanup="1";;
+-	--noclobber)     noclobber="1";;
+-	"")              h="";;
+-	*)               echo "Unknown install option: $2"; exit 1;;
+-esac
++while [ ${#} -gt 0 ]; do
++	case "$1" in
++		--hardlinks)     linkopts="-f";;
++		--symlinks)      linkopts="-fs";;
++		--binaries)      binaries="y";;
++		--scriptwrapper) scriptwrapper="y"; swrapall="y";;
++		--sw-sh-hard)    scriptwrapper="y"; linkopts="-f";;
++		--sw-sh-sym)     scriptwrapper="y"; linkopts="-fs";;
++		--cleanup)       cleanup="1";;
++		--noclobber)     noclobber="1";;
++		"")              h="";;
++		*)               echo "Unknown install option: $1"; exit 1;;
++	esac
++	shift
++done
+ 
+ if [ -n "$DO_INSTALL_LIBS" ] && [ "$DO_INSTALL_LIBS" != "n" ]; then
+ 	# get the target dir for the libs
+-- 
+2.14.1
+
diff --git a/package/busybox/0005-build-system-add-rule-to-install-without-cloberring-.patch b/package/busybox/0005-build-system-add-rule-to-install-without-cloberring-.patch
new file mode 100644
index 0000000000..b722a6da91
--- /dev/null
+++ b/package/busybox/0005-build-system-add-rule-to-install-without-cloberring-.patch
@@ -0,0 +1,29 @@
+From a47375de8c7b0f4dcb95097c8119ea47b6e2636c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 28 Dec 2017 23:49:49 +0100
+Subject: [PATCH] build system: add rule to install without cloberring
+ existing utilities
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ Makefile.custom | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile.custom b/Makefile.custom
+index 891c9ced7..28d0ef7bc 100644
+--- a/Makefile.custom
++++ b/Makefile.custom
+@@ -46,6 +46,9 @@ ifeq ($(strip $(CONFIG_FEATURE_SUID)),y)
+ 	@echo
+ endif
+ 
++install-noclobber: INSTALL_OPTS+=--noclobber
++install-noclobber: install
++
+ uninstall: busybox.links
+ 	rm -f $(CONFIG_PREFIX)/bin/busybox
+ 	for i in `cat busybox.links` ; do rm -f $(CONFIG_PREFIX)$$i; done
+-- 
+2.14.1
+
diff --git a/package/busybox/0006-applets-install-don-t-try-to-install-nothing.patch b/package/busybox/0006-applets-install-don-t-try-to-install-nothing.patch
new file mode 100644
index 0000000000..dd5b64039f
--- /dev/null
+++ b/package/busybox/0006-applets-install-don-t-try-to-install-nothing.patch
@@ -0,0 +1,65 @@
+From 296381ff4f69715ed880adcce7d5ce608153e767 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 15 Apr 2018 10:55:30 +0200
+Subject: [PATCH] applets/install: don't try to install nothing
+
+Commit 952d5a6024e7 (applets/install: accept more than one install
+option) changed the way we handle install options: before that commit, a
+missing install type would mean to install nothing; after, we would
+iterate over options, so we would never notice there was a mising
+option.
+
+Fix that by introducing an explicit --none option to specify to install
+nothing.
+
+Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
+Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
+Cc: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ Makefile.custom    | 3 +++
+ applets/install.sh | 6 ++++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.custom b/Makefile.custom
+index 28d0ef7bc..6f679c4e1 100644
+--- a/Makefile.custom
++++ b/Makefile.custom
+@@ -11,6 +11,9 @@ busybox.cfg.nosuid: $(srctree)/applets/busybox.mksuid $(objtree)/include/autocon
+ 	$(Q)-SUID="DROP" $(SHELL) $^ > $@
+ 
+ .PHONY: install
++ifeq ($(CONFIG_INSTALL_APPLET_DONT),y)
++INSTALL_OPTS:= --none
++endif
+ ifeq ($(CONFIG_INSTALL_APPLET_SYMLINKS),y)
+ INSTALL_OPTS:= --symlinks
+ endif
+diff --git a/applets/install.sh b/applets/install.sh
+index c75a78e9d..9aede0f53 100755
+--- a/applets/install.sh
++++ b/applets/install.sh
+@@ -5,7 +5,9 @@ export LC_CTYPE=POSIX
+ 
+ prefix=$1
+ if [ -z "$prefix" ]; then
+-	echo "usage: applets/install.sh DESTINATION [--symlinks/--hardlinks/--binaries/--scriptwrapper]"
++	echo "usage: applets/install.sh DESTINATION TYPE [OPTS ...]"
++	echo "  TYPE is one of: --symlinks --hardlinks --binaries --scriptwrapper --none"
++	echo "  OPTS is one or more of: --cleanup --noclobber"
+ 	exit 1
+ fi
+ shift # Keep only remaining options
+@@ -32,7 +34,7 @@ while [ ${#} -gt 0 ]; do
+ 		--sw-sh-sym)     scriptwrapper="y"; linkopts="-fs";;
+ 		--cleanup)       cleanup="1";;
+ 		--noclobber)     noclobber="1";;
+-		"")              h="";;
++		--none)          h="";;
+ 		*)               echo "Unknown install option: $1"; exit 1;;
+ 	esac
+ 	shift
+-- 
+2.14.1
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ba5a16b5b7..c566cdc3d6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -253,12 +253,6 @@ define BUSYBOX_INSTALL_ADD_TO_SHELLS
 endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
 
-# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
-# full-blown versions of apps installed by other packages with sym/hard links.
-define BUSYBOX_NOCLOBBER_INSTALL
-	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
-endef
-
 define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_PREFER_STATIC)
@@ -280,7 +274,7 @@ define BUSYBOX_BUILD_CMDS
 endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
-- 
2.14.1
