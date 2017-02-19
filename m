From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Feb 2017 14:18:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/cwiid: bump version
Message-ID: <20170219131834.27844-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kodi needs CWIID_MESG_BALANCE
https://github.com/xbmc/xbmc/blob/Krypton/tools/EventClients/Clients/WiiRemote/CWIID_WiiRemote.cpp#L106

It was added after the last cwiid release, which took place 2009:
https://github.com/abstrakraft/cwiid/commit/2174214bc2caca51aa49a47025ccb80b3f75e53f

Instead of adding another 20k-sized patch we switch to the upstream
github repo and bump to its HEAD commit, dating back to 2010.

By doing this we can remove two patches which were applied upstream:

0001-fix-link-options-for-as-needed-90.patch
https://github.com/abstrakraft/cwiid/commit/6af678616531eb1f3d3d0a052313ef9d8125bac7

0002-Update-for-BlueZ-changes.patch
https://github.com/abstrakraft/cwiid/commit/c5dd7d4a9af5a7d8ead8ad26d9e5e0f8f8292d29

The remaining patches were renumbered.

This patch is needed for the upcoming Kodi version bump which also adds
optional cwiid support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-fix-link-options-for-as-needed-90.patch   | 166 ---------------------
 ...inking-by-adding-the-missing-lbluetooth-.patch} |   0
 package/cwiid/0002-Update-for-BlueZ-changes.patch  |  28 ----
 ...0002-configure-make-wmgui-build-optional.patch} |   0
 package/cwiid/cwiid.hash                           |   2 +-
 package/cwiid/cwiid.mk                             |   5 +-
 6 files changed, 3 insertions(+), 198 deletions(-)
 delete mode 100644 package/cwiid/0001-fix-link-options-for-as-needed-90.patch
 rename package/cwiid/{0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch => 0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch} (100%)
 delete mode 100644 package/cwiid/0002-Update-for-BlueZ-changes.patch
 rename package/cwiid/{0004-configure-make-wmgui-build-optional.patch => 0002-configure-make-wmgui-build-optional.patch} (100%)

