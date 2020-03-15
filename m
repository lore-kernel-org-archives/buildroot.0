From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:14:01 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/patch: fix
 CVE-2019-13636
Message-ID: <20200315100136.AA2BE8427A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96725b6da94d50f06f81ab27fb5c41cf62783804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In GNU patch through 2.7.6, the following of symlinks is mishandled in
certain cases other than input files. This affects inp.c and util.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ad9c33935b2f765d020932d8268d2a46c6c130f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...symlinks-unless--follow-symlinks-is-given.patch | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
new file mode 100644
index 0000000000..e07ae0c670
--- /dev/null
+++ b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
@@ -0,0 +1,111 @@
+From dce4683cbbe107a95f1f0d45fabc304acfb5d71a Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 16:21:48 +0200
+Subject: Don't follow symlinks unless --follow-symlinks is given
+
+* src/inp.c (plan_a, plan_b), src/util.c (copy_to_fd, copy_file,
+append_to_file): Unless the --follow-symlinks option is given, open files with
+the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
+that consistently for input files.
+* src/util.c (create_backup): When creating empty backup files, (re)create them
+with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/inp.c  | 12 ++++++++++--
+ src/util.c | 14 +++++++++++---
+ 2 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/src/inp.c b/src/inp.c
+index 32d0919..22d7473 100644
+--- a/src/inp.c
++++ b/src/inp.c
+@@ -238,8 +238,13 @@ plan_a (char const *filename)
+     {
+       if (S_ISREG (instat.st_mode))
+         {
+-	  int ifd = safe_open (filename, O_RDONLY|binary_transput, 0);
++	  int flags = O_RDONLY | binary_transput;
+ 	  size_t buffered = 0, n;
++	  int ifd;
++
++	  if (! follow_symlinks)
++	    flags |= O_NOFOLLOW;
++	  ifd = safe_open (filename, flags, 0);
+ 	  if (ifd < 0)
+ 	    pfatal ("can't open file %s", quotearg (filename));
+ 
+@@ -340,6 +345,7 @@ plan_a (char const *filename)
+ static void
+ plan_b (char const *filename)
+ {
++  int flags = O_RDONLY | binary_transput;
+   int ifd;
+   FILE *ifp;
+   int c;
+@@ -353,7 +359,9 @@ plan_b (char const *filename)
+ 
+   if (instat.st_size == 0)
+     filename = NULL_DEVICE;
+-  if ((ifd = safe_open (filename, O_RDONLY | binary_transput, 0)) < 0
++  if (! follow_symlinks)
++    flags |= O_NOFOLLOW;
++  if ((ifd = safe_open (filename, flags, 0)) < 0
+       || ! (ifp = fdopen (ifd, binary_transput ? "rb" : "r")))
+     pfatal ("Can't open file %s", quotearg (filename));
+   if (TMPINNAME_needs_removal)
+diff --git a/src/util.c b/src/util.c
+index 1cc08ba..fb38307 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -388,7 +388,7 @@ create_backup (char const *to, const struct stat *to_st, bool leave_original)
+ 
+ 	  try_makedirs_errno = ENOENT;
+ 	  safe_unlink (bakname);
+-	  while ((fd = safe_open (bakname, O_CREAT | O_WRONLY | O_TRUNC, 0666)) < 0)
++	  while ((fd = safe_open (bakname, O_CREAT | O_EXCL | O_WRONLY | O_TRUNC, 0666)) < 0)
+ 	    {
+ 	      if (errno != try_makedirs_errno)
+ 		pfatal ("Can't create file %s", quotearg (bakname));
+@@ -579,10 +579,13 @@ create_file (char const *file, int open_flags, mode_t mode,
+ static void
+ copy_to_fd (const char *from, int tofd)
+ {
++  int from_flags = O_RDONLY | O_BINARY;
+   int fromfd;
+   ssize_t i;
+ 
+-  if ((fromfd = safe_open (from, O_RDONLY | O_BINARY, 0)) < 0)
++  if (! follow_symlinks)
++    from_flags |= O_NOFOLLOW;
++  if ((fromfd = safe_open (from, from_flags, 0)) < 0)
+     pfatal ("Can't reopen file %s", quotearg (from));
+   while ((i = read (fromfd, buf, bufsize)) != 0)
+     {
+@@ -625,6 +628,8 @@ copy_file (char const *from, char const *to, struct stat *tost,
+   else
+     {
+       assert (S_ISREG (mode));
++      if (! follow_symlinks)
++	to_flags |= O_NOFOLLOW;
+       tofd = create_file (to, O_WRONLY | O_BINARY | to_flags, mode,
+ 			  to_dir_known_to_exist);
+       copy_to_fd (from, tofd);
+@@ -640,9 +645,12 @@ copy_file (char const *from, char const *to, struct stat *tost,
+ void
+ append_to_file (char const *from, char const *to)
+ {
++  int to_flags = O_WRONLY | O_APPEND | O_BINARY;
+   int tofd;
+ 
+-  if ((tofd = safe_open (to, O_WRONLY | O_BINARY | O_APPEND, 0)) < 0)
++  if (! follow_symlinks)
++    to_flags |= O_NOFOLLOW;
++  if ((tofd = safe_open (to, to_flags, 0)) < 0)
+     pfatal ("Can't reopen file %s", quotearg (to));
+   copy_to_fd (from, tofd);
+   if (close (tofd) != 0)
+-- 
+cgit v1.2.1
+
