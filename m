From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 8 Aug 2018 22:55:58 +0300
Subject: [Buildroot] [Buildroot & ArchLinux] can not build host-m4 on
 machine with glibc-2.28 installed
In-Reply-To: <87lg9gg8sg.fsf@dell.be.48ers.dk>
References: <20180808031502.GE1085@techyauld.com>
 <87lg9gg8sg.fsf@dell.be.48ers.dk>
Message-ID: <20180808225558.GB3148@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Aug 2018 17:47:11 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "?" == ? ? <yzheng@techyauld.com> writes:
> 
> Please mail the buildroot mailing list and not individual contributors,
> thanks!
> 
>  > Hi,
>  > 	I found that failure and do some hacking.
> 
>  > 	(1) m4 source, lib/freadahead.c: It use the internal symbols to guess the C runtime lib's type.
> 
>  > 	(2) glibc-2.28 removed the header file /usr/include/bits/libio.h.
>  > 	    In fact, libio.h seems an internal header. The content of it has been
>  > 	    moved into <glibc source>/libio/libio.h, which is not installed.
> 
> 
>  > 	Anyone can help me out? M4 has not released new version since 1.4.18(2016-12-31).
> 
>  > Allan,
>  > 	It seems that that bug will hit our lovely ArchLinux!
> 
> What is the build failure you are seeing exactly? Looking around, it
> seems linuxfromscratch has some workarounds for building against
> glibc-2.28, perhaps we can do the same?
> 
> http://www.linuxfromscratch.org/lfs/view/development/chapter05/m4.html

I don't have a build log at hand, but the gnulib sources would complain e.g.
that ?freadahead()? is unimplemented for the current target platform, and its
source would ?#error?. I have a crappy local patch which patches a few files
from gnulib to the most recent version available in the repository. I also
have a similar one for Bison, but they are a bit crappy and should be done
properly, updating all gnulib bits that the packages use instead of just the
bare minimum to make things work (see the attached patches, you can drop them
in a local patches directory).

Also: gnulib is horrible, and I am baffled that it's still being used in
2018... I refuse to think that something like M4 or Bison (which basically
process some input text and generate some output text) needs functions from
gnulib which rely on the internals of the system C library. It was quite
disheartening for me to find out this ~_~

Regards,

-Adri?n


