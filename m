Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039B9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:12:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B1360200
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3B1360200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F4680D27;
	Mon,  6 Sep 2021 15:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDVKg2F2Y5Pa; Mon,  6 Sep 2021 15:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278FE80ECB;
	Mon,  6 Sep 2021 15:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58EF21BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F07F40495
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBgyB0_fJVl1 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:12:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D92440109
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:12:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF416886C0; Mon,  6 Sep 2021 15:10:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 17:06:38 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 9d341ef2ec2bb89d6b368a53ec6a97df4b8448d2
X-Git-Newrev: 94bd3fa36cb57131461e5e457fbb345c00c9c4ea
X-Patchwork-Hint: ignore
Message-Id: <20210906151041.CF416886C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/cpio: fix
 CVE-2021-38185
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94bd3fa36cb57131461e5e457fbb345c00c9c4ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

GNU cpio through 2.13 allows attackers to execute arbitrary code via a
crafted pattern file, because of a dstring.c ds_fgetstr integer overflow
that triggers an out-of-bounds heap write. NOTE: it is unclear whether
there are common cases where the pattern file, associated with the -E
option, is untrusted data.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 89857df2d1233f60ca7702b387d8e2a17e125d23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../cpio/0002-Rewrite-dynamic-string-support.patch | 461 +++++++++++++++++++++
 package/cpio/0003-Fix-previous-commit.patch        |  40 ++
 package/cpio/cpio.mk                               |   4 +
 3 files changed, 505 insertions(+)

