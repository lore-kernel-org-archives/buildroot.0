From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 15 Nov 2018 11:42:50 -0600
Subject: [Buildroot] [PATCH 1/1] vmtouch: new package
Message-ID: <20181115174250.109988-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 package/Config.in                             |  1 +
 ...upport-staged-installs-using-DESTDIR.patch | 34 ++++++++++
 ...CENSE-file-as-requested-by-Earnestly.patch | 44 +++++++++++++
 .../vmtouch/0003-add-LDFLAGS-to-cc-call.patch | 29 +++++++++
 .../0004-Correcting-for-C99-mode.patch        | 63 +++++++++++++++++++
 package/vmtouch/Config.in                     | 11 ++++
 package/vmtouch/vmtouch.hash                  |  5 ++
 package/vmtouch/vmtouch.mk                    | 21 +++++++
 8 files changed, 208 insertions(+)
 create mode 100644 package/vmtouch/0001-support-staged-installs-using-DESTDIR.patch
 create mode 100644 package/vmtouch/0002-add-separate-LICENSE-file-as-requested-by-Earnestly.patch
 create mode 100644 package/vmtouch/0003-add-LDFLAGS-to-cc-call.patch
 create mode 100644 package/vmtouch/0004-Correcting-for-C99-mode.patch
 create mode 100644 package/vmtouch/Config.in
 create mode 100644 package/vmtouch/vmtouch.hash
 create mode 100644 package/vmtouch/vmtouch.mk

diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..5d92fa5911 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -131,6 +131,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
 	source "package/valgrind/Config.in"
+	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
 
