From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 15 Jan 2013 17:47:09 +0100
Subject: [Buildroot] [PATCH 2/3] Add main scripts for opkg repository
	building.
In-Reply-To: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
References: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
Message-ID: <1358268430-2431-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These scripts are called during installation of packages.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-generic.mk      |    2 +
 support/scripts/ipk-post.sh |   95 +++++++++++++++++++++++++++++++++++++++++++
 support/scripts/ipk-pre.sh  |   30 ++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100755 support/scripts/ipk-post.sh
 create mode 100755 support/scripts/ipk-pre.sh

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 59de0f0..b0eca0a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -140,12 +140,14 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
+	$(if $(BR2_TARGET_ROOTFS_IPK_REPO),support/scripts/ipk-pre.sh $(TARGET_DIR) $(BUILD_DIR) $($(PKG)_DIR_PREFIX) $($(PKG)_RAWNAME) $($(PKG)_VERSION)) $(ARCH)
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(if $(BR2_TARGET_ROOTFS_IPK_REPO),support/scripts/ipk-post.sh $(TARGET_DIR) $(BUILD_DIR) $($(PKG)_DIR_PREFIX) $($(PKG)_RAWNAME) $($(PKG)_VERSION)) $(ARCH)
 	$(Q)touch $@
 
 # Clean package
