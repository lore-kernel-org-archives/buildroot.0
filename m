From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Apr 2021 21:54:18 +0200
Subject: [Buildroot] [PATCH-2021.02.x] package/tar: add upstream security
 fix for CVE-2021-20193
Message-ID: <20210409195418.8014-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- CVE-2021-20193: A flaw was found in the src/list.c of tar 1.33 and
  earlier.  This flaw allows an attacker who can submit a crafted input file
  to tar to cause uncontrolled consumption of memory.  The highest threat
  from this vulnerability is to system availability

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-memory-leak-in-read_header.patch | 129 ++++++++++++++++++
 package/tar/tar.mk                            |   3 +
 2 files changed, 132 insertions(+)
 create mode 100644 package/tar/0001-Fix-memory-leak-in-read_header.patch

diff --git a/package/tar/0001-Fix-memory-leak-in-read_header.patch b/package/tar/0001-Fix-memory-leak-in-read_header.patch
new file mode 100644
index 0000000000..874b27df38
--- /dev/null
+++ b/package/tar/0001-Fix-memory-leak-in-read_header.patch
@@ -0,0 +1,129 @@
+From d9d4435692150fa8ff68e1b1a473d187cc3fd777 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sun, 17 Jan 2021 20:41:11 +0200
+Subject: [PATCH] Fix memory leak in read_header
+
+Bug reported in https://savannah.gnu.org/bugs/?59897
+
+* src/list.c (read_header): Don't return directly from the loop.
+Instead set the status and break.  Return the status.  Free
+next_long_name and next_long_link before returning.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/list.c | 40 ++++++++++++++++++++++++++++------------
+ 1 file changed, 28 insertions(+), 12 deletions(-)
+
+diff --git a/src/list.c b/src/list.c
+index e40a5c8..d7ef441 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -408,26 +408,27 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	     enum read_header_mode mode)
+ {
+   union block *header;
+-  union block *header_copy;
+   char *bp;
+   union block *data_block;
+   size_t size, written;
+-  union block *next_long_name = 0;
+-  union block *next_long_link = 0;
++  union block *next_long_name = NULL;
++  union block *next_long_link = NULL;
+   size_t next_long_name_blocks = 0;
+   size_t next_long_link_blocks = 0;
+-
++  enum read_header status = HEADER_SUCCESS;
++  
+   while (1)
+     {
+-      enum read_header status;
+-
+       header = find_next_block ();
+       *return_block = header;
+       if (!header)
+-	return HEADER_END_OF_FILE;
++	{
++	  status = HEADER_END_OF_FILE;
++	  break;
++	}
+ 
+       if ((status = tar_checksum (header, false)) != HEADER_SUCCESS)
+-	return status;
++	break;
+ 
+       /* Good block.  Decode file size and return.  */
+ 
+@@ -437,7 +438,10 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	{
+ 	  info->stat.st_size = OFF_FROM_HEADER (header->header.size);
+ 	  if (info->stat.st_size < 0)
+-	    return HEADER_FAILURE;
++	    {
++	      status = HEADER_FAILURE;
++	      break;
++	    }
+ 	}
+ 
+       if (header->header.typeflag == GNUTYPE_LONGNAME
+@@ -447,10 +451,14 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	  || header->header.typeflag == SOLARIS_XHDTYPE)
+ 	{
+ 	  if (mode == read_header_x_raw)
+-	    return HEADER_SUCCESS_EXTENDED;
++	    {
++	      status = HEADER_SUCCESS_EXTENDED;
++	      break;
++	    }
+ 	  else if (header->header.typeflag == GNUTYPE_LONGNAME
+ 		   || header->header.typeflag == GNUTYPE_LONGLINK)
+ 	    {
++	      union block *header_copy;
+ 	      size_t name_size = info->stat.st_size;
+ 	      size_t n = name_size % BLOCKSIZE;
+ 	      size = name_size + BLOCKSIZE;
+@@ -517,7 +525,10 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	      xheader_decode_global (&xhdr);
+ 	      xheader_destroy (&xhdr);
+ 	      if (mode == read_header_x_global)
+-		return HEADER_SUCCESS_EXTENDED;
++		{
++		  status = HEADER_SUCCESS_EXTENDED;
++		  break;
++		}
+ 	    }
+ 
+ 	  /* Loop!  */
+@@ -536,6 +547,7 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	      name = next_long_name->buffer + BLOCKSIZE;
+ 	      recent_long_name = next_long_name;
+ 	      recent_long_name_blocks = next_long_name_blocks;
++	      next_long_name = NULL;
+ 	    }
+ 	  else
+ 	    {
+@@ -567,6 +579,7 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	      name = next_long_link->buffer + BLOCKSIZE;
+ 	      recent_long_link = next_long_link;
+ 	      recent_long_link_blocks = next_long_link_blocks;
++	      next_long_link = NULL;
+ 	    }
+ 	  else
+ 	    {
+@@ -578,9 +591,12 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	    }
+ 	  assign_string (&info->link_name, name);
+ 
+-	  return HEADER_SUCCESS;
++	  break;
+ 	}
+     }
++  free (next_long_name);
++  free (next_long_link);
++  return status;
+ }
+ 
+ #define ISOCTAL(c) ((c)>='0'&&(c)<='7')
+-- 
+2.20.1
+
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 2da731f80a..1a8e4369de 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -14,6 +14,9 @@ TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
 
+# 0001-Fix-memory-leak-in-read_header.patch
+TAR_IGNORE_CVES += CVE-2021-20193
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
 TAR_CONF_OPTS += --with-posix-acls
-- 
2.20.1
