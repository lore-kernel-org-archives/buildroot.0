From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 21:26:36 +0100
Subject: [Buildroot] [git commit] manual: add section about dealing
	efficiently with big image files
Message-ID: <20140109205952.502E09C417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abd4124e5fcae93337d755ea5e913368d1c3efa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Ryan, it is not well-known that most tools can deal
efficiently with big sparse files.

Add a section in the manual about this, with tar and cp used as
examples, and a hinting to the man pages for the others.

Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt |   39 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index c7e4568..1d15c05 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -104,3 +104,42 @@ or +g+++ for building helper-binaries on your host, then do
 --------------------
  $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 --------------------
+
+Dealing efficiently with filesystem images
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Filesystem images can get pretty big, depending on the filesystem you choose,
+the number of packages, whether you provisioned free space... Yet, some
+locations in the filesystems images may just be _empty_ (eg. a long run of
+'zeroes'); such a file is called a _sparse_ file.
+
+Most tools can handle sparse files efficiently, and will only store or write
+those parts of a sparse file that are not empty.
+
+For example:
+
+* +tar+ accepts the +-S+ option to tell it to only store non-zero blocks
+  of sparse files:
+** +tar cf archive.tar -S [files...]+ will efficiently store sparse files
+   in a tarball
+** +tar xf archive.tar -S+ will efficiently store sparse files extracted
+   from a tarball
+
+* +cp+ accepts the +--sparse=WHEN+ option (+WHEN+ is one of +auto+,
+  +never+ or +always+):
+** +cp --sparse=always source.file dest.file+ will make +dest.file+ a
+   sparse file if +source.file+ has long runs of zeroes
+
+Other tools may have similar options. Please consult their respective man
+pages.
+
+You can use sparse files if you need to store the filesystem images (eg.
+to transfer from one machine to another), of if you need to send them (eg.
+to the Q&A team).
+
+Note however that flashing a filesystem image to a device while using the
+sparse mode of +dd+ may result in a broken filesystem (eg. the block bitmap
+of an ext2 filesystem may be corrupted; or, if you have sparse files in
+your filesystem, those parts may not be all-zeroes when read back). You
+should only use sparse files when handling files on the build machine, not
+when transferring them to an actual device that will be used on the target.