diff --git a/support/scripts/ipk-post.sh b/support/scripts/ipk-post.sh
new file mode 100755
index 0000000..a5beacb
--- /dev/null
+++ b/support/scripts/ipk-post.sh
@@ -0,0 +1,95 @@
+#!/bin/bash
+#
+# Licence: GPL
+# Created: 2013-01-15 15:26:45+01:00
+# Main authors:
+#     - J?r?me Pouiller <jezz@sysmic.org>
+#
+# Second part of package building.
+#
+# Kill previously launched daemon. Using daemon result, create ipk files of 
+# package.
+#
+
+TARGET_DIR=$1
+BUILD_DIR=$2
+PACKAGES_DIR=$3
+PKG_RAWNAME=$4
+PKG_VERSION=$5
+ARCH=$6
+PKG_DIR=$PACKAGES_DIR/$PKG_RAWNAME
+PKG_BUILD_DIR=$BUILD_DIR/$PKG_RAWNAME-$PKG_VERSION
+IPK_DIR=$BUILD_DIR/ipk_build
+PKG=$PKG_RAWNAME
+
+kill $(cat $PKG_BUILD_DIR/.ipk_inotify_pid)
+
+# Create DEBIAN/control files
+for P in $PKG $PKG-i18n $PKG-doc $PKG-dbg $PKG-dev; do
+    rm -fr $IPK_DIR/$P
+    mkdir -p $IPK_DIR/$P/DEBIAN
+    (
+	echo "Package: $P"
+	echo "Version: $PKG_VERSION"
+	echo "Architecture: $ARCH"
+	echo "Maintainer: J?r?me Pouiller <jezz@sysmic.org>"
+	[ $P == $PKG-i18n ] && echo "Depends: $PKG"
+	[ $P == $PKG-dev  ] && echo "Depends: $PKG"
+	[ $P == $PKG-dbg  ] && echo "Depends: $PKG"
+	[ $P == $PKG-doc  ] && echo "Recommends: $PKG"
+	echo "Description: $PKG"
+	[ $P == $PKG-i18n ] &&  echo -e "	.\n	This package contains locales files"
+	[ $P == $PKG-dev  ] &&  echo -e "	.\n	This package contains developement files"
+	[ $P == $PKG-dbg  ] &&  echo -e "	.\n	This package contains debug symbols"
+	[ $P == $PKG-doc  ] &&  echo -e "	.\n	This package contains documentation"
+	echo 
+    ) > $IPK_DIR/$P/DEBIAN/control
+done
+
+# Place application files in package trees
+cut -f 2 $PKG_BUILD_DIR/.ipk_list_installed_files | sort | uniq | while read FILE_FULL; do 
+  FILE=${FILE_FULL##$TARGET_DIR/}
+  DIR=${FILE%/*}
+  [[ -e $FILE_FULL ]] || continue
+  [[ -d $FILE_FULL ]] && continue
+  case /$FILE in
+    /usr/include/*|*.a|*.la|/usr/lib/pkgconfig/*|/usr/share/aclocal/*)
+      mkdir -p $IPK_DIR/$PKG-dev/$DIR
+      cp -pd $FILE_FULL $IPK_DIR/$PKG-dev/$FILE
+      ;;
+    /bin/*|/sbin/*|/lib/*.so*|/usr/bin/*|/usr/sbin/*|/usr/lib/*.so*)
+      mkdir -p $IPK_DIR/$PKG/$DIR
+      if [[ -L $FILE_FULL ]]; then
+          cp -pd $FILE_FULL $IPK_DIR/$PKG/$FILE
+      else 
+          mkdir -p $IPK_DIR/$PKG-dbg/$DIR
+          strip $FILE_FULL -o $IPK_DIR/$PKG-dbg/$FILE.dbg --only-keep-debug
+          if [[ /$FILE == *thread*.so* ]]; then
+            strip $FILE_FULL -o $IPK_DIR/$PKG/$FILE --strip-debug
+          else
+            strip $FILE_FULL -o $IPK_DIR/$PKG/$FILE
+          fi
+      fi
+      ;;
+    /usr/*doc/*|/usr/*man/*|/usr/*info/*|/usr/*gtk-doc/*)
+      mkdir -p $IPK_DIR/$PKG-doc/$DIR
+      cp -pd $FILE_FULL $IPK_DIR/$PKG-doc/$FILE
+      ;;
+    /usr/share/locale/*)
+      mkdir -p $IPK_DIR/$PKG-i18n/$DIR
+      cp -pd $FILE_FULL $IPK_DIR/$PKG-i18n/$FILE
+      ;;
+    *)
+      mkdir -p $IPK_DIR/$PKG/$DIR
+      cp -pd $FILE_FULL $IPK_DIR/$PKG/$FILE
+      ;;
+  esac
+done
+
+# Create .deb (same than .ipk) file
+mkdir -p $BUILD_DIR/../images/ipk_repository
+for P in $PKG $PKG-i18n $PKG-doc $PKG-dbg $PKG-dev; do
+   if [[ $(ls $IPK_DIR/$P | wc -l) -gt 1 ]]; then 
+       dpkg-deb -b $IPK_DIR/$P $BUILD_DIR/../images/ipk_repository
+   fi
+done
diff --git a/support/scripts/ipk-pre.sh b/support/scripts/ipk-pre.sh
new file mode 100755
index 0000000..27a7b6b
--- /dev/null
+++ b/support/scripts/ipk-pre.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+#
+# Licence: GPL
+# Created: 2013-01-15 15:25:52+01:00
+# Main authors:
+#     - J?r?me Pouiller <jezz@sysmic.org>
+# 
+# First part of package building.
+#
+# It launches a daemon to spy write acces to target. Results are written to 
+# .ipk_list_installed_files in build subdirectory of package.
+#
+
+TARGET_DIR=$1
+BUILD_DIR=$2
+PACKAGES_DIR=$3
+PKG_RAWNAME=$4
+PKG_VERSION=$5
+PKG_DIR=$PACKAGES_DIR/$PKG_RAWNAME
+PKG_BUILD_DIR=$BUILD_DIR/$PKG_RAWNAME-$PKG_VERSION
+IPK_DIR=$BUILD_DIR/ipk_build
+PKG=$PKG_RAWNAME
+
+inotifywait -mr $TARGET_DIR -e create -e modify -e moved_to --format '%e	%w%f' >  $PKG_BUILD_DIR/.ipk_list_installed_files &
+echo $! > $PKG_BUILD_DIR/.ipk_inotify_pid
+# FIXME Be sure inotifywait is started
+#sleep 3
+
+
+
-- 
1.7.9.5
