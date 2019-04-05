From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:26:15 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/thttpd: security
 bump to version 2.29
Message-ID: <20190405152520.364F87FFC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b39d75838b9034a16ac8c9618e23a9b46ff8dcdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Switch site to "real" upstream instead of debian as debian does not
  have latest version
- Drop patch (not needed anymore as getline was renamed in my_getline)
- Add hash for license file
- Fix CVE-2013-0348 and CVE-2017-17663

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 48e6230e5fd764f301aa9509938957700799959d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thttpd/0001-getline.patch | 26 --------------------------
 package/thttpd/thttpd.hash        |  6 +++---
 package/thttpd/thttpd.mk          | 16 ++--------------
 3 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/thttpd/0001-getline.patch b/package/thttpd/0001-getline.patch
deleted file mode 100644
index 35c366aef1..0000000000
--- a/package/thttpd/0001-getline.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix glibc/eglibc getline() conflicting functions.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-
-diff -Nura thttpd-2.25b.orig/extras/htpasswd.c thttpd-2.25b/extras/htpasswd.c
---- thttpd-2.25b.orig/extras/htpasswd.c	2001-12-18 21:08:08.000000000 -0300
-+++ thttpd-2.25b/extras/htpasswd.c	2011-11-25 11:42:47.198582812 -0300
-@@ -49,7 +49,7 @@
-     while((line[y++] = line[x++]));
- }
- 
--static int getline(char *s, int n, FILE *f) {
-+static int get_line(char *s, int n, FILE *f) {
-     register int i=0;
- 
-     while(1) {
-@@ -189,7 +189,7 @@
-     strcpy(user,argv[2]);
- 
-     found = 0;
--    while(!(getline(line,MAX_STRING_LEN,f))) {
-+    while(!(get_line(line,MAX_STRING_LEN,f))) {
-         if(found || (line[0] == '#') || (!line[0])) {
-             putline(tfp,line);
-             continue;
diff --git a/package/thttpd/thttpd.hash b/package/thttpd/thttpd.hash
index 2400f5bc8d..4bdd7fe74b 100644
--- a/package/thttpd/thttpd.hash
+++ b/package/thttpd/thttpd.hash
@@ -1,3 +1,3 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/t/thttpd/thttpd_2.25b-11.dsc
-sha256	07719b08b1cff6a21c08697a7bcb4395425b07ee753106262fb62a03a7d32360	thttpd_2.25b.orig.tar.gz
-sha256	4d213c18daf121d21412cc54864fbca250e1773a91df6573373e1d2273a2cec9	thttpd_2.25b-11.diff.gz
+# Locally calculated
+sha256	99c09f47da326b1e7b5295c45549d2b65534dce27c44812cf7eef1441681a397	thttpd-2.29.tar.gz
+sha256	be059e6b8219d5bb5480fa6a2864bbb34892f56951d03d08b356bc1fa8c81a01	thttpd.c
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index f1bee01345..29611fff2c 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -4,23 +4,11 @@
 #
 ################################################################################
 
-THTTPD_VERSION = 2.25b
-THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
-THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
-THTTPD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/t/thttpd
+THTTPD_VERSION = 2.29
+THTTPD_SITE = https://acme.com/software/thttpd
 THTTPD_LICENSE = BSD-2-Clause
 THTTPD_LICENSE_FILES = thttpd.c
 
-ifneq ($(THTTPD_PATCH),)
-define THTTPD_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
-	fi
-endef
-endif
-
-THTTPD_POST_PATCH_HOOKS = THTTPD_DEBIAN_PATCHES
-
 THTTPD_MAKE = $(MAKE1)
 
 define THTTPD_INSTALL_TARGET_CMDS