diff --git a/package/vmtouch/0001-support-staged-installs-using-DESTDIR.patch b/package/vmtouch/0001-support-staged-installs-using-DESTDIR.patch
new file mode 100644
index 0000000000..e914ecc10e
--- /dev/null
+++ b/package/vmtouch/0001-support-staged-installs-using-DESTDIR.patch
@@ -0,0 +1,34 @@
+From 1640b6b2ab924915fcad010c09717aaaf0b6377c Mon Sep 17 00:00:00 2001
+From: Earnestly <zibeon@googlemail.com>
+Date: Sun, 23 Apr 2017 15:02:00 +0100
+Subject: [PATCH] support staged installs using DESTDIR
+
+Fetch from: https://github.com/hoytech/vmtouch/commit/1640b6b2ab924915fcad010c09717aaaf0b6377c
+Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
+---
+ Makefile | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 535138b..db484d7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,12 +16,11 @@ vmtouch.8: vmtouch.pod
+ 	pod2man --section 8 --center "System Manager's Manual" --release " " vmtouch.pod > vmtouch.8
+ 
+ install: vmtouch vmtouch.8
+-	mkdir -p $(BINDIR) $(MANDIR)
+-	install -m 0755 vmtouch $(BINDIR)/vmtouch
+-	install -m 0644 vmtouch.8 $(MANDIR)/vmtouch.8
++	install -Dm 0755 vmtouch $(DESTDIR)$(BINDIR)/vmtouch
++	install -Dm 0644 vmtouch.8 $(DESTDIR)$(MANDIR)/vmtouch.8
+ 
+ clean:
+ 	rm -f vmtouch vmtouch.8
+ 
+ uninstall:
+-	rm $(BINDIR)/vmtouch $(MANDIR)/vmtouch.8
++	rm $(DESTDIR)$(BINDIR)/vmtouch $(DESTDIR)$(MANDIR)/vmtouch.8
+-- 
+2.19.0
+
diff --git a/package/vmtouch/0002-add-separate-LICENSE-file-as-requested-by-Earnestly.patch b/package/vmtouch/0002-add-separate-LICENSE-file-as-requested-by-Earnestly.patch
new file mode 100644
index 0000000000..58386a6ba6
--- /dev/null
+++ b/package/vmtouch/0002-add-separate-LICENSE-file-as-requested-by-Earnestly.patch
@@ -0,0 +1,44 @@
+From 43866950c3d55847c6b804e67c3b455fc578ab6b Mon Sep 17 00:00:00 2001
+From: Doug <doug@hoytech.com>
+Date: Sun, 23 Apr 2017 11:37:46 -0400
+Subject: [PATCH] add separate LICENSE file as requested by @Earnestly
+
+Fetch from: https://github.com/hoytech/vmtouch/commit/43866950c3d55847c6b804e67c3b455fc578ab6b
+Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
+---
+ LICENSE | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+ create mode 100644 LICENSE
+
+diff --git a/LICENSE b/LICENSE
+new file mode 100644
+index 0000000..bb460d6
+--- /dev/null
++++ b/LICENSE
+@@ -0,0 +1,23 @@
++Copyright (c) 2009-2016 Doug Hoyte and contributors. All rights reserved.
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions
++are met:
++1. Redistributions of source code must retain the above copyright
++   notice, this list of conditions and the following disclaimer.
++2. Redistributions in binary form must reproduce the above copyright
++   notice, this list of conditions and the following disclaimer in the
++   documentation and/or other materials provided with the distribution.
++3. The name of the author may not be used to endorse or promote products
++   derived from this software without specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+-- 
+2.19.0
+
diff --git a/package/vmtouch/0003-add-LDFLAGS-to-cc-call.patch b/package/vmtouch/0003-add-LDFLAGS-to-cc-call.patch
new file mode 100644
index 0000000000..bde1140cda
--- /dev/null
+++ b/package/vmtouch/0003-add-LDFLAGS-to-cc-call.patch
@@ -0,0 +1,29 @@
+From d8857e63c689bfd6218c4cd18c69916eef84800f Mon Sep 17 00:00:00 2001
+From: Doug Hoyte <doug@hcsw.org>
+Date: Mon, 7 Aug 2017 11:31:34 -0400
+Subject: [PATCH] add LDFLAGS to cc call
+
+See issue #47
+
+Fetch from: https://github.com/hoytech/vmtouch/commit/d8857e63c689bfd6218c4cd18c69916eef84800f
+Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index db484d7..c449d9d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -10,7 +10,7 @@ all: vmtouch vmtouch.8
+ .PHONY: all install clean uninstall
+ 
+ vmtouch: vmtouch.c
+-	${CC} ${CFLAGS} -o vmtouch vmtouch.c
++	${CC} ${CFLAGS} ${LDFLAGS} -o vmtouch vmtouch.c
+ 
+ vmtouch.8: vmtouch.pod
+ 	pod2man --section 8 --center "System Manager's Manual" --release " " vmtouch.pod > vmtouch.8
+-- 
+2.19.0
+
diff --git a/package/vmtouch/0004-Correcting-for-C99-mode.patch b/package/vmtouch/0004-Correcting-for-C99-mode.patch
new file mode 100644
index 0000000000..d3f12f6c77
--- /dev/null
+++ b/package/vmtouch/0004-Correcting-for-C99-mode.patch
@@ -0,0 +1,63 @@
+From a386632a75b444aa86c23c01de2bd9804256af11 Mon Sep 17 00:00:00 2001
+From: Rushikesh Jadhav <rushikesh7@gmail.com>
+Date: Wed, 19 Sep 2018 17:15:33 +0530
+Subject: [PATCH] Correcting for C99 mode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixing following 2 errors
+
+vmtouch.c:675:3: error: ?for? loop initial declarations are only allowed in C99 mode
+
+vmtouch.c:698:3: error: ?for? loop initial declarations are only allowed in C99 mode
+
+Fetch from: https://github.com/hoytech/vmtouch/commit/a386632a75b444aa86c23c01de2bd9804256af11
+Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
+---
+ vmtouch.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/vmtouch.c b/vmtouch.c
+index 743ac3d..364874f 100644
+--- a/vmtouch.c
++++ b/vmtouch.c
+@@ -663,7 +663,7 @@ static inline void add_object (struct stat *st)
+ 
+ int is_ignored(const char* path) {
+   char *path_copy;
+-  int match;
++  int match, i;
+ 
+   if (!number_of_ignores) return 0;
+ 
+@@ -672,7 +672,7 @@ int is_ignored(const char* path) {
+ 
+   char *filename = basename(path_copy);
+ 
+-  for (int i = 0; i < number_of_ignores; i++) {
++  for (i = 0; i < number_of_ignores; i++) {
+     if (fnmatch(ignore_list[i], filename, 0) == 0) {
+       match = 1;
+       break;
+@@ -686,7 +686,7 @@ int is_ignored(const char* path) {
+ 
+ int is_filename_filtered(const char* path) {
+   char *path_copy;
+-  int match;
++  int match, i;
+ 
+   if (!number_of_filename_filters) return 1;
+ 
+@@ -695,7 +695,7 @@ int is_filename_filtered(const char* path) {
+ 
+   char *filename = basename(path_copy);
+ 
+-  for (int i = 0; i < number_of_filename_filters; i++) {
++  for (i = 0; i < number_of_filename_filters; i++) {
+     if (fnmatch(filename_filter_list[i], filename, 0) == 0) {
+       match = 1;
+       break;
+-- 
+2.19.0
+
diff --git a/package/vmtouch/Config.in b/package/vmtouch/Config.in
new file mode 100644
index 0000000000..daae03aa32
--- /dev/null
+++ b/package/vmtouch/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_VMTOUCH
+	bool "vmtouch"
+	depends on BR2_USE_MMU # fork()
+	help
+	  vmtouch is a tool for learning about and controlling
+	  the file system cache of unix and unix-like systems. It
+	  can discover which files the OS is caching, tell the OS
+	  to cache or evict some files or regions of files, lock
+	  files into memory so the OS won't evict them, and more.
+
+	  https://hoytech.com/vmtouch/
diff --git a/package/vmtouch/vmtouch.hash b/package/vmtouch/vmtouch.hash
new file mode 100644
index 0000000000..9dad04c34d
--- /dev/null
+++ b/package/vmtouch/vmtouch.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 4615980b8f824c8eb164e50ec0880bcb71591f4e3989a6075e5a3e2efd122ceb  vmtouch-v1.3.0.tar.gz
+
+# Hash for license files:
+sha256 b031abd12b10590aa966fa88ba131339a8927436c9a646a2566816e8da059263  LICENSE
diff --git a/package/vmtouch/vmtouch.mk b/package/vmtouch/vmtouch.mk
new file mode 100644
index 0000000000..6e066490aa
--- /dev/null
+++ b/package/vmtouch/vmtouch.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# vmtouch
+#
+################################################################################
+
+VMTOUCH_VERSION = v1.3.0
+VMTOUCH_SITE = $(call github,hoytech,vmtouch,$(VMTOUCH_VERSION))
+VMTOUCH_LICENSE = BSD-3-Clause
+VMTOUCH_LICENSE_FILES = LICENSE
+
+define VMTOUCH_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define VMTOUCH_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr
+endef
+
+$(eval $(generic-package))
-- 
2.19.0
