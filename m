From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 21 Jun 2018 12:28:53 -0500
Subject: [Buildroot] [PATCH] checksec: new package
Message-ID: <1529602133-32198-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This patch added host-checksec package support. This tool
provides a script to offline check the properties of a
security hardened elf file.

REF: https://github.com/slimm609/checksec.sh

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in.host                             |  1 +
 ...1-checksec-Fixed-issue-with-relative-path.patch | 43 ++++++++++++++++++++++
 package/checksec/Config.in.host                    | 16 ++++++++
 package/checksec/checksec.hash                     |  3 ++
 package/checksec/checksec.mk                       | 16 ++++++++
 5 files changed, 79 insertions(+)
 create mode 100644 package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
 create mode 100644 package/checksec/Config.in.host
 create mode 100644 package/checksec/checksec.hash
 create mode 100644 package/checksec/checksec.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index a8a4c1f..07d67d0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
+	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
diff --git a/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch b/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
new file mode 100644
index 0000000..43a882d
--- /dev/null
+++ b/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
@@ -0,0 +1,43 @@
+From b48a2dfae26fa3b4af8e65fb5953b3caf62c137b Mon Sep 17 00:00:00 2001
+From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+Date: Mon, 21 May 2018 14:34:23 -0500
+Subject: [PATCH] checksec: Fixed issue with relative path
+
+Before this patch script was not able find exists directory when user pass
+relative directory path with '--dir' or '-d' option and also we faced this error
+when we execute script with relative path.
+
+This patch fixed  "No such file or directory" error in both cases.
+
+https://github.com/slimm609/checksec.sh/issues/54
+
+Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+---
+ checksec | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/checksec b/checksec
+index 24b521f..baf8d63 100755
+--- a/checksec
++++ b/checksec
+@@ -1193,7 +1193,7 @@ do
+     echo_message "RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      FORTIFY Checked         Total   Filename\n" '' "<dir name='$tempdir'>\n" "{ \"dir\": { \"name\":\"$tempdir\" },"
+     fdircount=0
+     fdirtotal=0
+-    for N in $(find $tempdir -type f); do
++    for N in $(find . -type f); do
+       if [[ "$N" != "[A-Za-z1-0]*" ]]; then
+         out=$(file "$N")
+         if [[  $out =~ ELF ]] ; then
+@@ -1201,7 +1201,7 @@ do
+         fi
+       fi
+     done
+-    for N in $(find $tempdir -type f); do
++    for N in $(find . -type f); do
+       if [[ "$N" != "[A-Za-z1-0]*" ]]; then
+     # read permissions?
+     if [[ ! -r "$N" ]]; then
+-- 
+1.9.1
+
diff --git a/package/checksec/Config.in.host b/package/checksec/Config.in.host
new file mode 100644
index 0000000..7f86f46
--- /dev/null
+++ b/package/checksec/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_CHECKSEC
+	bool "host checksec"
+	help
+	  This tool provides a shell script to check the
+	  properties of the executables
+	  (like PIE,RELRO,PaX,Canaries,ASLR,Fortify Source).
+
+	  https://github.com/slimm609/checksec.sh.git
+
+	  NOTE: This tool has a hard-coded path to the standard
+	  libraries for some of the fortify test cases and
+	  requires you to either test the local filesystem or be
+	  in a chroot'd environment.  The tool can still be used
+	  against a folder of files but requires discretion of
+	  which the tests may not report consistently vs
+	  chroot/on-target.
diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
new file mode 100644
index 0000000..e3d1ffd
--- /dev/null
+++ b/package/checksec/checksec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 510b0b0528f15d0bf13fa1ae7140d2b9fc9261323c98ff76c011bef475a69c14 checksec-cdefe53eb72e6e8f23308417d2fc6b68cba9dbac.tar.gz
+sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
new file mode 100644
index 0000000..31ceb43
--- /dev/null
+++ b/package/checksec/checksec.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# checksec
+#
+################################################################################
+
+CHECKSEC_VERSION = cdefe53eb72e6e8f23308417d2fc6b68cba9dbac
+CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
+CHECKSEC_LICENSE = BSD-3-Clause
+CHECKSEC_LICENSE_FILES = LICENSE.txt
+
+define HOST_CHECKSEC_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/checksec $(HOST_DIR)/bin/
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
