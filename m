From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Nov 2011 11:48:30 -0300
Subject: [Buildroot] [PATCH] thttpd: fix build breakage with eglibc/glibc
Message-ID: <1322232510-630-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix getline() function conflict with glibc/eglibc by renaming it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/thttpd/thttpd-2.25b-getline.patch |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/thttpd/thttpd-2.25b-getline.patch

diff --git a/package/thttpd/thttpd-2.25b-getline.patch b/package/thttpd/thttpd-2.25b-getline.patch
new file mode 100644
index 0000000..35c366a
--- /dev/null
+++ b/package/thttpd/thttpd-2.25b-getline.patch
@@ -0,0 +1,26 @@
+Fix glibc/eglibc getline() conflicting functions.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+
+diff -Nura thttpd-2.25b.orig/extras/htpasswd.c thttpd-2.25b/extras/htpasswd.c
+--- thttpd-2.25b.orig/extras/htpasswd.c	2001-12-18 21:08:08.000000000 -0300
++++ thttpd-2.25b/extras/htpasswd.c	2011-11-25 11:42:47.198582812 -0300
+@@ -49,7 +49,7 @@
+     while((line[y++] = line[x++]));
+ }
+ 
+-static int getline(char *s, int n, FILE *f) {
++static int get_line(char *s, int n, FILE *f) {
+     register int i=0;
+ 
+     while(1) {
+@@ -189,7 +189,7 @@
+     strcpy(user,argv[2]);
+ 
+     found = 0;
+-    while(!(getline(line,MAX_STRING_LEN,f))) {
++    while(!(get_line(line,MAX_STRING_LEN,f))) {
+         if(found || (line[0] == '#') || (!line[0])) {
+             putline(tfp,line);
+             continue;
-- 
1.7.3.4
