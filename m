From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 May 2012 08:22:48 -0300
Subject: [Buildroot] [PATCH] binutils: add sysroot fix from bug #3049
Message-ID: <1336994568-29695-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add binutils ld sysroot bug fix.
See http://sourceware.org/bugzilla/show_bug.cgi?id=10340

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/binutils-2.20.1/500-sysroot.patch |   36 ++++++++++++++++++++
 package/binutils/binutils-2.20/500-sysroot.patch   |   36 ++++++++++++++++++++
 package/binutils/binutils-2.21.1/500-sysroot.patch |   36 ++++++++++++++++++++
 package/binutils/binutils-2.21/500-sysroot.patch   |   36 ++++++++++++++++++++
 package/binutils/binutils-2.22/500-sysroot.patch   |   36 ++++++++++++++++++++
 5 files changed, 180 insertions(+), 0 deletions(-)
 create mode 100644 package/binutils/binutils-2.20.1/500-sysroot.patch
 create mode 100644 package/binutils/binutils-2.20/500-sysroot.patch
 create mode 100644 package/binutils/binutils-2.21.1/500-sysroot.patch
 create mode 100644 package/binutils/binutils-2.21/500-sysroot.patch
 create mode 100644 package/binutils/binutils-2.22/500-sysroot.patch

diff --git a/package/binutils/binutils-2.20.1/500-sysroot.patch b/package/binutils/binutils-2.20.1/500-sysroot.patch
new file mode 100644
index 0000000..d21e4cb
--- /dev/null
+++ b/package/binutils/binutils-2.20.1/500-sysroot.patch
@@ -0,0 +1,36 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/binutils-2.20/500-sysroot.patch b/package/binutils/binutils-2.20/500-sysroot.patch
new file mode 100644
index 0000000..d21e4cb
--- /dev/null
+++ b/package/binutils/binutils-2.20/500-sysroot.patch
@@ -0,0 +1,36 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/binutils-2.21.1/500-sysroot.patch b/package/binutils/binutils-2.21.1/500-sysroot.patch
new file mode 100644
index 0000000..d21e4cb
--- /dev/null
+++ b/package/binutils/binutils-2.21.1/500-sysroot.patch
@@ -0,0 +1,36 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/binutils-2.21/500-sysroot.patch b/package/binutils/binutils-2.21/500-sysroot.patch
new file mode 100644
index 0000000..d21e4cb
--- /dev/null
+++ b/package/binutils/binutils-2.21/500-sysroot.patch
@@ -0,0 +1,36 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/binutils-2.22/500-sysroot.patch b/package/binutils/binutils-2.22/500-sysroot.patch
new file mode 100644
index 0000000..d21e4cb
--- /dev/null
+++ b/package/binutils/binutils-2.22/500-sysroot.patch
@@ -0,0 +1,36 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
-- 
1.7.3.4
