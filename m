From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 17 Nov 2016 11:00:26 +0100
Subject: [Buildroot] [PATCH 02/15] gcc5: honor SOURCE_DATE_EPOCH
In-Reply-To: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479376839-27795-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support $SOURCE_DATE_EPOCH is necessary to create reproducible build.
Unfortunately, it is not yet widely available. This patch add support for
SOURCE_DATE_EPOCH to Buildroot internal toolchains based on gcc 5.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch    | 213 +++++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 package/gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch

diff --git a/package/gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch b/package/gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch
new file mode 100644
index 0000000..0b644a7
--- /dev/null
+++ b/package/gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch
@@ -0,0 +1,213 @@
+From: J?r?me Pouiller <jezz@sysmic.org>
+Date: Fri, 04 Nov 2016 11:45:07 +0100
+Subject: [PATCH] Honor SOURCE_DATE_EPOCH
+
+Upstream status:
+  Accepted.
+  See http://gcc.gnu.org/git/?p=gcc.git;a=patch;h=e3e8c48c4a494d9da741c1c8ea6c4c0b7c4ff934
+
+Current patch is backported from equivalent written for gcc 6.1
+
+2016-04-28  Eduard Sanou  <dhole@openmailbox.org>
+	    Matthias Klose  <doko@debian.org>
+
+	* c-common.c (get_source_date_epoch): New function, gets the environment
+	variable SOURCE_DATE_EPOCH and parses it as long long with error
+	handling.
+	* c-common.h (get_source_date_epoch): Prototype.
+	* c-lex.c (c_lex_with_flags): set parse_in->source_date_epoch.
+
+gcc/ChangeLog:
+
+2016-04-28  Eduard Sanou  <dhole@openmailbox.org>
+	    Matthias Klose  <doko@debian.org>
+
+	* doc/cppenv.texi: Document SOURCE_DATE_EPOCH environment variable.
+
+libcpp/ChangeLog:
+
+2016-04-28  Eduard Sanou  <dhole@openmailbox.org>
+	    Matthias Klose  <doko@debian.org>
+
+	* include/cpplib.h (cpp_init_source_date_epoch): Prototype.
+	* init.c (cpp_init_source_date_epoch): New function.
+	* internal.h: Added source_date_epoch variable to struct
+	cpp_reader to store a reproducible date.
+	* macro.c (_cpp_builtin_macro_text): Set pfile->date timestamp from
+	pfile->source_date_epoch instead of localtime if source_date_epoch is
+	set, to be used for __DATE__ and __TIME__ macros to help reproducible
+	builds.
+
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+
+---
+ gcc/c-family/c-common.c |   33 +++++++++++++++++++++++++++++++++
+ gcc/c-family/c-common.h |    6 ++++++
+ gcc/c-family/c-lex.c    |    3 +++
+ gcc/doc/cppenv.texi     |   17 +++++++++++++++++
+ libcpp/include/cpplib.h |    3 +++
+ libcpp/init.c           |    7 +++++++
+ libcpp/internal.h       |    4 ++++
+ libcpp/macro.c          |   21 ++++++++++++++-------
+ 8 files changed, 87 insertions(+), 7 deletions(-)
+
+--- a/gcc/c-family/c-common.c
++++ b/gcc/c-family/c-common.c
+@@ -12318,4 +12318,37 @@ pointer_to_zero_sized_aggr_p (tree t)
+   return (TYPE_SIZE (t) && integer_zerop (TYPE_SIZE (t)));
+ }
+ 
++/* Read SOURCE_DATE_EPOCH from environment to have a deterministic
++   timestamp to replace embedded current dates to get reproducible
++   results.  Returns -1 if SOURCE_DATE_EPOCH is not defined.  */
++time_t
++get_source_date_epoch ()
++{
++  char *source_date_epoch;
++  long long epoch;
++  char *endptr;
++
++  source_date_epoch = getenv ("SOURCE_DATE_EPOCH");
++  if (!source_date_epoch)
++    return (time_t) -1;
++
++  errno = 0;
++  epoch = strtoll (source_date_epoch, &endptr, 10);
++  if ((errno == ERANGE && (epoch == LLONG_MAX || epoch == LLONG_MIN))
++      || (errno != 0 && epoch == 0))
++    fatal_error (UNKNOWN_LOCATION, "environment variable $SOURCE_DATE_EPOCH: "
++		 "strtoll: %s\n", xstrerror(errno));
++  if (endptr == source_date_epoch)
++    fatal_error (UNKNOWN_LOCATION, "environment variable $SOURCE_DATE_EPOCH: "
++		 "no digits were found: %s\n", endptr);
++  if (*endptr != '\0')
++    fatal_error (UNKNOWN_LOCATION, "environment variable $SOURCE_DATE_EPOCH: "
++		 "trailing garbage: %s\n", endptr);
++  if (epoch < 0)
++    fatal_error (UNKNOWN_LOCATION, "environment variable $SOURCE_DATE_EPOCH: "
++		 "value must be nonnegative: %lld \n", epoch);
++
++  return (time_t) epoch;
++}
++
+ #include "gt-c-family-c-common.h"
+--- a/gcc/c-family/c-common.h
++++ b/gcc/c-family/c-common.h
+@@ -1437,4 +1437,10 @@ extern bool contains_cilk_spawn_stmt (tr
+ extern tree cilk_for_number_of_iterations (tree);
+ extern bool check_no_cilk (tree, const char *, const char *,
+ 		           location_t loc = UNKNOWN_LOCATION);
++
++/* Read SOURCE_DATE_EPOCH from environment to have a deterministic
++   timestamp to replace embedded current dates to get reproducible
++   results.  Returns -1 if SOURCE_DATE_EPOCH is not defined.  */
++extern time_t get_source_date_epoch (void);
++
+ #endif /* ! GCC_C_COMMON_H */
+--- a/gcc/c-family/c-lex.c
++++ b/gcc/c-family/c-lex.c
+@@ -402,6 +402,9 @@ c_lex_with_flags (tree *value, location_
+   enum cpp_ttype type;
+   unsigned char add_flags = 0;
+   enum overflow_type overflow = OT_NONE;
++  time_t source_date_epoch = get_source_date_epoch ();
++
++  cpp_init_source_date_epoch (parse_in, source_date_epoch);
+ 
+   timevar_push (TV_CPP);
+  retry:
+--- a/gcc/doc/cppenv.texi
++++ b/gcc/doc/cppenv.texi
+@@ -79,4 +79,21 @@ main input file is omitted.
+ @ifclear cppmanual
+ @xref{Preprocessor Options}.
+ @end ifclear
++
++ at item SOURCE_DATE_EPOCH
++
++If this variable is set, its value specifies a UNIX timestamp to be
++used in replacement of the current date and time in the @code{__DATE__}
++and @code{__TIME__} macros, so that the embedded timestamps become
++reproducible.
++
++The value of @env{SOURCE_DATE_EPOCH} must be a UNIX timestamp,
++defined as the number of seconds (excluding leap seconds) since
++01 Jan 1970 00:00:00 represented in ASCII, identical to the output of
++@samp{@command{date +%s}}.
++
++The value should be a known timestamp such as the last modification
++time of the source or package and it should be set by the build
++process.
++
+ @end vtable
+--- a/libcpp/include/cpplib.h
++++ b/libcpp/include/cpplib.h
+@@ -775,6 +775,9 @@ extern void cpp_init_special_builtins (c
+ /* Set up built-ins like __FILE__.  */
+ extern void cpp_init_builtins (cpp_reader *, int);
+ 
++/* Initialize the source_date_epoch value.  */
++extern void cpp_init_source_date_epoch (cpp_reader *, time_t);
++
+ /* This is called after options have been parsed, and partially
+    processed.  */
+ extern void cpp_post_options (cpp_reader *);
+--- a/libcpp/init.c
++++ b/libcpp/init.c
+@@ -530,6 +530,13 @@ cpp_init_builtins (cpp_reader *pfile, in
+     _cpp_define_builtin (pfile, "__OBJC__ 1");
+ }
+ 
++/* Initialize the source_date_epoch value.  */
++void
++cpp_init_source_date_epoch (cpp_reader *pfile, time_t source_date_epoch)
++{
++  pfile->source_date_epoch = source_date_epoch; 
++}
++
+ /* Sanity-checks are dependent on command-line options, so it is
+    called as a subroutine of cpp_read_main_file ().  */
+ #if ENABLE_CHECKING
+--- a/libcpp/internal.h
++++ b/libcpp/internal.h
+@@ -502,6 +502,10 @@ struct cpp_reader
+   const unsigned char *date;
+   const unsigned char *time;
+ 
++  /* Externally set timestamp to replace current date and time useful for
++     reproducibility.  */
++  time_t source_date_epoch;
++
+   /* EOF token, and a token forcing paste avoidance.  */
+   cpp_token avoid_paste;
+   cpp_token eof;
+--- a/libcpp/macro.c
++++ b/libcpp/macro.c
+@@ -350,13 +350,20 @@ _cpp_builtin_macro_text (cpp_reader *pfi
+ 	  time_t tt;
+ 	  struct tm *tb = NULL;
+ 
+-	  /* (time_t) -1 is a legitimate value for "number of seconds
+-	     since the Epoch", so we have to do a little dance to
+-	     distinguish that from a genuine error.  */
+-	  errno = 0;
+-	  tt = time(NULL);
+-	  if (tt != (time_t)-1 || errno == 0)
+-	    tb = localtime (&tt);
++	  /* Set a reproducible timestamp for __DATE__ and __TIME__ macro
++	     usage if SOURCE_DATE_EPOCH is defined.  */
++	  if (pfile->source_date_epoch != (time_t) -1)
++	     tb = gmtime (&pfile->source_date_epoch);
++	  else
++	    {
++	      /* (time_t) -1 is a legitimate value for "number of seconds
++		 since the Epoch", so we have to do a little dance to
++		 distinguish that from a genuine error.  */
++	      errno = 0;
++	      tt = time (NULL);
++	      if (tt != (time_t)-1 || errno == 0)
++		tb = localtime (&tt);
++	    }
+ 
+ 	  if (tb)
+ 	    {
-- 
1.9.1