-------------- next part --------------
diff -Naur a/lib/fseterr.c b/lib/fseterr.c
--- a/lib/fseterr.c	2015-01-04 18:43:50.000000000 +0200
+++ b/lib/fseterr.c	2018-08-07 22:13:43.420899096 +0300
@@ -1,5 +1,5 @@
 /* Set the error indicator of a stream.
-   Copyright (C) 2007-2015 Free Software Foundation, Inc.
+   Copyright (C) 2007-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 #include <config.h>
 
@@ -23,21 +23,26 @@
 
 #include "stdio-impl.h"
 
+/* This file is not used on systems that have the __fseterr function,
+   namely musl libc.  */
+
 void
 fseterr (FILE *fp)
 {
   /* Most systems provide FILE as a struct and the necessary bitmask in
      <stdio.h>, because they need it for implementing getc() and putc() as
      fast macros.  */
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
+  /* GNU libc, BeOS, Haiku, Linux libc5 */
   fp->_flags |= _IO_ERR_SEEN;
-#elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin */
+#elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
+  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
   fp_->_flags |= __SERR;
 #elif defined __EMX__               /* emx+gcc */
   fp->_flags |= _IOERR;
 #elif defined __minix               /* Minix */
   fp->_flags |= _IOERR;
-#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, NonStop Kernel */
+#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel, OpenVMS */
   fp_->_flag |= _IOERR;
 #elif defined __UCLIBC__            /* uClibc */
   fp->__modeflags |= __FLAG_ERROR;
diff -Naur a/lib/fseterr.h b/lib/fseterr.h
--- a/lib/fseterr.h	2015-01-04 18:43:50.000000000 +0200
+++ b/lib/fseterr.h	2018-08-07 22:13:43.420899096 +0300
@@ -1,5 +1,5 @@
 /* Set the error indicator of a stream.
-   Copyright (C) 2007, 2009-2015 Free Software Foundation, Inc.
+   Copyright (C) 2007, 2009-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 #ifndef _FSETERR_H
 #define _FSETERR_H
-------------- next part --------------
diff -Naur a/lib/freadahead.c b/lib/freadahead.c
--- a/lib/freadahead.c	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/freadahead.c	2018-08-07 20:46:01.014459694 +0300
@@ -1,5 +1,5 @@
 /* Retrieve information about a FILE stream.
-   Copyright (C) 2007-2016 Free Software Foundation, Inc.
+   Copyright (C) 2007-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 #include <config.h>
 
@@ -22,17 +22,26 @@
 #include <stdlib.h>
 #include "stdio-impl.h"
 
+#if defined __DragonFly__
+/* Defined in libc, but not declared in <stdio.h>.  */
+extern size_t __sreadahead (FILE *);
+#endif
+
+/* This file is not used on systems that have the __freadahead function,
+   namely musl libc.  */
+
 size_t
 freadahead (FILE *fp)
 {
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
+  /* GNU libc, BeOS, Haiku, Linux libc5 */
   if (fp->_IO_write_ptr > fp->_IO_write_base)
     return 0;
   return (fp->_IO_read_end - fp->_IO_read_ptr)
          + (fp->_flags & _IO_IN_BACKUP ? fp->_IO_save_end - fp->_IO_save_base :
             0);
 #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
+  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
   if ((fp_->_flags & __SWR) != 0 || fp_->_r < 0)
     return 0;
 # if defined __DragonFly__
@@ -53,7 +62,7 @@
   if ((fp_->_flags & _IOWRITING) != 0)
     return 0;
   return fp_->_count;
-#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel */
+#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel, OpenVMS */
   if ((fp_->_flag & _IOWRT) != 0)
     return 0;
   return fp_->_cnt;
diff -Naur a/lib/freadahead.h b/lib/freadahead.h
--- a/lib/freadahead.h	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/freadahead.h	2018-08-07 20:46:01.014459694 +0300
@@ -1,5 +1,5 @@
 /* Retrieve information about a FILE stream.
-   Copyright (C) 2007-2016 Free Software Foundation, Inc.
+   Copyright (C) 2007-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 #include <stddef.h>
 #include <stdio.h>
diff -Naur a/lib/fseeko.c b/lib/fseeko.c
--- a/lib/fseeko.c	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/fseeko.c	2018-08-07 20:46:01.014459694 +0300
@@ -1,9 +1,9 @@
 /* An fseeko() function that, together with fflush(), is POSIX compliant.
-   Copyright (C) 2007-2016 Free Software Foundation, Inc.
+   Copyright (C) 2007-2018 Free Software Foundation, Inc.
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 3, or (at your option)
+   the Free Software Foundation; either version 2, or (at your option)
    any later version.
 
    This program is distributed in the hope that it will be useful,
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License along
-   with this program; if not, see <http://www.gnu.org/licenses/>.  */
+   with this program; if not, see <https://www.gnu.org/licenses/>.  */
 
 #include <config.h>
 
@@ -33,9 +33,9 @@
 #endif
 #if _GL_WINDOWS_64_BIT_OFF_T
 # undef fseeko
-# if HAVE__FSEEKI64 /* msvc, mingw64 */
+# if HAVE__FSEEKI64 && HAVE_DECL__FSEEKI64 /* msvc, mingw since msvcrt8.0, mingw64 */
 #  define fseeko _fseeki64
-# else /* mingw */
+# else /* mingw before msvcrt8.0 */
 #  define fseeko fseeko64
 # endif
 #endif
@@ -47,12 +47,13 @@
 #endif
 
   /* These tests are based on fpurge.c.  */
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
+  /* GNU libc, BeOS, Haiku, Linux libc5 */
   if (fp->_IO_read_end == fp->_IO_read_ptr
       && fp->_IO_write_ptr == fp->_IO_write_base
       && fp->_IO_save_base == NULL)
 #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
+  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
 # if defined __SL64 && defined __SCLE /* Cygwin */
   if ((fp->_flags & __SL64) == 0)
     {
@@ -80,7 +81,7 @@
 #elif defined __minix               /* Minix */
   if (fp_->_ptr == fp_->_buf
       && (fp_->_ptr == NULL || fp_->_count == 0))
-#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel */
+#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel, OpenVMS */
   if (fp_->_ptr == fp_->_base
       && (fp_->_ptr == NULL || fp_->_cnt == 0))
 #elif defined __UCLIBC__            /* uClibc */
@@ -117,18 +118,19 @@
       if (pos == -1)
         {
 #if defined __sferror || defined __DragonFly__ || defined __ANDROID__
-          /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
+          /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
           fp_->_flags &= ~__SOFF;
 #endif
           return -1;
         }
 
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
+      /* GNU libc, BeOS, Haiku, Linux libc5 */
       fp->_flags &= ~_IO_EOF_SEEN;
       fp->_offset = pos;
 #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-      /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
-# if defined __CYGWIN__ || (defined __NetBSD__ && __NetBSD_Version__ >= 600000000)
+      /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
+# if defined __CYGWIN__ || (defined __NetBSD__ && __NetBSD_Version__ >= 600000000) || defined __minix
       /* fp_->_offset is typed as an integer.  */
       fp_->_offset = pos;
 # else
@@ -150,7 +152,7 @@
       fp_->_flags &= ~__SEOF;
 #elif defined __EMX__               /* emx+gcc */
       fp->_flags &= ~_IOEOF;
-#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel */
+#elif defined _IOERR                /* AIX, HP-UX, IRIX, OSF/1, Solaris, OpenServer, mingw, MSVC, NonStop Kernel, OpenVMS */
       fp_->_flag &= ~_IOEOF;
 #elif defined __MINT__              /* Atari FreeMiNT */
       fp->__offset = pos;
diff -Naur a/lib/glthread/lock.c b/lib/glthread/lock.c
--- a/lib/glthread/lock.c	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/glthread/lock.c	2018-08-07 20:46:01.024459694 +0300
@@ -1,9 +1,9 @@
 /* Locking in multithreaded situations.
-   Copyright (C) 2005-2016 Free Software Foundation, Inc.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 3, or (at your option)
+   the Free Software Foundation; either version 2, or (at your option)
    any later version.
 
    This program is distributed in the hope that it will be useful,
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program; if not, see <http://www.gnu.org/licenses/>.  */
+   along with this program; if not, see <https://www.gnu.org/licenses/>.  */
 
 /* Written by Bruno Haible <bruno@clisp.org>, 2005.
    Based on GCC's gthr-posix.h, gthr-posix95.h, gthr-solaris.h,
@@ -30,9 +30,38 @@
 
 /* ------------------------- gl_rwlock_t datatype ------------------------- */
 
-# if HAVE_PTHREAD_RWLOCK
+# if HAVE_PTHREAD_RWLOCK && (HAVE_PTHREAD_RWLOCK_RDLOCK_PREFER_WRITER || (defined PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP && (__GNU_LIBRARY__ > 1)))
 
-#  if !defined PTHREAD_RWLOCK_INITIALIZER
+#  ifdef PTHREAD_RWLOCK_INITIALIZER
+
+#   if !HAVE_PTHREAD_RWLOCK_RDLOCK_PREFER_WRITER
+     /* glibc with bug https://sourceware.org/bugzilla/show_bug.cgi?id=13701 */
+
+int
+glthread_rwlock_init_for_glibc (pthread_rwlock_t *lock)
+{
+  pthread_rwlockattr_t attributes;
+  int err;
+
+  err = pthread_rwlockattr_init (&attributes);
+  if (err != 0)
+    return err;
+  /* Note: PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP is the only value that
+     causes the writer to be preferred. PTHREAD_RWLOCK_PREFER_WRITER_NP does not
+     do this; see
+     http://man7.org/linux/man-pages/man3/pthread_rwlockattr_setkind_np.3.html */
+  err = pthread_rwlockattr_setkind_np (&attributes,
+                                       PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP);
+  if (err == 0)
+    err = pthread_rwlock_init(lock, &attributes);
+  /* pthread_rwlockattr_destroy always returns 0.  It cannot influence the
+     return value.  */
+  pthread_rwlockattr_destroy (&attributes);
+  return err;
+}
+
+#   endif
+#  else
 
 int
 glthread_rwlock_init_multithreaded (gl_rwlock_t *lock)
@@ -152,11 +181,9 @@
   if (err != 0)
     return err;
   /* Test whether only readers are currently running, and whether the runcount
-     field will not overflow.  */
-  /* POSIX says: "It is implementation-defined whether the calling thread
-     acquires the lock when a writer does not hold the lock and there are
-     writers blocked on the lock."  Let's say, no: give the writers a higher
-     priority.  */
+     field will not overflow, and whether no writer is waiting.  The latter
+     condition is because POSIX recommends that "write locks shall take
+     precedence over read locks", to avoid "writer starvation".  */
   while (!(lock->runcount + 1 > 0 && lock->waiting_writers_count == 0))
     {
       /* This thread has to wait for a while.  Enqueue it among the
@@ -481,6 +508,141 @@
 
 /* ------------------------- gl_rwlock_t datatype ------------------------- */
 
+# if !HAVE_PTH_RWLOCK_ACQUIRE_PREFER_WRITER
+
+int
+glthread_rwlock_init_multithreaded (gl_rwlock_t *lock)
+{
+  if (!pth_mutex_init (&lock->lock))
+    return errno;
+  if (!pth_cond_init (&lock->waiting_readers))
+    return errno;
+  if (!pth_cond_init (&lock->waiting_writers))
+    return errno;
+  lock->waiting_writers_count = 0;
+  lock->runcount = 0;
+  lock->initialized = 1;
+  return 0;
+}
+
+int
+glthread_rwlock_rdlock_multithreaded (gl_rwlock_t *lock)
+{
+  if (!lock->initialized)
+    glthread_rwlock_init_multithreaded (lock);
+  if (!pth_mutex_acquire (&lock->lock, 0, NULL))
+    return errno;
+  /* Test whether only readers are currently running, and whether the runcount
+     field will not overflow, and whether no writer is waiting.  The latter
+     condition is because POSIX recommends that "write locks shall take
+     precedence over read locks", to avoid "writer starvation".  */
+  while (!(lock->runcount + 1 > 0 && lock->waiting_writers_count == 0))
+    {
+      /* This thread has to wait for a while.  Enqueue it among the
+         waiting_readers.  */
+      if (!pth_cond_await (&lock->waiting_readers, &lock->lock, NULL))
+        {
+          int err = errno;
+          pth_mutex_release (&lock->lock);
+          return err;
+        }
+    }
+  lock->runcount++;
+  return (!pth_mutex_release (&lock->lock) ? errno : 0);
+}
+
+int
+glthread_rwlock_wrlock_multithreaded (gl_rwlock_t *lock)
+{
+  if (!lock->initialized)
+    glthread_rwlock_init_multithreaded (lock);
+  if (!pth_mutex_acquire (&lock->lock, 0, NULL))
+    return errno;
+  /* Test whether no readers or writers are currently running.  */
+  while (!(lock->runcount == 0))
+    {
+      /* This thread has to wait for a while.  Enqueue it among the
+         waiting_writers.  */
+      lock->waiting_writers_count++;
+      if (!pth_cond_await (&lock->waiting_writers, &lock->lock, NULL))
+        {
+          int err = errno;
+          lock->waiting_writers_count--;
+          pth_mutex_release (&lock->lock);
+          return err;
+        }
+      lock->waiting_writers_count--;
+    }
+  lock->runcount--; /* runcount becomes -1 */
+  return (!pth_mutex_release (&lock->lock) ? errno : 0);
+}
+
+int
+glthread_rwlock_unlock_multithreaded (gl_rwlock_t *lock)
+{
+  int err;
+
+  if (!lock->initialized)
+    return EINVAL;
+  if (!pth_mutex_acquire (&lock->lock, 0, NULL))
+    return errno;
+  if (lock->runcount < 0)
+    {
+      /* Drop a writer lock.  */
+      if (!(lock->runcount == -1))
+        {
+          pth_mutex_release (&lock->lock);
+          return EINVAL;
+        }
+      lock->runcount = 0;
+    }
+  else
+    {
+      /* Drop a reader lock.  */
+      if (!(lock->runcount > 0))
+        {
+          pth_mutex_release (&lock->lock);
+          return EINVAL;
+        }
+      lock->runcount--;
+    }
+  if (lock->runcount == 0)
+    {
+      /* POSIX recommends that "write locks shall take precedence over read
+         locks", to avoid "writer starvation".  */
+      if (lock->waiting_writers_count > 0)
+        {
+          /* Wake up one of the waiting writers.  */
+          if (!pth_cond_notify (&lock->waiting_writers, FALSE))
+            {
+              int err = errno;
+              pth_mutex_release (&lock->lock);
+              return err;
+            }
+        }
+      else
+        {
+          /* Wake up all waiting readers.  */
+          if (!pth_cond_notify (&lock->waiting_readers, TRUE))
+            {
+              int err = errno;
+              pth_mutex_release (&lock->lock);
+              return err;
+            }
+        }
+    }
+  return (!pth_mutex_release (&lock->lock) ? errno : 0);
+}
+
+int
+glthread_rwlock_destroy_multithreaded (gl_rwlock_t *lock)
+{
+  lock->initialized = 0;
+  return 0;
+}
+
+# endif
+
 /* --------------------- gl_recursive_lock_t datatype --------------------- */
 
 /* -------------------------- gl_once_t datatype -------------------------- */
@@ -796,8 +958,10 @@
     }
   EnterCriticalSection (&lock->lock);
   /* Test whether only readers are currently running, and whether the runcount
-     field will not overflow.  */
-  if (!(lock->runcount + 1 > 0))
+     field will not overflow, and whether no writer is waiting.  The latter
+     condition is because POSIX recommends that "write locks shall take
+     precedence over read locks", to avoid "writer starvation".  */
+  if (!(lock->runcount + 1 > 0 && lock->waiting_writers.count == 0))
     {
       /* This thread has to wait for a while.  Enqueue it among the
          waiting_readers.  */
diff -Naur a/lib/glthread/lock.h b/lib/glthread/lock.h
--- a/lib/glthread/lock.h	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/glthread/lock.h	2018-08-07 20:46:01.024459694 +0300
@@ -1,9 +1,9 @@
 /* Locking in multithreaded situations.
-   Copyright (C) 2005-2016 Free Software Foundation, Inc.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 3, or (at your option)
+   the Free Software Foundation; either version 2, or (at your option)
    any later version.
 
    This program is distributed in the hope that it will be useful,
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program; if not, see <http://www.gnu.org/licenses/>.  */
+   along with this program; if not, see <https://www.gnu.org/licenses/>.  */
 
 /* Written by Bruno Haible <bruno@clisp.org>, 2005.
    Based on GCC's gthr-posix.h, gthr-posix95.h, gthr-solaris.h,
@@ -139,13 +139,24 @@
 #  pragma weak pthread_mutexattr_init
 #  pragma weak pthread_mutexattr_settype
 #  pragma weak pthread_mutexattr_destroy
+#  pragma weak pthread_rwlockattr_init
+#  if __GNU_LIBRARY__ > 1
+#   pragma weak pthread_rwlockattr_setkind_np
+#  endif
+#  pragma weak pthread_rwlockattr_destroy
 #  ifndef pthread_self
 #   pragma weak pthread_self
 #  endif
 
 #  if !PTHREAD_IN_USE_DETECTION_HARD
-#   pragma weak pthread_cancel
-#   define pthread_in_use() (pthread_cancel != NULL)
+    /* Considering all platforms with USE_POSIX_THREADS_WEAK, only few symbols
+       can be used to determine whether libpthread is in use.  These are:
+         pthread_mutexattr_gettype
+         pthread_rwlockattr_destroy
+         pthread_rwlockattr_init
+     */
+#   pragma weak pthread_mutexattr_gettype
+#   define pthread_in_use() (pthread_mutexattr_gettype != NULL)
 #  endif
 
 # else
@@ -176,7 +187,7 @@
 
 /* ------------------------- gl_rwlock_t datatype ------------------------- */
 
-# if HAVE_PTHREAD_RWLOCK
+# if HAVE_PTHREAD_RWLOCK && (HAVE_PTHREAD_RWLOCK_RDLOCK_PREFER_WRITER || (defined PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP && (__GNU_LIBRARY__ > 1)))
 
 #  ifdef PTHREAD_RWLOCK_INITIALIZER
 
@@ -185,10 +196,18 @@
       STORAGECLASS pthread_rwlock_t NAME;
 #   define gl_rwlock_define_initialized(STORAGECLASS, NAME) \
       STORAGECLASS pthread_rwlock_t NAME = gl_rwlock_initializer;
-#   define gl_rwlock_initializer \
-      PTHREAD_RWLOCK_INITIALIZER
-#   define glthread_rwlock_init(LOCK) \
-      (pthread_in_use () ? pthread_rwlock_init (LOCK, NULL) : 0)
+#   if HAVE_PTHREAD_RWLOCK_RDLOCK_PREFER_WRITER
+#    define gl_rwlock_initializer \
+       PTHREAD_RWLOCK_INITIALIZER
+#    define glthread_rwlock_init(LOCK) \
+       (pthread_in_use () ? pthread_rwlock_init (LOCK, NULL) : 0)
+#   else /* glibc with bug https://sourceware.org/bugzilla/show_bug.cgi?id=13701 */
+#    define gl_rwlock_initializer \
+       PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP
+#    define glthread_rwlock_init(LOCK) \
+       (pthread_in_use () ? glthread_rwlock_init_for_glibc (LOCK) : 0)
+extern int glthread_rwlock_init_for_glibc (pthread_rwlock_t *lock);
+#   endif
 #   define glthread_rwlock_rdlock(LOCK) \
       (pthread_in_use () ? pthread_rwlock_rdlock (LOCK) : 0)
 #   define glthread_rwlock_wrlock(LOCK) \
@@ -427,6 +446,9 @@
 
 /* ------------------------- gl_rwlock_t datatype ------------------------- */
 
+/* Pth pth_rwlock_acquire always prefers readers.  No autoconf test so far.  */
+# if HAVE_PTH_RWLOCK_ACQUIRE_PREFER_WRITER
+
 typedef pth_rwlock_t gl_rwlock_t;
 #  define gl_rwlock_define(STORAGECLASS, NAME) \
      STORAGECLASS pth_rwlock_t NAME;
@@ -445,6 +467,42 @@
 #  define glthread_rwlock_destroy(LOCK) \
      ((void)(LOCK), 0)
 
+# else
+
+typedef struct
+        {
+          int initialized;
+          pth_mutex_t lock; /* protects the remaining fields */
+          pth_cond_t waiting_readers; /* waiting readers */
+          pth_cond_t waiting_writers; /* waiting writers */
+          unsigned int waiting_writers_count; /* number of waiting writers */
+          int runcount; /* number of readers running, or -1 when a writer runs */
+        }
+        gl_rwlock_t;
+#  define gl_rwlock_define(STORAGECLASS, NAME) \
+     STORAGECLASS gl_rwlock_t NAME;
+#  define gl_rwlock_define_initialized(STORAGECLASS, NAME) \
+     STORAGECLASS gl_rwlock_t NAME = gl_rwlock_initializer;
+#  define gl_rwlock_initializer \
+     { 0 }
+#  define glthread_rwlock_init(LOCK) \
+     (pth_in_use () ? glthread_rwlock_init_multithreaded (LOCK) : 0)
+#  define glthread_rwlock_rdlock(LOCK) \
+     (pth_in_use () ? glthread_rwlock_rdlock_multithreaded (LOCK) : 0)
+#  define glthread_rwlock_wrlock(LOCK) \
+     (pth_in_use () ? glthread_rwlock_wrlock_multithreaded (LOCK) : 0)
+#  define glthread_rwlock_unlock(LOCK) \
+     (pth_in_use () ? glthread_rwlock_unlock_multithreaded (LOCK) : 0)
+#  define glthread_rwlock_destroy(LOCK) \
+     (pth_in_use () ? glthread_rwlock_destroy_multithreaded (LOCK) : 0)
+extern int glthread_rwlock_init_multithreaded (gl_rwlock_t *lock);
+extern int glthread_rwlock_rdlock_multithreaded (gl_rwlock_t *lock);
+extern int glthread_rwlock_wrlock_multithreaded (gl_rwlock_t *lock);
+extern int glthread_rwlock_unlock_multithreaded (gl_rwlock_t *lock);
+extern int glthread_rwlock_destroy_multithreaded (gl_rwlock_t *lock);
+
+# endif
+
 /* --------------------- gl_recursive_lock_t datatype --------------------- */
 
 /* In Pth, mutexes are recursive by default.  */
diff -Naur a/lib/glthread/threadlib.c b/lib/glthread/threadlib.c
--- a/lib/glthread/threadlib.c	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/glthread/threadlib.c	2018-08-07 20:46:01.024459694 +0300
@@ -1,9 +1,9 @@
 /* Multithreading primitives.
-   Copyright (C) 2005-2016 Free Software Foundation, Inc.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 3, or (at your option)
+   the Free Software Foundation; either version 2, or (at your option)
    any later version.
 
    This program is distributed in the hope that it will be useful,
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program; if not, see <http://www.gnu.org/licenses/>.  */
+   along with this program; if not, see <https://www.gnu.org/licenses/>.  */
 
 /* Written by Bruno Haible <bruno@clisp.org>, 2005.  */
 
diff -Naur a/lib/glthread/tls.c b/lib/glthread/tls.c
--- a/lib/glthread/tls.c	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/glthread/tls.c	2018-08-07 20:46:01.024459694 +0300
@@ -1,5 +1,5 @@
 /* Thread-local storage in multithreaded situations.
-   Copyright (C) 2005-2016 Free Software Foundation, Inc.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 /* Written by Bruno Haible <bruno@clisp.org>, 2005.  */
 
diff -Naur a/lib/glthread/tls.h b/lib/glthread/tls.h
--- a/lib/glthread/tls.h	2016-12-31 15:54:41.000000000 +0200
+++ b/lib/glthread/tls.h	2018-08-07 20:46:01.024459694 +0300
@@ -1,5 +1,5 @@
 /* Thread-local storage in multithreaded situations.
-   Copyright (C) 2005, 2007-2016 Free Software Foundation, Inc.
+   Copyright (C) 2005, 2007-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 /* Written by Bruno Haible <bruno@clisp.org>, 2005.  */
 
@@ -76,8 +76,8 @@
 #  endif
 
 #  if !PTHREAD_IN_USE_DETECTION_HARD
-#   pragma weak pthread_cancel
-#   define pthread_in_use() (pthread_cancel != NULL)
+#   pragma weak pthread_mutexattr_gettype
+#   define pthread_in_use() (pthread_mutexattr_gettype != NULL)
 #  endif
 
 # else
diff -Naur a/lib/stdio-impl.h b/lib/stdio-impl.h
--- a/lib/stdio-impl.h	2016-12-31 15:54:42.000000000 +0200
+++ b/lib/stdio-impl.h	2018-08-07 20:46:01.061126359 +0300
@@ -1,5 +1,5 @@
 /* Implementation details of FILE streams.
-   Copyright (C) 2007-2008, 2010-2016 Free Software Foundation, Inc.
+   Copyright (C) 2007-2008, 2010-2018 Free Software Foundation, Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -12,12 +12,18 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 /* Many stdio implementations have the same logic and therefore can share
    the same implementation of stdio extension API, except that some fields
    have different naming conventions, or their access requires some casts.  */
 
+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
+   problem by defining it ourselves.  FIXME: Do not rely on glibc
+   internals.  */
+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
+# define _IO_IN_BACKUP 0x100
+#endif
 
 /* BSD stdio derived implementations.  */
 
@@ -29,10 +35,10 @@
 #include <errno.h>                             /* For detecting Plan9.  */
 
 #if defined __sferror || defined __DragonFly__ || defined __ANDROID__
-  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
+  /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
 
 # if defined __DragonFly__          /* DragonFly */
-  /* See <http://www.dragonflybsd.org/cvsweb/src/lib/libc/stdio/priv_stdio.h?rev=HEAD&content-type=text/x-cvsweb-markup>.  */
+  /* See <https://gitweb.dragonflybsd.org/dragonfly.git/blob_plain/HEAD:/lib/libc/stdio/priv_stdio.h>.  */
 #  define fp_ ((struct { struct __FILE_public pub; \
                          struct { unsigned char *_base; int _size; } _bf; \
                          void *cookie; \
@@ -49,30 +55,84 @@
                          fpos_t _offset; \
                          /* More fields, not relevant here.  */ \
                        } *) fp)
-  /* See <http://www.dragonflybsd.org/cvsweb/src/include/stdio.h?rev=HEAD&content-type=text/x-cvsweb-markup>.  */
+  /* See <https://gitweb.dragonflybsd.org/dragonfly.git/blob_plain/HEAD:/include/stdio.h>.  */
 #  define _p pub._p
 #  define _flags pub._flags
 #  define _r pub._r
 #  define _w pub._w
+# elif defined __ANDROID__ /* Android */
+  /* Up to this commit from 2015-10-12
+     <https://android.googlesource.com/platform/bionic.git/+/f0141dfab10a4b332769d52fa76631a64741297a>
+     the innards of FILE were public, and fp_ub could be defined like for OpenBSD,
+     see <https://android.googlesource.com/platform/bionic.git/+/e78392637d5086384a5631ddfdfa8d7ec8326ee3/libc/stdio/fileext.h>
+     and <https://android.googlesource.com/platform/bionic.git/+/e78392637d5086384a5631ddfdfa8d7ec8326ee3/libc/stdio/local.h>.
+     After this commit, the innards of FILE are hidden.  */
+#  define fp_ ((struct { unsigned char *_p; \
+                         int _r; \
+                         int _w; \
+                         int _flags; \
+                         int _file; \
+                         struct { unsigned char *_base; size_t _size; } _bf; \
+                         int _lbfsize; \
+                         void *_cookie; \
+                         void *_close; \
+                         void *_read; \
+                         void *_seek; \
+                         void *_write; \
+                         struct { unsigned char *_base; size_t _size; } _ext; \
+                         unsigned char *_up; \
+                         int _ur; \
+                         unsigned char _ubuf[3]; \
+                         unsigned char _nbuf[1]; \
+                         struct { unsigned char *_base; size_t _size; } _lb; \
+                         int _blksize; \
+                         fpos_t _offset; \
+                         /* More fields, not relevant here.  */ \
+                       } *) fp)
 # else
 #  define fp_ fp
 # endif
 
