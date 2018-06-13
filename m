From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:52:11 +0200
Subject: [Buildroot] [git commit] perl: add upstream security fix for
 CVE-2018-12015
Message-ID: <20180613205007.53A4588561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66760f27342fccacdba64269525a3a32d0518905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-12015 - In Perl through 5.26.2, the Archive::Tar module
allows remote attackers to bypass a directory-traversal protection
mechanism, and overwrite arbitrary files, via an archive file containing a
symlink and a regular file with the same name.

Patch from
https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5
with path rewritten to match perl tarball.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ve-existing-files-before-overwriting-them.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch b/package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch
new file mode 100644
index 0000000000..5223b78c01
--- /dev/null
+++ b/package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch
@@ -0,0 +1,46 @@
+From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Fri, 8 Jun 2018 11:45:40 +0100
+Subject: [PATCH] [PATCH] Remove existing files before overwriting them
+
+Archive should extract only the latest same-named entry.
+Extracted regular file should not be writtent into existing block
+device (or any other one).
+
+https://rt.cpan.org/Ticket/Display.html?id=125523
+
+[Peter: rewrite path to match perl tarball with sed 's|\(lib/Archive\)|cpan/Archive-Tar/\1|g']
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ cpan/Archive-Tar/lib/Archive/Tar.pm | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 6244369..a83975f 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -845,6 +845,20 @@ sub _extract_file {
+         return;
+     }
+ 
++    ### If a file system already contains a block device with the same name as
++    ### the being extracted regular file, we would write the file's content
++    ### to the block device. So remove the existing file (block device) now.
++    ### If an archive contains multiple same-named entries, the last one
++    ### should replace the previous ones. So remove the old file now.
++    ### If the old entry is a symlink to a file outside of the CWD, the new
++    ### entry would create a file there. This is CVE-2018-12015
++    ### <https://rt.cpan.org/Ticket/Display.html?id=125523>.
++    if (-l $full || -e _) {
++	if (!unlink $full) {
++	    $self->_error( qq[Could not remove old file '$full': $!] );
++	    return;
++	}
++    }
+     if( length $entry->type && $entry->is_file ) {
+         my $fh = IO::File->new;
+         $fh->open( $full, '>' ) or (
+-- 
+2.11.0
+
