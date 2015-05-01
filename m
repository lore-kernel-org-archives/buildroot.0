From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri,  1 May 2015 18:15:32 +0200
Subject: [Buildroot] [PATCH v2] android-tools: new host package
Message-ID: <1430496932-17936-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This host package allows to build the fastboot and adb utilities,
which can be used to interact with target devices implementing one of
these protocols.

The work behind this commit was funded by ECA Group
<http://www.ecagroup.com>. ECA Group is the copyright owner of the
contributed code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---

Since v1:
	- fixed typos
	- added android-tools.hash

 package/Config.in.host                             |   1 +
 .../android-tools/0001-android-config-header.patch | 404 +++++++++++++++++++++
 package/android-tools/Config.in.host               |  24 ++
 package/android-tools/android-tools.hash           |   3 +
 package/android-tools/android-tools.mk             |  52 +++
 5 files changed, 484 insertions(+)
 create mode 100644 package/android-tools/0001-android-config-header.patch
 create mode 100644 package/android-tools/Config.in.host
 create mode 100644 package/android-tools/android-tools.hash
 create mode 100644 package/android-tools/android-tools.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 94981adb6425..6df627f1752f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/android-tools/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/android-tools/0001-android-config-header.patch b/package/android-tools/0001-android-config-header.patch
