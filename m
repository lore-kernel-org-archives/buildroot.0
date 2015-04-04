From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 16:39:51 +0200
Subject: [Buildroot] [git commit] open-plc-utils: new package
Message-ID: <20150404144244.E485581901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cd5f00a011fe8d3c4a010a40e0c90e700f952d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - rename to open-plc-utils to match upstream name.
  - fix Config.in to use tabs instead of spaces
  - remove 'default n' line
  - add dependency on BR2_USE_MMU
  - bump to a more recent upstream commit
  - remove no longer needed openplc-0002-Remove-vfprintf-call.patch
  - rename patch to the proper naming convention
  - specify <pkg>_LICENSE_FILES
  - pass CROSS= instead of CC=
  - do not pass CC= at install time.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...ve-OWNER-and-GROUPS-parameters-to-install.patch |  313 ++++++++++++++++++++
 package/open-plc-utils/Config.in                   |    7 +
 package/open-plc-utils/open-plc-utils.mk           |   22 ++
 4 files changed, 343 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c103854..702de90 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1203,6 +1203,7 @@ endif
 	source "package/odhcp6c/Config.in"
 	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
+	source "package/open-plc-utils/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
 	source "package/openssh/Config.in"
diff --git a/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch b/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
new file mode 100644
index 0000000..061b3a6
--- /dev/null
+++ b/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
@@ -0,0 +1,313 @@
+From fdfeac7e77382ddd0e3fb4f2abeae84f0a31584f Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+Date: Tue, 30 Sep 2014 13:46:59 +0200
+Subject: [PATCH] Remove OWNER and GROUPS parameters to install
+
+The Install tries to change the owner and groups of the binary. In
+Buildroot we don't want that, since fakeroot will do its job when we
+finalize the rootfs.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+---
+ docbook/Makefile  | 4 ++--
+ ether/Makefile    | 8 ++++----
+ iso15118/Makefile | 8 ++++----
+ key/Makefile      | 8 ++++----
+ mdio/Makefile     | 8 ++++----
+ mme/Makefile      | 8 ++++----
+ nvm/Makefile      | 8 ++++----
+ pib/Makefile      | 8 ++++----
+ plc/Makefile      | 8 ++++----
+ ram/Makefile      | 8 ++++----
+ scripts/Makefile  | 4 ++--
+ serial/Makefile   | 8 ++++----
+ slac/Makefile     | 8 ++++----
+ tools/Makefile    | 2 +-
+ 14 files changed, 49 insertions(+), 49 deletions(-)
+
+diff --git a/docbook/Makefile b/docbook/Makefile
+index d630822..23a9b5a 100755
+--- a/docbook/Makefile
++++ b/docbook/Makefile
+@@ -32,9 +32,9 @@ manuals:
+ 	${SHELL} ../docbook/manuals
+ scripts:
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${LIBRARY}
++	install -m ${DIR_PERM} -d ${LIBRARY}
+ install: library
+-	if [ -d ${LIBRARY} ]; then install -m ${WWW_PERM} -o ${OWNER} -g ${GROUP} *.html *.css *.png ${LIBRARY}; fi
++	if [ -d ${LIBRARY} ]; then install -m ${WWW_PERM} *.html *.css *.png ${LIBRARY}; fi
+ uninstall:
+ 	rm -f ${LIBRARY}/*.c.html ${LIBRARY}/*.h.html ${LIBRARY}/*.1.html
+ setup:
+diff --git a/ether/Makefile b/ether/Makefile
+index 807cbcb..574050a 100755
+--- a/ether/Makefile
++++ b/ether/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS) library
+-	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${SUID_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f ${TOOLS}
+ check:
+diff --git a/iso15118/Makefile b/iso15118/Makefile
+index 72afdc4..da11a1c 100755
+--- a/iso15118/Makefile
++++ b/iso15118/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	if [ ! -d ${MAN} ]; then install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}; fi
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	if [ ! -d ${MAN} ]; then install -m ${DIR_PERM} -d ${MAN}; fi
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: compile library
+-	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${SUID_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f plc ${TOOLS}
+ 	cd ${MAN}; rm -f plc ${PAGES}
+diff --git a/key/Makefile b/key/Makefile
+index 7de75ff..ee8968c 100755
+--- a/key/Makefile
++++ b/key/Makefile
+@@ -28,13 +28,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS)
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f ${TOOLS}
+ 	cd ${MAN}; rm -f ${PAGES}
+diff --git a/mdio/Makefile b/mdio/Makefile
+index 60a75a9..062d858 100755
+--- a/mdio/Makefile
++++ b/mdio/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS) library
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f int6k ${TOOLS}
+ 	cd ${MAN}; rm -f int6k ${PAGES}
+diff --git a/mme/Makefile b/mme/Makefile
+index d6a9132..23f4775 100755
+--- a/mme/Makefile
++++ b/mme/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS) library
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f ${TOOLS}
+ check:
+diff --git a/nvm/Makefile b/nvm/Makefile
+index 5ae47d2..d7f4037 100755
+--- a/nvm/Makefile
++++ b/nvm/Makefile
+@@ -28,12 +28,12 @@ compact: compile
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ install: $(TOOLS) library
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f ${TOOLS}
+ check:
+diff --git a/pib/Makefile b/pib/Makefile
+index 3af94c8..908b03a 100644
+--- a/pib/Makefile
++++ b/pib/Makefile
+@@ -30,12 +30,12 @@ compact: compile
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ install: $(TOOLS) library
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f ${TOOLS}
+ check:
+diff --git a/plc/Makefile b/plc/Makefile
+index bd8b806..5b41c0b 100644
+--- a/plc/Makefile
++++ b/plc/Makefile
+@@ -32,13 +32,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS) library
+-	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${SUID_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f int6k ${TOOLS}
+ 	cd ${MAN}; rm -f int6k ${PAGES}
+diff --git a/ram/Makefile b/ram/Makefile
+index 60b9bb3..c951218 100755
+--- a/ram/Makefile
++++ b/ram/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS) library
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f ${TOOLS}
+ 	cd ${MAN}; rm -f ${PAGES}
+diff --git a/scripts/Makefile b/scripts/Makefile
+index c9a785a..022e5f9 100755
+--- a/scripts/Makefile
++++ b/scripts/Makefile
+@@ -30,8 +30,8 @@ all compile:
+ install:
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ library:
+ uninstall:
+ clean:
+diff --git a/serial/Makefile b/serial/Makefile
+index c25f1a6..6420d4a 100755
+--- a/serial/Makefile
++++ b/serial/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: $(TOOLS) library
+-	install -m ${BIN_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${BIN_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f int6k ${TOOLS}
+ 	cd ${MAN}; rm -f int6k ${PAGES}
+diff --git a/slac/Makefile b/slac/Makefile
+index d69da17..449f20a 100755
+--- a/slac/Makefile
++++ b/slac/Makefile
+@@ -27,13 +27,13 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+-	if [ ! -d ${MAN} ]; then install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}; fi
+-	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
++	if [ ! -d ${MAN} ]; then install -m ${DIR_PERM} -d ${MAN}; fi
++	install -m ${MAN_PERM} ${PAGES} ${MAN}
+ install: compile library
+-	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
++	install -m ${SUID_PERM} ${TOOLS} ${BIN}
+ uninstall:
+ 	cd ${BIN}; rm -f plc ${TOOLS}
+ 	cd ${MAN}; rm -f plc ${PAGES}
+diff --git a/tools/Makefile b/tools/Makefile
+index 1d992cf..f17db3d 100755
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -27,7 +27,7 @@ compact: compile
+ 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
+ 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
+ library:
+-	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
++	install -m ${DIR_PERM} -d ${BIN}
+ scripts:
+ manuals:
+ #	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
+--
+2.1.0
diff --git a/package/open-plc-utils/Config.in b/package/open-plc-utils/Config.in
new file mode 100644
index 0000000..8ae3504
--- /dev/null
+++ b/package/open-plc-utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPEN_PLC_UTILS
+	bool "open-plc-utils"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Open version of the Qualcomm Atheros Powerline Toolkit
+
+	  https://github.com/qca/open-plc-utils
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
new file mode 100644
index 0000000..e7c5a6f
--- /dev/null
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# open-plc-utils
+#
+################################################################################
+
+OPEN_PLC_UTILS_VERSION = 1f6e7e372b313cf570aa63314037588ed01ec0de
+OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
+OPEN_PLC_UTILS_LICENSE = BSD-3c
+OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
+
+# We unfortunately can't use TARGET_CONFIGURE_OPTS, as it would
+# override the package CFLAGS, LDFLAGS and CXXFLAGS definitions.
+define OPEN_PLC_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) -C $(@D)
+endef
+
+define OPEN_PLC_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) ROOTFS=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