diff --git a/package/cwiid/0001-fix-link-options-for-as-needed-90.patch b/package/cwiid/0001-fix-link-options-for-as-needed-90.patch
deleted file mode 100644
index 806ddaa3f..000000000
--- a/package/cwiid/0001-fix-link-options-for-as-needed-90.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 6af678616531eb1f3d3d0a052313ef9d8125bac7 Mon Sep 17 00:00:00 2001
-From: "L. Donnie Smith" <donnie.smith@gatech.edu>
-Date: Thu, 4 Feb 2010 22:53:41 -0500
-Subject: [PATCH] fix link options for --as-needed (#90)
-
-also fix a couple of includes
----
- common/include/app.mak    | 2 +-
- common/include/lib.mak.in | 4 ++--
- common/include/plugin.mak | 2 +-
- lswm/Makefile.in          | 2 +-
- python/Makefile.in        | 2 +-
- python/Wiimote.c          | 2 +-
- python/cwiidmodule.c      | 2 +-
- wmdemo/wmdemo.c           | 1 +
- wmgui/Makefile.in         | 2 +-
- wminput/Makefile.in       | 2 +-
- wminput/main.c            | 1 +
- 11 files changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/common/include/app.mak b/common/include/app.mak
-index f00cf12..c26d0ff 100644
---- a/common/include/app.mak
-+++ b/common/include/app.mak
-@@ -10,7 +10,7 @@ DEST_INST_DIR = $(ROOTDIR)$(INST_DIR)
- all: $(APP_NAME)
- 
- $(APP_NAME): $(OBJECTS)
--	$(CC) -o $@ $(OBJECTS) $(LDFLAGS) $(LDLIBS)
-+	$(CC) $(LDFLAGS) -o $@ $(OBJECTS) $(LDLIBS)
- 
- install: $(APP_NAME)
- 	install -D $(APP_NAME) $(DEST_INST_DIR)/$(APP_NAME)
-diff --git a/common/include/lib.mak.in b/common/include/lib.mak.in
-index 5e81ff3..3afbb14 100644
---- a/common/include/lib.mak.in
-+++ b/common/include/lib.mak.in
-@@ -25,8 +25,8 @@ $(STATIC_LIB): $(OBJECTS)
- 	ar rcs $(STATIC_LIB) $(OBJECTS)
- 
- $(SHARED_LIB): $(OBJECTS)
--	$(CC) -shared -Wl,-soname,$(SO_NAME) $(LDFLAGS) $(LDLIBS) \
--	      -o $(SHARED_LIB) $(OBJECTS)
-+	$(CC) -shared -Wl,-soname,$(SO_NAME) $(LDFLAGS) -o $(SHARED_LIB) \
-+	      $(OBJECTS) $(LDLIBS)
- 
- install: install_header install_static install_shared
- 
-diff --git a/common/include/plugin.mak b/common/include/plugin.mak
-index 0f61502..a2d5c85 100644
---- a/common/include/plugin.mak
-+++ b/common/include/plugin.mak
-@@ -16,7 +16,7 @@ DEST_INST_DIR = $(INST_DIR)
- all: $(LIB_NAME)
- 
- $(LIB_NAME): $(OBJECTS)
--	$(CC) -shared $(LDFLAGS) $(LDLIBS) -o $(LIB_NAME) $(OBJECTS)
-+	$(CC) -shared $(LDFLAGS) -o $(LIB_NAME) $(OBJECTS) $(LDLIBS)
- 
- install: $(LIB_NAME)
- 	install -D $(LIB_NAME) $(DEST_INST_DIR)/$(LIB_NAME)
-diff --git a/lswm/Makefile.in b/lswm/Makefile.in
-index 79e8b5b..017104f 100644
---- a/lswm/Makefile.in
-+++ b/lswm/Makefile.in
-@@ -8,7 +8,7 @@ SOURCES = lswm.c
- 
- CFLAGS += -I at top_builddir@/libcwiid
- LDFLAGS += -L at top_builddir@/libcwiid
--LDLIBS += -lcwiid
-+LDLIBS += -lcwiid -lbluetooth
- INST_DIR = @bindir@
- 
- include $(COMMON)/include/app.mak
-diff --git a/python/Makefile.in b/python/Makefile.in
-index 0d7efdf..0ca57ca 100644
---- a/python/Makefile.in
-+++ b/python/Makefile.in
-@@ -7,7 +7,7 @@ ifdef ROOTDIR
- endif
- 
- all:
--	$(PYTHON) setup.py build_ext $(DEBUGFLAGS) -I at top_builddir@/libcwiid -L at top_builddir@/libcwiid -lcwiid
-+	$(PYTHON) setup.py build_ext $(DEBUGFLAGS) -I at top_builddir@/libcwiid -L at top_builddir@/libcwiid -lcwiid -lbluetooth
- 
- install:
- 	$(PYTHON) setup.py install --install-lib=${libdir}/python at PYTHON_VERSION@/site-packages $(SET_ROOT_DIR)
-diff --git a/python/Wiimote.c b/python/Wiimote.c
-index 794e7e2..523185e 100644
---- a/python/Wiimote.c
-+++ b/python/Wiimote.c
-@@ -24,7 +24,7 @@
- #include "structmember.h"
- #include <errno.h>
- #include <bluetooth/bluetooth.h>
--#include "cwiid.h"
-+#include <cwiid.h>
- 
- #if (PY_VERSION_HEX < 0x02050000)
-   #ifndef PY_SSIZE_T_MIN
-diff --git a/python/cwiidmodule.c b/python/cwiidmodule.c
-index f6a8f33..a01ed82 100644
---- a/python/cwiidmodule.c
-+++ b/python/cwiidmodule.c
-@@ -24,7 +24,7 @@
- 
- #include <stdlib.h>
- 
--#include "cwiid.h"
-+#include <cwiid.h>
- #include "structmember.h"
- 
- /* externally defined types */
-diff --git a/wmdemo/wmdemo.c b/wmdemo/wmdemo.c
-index 70a25a1..b7aaa7f 100644
---- a/wmdemo/wmdemo.c
-+++ b/wmdemo/wmdemo.c
-@@ -2,6 +2,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- 
-+#include <bluetooth/bluetooth.h>
- #include <cwiid.h>
- 
- /* This is a sample program written to demonstrate basic CWiid libwiimote
-diff --git a/wmgui/Makefile.in b/wmgui/Makefile.in
-index 41b205e..14d1c1e 100644
---- a/wmgui/Makefile.in
-+++ b/wmgui/Makefile.in
-@@ -8,7 +8,7 @@ SOURCES = main.c interface.c support.c
- 
- CFLAGS += @GTK_CFLAGS@ -I at top_builddir@/libcwiid
- LDFLAGS += -L at top_builddir@/libcwiid
--LDLIBS += @GTK_LIBS@ -lm -lcwiid
-+LDLIBS += @GTK_LIBS@ -lcwiid -lbluetooth -lm
- INST_DIR = @bindir@
- 
- include $(COMMON)/include/app.mak
-diff --git a/wminput/Makefile.in b/wminput/Makefile.in
-index 009d4d5..d3c3679 100644
---- a/wminput/Makefile.in
-+++ b/wminput/Makefile.in
-@@ -14,7 +14,7 @@ CFLAGS += -I at top_builddir@/libcwiid \
- 	-DWMINPUT_CONFIG_DIR=\"$(WMINPUT_CONFIG_DIR)\" \
- 	-DCWIID_PLUGINS_DIR=\"$(CWIID_PLUGINS_DIR)\"
- 
--LDLIBS += -lcwiid -ldl
-+LDLIBS += -lcwiid -lbluetooth -ldl -lpthread
- LDFLAGS += -L at top_builddir@/libcwiid -rdynamic
- INST_DIR = @bindir@
- 
-diff --git a/wminput/main.c b/wminput/main.c
-index c3a7445..bbc98d9 100644
---- a/wminput/main.c
-+++ b/wminput/main.c
-@@ -30,6 +30,7 @@
- #include <signal.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <bluetooth/bluetooth.h>
- 
- #include <cwiid.h>
- 
--- 
-1.8.5.2
-
diff --git a/package/cwiid/0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch b/package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
similarity index 100%
rename from package/cwiid/0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
rename to package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
diff --git a/package/cwiid/0002-Update-for-BlueZ-changes.patch b/package/cwiid/0002-Update-for-BlueZ-changes.patch
deleted file mode 100644
index c0d78a8ac..000000000
--- a/package/cwiid/0002-Update-for-BlueZ-changes.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c5dd7d4a9af5a7d8ead8ad26d9e5e0f8f8292d29 Mon Sep 17 00:00:00 2001
-From: "L. Donnie Smith" <donnie.smith@gatech.edu>
-Date: Sun, 30 Nov 2008 22:34:08 +0000
-Subject: [PATCH] Update for BlueZ changes.
-
-git-svn-id: http://abstrakraft.org/cwiid/svn/trunk at 183 918edb2d-ff29-0410-9de2-eb38e7f22bc7
----
- libcwiid/bluetooth.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libcwiid/bluetooth.c b/libcwiid/bluetooth.c
-index 63284a8..e986f75 100644
---- a/libcwiid/bluetooth.c
-+++ b/libcwiid/bluetooth.c
-@@ -122,8 +122,8 @@ int cwiid_get_bdinfo_array(int dev_id, unsigned int timeout, int max_bdinfo,
- 		}
- 
- 		/* timeout (10000) in milliseconds */
--		if (hci_remote_name(sock, &dev_list[i].bdaddr, BT_NAME_LEN,
--		                    (*bdinfo)[bdinfo_count].name, 10000)) {
-+		if (hci_read_remote_name(sock, &dev_list[i].bdaddr, BT_NAME_LEN,
-+		                         (*bdinfo)[bdinfo_count].name, 10000)) {
- 			cwiid_err(NULL, "Bluetooth name read error");
- 			err = 1;
- 			goto CODA;
--- 
-1.8.5.2
-
diff --git a/package/cwiid/0004-configure-make-wmgui-build-optional.patch b/package/cwiid/0002-configure-make-wmgui-build-optional.patch
similarity index 100%
rename from package/cwiid/0004-configure-make-wmgui-build-optional.patch
rename to package/cwiid/0002-configure-make-wmgui-build-optional.patch
diff --git a/package/cwiid/cwiid.hash b/package/cwiid/cwiid.hash
index 749c9c3cf..6b38d55a2 100644
--- a/package/cwiid/cwiid.hash
+++ b/package/cwiid/cwiid.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8880378303d872ea65b037184ad6c96bc68f87764b503c152032f56344b5e81d	cwiid-0.6.00.tgz
+sha256 3adf3bf018721dee3c47e12ba4dd71810a239918dce925aa4079cb2a98bca5fe  cwiid-fadf11e89b579bcc0336a0692ac15c93785f3f82.tar.gz
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index 0cfc77479..36450c17e 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-CWIID_VERSION = 0.6.00
-CWIID_SOURCE = cwiid-$(CWIID_VERSION).tgz
-CWIID_SITE = http://abstrakraft.org/cwiid/downloads
+CWIID_VERSION = fadf11e89b579bcc0336a0692ac15c93785f3f82
+CWIID_SITE = $(call github,abstrakraft,cwiid,$(CWIID_VERSION))
 CWIID_LICENSE = GPLv2+
 CWIID_LICENSE_FILES = COPYING
 
-- 
2.11.0
