From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 13 Aug 2018 12:30:28 -0700
Subject: [Buildroot] [PATCH 1/1] htop: bump to version 2.2.0
Message-ID: <20180813193028.8042-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

Romain, the patch from February [1] for opening files in binary mode no longer
applies with this release. Can you confirm whether or not such a workaround is
still necessary?

Thanks!

Joseph

[1] http://lists.busybox.net/pipermail/buildroot/2018-March/216103.html

---
 ...eHeader-open-files-using-binary-mode.patch | 50 -------------------
 package/htop/htop.hash                        |  2 +-
 package/htop/htop.mk                          |  2 +-
 3 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 package/htop/0002-MakeHeader-open-files-using-binary-mode.patch

diff --git a/package/htop/0002-MakeHeader-open-files-using-binary-mode.patch b/package/htop/0002-MakeHeader-open-files-using-binary-mode.patch
deleted file mode 100644
index bcc3e6564c..0000000000
--- a/package/htop/0002-MakeHeader-open-files-using-binary-mode.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 1a83a3e6ae0841a0dc4c7eb08a1a71930e99666c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 18 Mar 2018 21:57:54 +0100
-Subject: [PATCH] MakeHeader: open files using binary mode
-
-By default, open(sys.argv[1]) use Unicode mode.
-The readlines() will try to convert with the default codec
-(which depends on the i18n settings, so 'ascii' under
-LC_ALL=C)
-
-Open files using binary mode so no conversion will be done
-by readlines(). But then, normal strings can't be used in
-the rest of the code; either all strings have to be prefixed
-with b'' or (simpler) the read line has to be converted to
-a unicode string by calling decode() on it.
-
-http://lists.busybox.net/pipermail/buildroot/2018-February/214373.html
-
-Fixes:
-http://autobuild.buildroot.net/results/9ce/9ce2ef5ef694253b9759016c9702c5c6be7849a1
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- scripts/MakeHeader.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/MakeHeader.py b/scripts/MakeHeader.py
-index 4841bda..dd0798c 100755
---- a/scripts/MakeHeader.py
-+++ b/scripts/MakeHeader.py
-@@ -16,7 +16,7 @@ SKIPONE=4
- state = ANY
- static = 0
- 
--file = open(sys.argv[1])
-+file = open(sys.argv[1], 'rb')
- name = sys.argv[1][:-2]
- 
- out = StringIO()
-@@ -31,6 +31,7 @@ out.write( "#define HEADER_" + os.path.basename(name) + "\n")
- is_blank = False
- for line in file.readlines():
-    line = line[:-1]
-+   line = line.decode('utf-8')
-    if state == ANY:
-       if line == '/*{':
-          state = COPY
--- 
-2.14.3
-
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 5419d767a3..e764644a0b 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3260be990d26e25b6b49fc9d96dbc935ad46e61083c0b7f6df413e513bf80748  htop-2.1.0.tar.gz
+sha256  d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57  htop-2.2.0.tar.gz
 sha256  70466e76443cb5b68144d9fcedca9584e7bfdb6c50859daa5a0290ea27c58aad  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 71889557ca..dc84e32708 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 2.1.0
+HTOP_VERSION = 2.2.0
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
-- 
2.18.0
