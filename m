From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 22:00:02 +0100
Subject: [Buildroot] [git commit] glibc: drop stray from merge/bump
Message-ID: <20150303212044.1BC267FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3971cdfd328985421f74fe2646ba64bb6c74f9ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/2.19/0004-CVE-2015-1472.patch |   88 ---------------------------
 package/glibc/Config.in                     |    1 -
 2 files changed, 0 insertions(+), 89 deletions(-)

diff --git a/package/glibc/2.19/0004-CVE-2015-1472.patch b/package/glibc/2.19/0004-CVE-2015-1472.patch
deleted file mode 100644
index b2f8e49..0000000
--- a/package/glibc/2.19/0004-CVE-2015-1472.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-Fix CVE-2015-1472 - heap buffer overflow in wscanf
-Backport from upstream:
-https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06
-See: https://bugzilla.redhat.com/show_bug.cgi?id=1188235
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
-index aece3f2..8a2eb9e 100644
---- a/stdio-common/tst-sscanf.c
-+++ b/stdio-common/tst-sscanf.c
-@@ -233,5 +233,38 @@ main (void)
- 	}
-     }
- 
-+  /* BZ #16618
-+     The test will segfault during SSCANF if the buffer overflow
-+     is not fixed.  The size of `s` is such that it forces the use
-+     of malloc internally and this triggers the incorrect computation.
-+     Thus the value for SIZE is arbitrariy high enough that malloc
-+     is used.  */
-+  {
-+#define SIZE 131072
-+    CHAR *s = malloc ((SIZE + 1) * sizeof (*s));
-+    if (s == NULL)
-+      abort ();
-+    for (size_t i = 0; i < SIZE; i++)
-+      s[i] = L('0');
-+    s[SIZE] = L('\0');
-+    int i = 42;
-+    /* Scan multi-digit zero into `i`.  */
-+    if (SSCANF (s, L("%d"), &i) != 1)
-+      {
-+	printf ("FAIL: bug16618: SSCANF did not read one input item.\n");
-+	result = 1;
-+      }
-+    if (i != 0)
-+      {
-+	printf ("FAIL: bug16618: Value of `i` was not zero as expected.\n");
-+	result = 1;
-+      }
-+    free (s);
-+    if (result != 1)
-+      printf ("PASS: bug16618: Did not crash.\n");
-+#undef SIZE
-+  }
-+
-+
-   return result;
- }
-diff --git a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
-index cd129a8..0e204e7 100644
---- a/stdio-common/vfscanf.c
-+++ b/stdio-common/vfscanf.c
-@@ -272,9 +272,10 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
-       if (__glibc_unlikely (wpsize == wpmax))				      \
- 	{								    \
- 	  CHAR_T *old = wp;						    \
--	  size_t newsize = (UCHAR_MAX + 1 > 2 * wpmax			    \
--			    ? UCHAR_MAX + 1 : 2 * wpmax);		    \
--	  if (use_malloc || !__libc_use_alloca (newsize))		    \
-+	  bool fits = __glibc_likely (wpmax <= SIZE_MAX / sizeof (CHAR_T) / 2); \
-+	  size_t wpneed = MAX (UCHAR_MAX + 1, 2 * wpmax);		    \
-+	  size_t newsize = fits ? wpneed * sizeof (CHAR_T) : SIZE_MAX;	    \
-+	  if (!__libc_use_alloca (newsize))				    \
- 	    {								    \
- 	      wp = realloc (use_malloc ? wp : NULL, newsize);		    \
- 	      if (wp == NULL)						    \
-@@ -286,14 +287,13 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
- 		}							    \
- 	      if (! use_malloc)						    \
- 		MEMCPY (wp, old, wpsize);				    \
--	      wpmax = newsize;						    \
-+	      wpmax = wpneed;						    \
- 	      use_malloc = true;					    \
- 	    }								    \
- 	  else								    \
- 	    {								    \
- 	      size_t s = wpmax * sizeof (CHAR_T);			    \
--	      wp = (CHAR_T *) extend_alloca (wp, s,			    \
--					     newsize * sizeof (CHAR_T));    \
-+	      wp = (CHAR_T *) extend_alloca (wp, s, newsize);		    \
- 	      wpmax = s / sizeof (CHAR_T);				    \
- 	      if (old != NULL)						    \
- 		MEMCPY (wp, old, wpsize);				    \
--- 
-1.9.4
-
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 8001491..1dd22c9 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -47,6 +47,5 @@ config BR2_GLIBC_VERSION_STRING
 	string
 	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
 	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
-	default "2.19" if BR2_GLIBC_VERSION_2_19
 	default "2.20" if BR2_GLIBC_VERSION_2_20
 	default "2.21" if BR2_GLIBC_VERSION_2_21
