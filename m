From: hamish at uclibc.org <hamish@uclibc.org>
Date: Sun,  6 Apr 2008 18:45:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fis
Message-ID: <20080407014542.BD6A63C43B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-06 18:45:41 -0700 (Sun, 06 Apr 2008)
New Revision: 21660

Log:
Add support for setting the image base address


Modified:
   trunk/buildroot/package/fis/fis-001-checksum.patch


Changeset:
Modified: trunk/buildroot/package/fis/fis-001-checksum.patch
===================================================================
--- trunk/buildroot/package/fis/fis-001-checksum.patch	2008-04-07 01:44:06 UTC (rev 21659)
+++ trunk/buildroot/package/fis/fis-001-checksum.patch	2008-04-07 01:45:41 UTC (rev 21660)
@@ -1,113 +1,6 @@
---- fis/fis.c	2007-05-03 06:42:51.000000000 +1000
-+++ ../../snapgear_avila/user/fconfig/fis.c	2007-09-06 13:48:38.000000000 +1000
-@@ -141,8 +141,8 @@
- 
- static void dump_desc(FILE* f, const struct fis_image_desc* d)
- {
--  fprintf(f,"%16s: addr = 0x%08x, size = 0x%08x\n",
--             d->name,     d->flash_base, d->size);
-+  fprintf(f,"%16s: addr = 0x%08x, size = 0x%08x, checksum = 0x%08x\n",
-+             d->name,     d->flash_base, d->size, d->file_cksum);
-   for (unsigned int i=0; i<(sizeof(d->skips)/4); ++i) {
-     if (d->skips[i]==0x736b6970 || d->skips[i]==0x70696b73) { // "skip"
-       uint32_t offset = d->skips[i+1];
-@@ -332,6 +332,7 @@
-   d->size        = swap_end_32(d->size);
-   d->entry_point = swap_end_32(d->entry_point);
-   d->data_length = swap_end_32(d->data_length);
-+  d->file_cksum  = swap_end_32(d->file_cksum);
-   for (unsigned int i=0; i<(sizeof(d->skips)/4); ++i) {
-     d->skips[i] = swap_end_32(d->skips[i]);
-   }
-@@ -499,6 +500,66 @@
-   save_dir(fd,offset,size,swap_endianness,dir);
- }
- 
-+static void fis_checksum(const char* device, int offset, int size, bool swap_endianness,
-+                       int argc, char* argv[])
-+{
-+  char* name = NULL;
-+  char* filename = NULL;
-+
-+  for (int i=0; i<argc; ++i) {
-+    char* arg=argv[i];
-+    if (strcmp(arg,"-f")==0) {
-+      if (i==argc-1) {
-+        fatal("argumnet missing for -f");
-+      }
-+      ++i;
-+      filename = argv[i];
-+    } else if (strcmp(arg,"-n")==0) {
-+      if (i==argc-1) {
-+        fatal("argumnet missing for -n");
-+      }
-+      ++i;
-+      name = argv[i];
-+      if (strlen(name)>=16) {
-+        fatal("name too long, max 16 chars including terminating null");
-+      }
-+    } else {
-+      fputs("Unrecognised option '",stderr);
-+      fputs(arg,stderr);
-+      fputs("'\n",stderr);
-+      exit(1);
-+    }
-+  }
-+
-+  if (name == NULL || filename == NULL)
-+    fatal("filename and partition name must be specified");
-+
-+  int fd;
-+  char *buf;
-+  struct stat stat_buf;
-+  uint32_t crc;
-+
-+  CHECK(fd=open(filename,O_RDONLY),-1);
-+  CHECK(stat(filename, &stat_buf),-1);
-+  buf = (char*)chk_malloc(stat_buf.st_size);
-+  CHECK(read(fd,buf,stat_buf.st_size),-1);
-+  crc = crc32(buf,stat_buf.st_size);
-+  close(fd);
-+  free(buf);
-+
-+  CHECK(fd=open(device,O_RDWR),-1);
-+  dir_t dir;
-+  load_dir(fd,offset,&size,swap_endianness,&dir);
-+  iter_t after = NULL;
-+  FOR_EACH_DIR_ENTRY(dir,i) {
-+    if (strcmp(get(i)->name, name) == 0) {
-+      get(i)->file_cksum = crc;
-+      get(i)->data_length = stat_buf.st_size;
-+      break;
-+    }
-+  }
-+  save_dir(fd,offset,size,swap_endianness,dir);
-+}
- 
- static void fis_delete(const char* device, int offset, int size, bool swap_endianness,
-                        char* name)
-@@ -528,6 +589,7 @@
-         "  fis [options] init\n"
-         "  fis [options] create -f address -l size -n name\n"
-         "  fis [options] delete name\n"
-+        "  fis [options] checksum -f filename -n name\n"
-         "Options:\n"
-         "  -d device    specify /dev/mtd* device containing directory\n"
-         "  -o offset    specify offset into device of start of directory\n"
-@@ -597,6 +659,11 @@
-         fis_create(device,offset,size,swap_endianness,
-                    argc-i-1,&argv[i+1]);
-         break;
-+      } else if (strcmp(arg,"checksum")==0) {
-+        check_dev(device);
-+        fis_checksum(device,offset,size,swap_endianness,
-+                   argc-i-1,&argv[i+1]);
-+        break;
-       } else if (strcmp(arg,"delete")==0) {
-         if (i!=argc-2) {
-           fatal("Exactly one argumnet required after 'delete'");
---- fis/crc.c	1970-01-01 10:00:00.000000000 +1000
-+++ ../../snapgear_avila/user/fconfig/crc.c	2007-09-06 13:48:38.000000000 +1000
+diff -uN fis.orig/crc.c fis/crc.c
+--- fis.orig/crc.c	1970-01-01 10:00:00.000000000 +1000
++++ fis/crc.c	2008-04-01 11:39:13.000000000 +1100
 @@ -0,0 +1,88 @@
 +/*
 + * crc.c
@@ -197,8 +90,9 @@
 +	return val;
 +}
 +
---- fis/crc.h0	1970-01-01 10:00:00.000000000 +1000
-+++ fis/crc.h	2007-10-18 12:12:19.000000000 +1000
+diff -uN fis.orig/crc.h fis/crc.h
+--- fis.orig/crc.h	1970-01-01 10:00:00.000000000 +1000
++++ fis/crc.h	2008-04-01 11:39:13.000000000 +1100
 @@ -0,0 +1,25 @@
 +/*
 + * crc.h
@@ -225,3 +119,156 @@
 +
 +#endif //CRC_H
 +
+diff -uN fis.orig/fis.c fis/fis.c
+--- fis.orig/fis.c	2007-05-03 06:42:51.000000000 +1000
++++ fis/fis.c	2008-04-01 11:52:11.000000000 +1100
+@@ -30,6 +30,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ 
++#include "crc.h"
+ 
+ // Report an error and terminate:
+ 
+@@ -141,8 +142,8 @@
+ 
+ static void dump_desc(FILE* f, const struct fis_image_desc* d)
+ {
+-  fprintf(f,"%16s: addr = 0x%08x, size = 0x%08x\n",
+-             d->name,     d->flash_base, d->size);
++  fprintf(f,"%16s: flash addr = 0x%08x, mem addr = 0x%08x, size = 0x%08x, checksum = 0x%08x\n",
++             d->name, d->flash_base, d->mem_base, d->size, d->file_cksum);
+   for (unsigned int i=0; i<(sizeof(d->skips)/4); ++i) {
+     if (d->skips[i]==0x736b6970 || d->skips[i]==0x70696b73) { // "skip"
+       uint32_t offset = d->skips[i+1];
+@@ -332,6 +333,7 @@
+   d->size        = swap_end_32(d->size);
+   d->entry_point = swap_end_32(d->entry_point);
+   d->data_length = swap_end_32(d->data_length);
++  d->file_cksum  = swap_end_32(d->file_cksum);
+   for (unsigned int i=0; i<(sizeof(d->skips)/4); ++i) {
+     d->skips[i] = swap_end_32(d->skips[i]);
+   }
+@@ -446,19 +448,25 @@
+     char* arg=argv[i];
+     if (strcmp(arg,"-l")==0) {
+       if (i==argc-1) {
+-        fatal("argumnet missing for -l");
++        fatal("argument missing for -l");
+       }
+       ++i;
+       d->size = str_to_int_maybe_hex(argv[i]);
+     } else if (strcmp(arg,"-f")==0) {
+       if (i==argc-1) {
+-        fatal("argumnet missing for -f");
++        fatal("argument missing for -f");
+       }
+       ++i;
+       d->flash_base = str_to_int_maybe_hex(argv[i]);
++    } else if (strcmp(arg,"-m")==0) {
++      if (i==argc-1) {
++        fatal("argument missing for -m");
++      }
++      ++i;
++      d->mem_base = str_to_int_maybe_hex(argv[i]);
+     } else if (strcmp(arg,"-n")==0) {
+       if (i==argc-1) {
+-        fatal("argumnet missing for -n");
++        fatal("argument missing for -n");
+       }
+       ++i;
+       char* name = argv[i];
+@@ -499,6 +507,66 @@
+   save_dir(fd,offset,size,swap_endianness,dir);
+ }
+ 
++static void fis_checksum(const char* device, int offset, int size, bool swap_endianness,
++                       int argc, char* argv[])
++{
++  char* name = NULL;
++  char* filename = NULL;
++
++  for (int i=0; i<argc; ++i) {
++    char* arg=argv[i];
++    if (strcmp(arg,"-f")==0) {
++      if (i==argc-1) {
++        fatal("argument missing for -f");
++      }
++      ++i;
++      filename = argv[i];
++    } else if (strcmp(arg,"-n")==0) {
++      if (i==argc-1) {
++        fatal("argument missing for -n");
++      }
++      ++i;
++      name = argv[i];
++      if (strlen(name)>=16) {
++        fatal("name too long, max 16 chars including terminating null");
++      }
++    } else {
++      fputs("Unrecognised option '",stderr);
++      fputs(arg,stderr);
++      fputs("'\n",stderr);
++      exit(1);
++    }
++  }
++
++  if (name == NULL || filename == NULL)
++    fatal("filename and partition name must be specified");
++
++  int fd;
++  char *buf;
++  struct stat stat_buf;
++  uint32_t crc;
++
++  CHECK(fd=open(filename,O_RDONLY),-1);
++  CHECK(stat(filename, &stat_buf),-1);
++  buf = (char*)chk_malloc(stat_buf.st_size);
++  CHECK(read(fd,buf,stat_buf.st_size),-1);
++  crc = crc32(buf,stat_buf.st_size);
++  close(fd);
++  free(buf);
++
++  CHECK(fd=open(device,O_RDWR),-1);
++  dir_t dir;
++  load_dir(fd,offset,&size,swap_endianness,&dir);
++  iter_t after = NULL;
++  FOR_EACH_DIR_ENTRY(dir,i) {
++    if (strcmp(get(i)->name, name) == 0) {
++      get(i)->file_cksum = crc;
++      get(i)->data_length = stat_buf.st_size;
++      break;
++    }
++  }
++  save_dir(fd,offset,size,swap_endianness,dir);
++}
+ 
+ static void fis_delete(const char* device, int offset, int size, bool swap_endianness,
+                        char* name)
+@@ -526,8 +594,9 @@
+   fputs("Usage:\n"
+         "  fis [options] list\n"
+         "  fis [options] init\n"
+-        "  fis [options] create -f address -l size -n name\n"
++        "  fis [options] create -f address -l size -n name [-m memory_address]\n"
+         "  fis [options] delete name\n"
++        "  fis [options] checksum -f filename -n name\n"
+         "Options:\n"
+         "  -d device    specify /dev/mtd* device containing directory\n"
+         "  -o offset    specify offset into device of start of directory\n"
+@@ -597,9 +666,14 @@
+         fis_create(device,offset,size,swap_endianness,
+                    argc-i-1,&argv[i+1]);
+         break;
++      } else if (strcmp(arg,"checksum")==0) {
++        check_dev(device);
++        fis_checksum(device,offset,size,swap_endianness,
++                   argc-i-1,&argv[i+1]);
++        break;
+       } else if (strcmp(arg,"delete")==0) {
+         if (i!=argc-2) {
+-          fatal("Exactly one argumnet required after 'delete'");
++          fatal("Exactly one argument required after 'delete'");
+         }
+         ++i;
+         char* name = argv[i];
