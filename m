From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 05:29:34 -0500
Subject: [Buildroot] [PATCH] toolchain: add an unused ELF library cleaner
Message-ID: <1290248974-16161-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we install all the shared ELF libraries that are available
to the toolchain.  Often times, many of these libraries are unused in
the final build image.  So rather than forcing people to create their
own hardcoded list of libs they want to remove, add a helper script
that automatically scans the target rootfs and removes all libraries
that other ELFs in the rootfs do not need.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile                      |    6 ++++
 toolchain/toolchain-common.in |    6 ++++
 toolchain/trim-libs.sh        |   67 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100755 toolchain/trim-libs.sh

diff --git a/Makefile b/Makefile
index e351e79..f4b370f 100644
--- a/Makefile
+++ b/Makefile
@@ -406,6 +406,9 @@ $(TARGET_DIR): $(BUILD_DIR)/.root
 erase-fakeroots:
 	rm -f $(BUILD_DIR)/.fakeroot*
 
+ifeq ($(BR2_INSTALL_ELF_CLEANUP),y)
+target-finalize: host-pax-utils
+endif
 target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
@@ -424,6 +427,9 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || :
 endif
+ifeq ($(BR2_INSTALL_ELF_CLEANUP),y)
+	PATH="$(HOST_PATH)" toolchain/trim-libs.sh "$(TARGET_DIR)"
+endif
 	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index efb5863..2c8cd0d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -174,6 +174,12 @@ config BR2_INSTALL_LIBSTDCPP
 comment "C++ support broken in uClibc 0.9.31 with locale enabled with gcc 4.2"
 	depends on !BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31
 
+config BR2_INSTALL_ELF_CLEANUP
+	bool "Cull unused ELF shared libraries"
+	help
+	  Automatically scan the target rootfs and remove all ELF libraries
+	  that are not explicitly required by other ELF binaries.
+
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-pipe"
diff --git a/toolchain/trim-libs.sh b/toolchain/trim-libs.sh
new file mode 100755
index 0000000..b9a2264
--- /dev/null
+++ b/toolchain/trim-libs.sh
@@ -0,0 +1,67 @@
+#!/bin/bash
+
+set -e
+
+has() { [[ " ${*:2} " == *" "$1" "* ]] ; }
+
+v=
+vecho() { [ -z "$v" ] || echo "$*" ; }
+
+if [ -z "${ROMFSDIR}" ] ; then
+	if [ -d "$1" ] ; then
+		ROMFSDIR=$1
+	else
+		echo "ERROR: no dir specified (arg or \$ROMFSDIR)"
+		exit 1
+	fi
+fi
+
+if ! scanelf -V > /dev/null ; then
+	echo "ERROR: you do not have pax-utils installed"
+	exit 1
+fi
+
+cd "${ROMFSDIR}"
+libs=$(scanelf -F'%n#f' -qR bin sbin usr | sed 's:[, ]:\n:g' | sort -u)
+if [ -z "$libs" ] ; then
+	# all FLAT system, so leave libs alone
+	exit 0
+fi
+cd lib
+
+addlibs() {
+	newlibs=$( (echo $libs; scanelf -F'%n#f' -qR ${libs}) | sed 's:[, ]:\n:g' | sort -u)
+	newlibs=$(echo $newlibs)
+	[ "$newlibs" != "$libs" ] || return 0
+	libs=$newlibs
+	addlibs
+}
+addlibs
+
+# nptl like to dlopen() the libgcc_s.so library but not link against it,
+# so make sure we do not prune it if we might possibly need it
+if has "libpthread.so.*" ${libs} ; then
+	if ! has "libgcc_s.so.*" ${libs} ; then
+		libs="${libs} $(echo libgcc_s.so.*)"
+	fi
+fi
+
+(
+find . -maxdepth 1 -type l -printf '%P\n'
+find . -maxdepth 1 -type f -printf '%P\n'
+) | \
+while read l ; do
+	if has ${l} ${libs} ; then
+		if [ -L "${l}" ] ; then
+			vecho "delinking $l"
+			cp "$l" "../.$l"
+			rm "$l"
+			mv "../.$l" "$l"
+		else
+			vecho "keeping $l"
+		fi
+	else
+		vecho "trimming $l"
+		rm "${l}"
+	fi
+done
-- 
1.7.3.2
