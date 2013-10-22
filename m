From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 16:16:36 +0200
Subject: [Buildroot] [git commit] wget: Fix error in texi2pod on Perl 5.18
Message-ID: <20131022142610.5F2DE9BAB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5549f8e93489e6fc8348c3b2caac5dc3cbe2ff0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This gets around the following build errors that occurs on a system with
perl 5.18:

[...]
wget.pod around line 2151: Expected text after =item, not a number
wget.pod around line 2156: Expected text after =item, not a number
wget.pod around line 2162: Expected text after =item, not a number
[...]

This is already committed upstream and this patch will be unnecessary in
wget 1.15 when it is released:

commit 7f43748544f26008d0dd337704f02a6ed3200aaf
Author: Dave Reisner <dreisner@archlinux.org>
Date:   Mon Jun 17 23:31:46 2013 +0530

    Fix error in texi2pod intriduced with Perl 5.18

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ror-in-texi2pod-intriduced-with-Perl-5.18.patch |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch b/package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch
new file mode 100644
index 0000000..cf423a3
--- /dev/null
+++ b/package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch
@@ -0,0 +1,26 @@
+From 7f43748544f26008d0dd337704f02a6ed3200aaf Mon Sep 17 00:00:00 2001
+From: Dave Reisner <dreisner@archlinux.org>
+Date: Mon, 17 Jun 2013 23:31:46 +0530
+Subject: [PATCH] Fix error in texi2pod intriduced with Perl 5.18
+
+---
+ doc/ChangeLog   | 5 +++++
+ doc/texi2pod.pl | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/doc/texi2pod.pl b/doc/texi2pod.pl
+index 86c4b18..9db6de1 100755
+--- a/doc/texi2pod.pl
++++ b/doc/texi2pod.pl
+@@ -291,7 +291,7 @@ while(<$inf>) {
+ 	if (defined $1) {
+             my $thing = $1;
+             if ($ic =~ /\@asis/) {
+-                $_ = "\n=item $thing\n";
++                $_ = "\n=item C<$thing>\n";
+             } else {
+                 # Entity escapes prevent munging by the <> processing below.
+                 $_ = "\n=item $ic\&LT;$thing\&GT;\n";
+-- 
+1.8.4.rc3
+
