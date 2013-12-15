From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Dec 2013 19:56:32 +0100
Subject: [Buildroot] [PATCH] manual: add section about dealing efficiently
	with big image files
Message-ID: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

As reported by Ryan, it is not well-known that most tools can deal
efficiently with big sparse files.

Add a section in the manual about this, with three tools as examples,
and a hint to the man pages for the others.

Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 docs/manual/common-usage.txt | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 1290dfc..46183ec 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -100,3 +100,36 @@ or +g+++ for building helper-binaries on your host, then do
 --------------------
  $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 --------------------
+
+Dealing efficiently with filesystem images
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Filesystem images can get pretty big, depending on the filesystem you choose,
+the number of packages, whether you provisionned free space... Yet, some
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
+* +dd+ accepts the +sparse+ value in a +conv+ list (specifying the
+  block-size is recommended):
+** +dd if=image.file of=/dev/device bs=131072 conv=sparse+ will only
+   write to +/dev/device+ the blocks of +image.file+ that are not made
+   only of zeroes
+
+Other tools may have similar options. Please consult their own man pages.
-- 
1.8.1.2