-# if (defined __NetBSD__ && __NetBSD_Version__ >= 105270000) || defined __OpenBSD__ || defined __ANDROID__ /* NetBSD >= 1.5ZA, OpenBSD, Android */
+# if (defined __NetBSD__ && __NetBSD_Version__ >= 105270000) || defined __OpenBSD__ || defined __minix /* NetBSD >= 1.5ZA, OpenBSD, Minix 3 */
   /* See <http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libc/stdio/fileext.h?rev=HEAD&content-type=text/x-cvsweb-markup>
-     and <http://www.openbsd.org/cgi-bin/cvsweb/src/lib/libc/stdio/fileext.h?rev=HEAD&content-type=text/x-cvsweb-markup> */
+     and <https://cvsweb.openbsd.org/cgi-bin/cvsweb/src/lib/libc/stdio/fileext.h?rev=HEAD&content-type=text/x-cvsweb-markup>
+     and <https://github.com/Stichting-MINIX-Research-Foundation/minix/blob/master/lib/libc/stdio/fileext.h> */
   struct __sfileext
     {
       struct  __sbuf _ub; /* ungetc buffer */
       /* More fields, not relevant here.  */
     };
 #  define fp_ub ((struct __sfileext *) fp->_ext._base)->_ub
-# else                                         /* FreeBSD, NetBSD <= 1.5Z, DragonFly, Mac OS X, Cygwin, Android */
+# elif defined __ANDROID__                     /* Android */
+  struct __sfileext
+    {
+      struct { unsigned char *_base; size_t _size; } _ub; /* ungetc buffer */
+      /* More fields, not relevant here.  */
+    };
+#  define fp_ub ((struct __sfileext *) fp_->_ext._base)->_ub
+# else                                         /* FreeBSD, NetBSD <= 1.5Z, DragonFly, Mac OS X, Cygwin */
 #  define fp_ub fp_->_ub
 # endif
 
 # define HASUB(fp) (fp_ub._base != NULL)
 
