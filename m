From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 17 Feb 2012 15:30:58 -0800
Subject: [Buildroot] [PATCH] Add documentation for makedev
In-Reply-To: <87r4yecilz.fsf@macbook.be.48ers.dk>
References: <87r4yecilz.fsf@macbook.be.48ers.dk>
Message-ID: <1329521458-5614-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 docs/manual/adding-packages-gentargets.txt |    5 ++-
 docs/manual/appendix.txt                   |    4 ++
 docs/manual/makedev-syntax.txt             |   54 ++++++++++++++++++++++++++++
 docs/manual/manual.txt                     |    2 +
 4 files changed, 64 insertions(+), 1 deletions(-)
 create mode 100644 docs/manual/appendix.txt
 create mode 100644 docs/manual/makedev-syntax.txt

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index 3656a53..cfcee8c 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -210,10 +210,13 @@ information is (assuming the package name is +libfoo+) :
 
 * +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
   when using the static device table. The syntax to use is the
-  makedevs one.
+  makedevs one. You can find some documentation for this syntax in the
+  xref:makedev-syntax[]. This variable is optional.
 
 * +LIBFOO_PERMISSIONS+ lists the changes of permissions to be done at
   the end of the build process. The syntax is once again the makedevs one.
+  You can find some documentation for this syntax in the xref:makedev-syntax[].
+  This variable is optional.
 
 The recommended way to define these variables is to use the following
 syntax:
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
new file mode 100644
index 0000000..f41c82c
--- /dev/null
+++ b/docs/manual/appendix.txt
@@ -0,0 +1,4 @@
+Appendix
+========
+
+include::makedev-syntax.txt[]
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
new file mode 100644
index 0000000..4728c4b
--- /dev/null
+++ b/docs/manual/makedev-syntax.txt
@@ -0,0 +1,54 @@
+[[makedev-syntax]]
+Makedev syntax documentation
+----------------------------
+
+The makedev syntax is used across several places in Buildroot to
+define changes to be made for permissions or which device files to
+create and how to create them, in order to avoid to call mkdnod every
+now and then.
+
+This syntax is derived from the makedev utility, and a more complete
+documentation can be found in the +package/makedevs/README+ file.
+
+It takes the form of a line for each file, with the following layout:
+
+|===========================================================
+|name |type |mode |uid |gid |major |minor |start |inc |count
+|===========================================================
+
+There is a few non-trivial blocks here:
+
+- +name+ is the path to the file you want to create/modify
+- +type+ is the type of the file, being one of :
+  * f: a regular file
+  * d: a directory
+  * c: a character device file
+  * b: a block device file
+  * p: a named pipe
+- +mode+, +uid+ and +gid+ are the usual permissions stuff
+- +major+ and +minor+ are here for device files
+- +start+, +inc+ and +count+ are when you want to create a whole batch
+  of files, and can be reduced to a loop, beginning at +start+,
+  incrementing its counter by +inc+ until it reaches +count+
+
+Let's say you want to change the permissions of a given file, using
+this syntax, you will need to put:
+-------------------------------------------------------------------
+/usr/bin/foobar	f	644	0	0	-	-	-	-	-
+-------------------------------------------------------------------
+
+On the other hand, if you want to create the device file +/dev/hda+
+and the corresponding 15 files for the partitions, you will need for
++/dev/hda+:
+
+-------------------------------------------------------------------
+/dev/hda	b	640	0	0	3	0	0	0	-
+-------------------------------------------------------------------
+
+and then for device files corresponding to the partitions of
++/dev/hda+, +/dev/hdaX+, +X+ ranging from 1 to 15:
+
+-------------------------------------------------------------------
+/dev/hda	b	640	0	0	3	1	1	1	15
+-------------------------------------------------------------------
+
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 10ce695..732b50c 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -30,3 +30,5 @@ include::ccache-support.txt[]
 include::download-location.txt[]
 
 include::adding-packages.txt[]
+
+include::appendix.txt[]
-- 
1.7.5.4
