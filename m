From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Jan 2015 18:33:43 -0300
Subject: [Buildroot] [PATCH] openssl: fix c_rehash dumbness
Message-ID: <1422394423-27700-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new c_rehash from openssl 1.0.2 can't take a minus in the directory
string since the regex for matching commands checks for - in any
position instead of just the beginning to trigger the command parser. Fixes:
http://autobuild.buildroot.net/results/ee6/ee683569350d5deaf0ccc603ed7066bffb83cbe3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-match-commands-starting-with-minus-inste.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch

diff --git a/package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch b/package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch
new file mode 100644
index 0000000..5db95d6
--- /dev/null
+++ b/package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch
@@ -0,0 +1,27 @@
+From 079cae9d7628f16b9efdf5723d2bfae5bdc2ba4e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 27 Jan 2015 18:27:32 -0300
+Subject: [PATCH] Make c_rehash match commands starting with - (minus) instead
+ of minus in any starting position, otherwise a directory named a-b breaks it
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ tools/c_rehash.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/c_rehash.in b/tools/c_rehash.in
+index 887e927..1df2fab 100644
+--- a/tools/c_rehash.in
++++ b/tools/c_rehash.in
+@@ -15,7 +15,7 @@ my $symlink_exists=eval {symlink("",""); 1};
+ my $removelinks = 1;
+ 
+ ##  Parse flags.
+-while ( $ARGV[0] =~ '-.*' ) {
++while ( $ARGV[0] =~ '^-.*' ) {
+     my $flag = shift @ARGV;
+     last if ( $flag eq '--');
+     if ( $flag =~ /-old/) {
+-- 
+2.0.5
+
-- 
2.0.5