+# if defined __ANDROID__ /* Android */
+  /* Needed after this commit from 2016-01-25
+     <https://android.googlesource.com/platform/bionic.git/+/e70e0e9267d069bf56a5078c99307e08a7280de7> */
+#  ifndef __SEOF
+#   define __SLBF 1
+#   define __SNBF 2
+#   define __SRD 4
+#   define __SWR 8
+#   define __SRW 0x10
+#   define __SEOF 0x20
+#   define __SERR 0x40
+#  endif
+#  ifndef __SOFF
+#   define __SOFF 0x1000
+#  endif
+# endif
+
 #endif
 
 
@@ -81,7 +141,7 @@
 #ifdef __TANDEM                     /* NonStop Kernel */
 # ifndef _IOERR
 /* These values were determined by the program 'stdioext-flags' at
-   <http://lists.gnu.org/archive/html/bug-gnulib/2010-12/msg00165.html>.  */
+   <https://lists.gnu.org/r/bug-gnulib/2010-12/msg00165.html>.  */
 #  define _IOERR   0x40
 #  define _IOREAD  0x80
 #  define _IOWRT    0x4
@@ -99,6 +159,8 @@
                          int _file; \
                          unsigned int _flag; \
                        } *) fp)
+# elif defined __VMS                /* OpenVMS */
+#  define fp_ ((struct _iobuf *) fp)
 # else
 #  define fp_ fp
 # endif
@@ -110,7 +172,7 @@
 #  define _flag __flag
 # endif
 
-#elif (defined _WIN32 || defined __WIN32__) && ! defined __CYGWIN__  /* newer Windows with MSVC */
+#elif defined _WIN32 && ! defined __CYGWIN__  /* newer Windows with MSVC */
 
 /* <stdio.h> does not define the innards of FILE any more.  */
 # define WINDOWS_OPAQUE_FILE
@@ -130,7 +192,7 @@
 # define fp_ ((struct _gl_real_FILE *) fp)
 
 /* These values were determined by a program similar to the one at
-   <http://lists.gnu.org/archive/html/bug-gnulib/2010-12/msg00165.html>.  */
+   <https://lists.gnu.org/r/bug-gnulib/2010-12/msg00165.html>.  */
 # define _IOREAD   0x1
 # define _IOWRT    0x2
 # define _IORW     0x4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180808/d07acc70/attachment.asc>