new file mode 100644
index 000000000000..8717061a048c
--- /dev/null
+++ b/package/android-tools/0001-android-config-header.patch
@@ -0,0 +1,404 @@
+Add the AndroidConfig.h header and tweak the build system
+
+The Debian adaptation of android-tools normally relies on a separate
+package to provide linux-x86/AndroidConfig.h. Since we don't want to
+add this dependency in Buildroot just for one header file, let's
+simply integrate it as a patch, and tweak the build system
+accordingly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/AndroidConfig.h
+===================================================================
+--- /dev/null
++++ b/AndroidConfig.h
+@@ -0,0 +1,350 @@
++/*
++ * Copyright (C) 2005 The Android Open Source Project
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *      http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++/*
++ * Android config -- "Linux".  Used for desktop x86 Linux.
++ */
++#ifndef _ANDROID_CONFIG_H
++#define _ANDROID_CONFIG_H
++
++/*
++ * ===========================================================================
++ *                              !!! IMPORTANT !!!
++ * ===========================================================================
++ *
++ * This file is included by ALL C/C++ source files.  Don't put anything in
++ * here unless you are absolutely certain it can't go anywhere else.
++ *
++ * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not use "//"
++ * comments.
++ */
++
++/*
++ * Threading model.  Choose one:
++ *
++ * HAVE_PTHREADS - use the pthreads library.
++ * HAVE_WIN32_THREADS - use Win32 thread primitives.
++ *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and HAVE__BEGINTHREADEX
++ */
++#define HAVE_PTHREADS
++
++/*
++ * Do we have the futex syscall?
++ */
++
++#define HAVE_FUTEX
++
++/*
++ * Process creation model.  Choose one:
++ *
++ * HAVE_FORKEXEC - use fork() and exec()
++ * HAVE_WIN32_PROC - use CreateProcess()
++ */
++#define HAVE_FORKEXEC
++
++/*
++ * Process out-of-memory adjustment.  Set if running on Linux,
++ * where we can write to /proc/<pid>/oom_adj to modify the out-of-memory
++ * badness adjustment.
++ */
++#define HAVE_OOM_ADJ
++
++/*
++ * IPC model.  Choose one:
++ *
++ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget, shmget).
++ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).
++ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMapping).
++ * HAVE_ANDROID_IPC - use Android versions (?, mmap).
++ */
++#define HAVE_SYSV_IPC
++
++/*
++ * Memory-mapping model. Choose one:
++ *
++ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
++ * HAVE_WIN32_FILEMAP - use Win32 filemaps
++ */
++#define  HAVE_POSIX_FILEMAP
++
++/*
++ * Define this if you have <termio.h>
++ */
++#define  HAVE_TERMIO_H 1
++
++/*
++ * Define this if you have <sys/sendfile.h>
++ */
++#define  HAVE_SYS_SENDFILE_H 1
++
++/*
++ * Define this if you build against MSVCRT.DLL
++ */
++/* #define HAVE_MS_C_RUNTIME */
++
++/*
++ * Define this if you have sys/uio.h
++ */
++#define  HAVE_SYS_UIO_H 1
++
++/*
++ * Define this if your platforms implements symbolic links
++ * in its filesystems
++ */
++#define HAVE_SYMLINKS
++
++/*
++ * Define this if we have localtime_r().
++ */
++#define HAVE_LOCALTIME_R 1
++
++/*
++ * Define this if we have gethostbyname_r().
++ */
++#define HAVE_GETHOSTBYNAME_R
++
++/*
++ * Define this if we have ioctl().
++ */
++#define HAVE_IOCTL
++
++/*
++ * Define this if we want to use WinSock.
++ */
++/* #define HAVE_WINSOCK */
++
++/*
++ * Define this if have clock_gettime() and friends
++ *
++ * Desktop Linux has this in librt, but it's broken in goobuntu, yielding
++ * mildly or wildly inaccurate results.
++ */
++/*#define HAVE_POSIX_CLOCKS*/
++
++/*
++ * Define this if we have pthread_cond_timedwait_monotonic() and
++ * clock_gettime(CLOCK_MONOTONIC).
++ */
++/* #define HAVE_TIMEDWAIT_MONOTONIC */
++
++/*
++ * Define this if we have linux style epoll()
++ */
++#define HAVE_EPOLL
++
++/*
++ * Endianness of the target machine.  Choose one:
++ *
++ * HAVE_ENDIAN_H -- have endian.h header we can include.
++ * HAVE_LITTLE_ENDIAN -- we are little endian.
++ * HAVE_BIG_ENDIAN -- we are big endian.
++ */
++#define HAVE_ENDIAN_H
++#define HAVE_LITTLE_ENDIAN
++
++/*
++ * We need to choose between 32-bit and 64-bit off_t.  All of our code should
++ * agree on the same size.  For desktop systems, use 64-bit values,
++ * because some of our libraries (e.g. wxWidgets) expect to be built that way.
++ */
++#define _FILE_OFFSET_BITS 64
++#define _LARGEFILE_SOURCE 1
++
++/*
++ * Define if platform has off64_t (and lseek64 and other xxx64 functions)
++ */
++#define HAVE_OFF64_T
++
++/*
++ * Defined if we have the backtrace() call for retrieving a stack trace.
++ * Needed for CallStack to operate; if not defined, CallStack is
++ * non-functional.
++ */
++#define HAVE_BACKTRACE 1
++
++/*
++ * Defined if we have the dladdr() call for retrieving the symbol associated
++ * with a memory address.  If not defined, stack crawls will not have symbolic
++ * information.
++ */
++#define HAVE_DLADDR 1
++
++/*
++ * Defined if we have the cxxabi.h header for demangling C++ symbols.  If
++ * not defined, stack crawls will be displayed with raw mangled symbols
++ */
++#define HAVE_CXXABI 0
++
++/*
++ * Defined if we have the gettid() system call.
++ */
++/* #define HAVE_GETTID */
++
++/* 
++ * Defined if we have the sched_setscheduler() call
++ */
++#define HAVE_SCHED_SETSCHEDULER
++
++/*
++ * Add any extra platform-specific defines here.
++ */
++
++/*
++ * Define if we have <malloc.h> header
++ */
++#define HAVE_MALLOC_H
++
++/*
++ * Define if we have Linux-style non-filesystem Unix Domain Sockets
++ */
++
++/*
++ * What CPU architecture does this platform use?
++ */
++#define ARCH_X86
++
++
++/*
++ * Define if we have Linux's inotify in <sys/inotify.h>.
++ */
++/*#define HAVE_INOTIFY 1*/
++
++/*
++ * Define if we have madvise() in <sys/mman.h>
++ */
++#define HAVE_MADVISE 1
++
++/*
++ * Define if tm struct has tm_gmtoff field
++ */
++#define HAVE_TM_GMTOFF 1
++
++/*
++ * Define if dirent struct has d_type field
++ */
++#define HAVE_DIRENT_D_TYPE 1
++
++/*
++ * Define if libc includes Android system properties implementation.
++ */
++/* #define HAVE_LIBC_SYSTEM_PROPERTIES */
++
++/*
++ * Define if system provides a system property server (should be
++ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
++ */
++#define HAVE_SYSTEM_PROPERTY_SERVER
++
++/*
++ * sprintf() format string for shared library naming.
++ */
++#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"
++
++/*
++ * type for the third argument to mincore().
++ */
++#define MINCORE_POINTER_TYPE unsigned char *
++
++/*
++ * Do we have the sigaction flag SA_NOCLDWAIT?
++ */
++#define HAVE_SA_NOCLDWAIT
++
++/*
++ * The default path separator for the platform
++ */
++#define OS_PATH_SEPARATOR '/'
++
++/*
++ * Is the filesystem case sensitive?
++ */
++#define OS_CASE_SENSITIVE
++
++/*
++ * Define if <sys/socket.h> exists.
++ */
++#define HAVE_SYS_SOCKET_H 1
++
++/*
++ * Define if the strlcpy() function exists on the system.
++ */
++/* #define HAVE_STRLCPY 1 */
++
++/*
++ * Define if the open_memstream() function exists on the system.
++ */
++#define HAVE_OPEN_MEMSTREAM 1
++
++/*
++ * Define if the BSD funopen() function exists on the system.
++ */
++/* #define HAVE_FUNOPEN 1 */
++
++/*
++ * Define if prctl() exists
++ */
++#define HAVE_PRCTL 1
++
++/*
++ * Define if writev() exists
++ */
++#define HAVE_WRITEV 1
++
++/*
++ * Define if <stdint.h> exists.
++ */
++#define HAVE_STDINT_H 1
++
++/*
++ * Define if <stdbool.h> exists.
++ */
++#define HAVE_STDBOOL_H 1
++
++/*
++ * Define if <sched.h> exists.
++ */
++#define HAVE_SCHED_H 1
++
++/*
++ * Define if pread() exists
++ */
++#define HAVE_PREAD 1
++
++/*
++ * Define if we have st_mtim in struct stat
++ */
++#define HAVE_STAT_ST_MTIM 1
++
++/*
++ * Define if printf() supports %zd for size_t arguments
++ */
++#define HAVE_PRINTF_ZD 1
++
++/*
++ * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style function prototype.
++ */
++#define HAVE_BSD_QSORT_R 0
++
++/*
++ * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style function prototype.
++ */
++#if __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 8)
++#define HAVE_GNU_QSORT_R 1
++#else
++#define HAVE_GNU_QSORT_R 0
++#endif
++
++#endif /*_ANDROID_CONFIG_H*/
+Index: b/debian/makefiles/adb.mk
+===================================================================
+--- a/debian/makefiles/adb.mk
++++ b/debian/makefiles/adb.mk
+@@ -40,7 +40,7 @@
+ CPPFLAGS+= -DADB_HOST=1
+ CPPFLAGS+= -I$(SRCDIR)/core/adb
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+-CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
++CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h
+ 
+ LIBS+= -lc -lpthread -lz -lcrypto
+ 
+Index: b/debian/makefiles/ext4_utils.mk
+===================================================================
+--- a/debian/makefiles/ext4_utils.mk
++++ b/debian/makefiles/ext4_utils.mk
+@@ -38,7 +38,7 @@
+ CPPFLAGS+= -I/usr/include
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+ CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include
+-CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
++CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h
+ 
+ LIBS+= -lz -lselinux
+ 
+Index: b/debian/makefiles/fastboot.mk
+===================================================================
+--- a/debian/makefiles/fastboot.mk
++++ b/debian/makefiles/fastboot.mk
+@@ -39,7 +39,7 @@
+ CPPFLAGS+= -I$(SRCDIR)/core/mkbootimg
+ CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils
+ CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include
+-CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
++CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h
+ 
+ LIBS+= -lz -lselinux
+ 
diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
new file mode 100644
index 000000000000..7702d1d26266
--- /dev/null
+++ b/package/android-tools/Config.in.host
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_HOST_ANDROID_TOOLS
+       bool "android-tools"
+       help
+         This package contains the fastboot and adb utilities, that
+         can be used to interact with target devices using of these
+         protocols.
+
+if BR2_PACKAGE_HOST_ANDROID_TOOLS
+
+config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
+       bool "fastboot"
+       help
+         This option will build and install the fastboot utility for
+         the host, which can be used to reflash target devices
+         implementing the fastboot protocol.
+
+config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
+       bool "adb"
+       help
+         This option will build and install the adb utility for the
+         host, which can be used to interact with target devices
+         implementing the ADB protocol.
+
+endif
diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
new file mode 100644
index 000000000000..57bbc6f88070
--- /dev/null
+++ b/package/android-tools/android-tools.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141125T040054Z/pool/main/a/android-tools/
+sha512	aadf75d29e2aa223870c942fdd44bbeb9466542e17b81bb93069d4415dd6644b5266465d4e466b1d5ed2a84f86d89450a3aa077f4f81268ac1a3d1e4df74d9ad	android-tools_4.2.2+git20130529.orig.tar.xz
+sha512	c879d0fed0d53030319813cfadc29d939dec7600210d11c8e398e61c69447971f82e1e5228aeba730a2d95899c1c5d5d2a3b06e9a19a91866b33b5bc068079c6	android-tools_4.2.2+git20130529-5.1.debian.tar.xz
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
new file mode 100644
index 000000000000..436351853f5a
--- /dev/null
+++ b/package/android-tools/android-tools.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# android-tools
+#
+################################################################################
+
+ANDROID_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141125T040054Z/pool/main/a/android-tools/
+ANDROID_TOOLS_VERSION = 4.2.2+git20130529
+ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
+HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-5.1.debian.tar.xz
+ANDROID_TOOLS_LICENSE = Apache-2.0
+ANDROID_TOOLS_LICENSE_FILES = debian/copyright
+
+# Extract the Debian tarball inside the sources
+define HOST_ANDROID_TOOLS_DEBIAN_EXTRACT
+	$(call suitable-extractor,$(notdir $(HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
+		$(DL_DIR)/$(notdir $(HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+
+HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += HOST_ANDROID_TOOLS_DEBIAN_EXTRACT
+
+# Apply the Debian patches before applying the Buildroot patches
+define HOST_ANDROID_TOOLS_DEBIAN_PATCH
+	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*
+endef
+
+HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += HOST_ANDROID_TOOLS_DEBIAN_PATCH
+
+ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
+HOST_ANDROID_TOOLS_TARGETS += fastboot
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
+HOST_ANDROID_TOOLS_TARGETS += adb
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux host-openssl
+endif
+
+define HOST_ANDROID_TOOLS_BUILD_CMDS
+	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
+		mkdir -p $(@D)/build-$(t) && \
+		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
+			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
+endef
+
+define HOST_ANDROID_TOOLS_INSTALL_CMDS
+	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/usr/bin/$(t)$(sep))
+endef
+
+$(eval $(host-generic-package))
-- 
2.4.0
