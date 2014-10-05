From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 22:02:42 +0200
Subject: [Buildroot] [RFC] openplc: new package
Message-ID: <1412539362-22336-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
This is sent as an RFC, because I'm really not sure about the patches.
I will send them upstream as soon as possible.
---
 package/Config.in                                  |   1 +
 package/openplc/Config.in                          |   8 +
 ...ve-OWNER-and-GROUPS-parameters-to-install.patch | 311 +++++++++++++++++++++
 .../openplc-0002-Remove-vfprintf-call.patch        |  50 ++++
 package/openplc/openplc.mk                         |  20 ++
 5 files changed, 390 insertions(+)
 create mode 100644 package/openplc/Config.in
 create mode 100644 package/openplc/openplc-0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
 create mode 100644 package/openplc/openplc-0002-Remove-vfprintf-call.patch
 create mode 100644 package/openplc/openplc.mk

diff --git a/package/Config.in b/package/Config.in
index f488728..78c61e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1046,6 +1046,7 @@ endif
 	source "package/olsr/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
+	source "package/openplc/Config.in"
 	source "package/openssh/Config.in"
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
diff --git a/package/openplc/Config.in b/package/openplc/Config.in
new file mode 100644
index 0000000..8227644
--- /dev/null
+++ b/package/openplc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_OPENPLC
+        bool "openplc"
+        default n
+        help
+          Open version of the Qualcomm Atheros Powerline Toolkit
+
+          https://github.com/qca/open-plc-utils
+
diff --git a/package/openplc/openplc-0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch b/package/openplc/openplc-0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
new file mode 100644
index 0000000..0f238be
--- /dev/null
+++ b/package/openplc/openplc-0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
@@ -0,0 +1,311 @@
+From fdfeac7e77382ddd0e3fb4f2abeae84f0a31584f Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+Date: Tue, 30 Sep 2014 13:46:59 +0200
+Subject: [PATCH 1/2] Remove OWNER and GROUPS parameters to install
+
+The Install tries to change the owner and groups of the binary. In
+Buildroot we don't want that, since fakeroot will do its job when we
+finalize the rootfs.
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
diff --git a/package/openplc/openplc-0002-Remove-vfprintf-call.patch b/package/openplc/openplc-0002-Remove-vfprintf-call.patch
new file mode 100644
index 0000000..1e43a30
--- /dev/null
+++ b/package/openplc/openplc-0002-Remove-vfprintf-call.patch
@@ -0,0 +1,50 @@
+From 8c5f998c2a24be14e00c26741f20b4d546f6a0e6 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 30 Sep 2014 16:00:28 +0200
+Subject: [PATCH 2/2] Remove vfprintf call
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The way it's used, the third arguments cause a warning which cause an
+error:
+
+../mme/ARPCPrint.c:122:2: error: incompatible type for argument 3 of
+???vfprintf???
+  vfprintf (fp, (char *)(&data->LIST [LE16TOH (data->STROFFSET)]), (void
+  *)(&data->LIST [LE16TOH (data->ARGOFFSET)]));
+    ^
+    In file included from ../mme/ARPCPrint.c:68:0:
+    note: expected ???__gnuc_va_list??? but argument is of type ???void *???
+---
+ mme/ARPCPrint.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/mme/ARPCPrint.c b/mme/ARPCPrint.c
+index 6e7ef48..5e9c89d 100644
+--- a/mme/ARPCPrint.c
++++ b/mme/ARPCPrint.c
+@@ -108,8 +108,6 @@ void ARPCPrint (FILE * fp, void const * memory, size_t extent)
+ 		argp++;
+ 	}
+
+-#if defined (__UCLIBC__) || defined (__FREESCALE__)
+-
+ /*
+  *	This is a temporary fix so that we can compile program plctest for the PL16; A better solution is needed;
+  */
+@@ -117,12 +115,6 @@ void ARPCPrint (FILE * fp, void const * memory, size_t extent)
+ 	argp = (uint32_t *)(&data->LIST [LE16TOH (data->ARGOFFSET)]);
+ 	fprintf (fp, (char *)(&data->LIST [LE16TOH (data->STROFFSET)]), argp [0], argp [1], argp [2], argp [3], argp [4], argp [5], argp [6], argp [7], argp [8], argp [9], argp [10], argp [11], argp [12], argp [13], argp [14], argp [15], argp [16], argp [17], argp [18], argp [19], argp [20], argp [21], argp [22], argp [23], argp [24], argp [25], argp [26], argp [27], argp [28], argp [29], argp [30], argp [31], argp [32], argp [33], argp [34], argp [35], argp [36], argp [37], argp [38], argp [39]);
+
+-#else
+-
+-	vfprintf (fp, (char *)(&data->LIST [LE16TOH (data->STROFFSET)]), (void *)(&data->LIST [LE16TOH (data->ARGOFFSET)]));
+-
+-#endif
+-
+ 	fprintf (fp, "\n");
+ 	fflush (fp);
+ 	return;
+--
+2.1.0
diff --git a/package/openplc/openplc.mk b/package/openplc/openplc.mk
new file mode 100644
index 0000000..463fe0e
--- /dev/null
+++ b/package/openplc/openplc.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# openplc
+#
+################################################################################
+
+OPENPLC_VERSION = 624ed6
+OPENPLC_SITE = $(call github,qca,open-plc-utils,$(OPENPLC_VERSION))
+OPENPLC_LICENSE = BSD-3c
+
+define OPENPLC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define OPENPLC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) ROOTFS=$(TARGET_DIR) \
+		CC="$(TARGET_CC)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.1.1
