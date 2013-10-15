From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Tue, 15 Oct 2013 08:16:33 -0500
Subject: [Buildroot] [PATCH] wget: Fix error in texi2pod on Perl 5.18
Message-ID: <20131015131633.GA20069@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 ...ror-in-texi2pod-intriduced-with-Perl-5.18.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch

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
-- 
1.8.4.rc3