diff --git a/package/cpio/0002-Rewrite-dynamic-string-support.patch b/package/cpio/0002-Rewrite-dynamic-string-support.patch
new file mode 100644
index 0000000000..44282ae3f1
--- /dev/null
+++ b/package/cpio/0002-Rewrite-dynamic-string-support.patch
@@ -0,0 +1,461 @@
+From dd96882877721703e19272fe25034560b794061b Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 7 Aug 2021 12:52:21 +0300
+Subject: Rewrite dynamic string support.
+
+* src/dstring.c (ds_init): Take a single argument.
+(ds_free): New function.
+(ds_resize): Take a single argument.  Use x2nrealloc to expand
+the storage.
+(ds_reset,ds_append,ds_concat,ds_endswith): New function.
+(ds_fgetstr): Rewrite.  In particular, this fixes integer overflow.
+* src/dstring.h (dynamic_string): Keep both the allocated length
+(ds_size) and index of the next free byte in the string (ds_idx).
+(ds_init,ds_resize): Change signature.
+(ds_len): New macro.
+(ds_free,ds_reset,ds_append,ds_concat,ds_endswith): New protos.
+* src/copyin.c: Use new ds_ functions.
+* src/copyout.c: Likewise.
+* src/copypass.c: Likewise.
+* src/util.c: Likewise.
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dd96882877721703e19272fe25034560b794061b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/copyin.c   | 40 +++++++++++++-------------
+ src/copyout.c  | 16 ++++-------
+ src/copypass.c | 34 +++++++++++------------
+ src/dstring.c  | 88 ++++++++++++++++++++++++++++++++++++++++++----------------
+ src/dstring.h  | 31 ++++++++++-----------
+ src/util.c     |  6 ++--
+ 6 files changed, 123 insertions(+), 92 deletions(-)
+
+diff --git a/src/copyin.c b/src/copyin.c
+index a096048..4fb14af 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -55,11 +55,12 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *tty_in, FILE *tty_out,
+   char *str_res;		/* Result for string function.  */
+   static dynamic_string new_name;	/* New file name for rename option.  */
+   static int initialized_new_name = false;
++
+   if (!initialized_new_name)
+-  {
+-    ds_init (&new_name, 128);
+-    initialized_new_name = true;
+-  }
++    {
++      ds_init (&new_name);
++      initialized_new_name = true;
++    }
+ 
+   if (rename_flag)
+     {
+@@ -780,37 +781,36 @@ long_format (struct cpio_file_stat *file_hdr, char const *link_name)
+    already in `save_patterns' (from the command line) are preserved.  */
+ 
+ static void
+-read_pattern_file ()
++read_pattern_file (void)
+ {
+-  int max_new_patterns;
+-  char **new_save_patterns;
+-  int new_num_patterns;
++  char **new_save_patterns = NULL;
++  size_t max_new_patterns;
++  size_t new_num_patterns;
+   int i;
+-  dynamic_string pattern_name;
++  dynamic_string pattern_name = DYNAMIC_STRING_INITIALIZER;
+   FILE *pattern_fp;
+ 
+   if (num_patterns < 0)
+     num_patterns = 0;
+-  max_new_patterns = 1 + num_patterns;
+-  new_save_patterns = (char **) xmalloc (max_new_patterns * sizeof (char *));
+   new_num_patterns = num_patterns;
+-  ds_init (&pattern_name, 128);
++  max_new_patterns = num_patterns;
++  new_save_patterns = xcalloc (max_new_patterns, sizeof (new_save_patterns[0]));
+ 
+   pattern_fp = fopen (pattern_file_name, "r");
+   if (pattern_fp == NULL)
+     open_fatal (pattern_file_name);
+   while (ds_fgetstr (pattern_fp, &pattern_name, '\n') != NULL)
+     {
+-      if (new_num_patterns >= max_new_patterns)
+-	{
+-	  max_new_patterns += 1;
+-	  new_save_patterns = (char **)
+-	    xrealloc ((char *) new_save_patterns,
+-		      max_new_patterns * sizeof (char *));
+-	}
++      if (new_num_patterns == max_new_patterns)
++	new_save_patterns = x2nrealloc (new_save_patterns,
++					&max_new_patterns,
++					sizeof (new_save_patterns[0]));
+       new_save_patterns[new_num_patterns] = xstrdup (pattern_name.ds_string);
+       ++new_num_patterns;
+     }
++
++  ds_free (&pattern_name);
++  
+   if (ferror (pattern_fp) || fclose (pattern_fp) == EOF)
+     close_error (pattern_file_name);
+ 
+@@ -1210,7 +1210,7 @@ swab_array (char *ptr, int count)
+    in the file system.  */
+ 
+ void
+-process_copy_in ()
++process_copy_in (void)
+ {
+   FILE *tty_in = NULL;		/* Interactive file for rename option.  */
+   FILE *tty_out = NULL;		/* Interactive file for rename option.  */
+diff --git a/src/copyout.c b/src/copyout.c
+index 5ca587f..ca6798c 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -594,9 +594,10 @@ assign_string (char **pvar, char *value)
+    The format of the header depends on the compatibility (-c) flag.  */
+ 
+ void
+-process_copy_out ()
++process_copy_out (void)
+ {
+-  dynamic_string input_name;	/* Name of file read from stdin.  */
++  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
++                                /* Name of file read from stdin.  */
+   struct stat file_stat;	/* Stat record for file.  */
+   struct cpio_file_stat file_hdr = CPIO_FILE_STAT_INITIALIZER;
+                                 /* Output header information.  */
+@@ -605,7 +606,6 @@ process_copy_out ()
+   char *orig_file_name = NULL;
+ 
+   /* Initialize the copy out.  */
+-  ds_init (&input_name, 128);
+   file_hdr.c_magic = 070707;
+ 
+   /* Check whether the output file might be a tape.  */
+@@ -657,14 +657,9 @@ process_copy_out ()
+ 	    {
+ 	      if (file_hdr.c_mode & CP_IFDIR)
+ 		{
+-		  int len = strlen (input_name.ds_string);
+ 		  /* Make sure the name ends with a slash */
+-		  if (input_name.ds_string[len-1] != '/')
+-		    {
+-		      ds_resize (&input_name, len + 2);
+-		      input_name.ds_string[len] = '/';
+-		      input_name.ds_string[len+1] = 0;
+-		    }
++		  if (!ds_endswith (&input_name, '/'))
++		    ds_append (&input_name, '/');
+ 		}
+ 	    }
+ 	  
+@@ -875,6 +870,7 @@ process_copy_out ()
+ 			 (unsigned long) blocks), (unsigned long) blocks);
+     }
+   cpio_file_stat_free (&file_hdr);
++  ds_free (&input_name);
+ }
+ 
+ 
+diff --git a/src/copypass.c b/src/copypass.c
+index 5d5e939..23ee687 100644
+--- a/src/copypass.c
++++ b/src/copypass.c
+@@ -48,10 +48,12 @@ set_copypass_perms (int fd, const char *name, struct stat *st)
+    If `link_flag', link instead of copying.  */
+ 
+ void
+-process_copy_pass ()
++process_copy_pass (void)
+ {
+-  dynamic_string input_name;	/* Name of file from stdin.  */
+-  dynamic_string output_name;	/* Name of new file.  */
++  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
++                                /* Name of file from stdin.  */
++  dynamic_string output_name = DYNAMIC_STRING_INITIALIZER;
++                                /* Name of new file.  */
+   size_t dirname_len;		/* Length of `directory_name'.  */
+   int res;			/* Result of functions.  */
+   char *slash;			/* For moving past slashes in input name.  */
+@@ -65,25 +67,18 @@ process_copy_pass ()
+ 				   created files  */
+ 
+   /* Initialize the copy pass.  */
+-  ds_init (&input_name, 128);
+   
+   dirname_len = strlen (directory_name);
+   if (change_directory_option && !ISSLASH (directory_name[0]))
+     {
+       char *pwd = xgetcwd ();
+-
+-      dirname_len += strlen (pwd) + 1;
+-      ds_init (&output_name, dirname_len + 2);
+-      strcpy (output_name.ds_string, pwd);
+-      strcat (output_name.ds_string, "/");
+-      strcat (output_name.ds_string, directory_name);
++      
++      ds_concat (&output_name, pwd);
++      ds_append (&output_name, '/');
+     }
+-  else
+-    {
+-      ds_init (&output_name, dirname_len + 2);
+-      strcpy (output_name.ds_string, directory_name);
+-    }
+-  output_name.ds_string[dirname_len] = '/';
++  ds_concat (&output_name, directory_name);
++  ds_append (&output_name, '/');
++  dirname_len = ds_len (&output_name);
+   output_is_seekable = true;
+ 
+   change_dir ();
+@@ -116,8 +111,8 @@ process_copy_pass ()
+       /* Make the name of the new file.  */
+       for (slash = input_name.ds_string; *slash == '/'; ++slash)
+ 	;
+-      ds_resize (&output_name, dirname_len + strlen (slash) + 2);
+-      strcpy (output_name.ds_string + dirname_len + 1, slash);
++      ds_reset (&output_name, dirname_len);
++      ds_concat (&output_name, slash);
+ 
+       existing_dir = false;
+       if (lstat (output_name.ds_string, &out_file_stat) == 0)
+@@ -333,6 +328,9 @@ process_copy_pass ()
+ 			 (unsigned long) blocks),
+ 	       (unsigned long) blocks);
+     }
++
++  ds_free (&input_name);
++  ds_free (&output_name);
+ }
+ 
+ /* Try and create a hard link from FILE_NAME to another file 
+diff --git a/src/dstring.c b/src/dstring.c
+index b261d5a..692d3e7 100644
+--- a/src/dstring.c
++++ b/src/dstring.c
+@@ -20,8 +20,8 @@
+ #if defined(HAVE_CONFIG_H)
+ # include <config.h>
+ #endif
+-
+ #include <stdio.h>
++#include <stdlib.h>
+ #if defined(HAVE_STRING_H) || defined(STDC_HEADERS)
+ #include <string.h>
+ #else
+@@ -33,24 +33,41 @@
+ /* Initialiaze dynamic string STRING with space for SIZE characters.  */
+ 
+ void
+-ds_init (dynamic_string *string, int size)
++ds_init (dynamic_string *string)
++{
++  memset (string, 0, sizeof *string);
++}
++
++/* Free the dynamic string storage. */
++
++void
++ds_free (dynamic_string *string)
+ {
+-  string->ds_length = size;
+-  string->ds_string = (char *) xmalloc (size);
++  free (string->ds_string);
+ }
+ 
+-/* Expand dynamic string STRING, if necessary, to hold SIZE characters.  */
++/* Expand dynamic string STRING, if necessary.  */
+ 
+ void
+-ds_resize (dynamic_string *string, int size)
++ds_resize (dynamic_string *string)
+ {
+-  if (size > string->ds_length)
++  if (string->ds_idx == string->ds_size)
+     {
+-      string->ds_length = size;
+-      string->ds_string = (char *) xrealloc ((char *) string->ds_string, size);
++      string->ds_string = x2nrealloc (string->ds_string, &string->ds_size,
++				      1);
+     }
+ }
+ 
++/* Reset the index of the dynamic string S to LEN. */
++
++void
++ds_reset (dynamic_string *s, size_t len)
++{
++  while (len > s->ds_size)
++    ds_resize (s);
++  s->ds_idx = len;
++}
++
+ /* Dynamic string S gets a string terminated by the EOS character
+    (which is removed) from file F.  S will increase
+    in size during the function if the string from F is longer than
+@@ -61,34 +78,50 @@ ds_resize (dynamic_string *string, int size)
+ char *
+ ds_fgetstr (FILE *f, dynamic_string *s, char eos)
+ {
+-  int insize;			/* Amount needed for line.  */
+-  int strsize;			/* Amount allocated for S.  */
+   int next_ch;
+ 
+   /* Initialize.  */
+-  insize = 0;
+-  strsize = s->ds_length;
++  s->ds_idx = 0;
+ 
+   /* Read the input string.  */
+-  next_ch = getc (f);
+-  while (next_ch != eos && next_ch != EOF)
++  while ((next_ch = getc (f)) != eos && next_ch != EOF)
+     {
+-      if (insize >= strsize - 1)
+-	{
+-	  ds_resize (s, strsize * 2 + 2);
+-	  strsize = s->ds_length;
+-	}
+-      s->ds_string[insize++] = next_ch;
+-      next_ch = getc (f);
++      ds_resize (s);
++      s->ds_string[s->ds_idx++] = next_ch;
+     }
+-  s->ds_string[insize++] = '\0';
++  ds_resize (s);
++  s->ds_string[s->ds_idx] = '\0';
+ 
+-  if (insize == 1 && next_ch == EOF)
++  if (s->ds_idx == 0 && next_ch == EOF)
+     return NULL;
+   else
+     return s->ds_string;
+ }
+ 
++void
++ds_append (dynamic_string *s, int c)
++{
++  ds_resize (s);
++  s->ds_string[s->ds_idx] = c;
++  if (c)
++    {
++      s->ds_idx++;
++      ds_resize (s);
++      s->ds_string[s->ds_idx] = 0;
++    }      
++}
++
++void
++ds_concat (dynamic_string *s, char const *str)
++{
++  size_t len = strlen (str);
++  while (len + 1 > s->ds_size)
++    ds_resize (s);
++  memcpy (s->ds_string + s->ds_idx, str, len);
++  s->ds_idx += len;
++  s->ds_string[s->ds_idx] = 0;
++}
++
+ char *
+ ds_fgets (FILE *f, dynamic_string *s)
+ {
+@@ -100,3 +133,10 @@ ds_fgetname (FILE *f, dynamic_string *s)
+ {
+   return ds_fgetstr (f, s, '\0');
+ }
++
++/* Return true if the dynamic string S ends with character C. */
++int
++ds_endswith (dynamic_string *s, int c)
++{
++  return (s->ds_idx > 0 && s->ds_string[s->ds_idx - 1] == c);
++}
+diff --git a/src/dstring.h b/src/dstring.h
+index 5d24181..ca7a5f1 100644
+--- a/src/dstring.h
++++ b/src/dstring.h
+@@ -17,10 +17,6 @@
+    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
+    Boston, MA 02110-1301 USA.  */
+ 
+-#ifndef NULL
+-#define NULL 0
+-#endif
+-
+ /* A dynamic string consists of record that records the size of an
+    allocated string and the pointer to that string.  The actual string
+    is a normal zero byte terminated string that can be used with the
+@@ -30,22 +26,25 @@
+ 
+ typedef struct
+ {
+-  int ds_length;		/* Actual amount of storage allocated.  */
+-  char *ds_string;		/* String.  */
++  size_t ds_size;   /* Actual amount of storage allocated.  */
++  size_t ds_idx;    /* Index of the next free byte in the string. */
++  char *ds_string;  /* String storage. */
+ } dynamic_string;
+ 
++#define DYNAMIC_STRING_INITIALIZER { 0, 0, NULL }
+ 
+-/* Macros that look similar to the original string functions.
+-   WARNING:  These macros work only on pointers to dynamic string records.
+-   If used with a real record, an "&" must be used to get the pointer.  */
+-#define ds_strlen(s)		strlen ((s)->ds_string)
+-#define ds_strcmp(s1, s2)	strcmp ((s1)->ds_string, (s2)->ds_string)
+-#define ds_strncmp(s1, s2, n)	strncmp ((s1)->ds_string, (s2)->ds_string, n)
+-#define ds_index(s, c)		index ((s)->ds_string, c)
+-#define ds_rindex(s, c)		rindex ((s)->ds_string, c)
++void ds_init (dynamic_string *string);
++void ds_free (dynamic_string *string);
++void ds_reset (dynamic_string *s, size_t len);
+ 
+-void ds_init (dynamic_string *string, int size);
+-void ds_resize (dynamic_string *string, int size);
++/* All functions below guarantee that s->ds_string[s->ds_idx] == '\0' */
+ char *ds_fgetname (FILE *f, dynamic_string *s);
+ char *ds_fgets (FILE *f, dynamic_string *s);
+ char *ds_fgetstr (FILE *f, dynamic_string *s, char eos);
++void ds_append (dynamic_string *s, int c);
++void ds_concat (dynamic_string *s, char const *str);
++
++#define ds_len(s) ((s)->ds_idx)
++
++int ds_endswith (dynamic_string *s, int c);
++
+diff --git a/src/util.c b/src/util.c
+index 996d4fa..ff2746d 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -846,11 +846,9 @@ get_next_reel (int tape_des)
+   FILE *tty_out;		/* File for interacting with user.  */
+   int old_tape_des;
+   char *next_archive_name;
+-  dynamic_string new_name;
++  dynamic_string new_name = DYNAMIC_STRING_INITIALIZER;
+   char *str_res;
+ 
+-  ds_init (&new_name, 128);
+-
+   /* Open files for interactive communication.  */
+   tty_in = fopen (TTY_NAME, "r");
+   if (tty_in == NULL)
+@@ -925,7 +923,7 @@ get_next_reel (int tape_des)
+     error (PAXEXIT_FAILURE, 0, _("internal error: tape descriptor changed from %d to %d"),
+ 	   old_tape_des, tape_des);
+ 
+-  free (new_name.ds_string);
++  ds_free (&new_name);
+   fclose (tty_in);
+   fclose (tty_out);
+ }
+-- 
+cgit v1.2.1
+
diff --git a/package/cpio/0003-Fix-previous-commit.patch b/package/cpio/0003-Fix-previous-commit.patch
new file mode 100644
index 0000000000..e33a8523d8
--- /dev/null
+++ b/package/cpio/0003-Fix-previous-commit.patch
@@ -0,0 +1,40 @@
+From dfc801c44a93bed7b3951905b188823d6a0432c8 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Wed, 11 Aug 2021 18:10:38 +0300
+Subject: Fix previous commit
+
+* src/dstring.c (ds_reset,ds_concat): Don't call ds_resize in a
+loop.
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dfc801c44a93bed7b3951905b188823d6a0432c8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/dstring.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dstring.c b/src/dstring.c
+index 692d3e7..b7e0bb5 100644
+--- a/src/dstring.c
++++ b/src/dstring.c
+@@ -64,7 +64,7 @@ void
+ ds_reset (dynamic_string *s, size_t len)
+ {
+   while (len > s->ds_size)
+-    ds_resize (s);
++    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
+   s->ds_idx = len;
+ }
+ 
+@@ -116,7 +116,7 @@ ds_concat (dynamic_string *s, char const *str)
+ {
+   size_t len = strlen (str);
+   while (len + 1 > s->ds_size)
+-    ds_resize (s);
++    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
+   memcpy (s->ds_string + s->ds_idx, str, len);
+   s->ds_idx += len;
+   s->ds_string[s->ds_idx] = 0;
+-- 
+cgit v1.2.1
+
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 9ce281dd1c..e95ea742b3 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -12,6 +12,10 @@ CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
 CPIO_CPE_ID_VENDOR = gnu
 
+# 0002-Rewrite-dynamic-string-support.patch
+# 0003-Fix-previous-commit.patch
+CPIO_IGNORE_CVES += CVE-2021-38185
+
 # cpio uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
