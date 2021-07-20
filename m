From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:41:54 +0200
Subject: [Buildroot] [git commit] package/darkhttpd: fix build with gcc 4.8
Message-ID: <20210720210839.76EA584110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=9ca64820db6766ad51bc835c86948cbe2c87e209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure which is raised since bump to version
0.13 in commit 88705a8c248e566f2c9ca71a8ee5353b33e368c2:

darkhttpd.c:966:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i = 0, j = 0; i < input_length;) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/ffc/ffcb627c44d2b7202d641129b67af2dc7865c618/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lare-vars-outside-of-for-loop-for-std-c90.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
new file mode 100644
index 0000000000..7584bff98e
--- /dev/null
+++ b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
@@ -0,0 +1,39 @@
+From 81b491e60affd67f4ec2feccbee1cdf98dc57b81 Mon Sep 17 00:00:00 2001
+From: Emil Mikulic <emikulic@gmail.com>
+Date: Sun, 21 Mar 2021 15:03:14 +1100
+Subject: [PATCH] Declare vars outside of for() loop for -std=c90.
+
+Fixes #2.
+
+[Retrieved from:
+https://github.com/emikulic/darkhttpd/commit/81b491e60affd67f4ec2feccbee1cdf98dc57b81]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ darkhttpd.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/darkhttpd.c b/darkhttpd.c
+index 219a8a3..268628a 100644
+--- a/darkhttpd.c
++++ b/darkhttpd.c
+@@ -966,8 +966,9 @@ static char *base64_encode(char *str) {
+     char *encoded_data = malloc(output_length+1);
+     if (encoded_data == NULL) return NULL;
+ 
+-    for (int i = 0, j = 0; i < input_length;) {
+-
++    int i;
++    int j;
++    for (i = 0, j = 0; i < input_length;) {
+         uint32_t octet_a = i < input_length ? (unsigned char)str[i++] : 0;
+         uint32_t octet_b = i < input_length ? (unsigned char)str[i++] : 0;
+         uint32_t octet_c = i < input_length ? (unsigned char)str[i++] : 0;
+@@ -981,7 +982,7 @@ static char *base64_encode(char *str) {
+     }
+ 
+     const int mod_table[] = {0, 2, 1};
+-    for (int i = 0; i < mod_table[input_length % 3]; i++)
++    for (i = 0; i < mod_table[input_length % 3]; i++)
+         encoded_data[output_length - 1 - i] = '=';
+     encoded_data[output_length] = '\0';
+ 
