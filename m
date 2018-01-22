From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:32:41 +0100
Subject: [Buildroot] [git commit] refpolicy: bump to 2.20180114
Message-ID: <20180122213643.433E483E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=326c23fd6fd005100554b5abcc5a3c2de78700cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0001-fix-regex-escape-sequence-error.patch, as it has been
committed upstream.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-regex-escape-sequence-error.patch     | 59 ----------------------
 package/refpolicy/refpolicy.hash                   |  2 +-
 package/refpolicy/refpolicy.mk                     |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/refpolicy/0001-fix-regex-escape-sequence-error.patch b/package/refpolicy/0001-fix-regex-escape-sequence-error.patch
deleted file mode 100644
index 1aa0189..0000000
--- a/package/refpolicy/0001-fix-regex-escape-sequence-error.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 6c9cc47e6cc9c6e67b1b822f7a1a2e1f6d836118 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
-Date: Tue, 10 Oct 2017 18:00:30 -0400
-Subject: [PATCH] fix regex escape sequence error.
-
-python3.6 will error out with the message "invalid escape sequence"
-in genhomedircon.py.  This patch fixes these errors by turning the string
-in the into a raw string.
-
-Upstream status: accepted
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- support/genhomedircon.py | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/support/genhomedircon.py b/support/genhomedircon.py
-index 036f5cc9..6662f412 100644
---- a/support/genhomedircon.py
-+++ b/support/genhomedircon.py
-@@ -189,13 +189,13 @@ def oldgenhomedircon(filecontextdir, filecontext):
-                 addme = 1
-                 for regex in prefix_regex:
-                         #match a trailing (/*)? which is actually a bug in rpc_pipefs
--                        regex = re.sub("\(/\*\)\?$", "", regex)
-+                        regex = re.sub(r"\(/\*\)\?$", "", regex)
-                         #match a trailing .+
--                        regex = re.sub("\.+$", "", regex)
-+                        regex = re.sub(r"\.+$", "", regex)
-                         #match a trailing .*
--                        regex = re.sub("\.\*$", "", regex)
-+                        regex = re.sub(r"\.\*$", "", regex)
-                         #strip a (/.*)? which matches anything trailing to a /*$ which matches trailing /'s
--                        regex = re.sub("\(\/\.\*\)\?", "", regex)
-+                        regex = re.sub(r"\(\/\.\*\)\?", "", regex)
-                         regex = regex + "/*$"
-                         if re.search(regex, potential, 0):
-                                 addme = 0
-@@ -391,13 +391,13 @@ class selinuxConfig:
- 		exists=1
- 		for regex in prefix_regex:
- 			#match a trailing (/*)? which is actually a bug in rpc_pipefs
--			regex = re.sub("\(/\*\)\?$", "", regex)
-+			regex = re.sub(r"\(/\*\)\?$", "", regex)
- 			#match a trailing .+
--			regex = re.sub("\.+$", "", regex)
-+			regex = re.sub(r"\.+$", "", regex)
- 			#match a trailing .*
--			regex = re.sub("\.\*$", "", regex)
-+			regex = re.sub(r"\.\*$", "", regex)
- 			#strip a (/.*)? which matches anything trailing to a /*$ which matches trailing /'s
--			regex = re.sub("\(\/\.\*\)\?", "", regex)
-+			regex = re.sub(r"\(\/\.\*\)\?", "", regex)
- 			regex = regex + "/*$"
- 			if re.search(regex, home, 0):
- 				exists = 0
--- 
-2.13.6
-
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 905ac88..f341566 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
-sha256 045709f5e44199f402149b31c6aab9666bdb1540a5c5ed0312a46c90dedfa52d  refpolicy-2.20170805.tar.bz2
+sha256 e826f7d7f899a548e538964487e9fc1bc67ca94756ebdce0bfb6532b4eb0d06b  refpolicy-2.20180114.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 1e2180b..590e0eb 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = 2.20170805
+REFPOLICY_VERSION = 2.20180114
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/refpolicy/files
 REFPOLICY_LICENSE = GPL-2.0
