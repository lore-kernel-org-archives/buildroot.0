From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2010 11:30:54 +0100
Subject: [Buildroot] [git commit master] Fix build failure of rubix
Message-ID: <20100219103249.0EB0C7772A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=161afc186256b05b2b1af0b3cfa909e104529ed6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to use strstr() instead of index().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../rubix-1.0.5-dont-use-legacy-functions.patch    |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch

diff --git a/package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch b/package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
new file mode 100644
index 0000000..9c34aee
--- /dev/null
+++ b/package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
@@ -0,0 +1,18 @@
+Use strstr() instead of index(), since index() is a legacy function
+and it may not be available in uClibc, depending on the configuration.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: rubix-1.0.5/cube.c
+===================================================================
+--- rubix-1.0.5.orig/cube.c	2010-02-14 14:19:05.000000000 +0100
++++ rubix-1.0.5/cube.c	2010-02-14 14:19:14.000000000 +0100
+@@ -257,7 +257,7 @@
+     if (i==-1) goto finish;
+     if (buffer[0]=='%') goto new_section;
+     buffer[0]=toupper(buffer[0]);
+-    ptr = index(buffer, '=');
++    ptr = strstr(buffer, '=');
+     if (ptr) {
+       ++ptr;
+       while (isspace(*ptr)) ++ptr;
-- 
1.6.3.3
