From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:43 -0000
Subject: [Buildroot] [git commit] package/checksec: new package
Message-ID: <20180907111540.734F380DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf61e3725c44fa7da32276df480d411ecfd64f29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds host-checksec package support. This tool provides a
script to offline check the properties of a security hardened elf file.

REF: https://github.com/slimm609/checksec.sh

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: add entry to DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 ++
 package/Config.in.host                             |  1 +
 ...1-checksec-Fixed-issue-with-relative-path.patch | 43 ++++++++++++++++++++++
 package/checksec/Config.in.host                    | 17 +++++++++
 package/checksec/checksec.hash                     |  3 ++
 package/checksec/checksec.mk                       | 16 ++++++++
 6 files changed, 84 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a2576ddc7..cee19af880 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1312,6 +1312,7 @@ F:	package/aufs-util/
 F:	package/bc/
 F:	package/bridge-utils/
 F:	package/checkpolicy/
+F:	package/checksec/
 F:	package/cgroupfs-mount/
 F:	package/crda/
 F:	package/devmem2/
@@ -1529,6 +1530,9 @@ F:	package/openjpeg/
 N:	Olivier Singla <olivier.singla@gmail.com>
 F:	package/shellinabox/
 
+N:	Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+F:	package/checksec/
+
 N:	Parnell Springmeyer <parnell@digitalmentat.com>
 F:	package/scrypt/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 7838ffc219..0c21b11bd0 100644
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
index 0000000000..3ed75a3c34
--- /dev/null
+++ b/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
@@ -0,0 +1,43 @@
+From b48a2dfae26fa3b4af8e65fb5953b3caf62c137b Mon Sep 17 00:00:00 2001
+From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+Date: Mon, 21 May 2018 14:34:23 -0500
+Subject: [PATCH] checksec: Fixed issue with relative path
+
+Before this patch, the checksec script was not able to find existing
+directories when the user passed a relative path with --dir/-d,
+the script aborted with a "No such file or directory". The same error
+was reported when the script was executed through a relative path.
+
+https://github.com/slimm609/checksec.sh/issues/54
+
+Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
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
index 0000000000..e4e8903b48
--- /dev/null
+++ b/package/checksec/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_CHECKSEC
+	bool "host checksec"
+	help
+	  This tool provides a shell script to check the
+	  properties of executables
+	  (PIE,RELRO,Stack Canaries,Fortify Source).
+	  It also has a kernel test mode that can run on target
+	  for testing of PaX, ASLR, heap and config hardening.
+
+	  NOTE: when using this tool as a host tool, the tool
+	  can offline check a target folder of elf files for
+	  hardening features enabled in those elf files.  There
+	  are other features of this tool, like the kernel test
+	  feature that are not functional offline, but require the
+	  user to execute in a chroot or on target.
+
+	  https://github.com/slimm609/checksec.sh.git
diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
new file mode 100644
index 0000000000..e3d1ffd5d1
--- /dev/null
+++ b/package/checksec/checksec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 510b0b0528f15d0bf13fa1ae7140d2b9fc9261323c98ff76c011bef475a69c14 checksec-cdefe53eb72e6e8f23308417d2fc6b68cba9dbac.tar.gz
+sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
new file mode 100644
index 0000000000..bfe54c262e
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
+	$(INSTALL) -D -m 0755 $(@D)/checksec $(HOST_DIR)/bin/checksec
+endef
+
+$(eval $(host-generic-package))
