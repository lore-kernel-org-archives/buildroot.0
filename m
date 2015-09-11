From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 11 Sep 2015 11:23:50 +0200
Subject: [Buildroot] [PATCH] android-tools: add target and adbd support
Message-ID: <1441963430-1326-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required to switch from the Debian to the Ubuntu package as the former
doesn't offer adbd support. That change allows to get rid the
AndroidConfig.h as everything is defined in the Makefiles.

Regarding adbd, the target is required to have the FunctionFS USB Gadget
configuration. Then the following commands enable the use of adb:
 # modprobe g_ffs idVendor=0x18d1 idProduct=0x4e42 \
   iSerialNumber="buildroot"
 # mkdir -p /dev/usb-ffs/adb
 # mount -t functionfs adb /dev/usb-ffs/adb -o uid=2000,gid=2000
 # adbd &

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is to be applied on top of the one from Antoine/Thomas:
http://patchwork.ozlabs.org/patch/467019/

This is a first draft and I'll obviously need to respin once a v3 of
their patch will be delivered. I don't know if it would even be
better to squash both patches and have one android-tools patch only.

A few things to note, originally I did a patch to add adbd using the
original system_core Android repo and a few patches (a RFC can be
provided if needed). But this approach doesn't allow to build
fastboot as it also requires ext4_utils from system_extras repo.

Wasn't sure if anyone would be interested in having adb/fastboot
running on the target but it didn't cost much to add them.

I was surprised not to see "select" in the Config.in.host for zlib
or openssl but only at dependencies in the .mk file. Is that on
purpose? To be in line I've basically copied the Config.in.host
into the Config.in but I have the feeling we should select the other
packages.

As for the testing, I've tried to run adbd on a Nitrogen6x and the
following commands from my machine:
$ adb devices
List of devices attached 
buildroot	device
$ adb shell
$ adb push 
$ adb pull

Regards,
Gary
---
 package/Config.in                                  |   1 +
 .../0001-Fix-makefiles-for-out-of-tree-build.patch | 165 +++++++++
 .../android-tools/0001-android-config-header.patch | 404 ---------------------
 .../0002-Fix-adbd-for-non-Ubuntu-systems.patch     | 267 ++++++++++++++
 package/android-tools/Config.in                    |  32 ++
 package/android-tools/android-tools.hash           |   6 +-
 package/android-tools/android-tools.mk             |  49 ++-
 7 files changed, 508 insertions(+), 416 deletions(-)
 create mode 100644 package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
 delete mode 100644 package/android-tools/0001-android-config-header.patch
 create mode 100644 package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
 create mode 100644 package/android-tools/Config.in

diff --git a/package/Config.in b/package/Config.in
index 030477a..072ea95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1454,6 +1454,7 @@ endmenu
 
 menu "System tools"
 	source "package/acl/Config.in"
