From: Maarten ter Huurne <maarten@treewalker.org>
Date: Thu, 11 Sep 2014 06:38:45 +0200
Subject: [Buildroot] [PATCH] libxml2: Add patch to remove weak symbol
	trickery
Message-ID: <1410410325-23801-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This avoids runtime problems when linking libpthread statically and it
fixes compilation with musl libc.

The patch is based on this one:

  https://github.com/sabotage-linux/sabotage/blob/master/KEEP/libxml2-pthread.patch

I added the configure modification to ensure that libxml-2.0.pc will
list libpthread as a private dependency.
---
 ...bxml2-pthread-remove-weak-symbol-trickery.patch | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch

diff --git a/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch b/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
new file mode 100644
index 0000000..8e9a139
--- /dev/null
+++ b/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
@@ -0,0 +1,82 @@
+libxml2 contains some trickery to avoid linking to libpthread.
+However, this is unsafe in several ways:
+
+Bug 704904 - Incorrect and unsafe use of weak references to pthread functions
+https://bugzilla.gnome.org/show_bug.cgi?id=704904
+
+As a side effect, the following compilation error with musl libc is also
+fixed by this patch:
+
+Bug 704908 - Failure to suppress macros when re-declaring pthread functions
+https://bugzilla.gnome.org/show_bug.cgi?id=704908
+
+--- libxml2-2.9.1.org/threads.c	2013-04-05 17:08:04.000000000 +0200
++++ libxml2-2.9.1/threads.c	2014-09-11 06:18:30.988687882 +0200
+@@ -47,49 +47,7 @@
+ #ifdef HAVE_PTHREAD_H
+ 
+ static int libxml_is_threaded = -1;
+-#ifdef __GNUC__
+-#ifdef linux
+-#if (__GNUC__ == 3 && __GNUC_MINOR__ >= 3) || (__GNUC__ > 3)
+-extern int pthread_once (pthread_once_t *__once_control,
+-                         void (*__init_routine) (void))
+-	   __attribute((weak));
+-extern void *pthread_getspecific (pthread_key_t __key)
+-	   __attribute((weak));
+-extern int pthread_setspecific (pthread_key_t __key,
+-                                __const void *__pointer)
+-	   __attribute((weak));
+-extern int pthread_key_create (pthread_key_t *__key,
+-                               void (*__destr_function) (void *))
+-	   __attribute((weak));
+-extern int pthread_key_delete (pthread_key_t __key)
+-	   __attribute((weak));
+-extern int pthread_mutex_init ()
+-	   __attribute((weak));
+-extern int pthread_mutex_destroy ()
+-	   __attribute((weak));
+-extern int pthread_mutex_lock ()
+-	   __attribute((weak));
+-extern int pthread_mutex_unlock ()
+-	   __attribute((weak));
+-extern int pthread_cond_init ()
+-	   __attribute((weak));
+-extern int pthread_cond_destroy ()
+-	   __attribute((weak));
+-extern int pthread_cond_wait ()
+-	   __attribute((weak));
+-extern int pthread_equal ()
+-	   __attribute((weak));
+-extern pthread_t pthread_self ()
+-	   __attribute((weak));
+-extern int pthread_key_create ()
+-	   __attribute((weak));
+-extern int pthread_key_delete ()
+-	   __attribute((weak));
+-extern int pthread_cond_signal ()
+-	   __attribute((weak));
+-#endif
+-#endif /* linux */
+-#endif /* __GNUC__ */
++
+ #endif /* HAVE_PTHREAD_H */
+ 
+ /*
+--- libxml2-2.9.1.org/configure.in	2013-04-19 09:25:20.000000000 +0200
++++ libxml2-2.9.1/configure.in	2014-09-11 06:14:21.357860768 +0200
+@@ -1001,14 +1001,6 @@
+ 		   then
+ 		       THREAD_LIBS=""
+ 		       BASE_THREAD_LIBS="-lpthread"
+-		   else
+-		   if expr ${GCC_MAJOR} \> 3 > /dev/null
+-		   then
+-		       THREAD_LIBS=""
+-		       BASE_THREAD_LIBS="-lpthread"
+-		   else
+-		       echo old GCC disabling weak symbols for pthread
+-		   fi
+ 		   fi
+ 	       fi
+ 	   fi
-- 
1.8.4.5
