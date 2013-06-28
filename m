From: =?utf-8?b?Q2lhcsOhbg==?= Rehill <cir.vfi@gmail.com>
Date: Fri, 28 Jun 2013 16:55:33 +0000 (UTC)
Subject: [Buildroot] ldconfig - unknown machine 40
Message-ID: <loom.20130628T172450-675@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Actual questions are below, on lines starting with "*** ", but some 
explanation of context is required first.)

I'm cross-compiling on an x86_64 build machine for an ARMv6 target using an 
external CodeSourcery toolchain.  The build machine is running Fedora 18, 
with glibc 2.16.
I notice that in the "target-finalize" stage, "ldconfig -r ..." is printing 
out a lot of lines like:

    /lib:
    /sbin/ldconfig: /lib/libnsl.so.1 is for unknown machine 40.
    ...
    /sbin/ldconfig: /lib/libthread_db-1.0.so is for unknown machine 40.
    /sbin/ldconfig: /lib/libgcc_s.so.1 is for unknown machine 40.
    ...
    /sbin/ldconfig: /lib/ld-linux.so.3 is for unknown machine 40.
    /sbin/ldconfig: /lib/libm.so.6 is for unknown machine 40.
    ...
    /sbin/ldconfig: /lib/libc.so.6 is for unknown machine 40.

and so on.  You'll notice these are toolchain-provided libraries; the same 
happens for all generated libraries too.
These are _not_ just warnings; ldconfig ignores the library content, so 
"output/target/etc/ld.so.cache" is left unpopulated, meaning that the 
target device will not boot successfully due to missing libraries (the 
libraries are on the file-system, just the ld.so.cache does not list them).

The same build works on a Ubuntu machine with (e)glibc 2.15 and older 
Fedora machines with earlier versions of glibc.

Since v2.15 appears to work and v2.16 does not, I grabbed the glibc git 
repo and did some digging in the commits between the two releases.  The one 
that grabbed my attention was commit 
f1a77b01f4e3a80782171297120e77ab112ce85d, in particular the change in 
"sysdeps/unix/sysv/linux/i386/readelflib.c" (equivalently the x86_64 
version after this commit too).

The patch is relatively small for this file so I'll include it here.

--
diff --git a/sysdeps/unix/sysv/linux/i386/readelflib.c b/sysdeps/unix/sysv/
linux/i386/readelflib.c
index bdd5e70..fab830e 100644
--- a/sysdeps/unix/sysv/linux/i386/readelflib.c
+++ b/sysdeps/unix/sysv/linux/i386/readelflib.c
@@ -32,40 +32,52 @@ process_elf_file (const char *file_name, const char 
*lib, int *flag,
           size_t file_length)
 {
   ElfW(Ehdr) *elf_header = (ElfW(Ehdr) *) file_contents;
-  int ret;
+  int ret, file_flag = 0;
 
-  if (elf_header->e_ident [EI_CLASS] == ELFCLASS32)
-    return process_elf32_file (file_name, lib, flag, osversion, soname,
-                   file_contents, file_length);
-  else
+  switch (elf_header->e_machine)
     {
-      switch (elf_header->e_machine)
+    case EM_X86_64:
+      if (elf_header->e_ident[EI_CLASS] == ELFCLASS64)
+    /* X86-64 64bit libraries are always libc.so.6+.  */
+    file_flag = FLAG_X8664_LIB64|FLAG_ELF_LIBC6;
+      else
+    /* X32 libraries are always libc.so.6+.  */
+    file_flag = FLAG_X8664_LIBX32|FLAG_ELF_LIBC6;
+      break;
+#ifndef SKIP_EM_IA_64
+    case EM_IA_64:
+      if (elf_header->e_ident[EI_CLASS] == ELFCLASS64)
     {
-    case EM_IA_64:
-    case EM_X86_64:
+      /* IA64 64bit libraries are always libc.so.6+.  */
+      file_flag = FLAG_IA64_LIB64|FLAG_ELF_LIBC6;
       break;
-    default:
-      error (0, 0, _("%s is for unknown machine %d.\n"),
-         file_name, elf_header->e_machine);
-      return 1;
     }
+      goto failed;
+#endif
+    case EM_386:
+      if (elf_header->e_ident[EI_CLASS] == ELFCLASS32)
+    break;
+      /* Fall through.  */
+    default:
+#ifndef SKIP_EM_IA_64
+failed:
+#endif
+      error (0, 0, _("%s is for unknown machine %d.\n"),
+         file_name, elf_header->e_machine);
+      return 1;
+    }
 
-      ret = process_elf64_file (file_name, lib, flag, osversion, soname,
-                file_contents, file_length);
-      /* IA64/X86-64 64bit libraries are always libc.so.6+.  */
-      if (!ret)
-    switch (elf_header->e_machine)
-      {
-      case EM_IA_64:
-        *flag = FLAG_IA64_LIB64|FLAG_ELF_LIBC6;
-        break;
-      case EM_X86_64:
-        *flag = FLAG_X8664_LIB64|FLAG_ELF_LIBC6;
-        break;
-      }
+  if (elf_header->e_ident[EI_CLASS] == ELFCLASS32)
+    ret = process_elf32_file (file_name, lib, flag, osversion, soname,
+                  file_contents, file_length);
+  else
+    ret = process_elf64_file (file_name, lib, flag, osversion, soname,
+                  file_contents, file_length);
 
-      return ret;
-    }
+  if (!ret && file_flag)
+    *flag = file_flag;
+
+  return ret;
 }
 
 #undef __ELF_NATIVE_CLASS
--


So, instead of just accepting the class identifier (ELFCLASS32, which 
includes most ARM binaries) and moving on, it now tests the machine and 
*then* the class.  Unfortunately, the list of accepted machines does not 
include ARM, so the "unknown machine 40" (40 being EM_ARM) is spat out and 
the attempt to process is abandoned.

*** Firstly, anyone else seeing this?  Searching doesn't turn up much.

*** Second, is my train of thought above correct?

*** Most importantly, any ideas on how to successfully use Buildroot on an 
F18 machine for ARM (or any non-Intel arch, I suppose)?

The act of typing the above line now makes me suspicious that I *am* the 
only one seeing this so there's something wrong on my end, but I have 
confirmed that this error *is* emitted with the top of current master 
branch (a2d06655e5684c10f6a02cc065aaf481f56a8c64) though, using the 
following defconfig:

--
BR2_arm=y
BR2_arm1136jf_s_r0=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/CodeSourcery/Sourcery_G++/libc/usr"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-none-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
# BR2_TARGET_ROOTFS_TAR is not set
--


Sorry for the long message, but I think everything mentioned is relevant 
(except this line ;-).
