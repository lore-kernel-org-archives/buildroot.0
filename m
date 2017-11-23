From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:03:34 +0100
Subject: [Buildroot] [git commit] refpolicy: bump to 2.20170805
Message-ID: <20171201205335.628107FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9edec7d2687bf36363ec1e07272ccd03778e59d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to a simple bump, the following extra changes have occured:
  - Change the refpolicy site to the official release URL.
  - Remove REFPOLICY_SITE_METHOD and REFPOLICY_GIT_SUBMODULES as the contrib
    submodule is included in the release tarball.
  - Refpolicy is now compatible with python3, as such, remove host-python.
    from the dependencies and add a check for python3 or python in it's place.
  - Add upstreamed 0001-fix-regex-escape-sequence-error.patch to fix building
    against python3.6.
  - Add sha256 license hash to hash file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-regex-escape-sequence-error.patch     | 59 ++++++++++++++++++++++
 package/refpolicy/refpolicy.hash                   |  7 ++-
 package/refpolicy/refpolicy.mk                     | 17 ++++---
 3 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/package/refpolicy/0001-fix-regex-escape-sequence-error.patch b/package/refpolicy/0001-fix-regex-escape-sequence-error.patch
new file mode 100644
index 0000000..1aa0189
--- /dev/null
+++ b/package/refpolicy/0001-fix-regex-escape-sequence-error.patch
@@ -0,0 +1,59 @@
+From 6c9cc47e6cc9c6e67b1b822f7a1a2e1f6d836118 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Tue, 10 Oct 2017 18:00:30 -0400
+Subject: [PATCH] fix regex escape sequence error.
+
+python3.6 will error out with the message "invalid escape sequence"
+in genhomedircon.py.  This patch fixes these errors by turning the string
+in the into a raw string.
+
+Upstream status: accepted
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ support/genhomedircon.py | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/support/genhomedircon.py b/support/genhomedircon.py
+index 036f5cc9..6662f412 100644
+--- a/support/genhomedircon.py
++++ b/support/genhomedircon.py
+@@ -189,13 +189,13 @@ def oldgenhomedircon(filecontextdir, filecontext):
+                 addme = 1
+                 for regex in prefix_regex:
+                         #match a trailing (/*)? which is actually a bug in rpc_pipefs
+-                        regex = re.sub("\(/\*\)\?$", "", regex)
++                        regex = re.sub(r"\(/\*\)\?$", "", regex)
+                         #match a trailing .+
+-                        regex = re.sub("\.+$", "", regex)
++                        regex = re.sub(r"\.+$", "", regex)
+                         #match a trailing .*
+-                        regex = re.sub("\.\*$", "", regex)
++                        regex = re.sub(r"\.\*$", "", regex)
+                         #strip a (/.*)? which matches anything trailing to a /*$ which matches trailing /'s
+-                        regex = re.sub("\(\/\.\*\)\?", "", regex)
++                        regex = re.sub(r"\(\/\.\*\)\?", "", regex)
+                         regex = regex + "/*$"
+                         if re.search(regex, potential, 0):
+                                 addme = 0
+@@ -391,13 +391,13 @@ class selinuxConfig:
+ 		exists=1
+ 		for regex in prefix_regex:
+ 			#match a trailing (/*)? which is actually a bug in rpc_pipefs
+-			regex = re.sub("\(/\*\)\?$", "", regex)
++			regex = re.sub(r"\(/\*\)\?$", "", regex)
+ 			#match a trailing .+
+-			regex = re.sub("\.+$", "", regex)
++			regex = re.sub(r"\.+$", "", regex)
+ 			#match a trailing .*
+-			regex = re.sub("\.\*$", "", regex)
++			regex = re.sub(r"\.\*$", "", regex)
+ 			#strip a (/.*)? which matches anything trailing to a /*$ which matches trailing /'s
+-			regex = re.sub("\(\/\.\*\)\?", "", regex)
++			regex = re.sub(r"\(\/\.\*\)\?", "", regex)
+ 			regex = regex + "/*$"
+ 			if re.search(regex, home, 0):
+ 				exists = 0
+-- 
+2.13.6
+
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 7aeac41..905ac88 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,2 +1,5 @@
-#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
-sha256 08f9e2afc5e4939c23e56deeec7c47da029d7b85d82fb4ded01a36eb5da0651e  refpolicy-RELEASE_2_20170204.tar.gz
+# From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
+sha256 045709f5e44199f402149b31c6aab9666bdb1540a5c5ed0312a46c90dedfa52d  refpolicy-2.20170805.tar.bz2
+
+# Locally computed
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 2da151f..1e2180b 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = RELEASE_2_20170204
-
-# Do not use GitHub helper as git submodules are needed for refpolicy-contrib
-REFPOLICY_SITE = https://github.com/TresysTechnology/refpolicy.git
-REFPOLICY_SITE_METHOD = git
-REFPOLICY_GIT_SUBMODULES = y # Required for refpolicy-contrib
+REFPOLICY_VERSION = 2.20170805
+REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
+REFPOLICY_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/refpolicy/files
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
 REFPOLICY_INSTALL_STAGING = YES
@@ -19,13 +16,17 @@ REFPOLICY_DEPENDENCIES = \
 	host-policycoreutils \
 	host-setools \
 	host-gawk \
-	host-python \
 	policycoreutils
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+REFPOLICY_DEPENDENCIES += host-python3
+else
+REFPOLICY_DEPENDENCIES += host-python
+endif
+
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
 	TEST_TOOLCHAIN=$(HOST_DIR) \
-	PYTHON="$(HOST_DIR)/bin/python2" \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
 
