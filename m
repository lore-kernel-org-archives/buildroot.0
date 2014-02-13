From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2014 13:51:49 +0000 (UTC)
Subject: [Buildroot] [Bug 6230] Cannot compile gcc without threads
In-Reply-To: <bug-6230-163@https.bugs.busybox.net/>
References: <bug-6230-163@https.bugs.busybox.net/>
Message-ID: <20140213135149.987399C9D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6230

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-13 13:51:49 UTC ---
I tried reproducing the problem, and get failures in uclibc, even with your
proposed .config:

In file included from libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:31:0:
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:17: error: 'fork'
undeclared here (not in a function)
 extern __typeof(fork) __libc_fork;
                 ^
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:63:1: error:
'__libc_fork' redeclared as different kind of symbol
 __libc_fork (void)
 ^
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: note: previous
declaration of '__libc_fork' was here
 extern __typeof(fork) __libc_fork;
                       ^
In file included from ./include/tls.h:6:0,
                 from libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:23:
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c: In function
'__libc_fork':
./libpthread/nptl/sysdeps/arm/tls.h:114:11: warning: implicit declaration of
function '__builtin_thread_pointer' [-Wimplicit-function-declaration]
  ((struct pthread *)__builtin_thread_pointer () - 1)
           ^
./include/bits/stdio-lock.h:42:22: note: in expansion of macro 'THREAD_SELF'
     void *__meself = THREAD_SELF;            \
                      ^
./include/bits/uClibc_mutex.h:96:50: note: in expansion of macro
'_IO_lock_lock'
 #define __UCLIBC_IO_MUTEX_LOCK_CANCEL_UNSAFE(M)  _IO_lock_lock(M)
                                                  ^
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:127:3: note: in expansion
of macro '__UCLIBC_IO_MUTEX_LOCK_CANCEL_UNSAFE'
   __UCLIBC_IO_MUTEX_LOCK_CANCEL_UNSAFE(_stdio_openlist_add_lock);
   ^


In any case, something is definitely broken here...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
