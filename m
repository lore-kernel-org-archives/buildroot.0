From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Sep 2020 21:37:58 +0200
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.0.1
Message-ID: <20200907193759.1503418-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patches are now useless
- https://github.com/hishamhm/htop/pull/770
	MakeHeader.py: Fix for non-utf8 environments
- https://github.com/hishamhm/htop/pull/981
	Fix gcc10

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...Panel-remove-0xe2-from-MetersPanel.c.patch |  52 ------
 ...ve-complation-issues-with-fno-common.patch | 173 ------------------
 package/htop/Config.in                        |   2 +-
 package/htop/htop.hash                        |   4 +-
 package/htop/htop.mk                          |   5 +-
 5 files changed, 6 insertions(+), 230 deletions(-)
 delete mode 100644 package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch
 delete mode 100644 package/htop/0002-Resolve-complation-issues-with-fno-common.patch

diff --git a/package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch b/package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch
deleted file mode 100644
index 81f9d1bd9..000000000
--- a/package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ae32d292ca641c08b6db8d2f7cfcce2a54d00835 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 20 Feb 2018 23:09:24 +0100
-Subject: [PATCH] MetersPanel: remove 0xe2 from MetersPanel.c
-
-This non ascii character trigger an issue with MakeHeader.py.
-
-./scripts/MakeHeader.py MetersPanel.c
-Traceback (most recent call last):
-  File "./scripts/MakeHeader.py", line 32, in <module>
-    for line in file.readlines():
-  File "[...]/output/host/lib/python3.6/encodings/ascii.py", line 26, in decode
-    return codecs.ascii_decode(input, self.errors)[0]
-UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 956: ordinal not in range(128)
-
-http://autobuild.buildroot.net/results/8ed/8edb78b054a265447fd0e83f67cba5f978be4ed6/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- MetersPanel.c | 2 +-
- MetersPanel.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/MetersPanel.c b/MetersPanel.c
-index 3cf3e07..47296a4 100644
---- a/MetersPanel.c
-+++ b/MetersPanel.c
-@@ -37,7 +37,7 @@ static const char* const MetersFunctions[] = {"Style ", "Move  ", "
- static const char* const MetersKeys[] = {"Space", "Enter", "  ", "Del", "F10"};
- static int MetersEvents[] = {' ', 13, ERR, KEY_DC, KEY_F(10)};
- 
--// We avoid UTF-8 arrows ? ? here as they might display full-width on Chinese
-+// We avoid UTF-8 arrows <- -> here as they might display full-width on Chinese
- // terminals, breaking our aligning.
- // In <http://unicode.org/reports/tr11/>, arrows (U+2019..U+2199) are
- // considered "Ambiguous characters".
-diff --git a/MetersPanel.h b/MetersPanel.h
-index e00169c..e80754a 100644
---- a/MetersPanel.h
-+++ b/MetersPanel.h
-@@ -29,7 +29,7 @@ struct MetersPanel_ {
- 
- // Note: In code the meters are known to have bar/text/graph "Modes", but in UI
- // we call them "Styles".
--// We avoid UTF-8 arrows ? ? here as they might display full-width on Chinese
-+// We avoid UTF-8 arrows <- -> here as they might display full-width on Chinese
- // terminals, breaking our aligning.
- // In <http://unicode.org/reports/tr11/>, arrows (U+2019..U+2199) are
- // considered "Ambiguous characters".
--- 
-2.14.3
-
diff --git a/package/htop/0002-Resolve-complation-issues-with-fno-common.patch b/package/htop/0002-Resolve-complation-issues-with-fno-common.patch
deleted file mode 100644
index 097a8df7e..000000000
--- a/package/htop/0002-Resolve-complation-issues-with-fno-common.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From dfd9279f87791e36a5212726781c31fbe7110361 Mon Sep 17 00:00:00 2001
-From: Nathan Scott <nathans@redhat.com>
-Date: Fri, 10 Jul 2020 10:35:32 +1000
-Subject: [PATCH] Resolve complation issues with -fno-common (default from
- gcc-10)
-
-Extends the MakeHeader script to auto-generate correct "extern"
-function declarations in some cases that it currently does not.
-
-Related to https://github.com/hishamhm/htop/pull/981
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/hishamhm/htop/commit/dfd9279f87791e36a5212726781c31fbe7110361.patch
----
- CRT.c                 |  4 ++--
- CRT.h                 | 28 ++++++++++++++--------------
- linux/LinuxProcess.c  |  3 ++-
- linux/LinuxProcess.h  | 19 ++++++++++---------
- scripts/MakeHeader.py |  4 +++-
- 5 files changed, 31 insertions(+), 27 deletions(-)
-
-diff --git a/CRT.c b/CRT.c
-index ca9a10dd..088cd1a4 100644
---- a/CRT.c
-+++ b/CRT.c
-@@ -131,9 +131,9 @@ typedef enum ColorElements_ {
-    LAST_COLORELEMENT
- } ColorElements;
- 
--void CRT_fatalError(const char* note) __attribute__ ((noreturn));
-+extern void CRT_fatalError(const char* note) __attribute__ ((noreturn));
- 
--void CRT_handleSIGSEGV(int sgn);
-+extern void CRT_handleSIGSEGV(int sgn);
- 
- #define KEY_ALT(x) (KEY_F(64 - 26) + (x - 'A'))
- 
-diff --git a/CRT.h b/CRT.h
-index 933fe068..bc3fb8b7 100644
---- a/CRT.h
-+++ b/CRT.h
-@@ -119,9 +119,9 @@ typedef enum ColorElements_ {
-    LAST_COLORELEMENT
- } ColorElements;
- 
--void CRT_fatalError(const char* note) __attribute__ ((noreturn));
-+extern void CRT_fatalError(const char* note) __attribute__ ((noreturn));
- 
--void CRT_handleSIGSEGV(int sgn);
-+extern void CRT_handleSIGSEGV(int sgn);
- 
- #define KEY_ALT(x) (KEY_F(64 - 26) + (x - 'A'))
- 
-@@ -140,7 +140,7 @@ extern const char **CRT_treeStr;
- 
- extern int CRT_delay;
- 
--int* CRT_colors;
-+extern int* CRT_colors;
- 
- extern int CRT_colorSchemes[LAST_COLORSCHEME][LAST_COLORELEMENT];
- 
-@@ -150,21 +150,21 @@ extern int CRT_scrollHAmount;
- 
- extern int CRT_scrollWheelVAmount;
- 
--char* CRT_termType;
-+extern char* CRT_termType;
- 
- // TODO move color scheme to Settings, perhaps?
- 
- extern int CRT_colorScheme;
- 
--void *backtraceArray[128];
-+extern void *backtraceArray[128];
- 
- #if HAVE_SETUID_ENABLED
- 
- #define DIE(msg) do { CRT_done(); fprintf(stderr, msg); exit(1); } while(0)
- 
--void CRT_dropPrivileges();
-+extern void CRT_dropPrivileges();
- 
--void CRT_restorePrivileges();
-+extern void CRT_restorePrivileges();
- 
- #else
- 
-@@ -179,18 +179,18 @@ void CRT_restorePrivileges();
- 
- // TODO: pass an instance of Settings instead.
- 
--void CRT_init(int delay, int colorScheme);
-+extern void CRT_init(int delay, int colorScheme);
- 
--void CRT_done();
-+extern void CRT_done();
- 
--void CRT_fatalError(const char* note);
-+extern void CRT_fatalError(const char* note);
- 
--int CRT_readKey();
-+extern int CRT_readKey();
- 
--void CRT_disableDelay();
-+extern void CRT_disableDelay();
- 
--void CRT_enableDelay();
-+extern void CRT_enableDelay();
- 
--void CRT_setColors(int colorScheme);
-+extern void CRT_setColors(int colorScheme);
- 
- #endif
-
-diff --git a/linux/LinuxProcess.h b/linux/LinuxProcess.h
-index 6ce3037d..586aa717 100644
---- a/linux/LinuxProcess.h
-+++ b/linux/LinuxProcess.h
-@@ -152,9 +153,9 @@ extern ProcessPidColumn Process_pidColumns[];
- 
- extern ProcessClass LinuxProcess_class;
- 
--LinuxProcess* LinuxProcess_new(Settings* settings);
-+extern LinuxProcess* LinuxProcess_new(Settings* settings);
- 
--void Process_delete(Object* cast);
-+extern void Process_delete(Object* cast);
- 
- /*
- [1] Note that before kernel 2.6.26 a process that has not asked for
-@@ -166,19 +167,19 @@ extern io_priority;
- */
- #define LinuxProcess_effectiveIOPriority(p_) (IOPriority_class(p_->ioPriority) == IOPRIO_CLASS_NONE ? IOPriority_tuple(IOPRIO_CLASS_BE, (p_->super.nice + 20) / 5) : p_->ioPriority)
- 
--IOPriority LinuxProcess_updateIOPriority(LinuxProcess* this);
-+extern IOPriority LinuxProcess_updateIOPriority(LinuxProcess* this);
- 
--bool LinuxProcess_setIOPriority(LinuxProcess* this, IOPriority ioprio);
-+extern bool LinuxProcess_setIOPriority(LinuxProcess* this, IOPriority ioprio);
- 
- #ifdef HAVE_DELAYACCT
--void LinuxProcess_printDelay(float delay_percent, char* buffer, int n);
-+extern void LinuxProcess_printDelay(float delay_percent, char* buffer, int n);
- #endif
- 
--void LinuxProcess_writeField(Process* this, RichString* str, ProcessField field);
-+extern void LinuxProcess_writeField(Process* this, RichString* str, ProcessField field);
- 
--long LinuxProcess_compare(const void* v1, const void* v2);
-+extern long LinuxProcess_compare(const void* v1, const void* v2);
- 
--bool Process_isThread(Process* this);
-+extern bool Process_isThread(Process* this);
- 
- 
- #endif
-diff --git a/scripts/MakeHeader.py b/scripts/MakeHeader.py
-index 349531b8..3ef34b88 100755
---- a/scripts/MakeHeader.py
-+++ b/scripts/MakeHeader.py
-@@ -54,8 +54,10 @@
-          elif line.startswith("typedef struct"):
-             state = SKIP
-          elif line[-1] == "{":
--            out.write( line[:-2].replace("inline", "extern") + ";\n" )
-+            out.write("extern " + line[:-2].replace("inline ", "") + ";\n")
-             state = SKIP
-+         elif line[-1] == ";":
-+            out.write("extern " + line + "\n")
-          else:
-             out.write( line + "\n")
-          is_blank = False
diff --git a/package/htop/Config.in b/package/htop/Config.in
index c19ff27b7..7bb0fe6e0 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_HTOP
 	  htop is an interactive text-mode process viewer for Linux.
 	  It aims to be a better top.
 
-	  http://hisham.hm/htop/
+	  https://htop.dev/
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index e764644a0..3ecfd8e9d 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57  htop-2.2.0.tar.gz
-sha256  70466e76443cb5b68144d9fcedca9584e7bfdb6c50859daa5a0290ea27c58aad  COPYING
+sha256  8465164bc085f5f1813e1d3f6c4b9b56bf4c95cc12226a5367e65794949b01ca  htop-3.0.1.tar.gz
+sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index dc84e3270..8818f3423 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-HTOP_VERSION = 2.2.0
-HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
+HTOP_VERSION = 3.0.1
+HTOP_SITE = https://github.com/htop-dev/htop/archive/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+HTOP_AUTORECONF = YES
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
-- 
2.25.1