+	source "package/android-tools/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
new file mode 100644
index 0000000..84bd997
--- /dev/null
+++ b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
@@ -0,0 +1,165 @@
+From 7b17464fa8a2dcfe43d8f7cf24a633e3848ab39b Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Fri, 11 Sep 2015 10:02:20 +0200
+Subject: [PATCH 1/2] Fix makefiles for out-of-tree build
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ debian/makefiles/adb.mk      | 10 +++++-----
+ debian/makefiles/adbd.mk     | 33 ++++++++++++++++-----------------
+ debian/makefiles/fastboot.mk | 17 +++++++++--------
+ 3 files changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/debian/makefiles/adb.mk b/debian/makefiles/adb.mk
+index d9d4feb..654b9f1 100644
+--- a/debian/makefiles/adb.mk
++++ b/debian/makefiles/adb.mk
+@@ -1,5 +1,6 @@
+ # Makefile for adb; from https://heiher.info/2227.html
+ 
++VPATH+= $(SRCDIR)/core/adb
+ SRCS+= adb.c
+ SRCS+= adb_client.c
+ SRCS+= adb_auth_host.c
+@@ -17,7 +18,7 @@ SRCS+= usb_linux.c
+ SRCS+= usb_vendors.c
+ SRCS+= utils.c
+ 
+-VPATH+= ../libcutils
++VPATH+= $(SRCDIR)/core/libcutils
+ SRCS+= abort_socket.c
+ SRCS+= socket_inaddr_any_server.c
+ SRCS+= socket_local_client.c
+@@ -28,7 +29,7 @@ SRCS+= socket_network_client.c
+ SRCS+= list.c
+ SRCS+= load_file.c
+ 
+-VPATH+= ../libzipfile
++VPATH+= $(SRCDIR)/core/libzipfile
+ SRCS+= centraldir.c
+ SRCS+= zipfile.c
+ 
+@@ -37,9 +38,8 @@ CPPFLAGS+= -DADB_HOST=1
+ CPPFLAGS+= -DHAVE_FORKEXEC=1
+ CPPFLAGS+= -DHAVE_SYMLINKS
+ CPPFLAGS+= -DHAVE_TERMIO_H
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I../include
+-CPPFLAGS+= -I../../../external/zlib
++CPPFLAGS+= -I$(SRCDIR)/core/adb
++CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+ LIBS+= -lc -lpthread -lz -lcrypto
+ 
+diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
+index 94d3a90..49dab8c 100644
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
+@@ -1,18 +1,6 @@
+ # Makefile for adbd
+ 
+-VPATH+= ../libcutils
+-SRCS+= abort_socket.c
+-SRCS+= socket_inaddr_any_server.c
+-SRCS+= socket_local_client.c
+-SRCS+= socket_local_server.c
+-SRCS+= socket_loopback_client.c
+-SRCS+= socket_loopback_server.c
+-SRCS+= socket_network_client.c
+-SRCS+= list.c
+-SRCS+= load_file.c
+-SRCS+= android_reboot.c
+-
+-#VPATH+= ../adb
++VPATH+= $(SRCDIR)/core/adbd
+ SRCS+=  adb.c
+ SRCS+=	backup_service.c
+ SRCS+=	fdevent.c
+@@ -31,7 +19,19 @@ SRCS+=	log_service.c
+ SRCS+=	utils.c
+ SRCS+=	base64.c
+ 
+-VPATH+= ../libzipfile
++VPATH+= $(SRCDIR)/core/libcutils
++SRCS+= abort_socket.c
++SRCS+= socket_inaddr_any_server.c
++SRCS+= socket_local_client.c
++SRCS+= socket_local_server.c
++SRCS+= socket_loopback_client.c
++SRCS+= socket_loopback_server.c
++SRCS+= socket_network_client.c
++SRCS+= list.c
++SRCS+= load_file.c
++SRCS+= android_reboot.c
++
++VPATH+= $(SRCDIR)/core/libzipfile
+ SRCS+= centraldir.c
+ SRCS+= zipfile.c
+ 
+@@ -40,10 +40,9 @@ CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
+ CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
+ CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
+ CPPFLAGS+= -DHAVE_TERMIO_H
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I../include
+-CPPFLAGS+= -I../../../external/zlib
+ CPPFLAGS+= `pkg-config --cflags glib-2.0 gio-2.0`
++CPPFLAGS+= -I$(SRCDIR)/core/adbd
++CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+ LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
+ 
+diff --git a/debian/makefiles/fastboot.mk b/debian/makefiles/fastboot.mk
+index 9e8b751..94a069b 100644
+--- a/debian/makefiles/fastboot.mk
++++ b/debian/makefiles/fastboot.mk
+@@ -1,5 +1,6 @@
+ # Makefile for fastboot; from https://heiher.info/2227.html
+ 
++VPATH+= $(SRCDIR)/core/fastboot
+ SRCS+= bootimg.c
+ SRCS+= engine.c
+ SRCS+= fastboot.c
+@@ -7,11 +8,11 @@ SRCS+= protocol.c
+ SRCS+= usb_linux.c
+ SRCS+= util_linux.c
+ 
+-VPATH+= ../libzipfile
++VPATH+= $(SRCDIR)/core/libzipfile
+ SRCS+= centraldir.c
+ SRCS+= zipfile.c
+ 
+-VPATH+= ../libsparse
++VPATH+= $(SRCDIR)/core/libsparse
+ SRCS+= backed_block.c
+ SRCS+= sparse_crc32.c
+ SRCS+= sparse.c
+@@ -19,7 +20,7 @@ SRCS+= sparse_read.c
+ SRCS+= sparse_err.c
+ SRCS+= output_file.c
+ 
+-VPATH+= ../../extras/ext4_utils/
++VPATH+= $(SRCDIR)/extras/ext4_utils/
+ SRCS+= make_ext4fs.c
+ SRCS+= crc16.c
+ SRCS+= ext4_utils.c
+@@ -31,11 +32,11 @@ SRCS+= extent.c
+ SRCS+= wipe.c
+ SRCS+= sha1.c
+ 
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I../include
+-CPPFLAGS+= -I../mkbootimg
+-CPPFLAGS+= -I../../extras/ext4_utils/
+-CPPFLAGS+= -I../libsparse/include/
++CPPFLAGS+= -I$(SRCDIR)/core/fastboot
++CPPFLAGS+= -I$(SRCDIR)/core/include
++CPPFLAGS+= -I$(SRCDIR)/core/mkbootimg
++CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils/
++CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
+ 
+ LIBS+= -lz -lselinux
+ 
+-- 
+2.5.1
+
diff --git a/package/android-tools/0001-android-config-header.patch b/package/android-tools/0001-android-config-header.patch
deleted file mode 100644
index 8717061..0000000
--- a/package/android-tools/0001-android-config-header.patch
+++ /dev/null
@@ -1,404 +0,0 @@
-Add the AndroidConfig.h header and tweak the build system
-
-The Debian adaptation of android-tools normally relies on a separate
-package to provide linux-x86/AndroidConfig.h. Since we don't want to
-add this dependency in Buildroot just for one header file, let's
-simply integrate it as a patch, and tweak the build system
-accordingly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/AndroidConfig.h
-===================================================================
---- /dev/null
-+++ b/AndroidConfig.h
-@@ -0,0 +1,350 @@
-+/*
-+ * Copyright (C) 2005 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+/*
-+ * Android config -- "Linux".  Used for desktop x86 Linux.
-+ */
-+#ifndef _ANDROID_CONFIG_H
-+#define _ANDROID_CONFIG_H
-+
-+/*
-+ * ===========================================================================
-+ *                              !!! IMPORTANT !!!
-+ * ===========================================================================
-+ *
-+ * This file is included by ALL C/C++ source files.  Don't put anything in
-+ * here unless you are absolutely certain it can't go anywhere else.
-+ *
-+ * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not use "//"
-+ * comments.
-+ */
-+
-+/*
-+ * Threading model.  Choose one:
-+ *
-+ * HAVE_PTHREADS - use the pthreads library.
-+ * HAVE_WIN32_THREADS - use Win32 thread primitives.
-+ *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and HAVE__BEGINTHREADEX
-+ */
-+#define HAVE_PTHREADS
-+
-+/*
-+ * Do we have the futex syscall?
-+ */
-+
-+#define HAVE_FUTEX
-+
-+/*
-+ * Process creation model.  Choose one:
-+ *
-+ * HAVE_FORKEXEC - use fork() and exec()
-+ * HAVE_WIN32_PROC - use CreateProcess()
-+ */
-+#define HAVE_FORKEXEC
-+
-+/*
-+ * Process out-of-memory adjustment.  Set if running on Linux,
-+ * where we can write to /proc/<pid>/oom_adj to modify the out-of-memory
-+ * badness adjustment.
-+ */
-+#define HAVE_OOM_ADJ
-+
-+/*
-+ * IPC model.  Choose one:
-+ *
-+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget, shmget).
-+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).
-+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMapping).
-+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).
-+ */
-+#define HAVE_SYSV_IPC
-+
-+/*
-+ * Memory-mapping model. Choose one:
-+ *
-+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
-+ * HAVE_WIN32_FILEMAP - use Win32 filemaps
-+ */
-+#define  HAVE_POSIX_FILEMAP
-+
-+/*
-+ * Define this if you have <termio.h>
-+ */
-+#define  HAVE_TERMIO_H 1
-+
-+/*
-+ * Define this if you have <sys/sendfile.h>
-+ */
-+#define  HAVE_SYS_SENDFILE_H 1
-+
-+/*
-+ * Define this if you build against MSVCRT.DLL
-+ */
-+/* #define HAVE_MS_C_RUNTIME */
-+
-+/*
-+ * Define this if you have sys/uio.h
-+ */
-+#define  HAVE_SYS_UIO_H 1
-+
-+/*
-+ * Define this if your platforms implements symbolic links
-+ * in its filesystems
-+ */
-+#define HAVE_SYMLINKS
-+
-+/*
-+ * Define this if we have localtime_r().
-+ */
-+#define HAVE_LOCALTIME_R 1
-+
-+/*
-+ * Define this if we have gethostbyname_r().
-+ */
-+#define HAVE_GETHOSTBYNAME_R
-+
-+/*
-+ * Define this if we have ioctl().
-+ */
-+#define HAVE_IOCTL
-+
-+/*
-+ * Define this if we want to use WinSock.
-+ */
-+/* #define HAVE_WINSOCK */
-+
-+/*
-+ * Define this if have clock_gettime() and friends
-+ *
-+ * Desktop Linux has this in librt, but it's broken in goobuntu, yielding
-+ * mildly or wildly inaccurate results.
-+ */
-+/*#define HAVE_POSIX_CLOCKS*/
-+
-+/*
-+ * Define this if we have pthread_cond_timedwait_monotonic() and
-+ * clock_gettime(CLOCK_MONOTONIC).
-+ */
-+/* #define HAVE_TIMEDWAIT_MONOTONIC */
-+
-+/*
-+ * Define this if we have linux style epoll()
-+ */
-+#define HAVE_EPOLL
-+
-+/*
-+ * Endianness of the target machine.  Choose one:
-+ *
-+ * HAVE_ENDIAN_H -- have endian.h header we can include.
-+ * HAVE_LITTLE_ENDIAN -- we are little endian.
-+ * HAVE_BIG_ENDIAN -- we are big endian.
-+ */
-+#define HAVE_ENDIAN_H
-+#define HAVE_LITTLE_ENDIAN
-+
-+/*
-+ * We need to choose between 32-bit and 64-bit off_t.  All of our code should
-+ * agree on the same size.  For desktop systems, use 64-bit values,
-+ * because some of our libraries (e.g. wxWidgets) expect to be built that way.
-+ */
-+#define _FILE_OFFSET_BITS 64
-+#define _LARGEFILE_SOURCE 1
-+
-+/*
-+ * Define if platform has off64_t (and lseek64 and other xxx64 functions)
-+ */
-+#define HAVE_OFF64_T
-+
-+/*
-+ * Defined if we have the backtrace() call for retrieving a stack trace.
-+ * Needed for CallStack to operate; if not defined, CallStack is
-+ * non-functional.
-+ */
-+#define HAVE_BACKTRACE 1
-+
-+/*
-+ * Defined if we have the dladdr() call for retrieving the symbol associated
-+ * with a memory address.  If not defined, stack crawls will not have symbolic
-+ * information.
-+ */
-+#define HAVE_DLADDR 1
-+
-+/*
-+ * Defined if we have the cxxabi.h header for demangling C++ symbols.  If
-+ * not defined, stack crawls will be displayed with raw mangled symbols
-+ */
-+#define HAVE_CXXABI 0
-+
-+/*
-+ * Defined if we have the gettid() system call.
-+ */
-+/* #define HAVE_GETTID */
-+
-+/* 
-+ * Defined if we have the sched_setscheduler() call
-+ */
-+#define HAVE_SCHED_SETSCHEDULER
-+
-+/*
-+ * Add any extra platform-specific defines here.
-+ */
-+
-+/*
-+ * Define if we have <malloc.h> header
-+ */
-+#define HAVE_MALLOC_H
-+
-+/*
-+ * Define if we have Linux-style non-filesystem Unix Domain Sockets
-+ */
-+
-+/*
-+ * What CPU architecture does this platform use?
-+ */
-+#define ARCH_X86
-+
-+
-+/*
-+ * Define if we have Linux's inotify in <sys/inotify.h>.
-+ */
-+/*#define HAVE_INOTIFY 1*/
-+
-+/*
-+ * Define if we have madvise() in <sys/mman.h>
-+ */
-+#define HAVE_MADVISE 1
-+
-+/*
-+ * Define if tm struct has tm_gmtoff field
-+ */
-+#define HAVE_TM_GMTOFF 1
-+
-+/*
-+ * Define if dirent struct has d_type field
-+ */
-+#define HAVE_DIRENT_D_TYPE 1
-+
-+/*
-+ * Define if libc includes Android system properties implementation.
-+ */
-+/* #define HAVE_LIBC_SYSTEM_PROPERTIES */
-+
-+/*
-+ * Define if system provides a system property server (should be
-+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
-+ */
-+#define HAVE_SYSTEM_PROPERTY_SERVER
-+
-+/*
-+ * sprintf() format string for shared library naming.
-+ */
-+#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"
-+
-+/*
-+ * type for the third argument to mincore().
-+ */
-+#define MINCORE_POINTER_TYPE unsigned char *
-+
-+/*
-+ * Do we have the sigaction flag SA_NOCLDWAIT?
-+ */
-+#define HAVE_SA_NOCLDWAIT
-+
-+/*
-+ * The default path separator for the platform
-+ */
-+#define OS_PATH_SEPARATOR '/'
-+
-+/*
-+ * Is the filesystem case sensitive?
-+ */
-+#define OS_CASE_SENSITIVE
-+
-+/*
-+ * Define if <sys/socket.h> exists.
-+ */
-+#define HAVE_SYS_SOCKET_H 1
-+
-+/*
-+ * Define if the strlcpy() function exists on the system.
-+ */
-+/* #define HAVE_STRLCPY 1 */
-+
-+/*
-+ * Define if the open_memstream() function exists on the system.
-+ */
-+#define HAVE_OPEN_MEMSTREAM 1
-+
-+/*
-+ * Define if the BSD funopen() function exists on the system.
-+ */
-+/* #define HAVE_FUNOPEN 1 */
-+
-+/*
-+ * Define if prctl() exists
-+ */
-+#define HAVE_PRCTL 1
-+
-+/*
-+ * Define if writev() exists
-+ */
-+#define HAVE_WRITEV 1
-+
-+/*
-+ * Define if <stdint.h> exists.
-+ */
-+#define HAVE_STDINT_H 1
-+
-+/*
-+ * Define if <stdbool.h> exists.
-+ */
-+#define HAVE_STDBOOL_H 1
-+
-+/*
-+ * Define if <sched.h> exists.
-+ */
-+#define HAVE_SCHED_H 1
-+
-+/*
-+ * Define if pread() exists
-+ */
-+#define HAVE_PREAD 1
-+
-+/*
-+ * Define if we have st_mtim in struct stat
-+ */
-+#define HAVE_STAT_ST_MTIM 1
-+
-+/*
-+ * Define if printf() supports %zd for size_t arguments
-+ */
-+#define HAVE_PRINTF_ZD 1
-+
-+/*
-+ * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style function prototype.
-+ */
-+#define HAVE_BSD_QSORT_R 0
-+
-+/*
-+ * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style function prototype.
-+ */
-+#if __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 8)
-+#define HAVE_GNU_QSORT_R 1
-+#else
-+#define HAVE_GNU_QSORT_R 0
-+#endif
-+
-+#endif /*_ANDROID_CONFIG_H*/
-Index: b/debian/makefiles/adb.mk
-===================================================================
---- a/debian/makefiles/adb.mk
-+++ b/debian/makefiles/adb.mk
-@@ -40,7 +40,7 @@
- CPPFLAGS+= -DADB_HOST=1
- CPPFLAGS+= -I$(SRCDIR)/core/adb
- CPPFLAGS+= -I$(SRCDIR)/core/include
--CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
-+CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h
- 
- LIBS+= -lc -lpthread -lz -lcrypto
- 
-Index: b/debian/makefiles/ext4_utils.mk
-===================================================================
---- a/debian/makefiles/ext4_utils.mk
-+++ b/debian/makefiles/ext4_utils.mk
-@@ -38,7 +38,7 @@
- CPPFLAGS+= -I/usr/include
- CPPFLAGS+= -I$(SRCDIR)/core/include
- CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include
--CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
-+CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h
- 
- LIBS+= -lz -lselinux
- 
-Index: b/debian/makefiles/fastboot.mk
-===================================================================
---- a/debian/makefiles/fastboot.mk
-+++ b/debian/makefiles/fastboot.mk
-@@ -39,7 +39,7 @@
- CPPFLAGS+= -I$(SRCDIR)/core/mkbootimg
- CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils
- CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include
--CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
-+CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h
- 
- LIBS+= -lz -lselinux
- 
diff --git a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
new file mode 100644
index 0000000..2aa708b
--- /dev/null
+++ b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
@@ -0,0 +1,267 @@
+From bf903929f90cb79e00290ea7681703543620aebd Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Fri, 11 Sep 2015 10:03:19 +0200
+Subject: [PATCH 2/2] Fix adbd for non-Ubuntu systems
+
+Remove glib/dbus dependencies and partially restore services.c to be
+closer to the original source code in order to run on systems without
+sudo.
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ core/adbd/adb.c          |   1 -
+ core/adbd/services.c     | 160 ++++-------------------------------------------
+ debian/makefiles/adbd.mk |   4 +-
+ 3 files changed, 14 insertions(+), 151 deletions(-)
+
+diff --git a/core/adbd/adb.c b/core/adbd/adb.c
+index d90e6b8..7fe6445 100644
+--- a/core/adbd/adb.c
++++ b/core/adbd/adb.c
+@@ -1165,7 +1165,6 @@ void build_local_name(char* target_str, size_t target_size, int server_port)
+ 
+ #if !ADB_HOST
+ static int should_drop_privileges() {
+-    return 1;
+ #ifndef ALLOW_ADBD_ROOT
+     return 1;
+ #else /* ALLOW_ADBD_ROOT */
+diff --git a/core/adbd/services.c b/core/adbd/services.c
+index 05bd0d0..5adcefe 100644
+--- a/core/adbd/services.c
++++ b/core/adbd/services.c
+@@ -20,15 +20,6 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <pwd.h>
+-#include <glib.h>
+-#include <gio/gio.h>
+-
+-#define UNITY_SERVICE "com.canonical.UnityGreeter"
+-#define GREETER_OBJ "/"
+-#define GREETER_INTERFACE "com.canonical.UnityGreeter"
+-#define PROPERTIES_INTERFACE "org.freedesktop.DBus.Properties"
+-#define ACTIVE_PROPERTY "IsActive"
+-#define UNLOCK_PATH "/userdata/.adb_onlock"
+ 
+ #include "sysdeps.h"
+ 
+@@ -268,11 +259,11 @@ static int create_service_thread(void (*func)(int, void *), void *cookie)
+ }
+ 
+ #if !ADB_HOST
+-static int create_subprocess(const char *cmd, const char *arg0, const char *arg1, const char *arg2, const char *arg3,  const char *arg4, pid_t *pid)
++static int create_subprocess(const char *cmd, const char *arg0, const char *arg1, pid_t *pid)
+ {
+ #ifdef HAVE_WIN32_PROC
+-    D("create_subprocess(cmd=%s, arg0=%s, arg1=%s, arg2=%s, arg3=%, arg4=%ss)\n", cmd, arg0, arg1, arg2, arg3, arg4);
+-    fprintf(stderr, "error: create_subprocess not implemented on Win32 (%s %s %s %s %s %s)\n", cmd, arg0, arg1, arg2, arg3, arg4);
++    D("create_subprocess(cmd=%s, arg0=%s, arg1=%s)\n", cmd, arg0, arg1);
++    fprintf(stderr, "error: create_subprocess not implemented on Win32 (%s %s %s)\n", cmd, arg0, arg1);
+     return -1;
+ #else /* !HAVE_WIN32_PROC */
+     char *devname;
+@@ -327,7 +318,7 @@ static int create_subprocess(const char *cmd, const char *arg0, const char *arg1
+         } else {
+            D("adb: unable to open %s\n", text);
+         }
+-	execl(cmd, cmd, arg0, arg1, arg2, arg3, arg4, NULL);
++        execl(cmd, cmd, arg0, arg1, NULL);
+         fprintf(stderr, "- exec '%s' failed: %s (%d) -\n",
+                 cmd, strerror(errno), errno);
+         exit(-1);
+@@ -342,7 +333,7 @@ static int create_subprocess(const char *cmd, const char *arg0, const char *arg1
+ }
+ #endif  /* !ABD_HOST */
+ 
+-#if ADB_HOST
++#if ADB_HOST || ADBD_NON_ANDROID
+ #define SHELL_COMMAND "/bin/sh"
+ #else
+ #define SHELL_COMMAND "/system/bin/sh"
+@@ -380,139 +371,16 @@ static void subproc_waiter_service(int fd, void *cookie)
+     }
+ }
+ 
+-int is_phone_locked() {
+-    GError *error = NULL;
+-    GVariant *variant = NULL;
+-    GDBusConnection *connection = NULL;
+-
+-    if (g_file_test(UNLOCK_PATH, G_FILE_TEST_EXISTS)) {
+-        D("unlock path present.");
+-        return 0;
+-    }
+-
+-    // check if the environment variable is present, if not we grab it from
+-    // the phablet user
+-    if (g_getenv("DBUS_SESSION_BUS_ADDRESS") == NULL) {
+-        D("DBUS_SESSION_BUS_ADDRESS missing.\n");
+-        struct passwd *pw = getpwuid(AID_SHELL);
+-        char user_id[15];
+-        gchar *path = NULL;
+-        gchar *contents = NULL;
+-        gchar *session_path = NULL;
+-
+-        snprintf(user_id, sizeof user_id, "%d", pw->pw_uid);
+-
+-        path = g_build_filename("/run", "user", user_id, "dbus-session", NULL);
+-
+-        g_file_get_contents(path, &contents, NULL, &error);
+-        session_path = g_strstrip(g_strsplit(contents, "DBUS_SESSION_BUS_ADDRESS=", -1)[1]);
+-        D("Session bus is %s\n", session_path);
+-
+-        // path is not longer used
+-        g_free(path);
+-
+-        if (error != NULL) {
+-            g_clear_error(&error);
+-            D("Couldn't set session bus\n");
+-            return 1;
+-        }
+-
+-        g_setenv("DBUS_SESSION_BUS_ADDRESS", session_path, TRUE);
+-        g_free(contents);
+-    }
+-
+-    // set the uid to be able to connect to the phablet user session bus
+-    setuid(AID_SHELL);
+-    connection =  g_dbus_connection_new_for_address_sync(g_getenv("DBUS_SESSION_BUS_ADDRESS"),
+-                                                         G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT | G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+-                                                         NULL,
+-                                                         NULL,
+-                                                         &error);
+-    if (connection == NULL) {
+-        D("session bus not available: %s", error->message);
+-        g_error_free (error);
+-        return 1;
+-    }
+-
+-    variant = g_dbus_connection_call_sync(connection,
+-                                          UNITY_SERVICE,
+-                                          GREETER_OBJ,
+-                                          PROPERTIES_INTERFACE,
+-                                          "Get",
+-                                          g_variant_new("(ss)", GREETER_INTERFACE, ACTIVE_PROPERTY),
+-                                          g_variant_type_new("(v)"),
+-                                          G_DBUS_CALL_FLAGS_NONE,
+-                                          -1,
+-                                          NULL,
+-                                          &error);
+-
+-    if (error != NULL) {
+-        D("Could not get property: %s", error->message);
+-        g_object_unref(connection);
+-        g_error_free(error);
+-        return 1;
+-    }
+-
+-    if (variant == NULL) {
+-        D("Failed to get property '%s': %s", "IsActive", error->message);
+-        g_object_unref(connection);
+-        g_error_free(error);
+-        return 1;
+-    }
+-
+-    variant = g_variant_get_variant(g_variant_get_child_value(variant, 0));
+-
+-    int active = 1;
+-    if (!g_variant_get_boolean(variant)) {
+-        active = 0;
+-    }
+-
+-    // get back to be root and return the value
+-    g_object_unref(connection);
+-    g_variant_unref(variant);
+-    setuid(0);
+-    return active;
+-}
+-
+ static int create_subproc_thread(const char *name)
+ {
+-    if (is_phone_locked() ) {
+-        fprintf(stderr, "device is locked\n");
+-        return -1;
+-    }
+-
+     stinfo *sti;
+     adb_thread_t t;
+     int ret_fd;
+     pid_t pid;
+-
+-    struct passwd *user = getpwuid(getuid());
+-    char *shell;
+-    char *shellopts = "-c";
+-    char *home;
+-    char *sudo = "/usr/bin/sudo";
+-    char useropt[256] = "-u";
+-
+-    if (user->pw_name)
+-        strcat(useropt, user->pw_name);
+-
+-    if (user && user->pw_shell) {
+-        shell = user->pw_shell;
+-        shellopts = "-cl";
+-    } else {
+-        shell = SHELL_COMMAND;
+-    }
+-
+-    if (user->pw_dir)
+-        home = user->pw_dir;
+-        if(chdir(home) < 0 )
+-            return 1;
+-
+     if(name) {
+-	ret_fd = create_subprocess(sudo, useropt, "-i", shell, shellopts, name, &pid);
++        ret_fd = create_subprocess(SHELL_COMMAND, "-c", name, &pid);
+     } else {
+-	shellopts = "-l";
+-	ret_fd = create_subprocess(sudo, useropt, "-i", shell, shellopts, 0, &pid);
++        ret_fd = create_subprocess(SHELL_COMMAND, "-", 0, &pid);
+     }
+     D("create_subprocess() ret_fd=%d pid=%d\n", ret_fd, pid);
+ 
+@@ -585,17 +453,13 @@ int service_to_fd(const char *name)
+     } else if (!strncmp(name, "log:", 4)) {
+         ret = create_service_thread(log_service, get_log_file_path(name + 4));
+     } else if(!HOST && !strncmp(name, "shell:", 6)) {
+-        if (!is_phone_locked() ) {
+-            if(name[6]) {
+-                ret = create_subproc_thread(name + 6);
+-            } else {
+-                ret = create_subproc_thread(0);
+-            }
++        if(name[6]) {
++            ret = create_subproc_thread(name + 6);
++        } else {
++            ret = create_subproc_thread(0);
+         }
+     } else if(!strncmp(name, "sync:", 5)) {
+-        if (!is_phone_locked() ) {
+-            ret = create_service_thread(file_sync_service, NULL);
+-        }
++        ret = create_service_thread(file_sync_service, NULL);
+     } else if(!strncmp(name, "remount:", 8)) {
+         ret = create_service_thread(remount_service, NULL);
+     } else if(!strncmp(name, "reboot:", 7)) {
+diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
+index 49dab8c..22c1816 100644
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
+@@ -40,11 +40,11 @@ CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
+ CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
+ CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
+ CPPFLAGS+= -DHAVE_TERMIO_H
+-CPPFLAGS+= `pkg-config --cflags glib-2.0 gio-2.0`
++CPPFLAGS+= -DADBD_NON_ANDROID
+ CPPFLAGS+= -I$(SRCDIR)/core/adbd
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+-LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
++LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
+ 
+ OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
+ 
+-- 
+2.5.1
+
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
new file mode 100644
index 0000000..cb3f917
--- /dev/null
+++ b/package/android-tools/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_ANDROID_TOOLS
+       bool "android-tools"
+       help
+         This package contains the fastboot and adb utilities, that
+         can be used to interact with target devices using of these
+         protocols.
+
+if BR2_PACKAGE_ANDROID_TOOLS
+
+config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
+       bool "fastboot"
+       help
+         This option will build and install the fastboot utility for
+         the target, which can be used to reflash other target devices
+         implementing the fastboot protocol.
+
+config BR2_PACKAGE_ANDROID_TOOLS_ADB
+       bool "adb"
+       help
+         This option will build and install the adb utility for the
+         target, which can be used to interact with other target devices
+         implementing the ADB protocol.
+
+config BR2_PACKAGE_ANDROID_TOOLS_ADBD
+       bool "adbd"
+       help
+         This option will build and install the adbd utility for the
+         target, which can be used to interact with a host machine
+         implementing the ADB protocol.
+
+endif
+
diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
index 57bbc6f..5d8ae59 100644
--- a/package/android-tools/android-tools.hash
+++ b/package/android-tools/android-tools.hash
@@ -1,3 +1,3 @@
-# From http://snapshot.debian.org/archive/debian/20141125T040054Z/pool/main/a/android-tools/
-sha512	aadf75d29e2aa223870c942fdd44bbeb9466542e17b81bb93069d4415dd6644b5266465d4e466b1d5ed2a84f86d89450a3aa077f4f81268ac1a3d1e4df74d9ad	android-tools_4.2.2+git20130529.orig.tar.xz
-sha512	c879d0fed0d53030319813cfadc29d939dec7600210d11c8e398e61c69447971f82e1e5228aeba730a2d95899c1c5d5d2a3b06e9a19a91866b33b5bc068079c6	android-tools_4.2.2+git20130529-5.1.debian.tar.xz
+# locally computed
+sha512	c5bfd3c8e514809db257ba5559c865742768b7520b38aa2f53185aff5c328e5cf7fb328a6ff6450eeddd5056985f232d492eba63a87978440e2147e26d62f458  android-tools_4.2.2+git20130218.orig.tar.xz
+sha512	aa3fee593cecf5d9a5fbc60b18d67dadc5b832fdea75a098ec7371b8f774673af3a3b6052d7eecaf315943beaa984a1f5a3c114a698620275af1682bd05d4d23  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 4363518..2f7a803 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -4,28 +4,31 @@
 #
 ################################################################################
 
-ANDROID_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141125T040054Z/pool/main/a/android-tools/
-ANDROID_TOOLS_VERSION = 4.2.2+git20130529
+ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files/
+ANDROID_TOOLS_VERSION = 4.2.2+git20130218
 ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
-HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-5.1.debian.tar.xz
+ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
+HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 
 # Extract the Debian tarball inside the sources
-define HOST_ANDROID_TOOLS_DEBIAN_EXTRACT
-	$(call suitable-extractor,$(notdir $(HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
-		$(DL_DIR)/$(notdir $(HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
+define ANDROID_TOOLS_DEBIAN_EXTRACT
+	$(call suitable-extractor,$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
+		$(DL_DIR)/$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
 		$(TAR) -C $(@D) $(TAR_OPTIONS) -
 endef
 
-HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += HOST_ANDROID_TOOLS_DEBIAN_EXTRACT
+HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
+ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
 
 # Apply the Debian patches before applying the Buildroot patches
-define HOST_ANDROID_TOOLS_DEBIAN_PATCH
+define ANDROID_TOOLS_DEBIAN_PATCH
 	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*
 endef
 
-HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += HOST_ANDROID_TOOLS_DEBIAN_PATCH
+HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
+ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
 HOST_ANDROID_TOOLS_TARGETS += fastboot
@@ -37,6 +40,21 @@ HOST_ANDROID_TOOLS_TARGETS += adb
 HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux host-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT),y)
+ANDROID_TOOLS_TARGETS += fastboot
+ANDROID_TOOLS_DEPENDENCIES += zlib libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADB),y)
+ANDROID_TOOLS_TARGETS += adb
+ANDROID_TOOLS_DEPENDENCIES += zlib libselinux openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
+ANDROID_TOOLS_TARGETS += adbd
+ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+endif
+
 define HOST_ANDROID_TOOLS_BUILD_CMDS
 	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
 		mkdir -p $(@D)/build-$(t) && \
@@ -44,9 +62,22 @@ define HOST_ANDROID_TOOLS_BUILD_CMDS
 			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
 endef
 
+define ANDROID_TOOLS_BUILD_CMDS
+	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
+		mkdir -p $(@D)/build-$(t) && \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
+			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
+endef
+
 define HOST_ANDROID_TOOLS_INSTALL_CMDS
 	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
 		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/usr/bin/$(t)$(sep))
 endef
 
+define ANDROID_TOOLS_INSTALL_TARGET_CMDS
+	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(TARGET_DIR)/usr/bin/$(t)$(sep))
+endef
+
 $(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.5.1
