From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 11 Feb 2020 13:39:51 -0600
Subject: [Buildroot] [PATCH v2 1/3] package/qemu: Bump to version 4.2.0
In-Reply-To: <20200208211512.994361-1-aduskett@gmail.com>
References: <20200208211512.994361-1-aduskett@gmail.com>
Message-ID: <170f2b19-4338-8a7c-8440-c1da3b079779@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On 2/8/20 3:15 PM, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
>
> Other changes:
>    - Remove upstream patches
>    - Update COPYING.LIB hash as upstream updated the file to match the new LGPL
>      2.1 license from upstream. See:
>      https://github.com/qemu/qemu/commit/f0d44cc4462f112bce5ec556e87eff4eec682e39
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>    - Remove the uneeded pactches in the qemu/3.1.1.1 directory (Baruch)
>    - Move the upstream patches to qemu/4.2.0
>
>   ...ly-sized-SIOCGSTAMP-with-new-kernels.patch | 337 ------------------
>   ...ser-assume-__NR_gettid-always-exists.patch |  44 ---
>   ...e-gettid-to-sys_gettid-to-avoid-clas.patch |  91 -----
>   ...age-of-mcontext-structure-on-ARM-uCl.patch |   2 +-
>   ...ix-crash-when-compiling-with-uClibc.patch} |   0
>   package/qemu/qemu.hash                        |   4 +-
>   package/qemu/qemu.mk                          |   2 +-
>   7 files changed, 4 insertions(+), 476 deletions(-)
>   delete mode 100644 package/qemu/3.1.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
>   delete mode 100644 package/qemu/3.1.1.1/0004-linux-user-assume-__NR_gettid-always-exists.patch
>   delete mode 100644 package/qemu/3.1.1.1/0005-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
>   rename package/qemu/{3.1.1.1 => 4.2.0}/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch (95%)
>   rename package/qemu/{3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch => 4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch} (100%)
>
> diff --git a/package/qemu/3.1.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch b/package/qemu/3.1.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
> deleted file mode 100644
> index a757d1f1ae..0000000000
> --- a/package/qemu/3.1.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
> +++ /dev/null
> @@ -1,337 +0,0 @@
> -From 6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> -Date: Thu, 18 Jul 2019 15:06:41 +0200
> -Subject: [PATCH] linux-user: fix to handle variably sized SIOCGSTAMP with new
> - kernels
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The SIOCGSTAMP symbol was previously defined in the
> -asm-generic/sockios.h header file. QEMU sees that header
> -indirectly via sys/socket.h
> -
> -In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
> -the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
> -Instead it provides only SIOCGSTAMP_OLD, which only uses a
> -32-bit time_t on 32-bit architectures.
> -
> -The linux/sockios.h header then defines SIOCGSTAMP using
> -either SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. If
> -SIOCGSTAMP_NEW is used, then the tv_sec field is 64-bit even
> -on 32-bit architectures
> -
> -To cope with this we must now convert the old and new type from
> -the target to the host one.
> -
> -Signed-off-by: Daniel P. Berrang? <berrange@redhat.com>
> -Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> -Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> -Message-Id: <20190718130641.15294-1-laurent@vivier.eu>
> -Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> -
> -[Retrieved (and backported to 3.1.0) from:
> -https://github.com/qemu/qemu/commit/6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - linux-user/ioctls.h        |  21 +++++-
> - linux-user/syscall.c       | 140 +++++++++++++++++++++++++++++--------
> - linux-user/syscall_defs.h  |  30 +++++++-
> - linux-user/syscall_types.h |   6 --
> - 4 files changed, 159 insertions(+), 38 deletions(-)
> -
> -diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> -index 5e84dc7c3a7..3281c97ca26 100644
> ---- a/linux-user/ioctls.h
> -+++ b/linux-user/ioctls.h
> -@@ -222,8 +222,25 @@
> -   IOCTL(SIOCGIWNAME, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_char_ifreq)))
> -   IOCTL(SIOCSPGRP, IOC_W, MK_PTR(TYPE_INT)) /* pid_t */
> -   IOCTL(SIOCGPGRP, IOC_R, MK_PTR(TYPE_INT)) /* pid_t */
> --  IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
> --  IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
> -+
> -+  /*
> -+   * We can't use IOCTL_SPECIAL() because it will set
> -+   * host_cmd to XXX_OLD and XXX_NEW and these macros
> -+   * are not defined with kernel prior to 5.2.
> -+   * We must set host_cmd to the same value as in target_cmd
> -+   * otherwise the consistency check in syscall_init()
> -+   * will trigger an error.
> -+   * host_cmd is ignored by the do_ioctl_XXX() helpers.
> -+   * FIXME: create a macro to define this kind of entry
> -+   */
> -+  { TARGET_SIOCGSTAMP_OLD, TARGET_SIOCGSTAMP_OLD,
> -+    "SIOCGSTAMP_OLD", IOC_R, do_ioctl_SIOCGSTAMP },
> -+  { TARGET_SIOCGSTAMPNS_OLD, TARGET_SIOCGSTAMPNS_OLD,
> -+    "SIOCGSTAMPNS_OLD", IOC_R, do_ioctl_SIOCGSTAMPNS },
> -+  { TARGET_SIOCGSTAMP_NEW, TARGET_SIOCGSTAMP_NEW,
> -+    "SIOCGSTAMP_NEW", IOC_R, do_ioctl_SIOCGSTAMP },
> -+  { TARGET_SIOCGSTAMPNS_NEW, TARGET_SIOCGSTAMPNS_NEW,
> -+    "SIOCGSTAMPNS_NEW", IOC_R, do_ioctl_SIOCGSTAMPNS },
> -
> -   IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
> -   IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
> -diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index 39a37496fed..8367cb138df 100644
> ---- a/linux-user/syscall.c
> -+++ b/linux-user/syscall.c
> -@@ -37,6 +37,7 @@
> - #include <sched.h>
> - #include <sys/timex.h>
> - #include <sys/socket.h>
> -+#include <linux/sockios.h>
> - #include <sys/un.h>
> - #include <sys/uio.h>
> - #include <poll.h>
> -@@ -1126,8 +1127,9 @@ static inline abi_long copy_from_user_timeval(struct timeval *tv,
> - {
> -     struct target_timeval *target_tv;
> -
> --    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1))
> -+    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1)) {
> -         return -TARGET_EFAULT;
> -+    }
> -
> -     __get_user(tv->tv_sec, &target_tv->tv_sec);
> -     __get_user(tv->tv_usec, &target_tv->tv_usec);
> -@@ -1142,8 +1144,26 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
> - {
> -     struct target_timeval *target_tv;
> -
> --    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0))
> -+    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
> -+        return -TARGET_EFAULT;
> -+    }
> -+
> -+    __put_user(tv->tv_sec, &target_tv->tv_sec);
> -+    __put_user(tv->tv_usec, &target_tv->tv_usec);
> -+
> -+    unlock_user_struct(target_tv, target_tv_addr, 1);
> -+
> -+    return 0;
> -+}
> -+
> -+static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
> -+                                             const struct timeval *tv)
> -+{
> -+    struct target__kernel_sock_timeval *target_tv;
> -+
> -+    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
> -         return -TARGET_EFAULT;
> -+    }
> -
> -     __put_user(tv->tv_sec, &target_tv->tv_sec);
> -     __put_user(tv->tv_usec, &target_tv->tv_usec);
> -@@ -1153,6 +1173,48 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
> -     return 0;
> - }
> -
> -+static inline abi_long target_to_host_timespec(struct timespec *host_ts,
> -+                                               abi_ulong target_addr)
> -+{
> -+    struct target_timespec *target_ts;
> -+
> -+    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
> -+        return -TARGET_EFAULT;
> -+    }
> -+    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
> -+    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
> -+    unlock_user_struct(target_ts, target_addr, 0);
> -+    return 0;
> -+}
> -+
> -+static inline abi_long host_to_target_timespec(abi_ulong target_addr,
> -+                                               struct timespec *host_ts)
> -+{
> -+    struct target_timespec *target_ts;
> -+
> -+    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
> -+        return -TARGET_EFAULT;
> -+    }
> -+    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
> -+    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
> -+    unlock_user_struct(target_ts, target_addr, 1);
> -+    return 0;
> -+}
> -+
> -+static inline abi_long host_to_target_timespec64(abi_ulong target_addr,
> -+                                                 struct timespec *host_ts)
> -+{
> -+    struct target__kernel_timespec *target_ts;
> -+
> -+    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
> -+        return -TARGET_EFAULT;
> -+    }
> -+    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
> -+    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
> -+    unlock_user_struct(target_ts, target_addr, 1);
> -+    return 0;
> -+}
> -+
> - static inline abi_long copy_from_user_timezone(struct timezone *tz,
> -                                                abi_ulong target_tz_addr)
> - {
> -@@ -4899,6 +4961,54 @@ static abi_long do_ioctl_kdsigaccept(const IOCTLEntry *ie, uint8_t *buf_temp,
> -     return get_errno(safe_ioctl(fd, ie->host_cmd, sig));
> - }
> -
> -+static abi_long do_ioctl_SIOCGSTAMP(const IOCTLEntry *ie, uint8_t *buf_temp,
> -+                                    int fd, int cmd, abi_long arg)
> -+{
> -+    struct timeval tv;
> -+    abi_long ret;
> -+
> -+    ret = get_errno(safe_ioctl(fd, SIOCGSTAMP, &tv));
> -+    if (is_error(ret)) {
> -+        return ret;
> -+    }
> -+
> -+    if (cmd == (int)TARGET_SIOCGSTAMP_OLD) {
> -+        if (copy_to_user_timeval(arg, &tv)) {
> -+            return -TARGET_EFAULT;
> -+        }
> -+    } else {
> -+        if (copy_to_user_timeval64(arg, &tv)) {
> -+            return -TARGET_EFAULT;
> -+        }
> -+    }
> -+
> -+    return ret;
> -+}
> -+
> -+static abi_long do_ioctl_SIOCGSTAMPNS(const IOCTLEntry *ie, uint8_t *buf_temp,
> -+                                      int fd, int cmd, abi_long arg)
> -+{
> -+    struct timespec ts;
> -+    abi_long ret;
> -+
> -+    ret = get_errno(safe_ioctl(fd, SIOCGSTAMPNS, &ts));
> -+    if (is_error(ret)) {
> -+        return ret;
> -+    }
> -+
> -+    if (cmd == (int)TARGET_SIOCGSTAMPNS_OLD) {
> -+        if (host_to_target_timespec(arg, &ts)) {
> -+            return -TARGET_EFAULT;
> -+        }
> -+    } else{
> -+        if (host_to_target_timespec64(arg, &ts)) {
> -+            return -TARGET_EFAULT;
> -+        }
> -+    }
> -+
> -+    return ret;
> -+}
> -+
> - #ifdef TIOCGPTPEER
> - static abi_long do_ioctl_tiocgptpeer(const IOCTLEntry *ie, uint8_t *buf_temp,
> -                                      int fd, int cmd, abi_long arg)
> -@@ -6271,32 +6381,6 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
> - }
> - #endif
> -
> --static inline abi_long target_to_host_timespec(struct timespec *host_ts,
> --                                               abi_ulong target_addr)
> --{
> --    struct target_timespec *target_ts;
> --
> --    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1))
> --        return -TARGET_EFAULT;
> --    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
> --    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
> --    unlock_user_struct(target_ts, target_addr, 0);
> --    return 0;
> --}
> --
> --static inline abi_long host_to_target_timespec(abi_ulong target_addr,
> --                                               struct timespec *host_ts)
> --{
> --    struct target_timespec *target_ts;
> --
> --    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0))
> --        return -TARGET_EFAULT;
> --    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
> --    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
> --    unlock_user_struct(target_ts, target_addr, 1);
> --    return 0;
> --}
> --
> - static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
> -                                                  abi_ulong target_addr)
> - {
> -diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> -index fffa89f2564..06622703008 100644
> ---- a/linux-user/syscall_defs.h
> -+++ b/linux-user/syscall_defs.h
> -@@ -209,16 +209,34 @@ struct target_linger {
> -     abi_int l_linger;       /* How long to linger for       */
> - };
> -
> -+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
> -+struct target_timeval {
> -+    abi_long tv_sec;
> -+    abi_int tv_usec;
> -+};
> -+#define target__kernel_sock_timeval target_timeval
> -+#else
> - struct target_timeval {
> -     abi_long tv_sec;
> -     abi_long tv_usec;
> - };
> -
> -+struct target__kernel_sock_timeval {
> -+    abi_llong tv_sec;
> -+    abi_llong tv_usec;
> -+};
> -+#endif
> -+
> - struct target_timespec {
> -     abi_long tv_sec;
> -     abi_long tv_nsec;
> - };
> -
> -+struct target__kernel_timespec {
> -+    abi_llong tv_sec;
> -+    abi_llong tv_nsec;
> -+};
> -+
> - struct target_timezone {
> -     abi_int tz_minuteswest;
> -     abi_int tz_dsttime;
> -@@ -749,8 +767,16 @@ struct target_pollfd {
> - #define TARGET_SIOCATMARK      0x8905
> - #define TARGET_SIOCGPGRP       0x8904
> - #endif
> --#define TARGET_SIOCGSTAMP      0x8906          /* Get stamp (timeval) */
> --#define TARGET_SIOCGSTAMPNS    0x8907          /* Get stamp (timespec) */
> -+#if defined(TARGET_SH4)
> -+#define TARGET_SIOCGSTAMP_OLD   TARGET_IOR('s', 100, struct target_timeval)
> -+#define TARGET_SIOCGSTAMPNS_OLD TARGET_IOR('s', 101, struct target_timespec)
> -+#else
> -+#define TARGET_SIOCGSTAMP_OLD   0x8906
> -+#define TARGET_SIOCGSTAMPNS_OLD 0x8907
> -+#endif
> -+
> -+#define TARGET_SIOCGSTAMP_NEW   TARGET_IOR(0x89, 0x06, abi_llong[2])
> -+#define TARGET_SIOCGSTAMPNS_NEW TARGET_IOR(0x89, 0x07, abi_llong[2])
> -
> - /* Networking ioctls */
> - #define TARGET_SIOCADDRT       0x890B          /* add routing table entry */
> -diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> -index b98a23b0f1b..4e369838262 100644
> ---- a/linux-user/syscall_types.h
> -+++ b/linux-user/syscall_types.h
> -@@ -14,12 +14,6 @@ STRUCT(serial_icounter_struct,
> - STRUCT(sockaddr,
> -        TYPE_SHORT, MK_ARRAY(TYPE_CHAR, 14))
> -
> --STRUCT(timeval,
> --       MK_ARRAY(TYPE_LONG, 2))
> --
> --STRUCT(timespec,
> --       MK_ARRAY(TYPE_LONG, 2))
> --
> - STRUCT(rtentry,
> -        TYPE_ULONG, MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr),
> -        TYPE_SHORT, TYPE_SHORT, TYPE_ULONG, TYPE_PTRVOID, TYPE_SHORT, TYPE_PTRVOID,
> diff --git a/package/qemu/3.1.1.1/0004-linux-user-assume-__NR_gettid-always-exists.patch b/package/qemu/3.1.1.1/0004-linux-user-assume-__NR_gettid-always-exists.patch
> deleted file mode 100644
> index 3475ad5b13..0000000000
> --- a/package/qemu/3.1.1.1/0004-linux-user-assume-__NR_gettid-always-exists.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 184943d827ce09375284e6fbb9fd5eeb9e369529 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> -Date: Wed, 20 Mar 2019 16:18:41 +0000
> -Subject: [PATCH] linux-user: assume __NR_gettid always exists
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The gettid syscall was introduced in Linux 2.4.11. This is old enough
> -that we can assume it always exists and thus not bother with the
> -conditional backcompat logic.
> -
> -Signed-off-by: Daniel P. Berrang? <berrange@redhat.com>
> -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> -Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> -Message-Id: <20190320161842.13908-2-berrange@redhat.com>
> -Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ----
> - linux-user/syscall.c | 8 --------
> - 1 file changed, 8 deletions(-)
> -
> -diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index 208fd1813d..11729f382c 100644
> ---- a/linux-user/syscall.c
> -+++ b/linux-user/syscall.c
> -@@ -249,15 +249,7 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
> - #define TARGET_NR__llseek TARGET_NR_llseek
> - #endif
> -
> --#ifdef __NR_gettid
> - _syscall0(int, gettid)
> --#else
> --/* This is a replacement for the host gettid() and must return a host
> --   errno. */
> --static int gettid(void) {
> --    return -ENOSYS;
> --}
> --#endif
> -
> - /* For the 64-bit guest on 32-bit host case we must emulate
> -  * getdents using getdents64, because otherwise the host
> ---
> -2.23.0
> -
> diff --git a/package/qemu/3.1.1.1/0005-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch b/package/qemu/3.1.1.1/0005-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
> deleted file mode 100644
> index 8e49bc0c99..0000000000
> --- a/package/qemu/3.1.1.1/0005-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From 71ba74f67eaca21b0cc9d96f534ad3b9a7161400 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> -Date: Wed, 20 Mar 2019 16:18:42 +0000
> -Subject: [PATCH] linux-user: rename gettid() to sys_gettid() to avoid clash
> - with glibc
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The glibc-2.29.9000-6.fc31.x86_64 package finally includes the gettid()
> -function as part of unistd.h when __USE_GNU is defined. This clashes
> -with linux-user code which unconditionally defines this function name
> -itself.
> -
> -/home/berrange/src/virt/qemu/linux-user/syscall.c:253:16: error: static declaration of ?gettid? follows non-static declaration
> -  253 | _syscall0(int, gettid)
> -      |                ^~~~~~
> -/home/berrange/src/virt/qemu/linux-user/syscall.c:184:13: note: in definition of macro ?_syscall0?
> -  184 | static type name (void)   \
> -      |             ^~~~
> -In file included from /usr/include/unistd.h:1170,
> -                 from /home/berrange/src/virt/qemu/include/qemu/osdep.h:107,
> -                 from /home/berrange/src/virt/qemu/linux-user/syscall.c:20:
> -/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of ?gettid? was here
> -   34 | extern __pid_t gettid (void) __THROW;
> -      |                ^~~~~~
> -  CC      aarch64-linux-user/linux-user/signal.o
> -make[1]: *** [/home/berrange/src/virt/qemu/rules.mak:69: linux-user/syscall.o] Error 1
> -make[1]: *** Waiting for unfinished jobs....
> -make: *** [Makefile:449: subdir-aarch64-linux-user] Error 2
> -
> -While we could make our definition conditional and rely on glibc's impl,
> -this patch simply renames our definition to sys_gettid() which is a
> -common pattern in this file.
> -
> -Signed-off-by: Daniel P. Berrang? <berrange@redhat.com>
> -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> -Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> -Message-Id: <20190320161842.13908-3-berrange@redhat.com>
> -Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ----
> - linux-user/syscall.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index 11729f382c..96cd4bf86d 100644
> ---- a/linux-user/syscall.c
> -+++ b/linux-user/syscall.c
> -@@ -249,7 +249,8 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
> - #define TARGET_NR__llseek TARGET_NR_llseek
> - #endif
> -
> --_syscall0(int, gettid)
> -+#define __NR_sys_gettid __NR_gettid
> -+_syscall0(int, sys_gettid)
> -
> - /* For the 64-bit guest on 32-bit host case we must emulate
> -  * getdents using getdents64, because otherwise the host
> -@@ -5434,7 +5435,7 @@ static void *clone_func(void *arg)
> -     cpu = ENV_GET_CPU(env);
> -     thread_cpu = cpu;
> -     ts = (TaskState *)cpu->opaque;
> --    info->tid = gettid();
> -+    info->tid = sys_gettid();
> -     task_settid(ts);
> -     if (info->child_tidptr)
> -         put_user_u32(info->tid, info->child_tidptr);
> -@@ -5579,9 +5580,9 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
> -                mapping.  We can't repeat the spinlock hack used above because
> -                the child process gets its own copy of the lock.  */
> -             if (flags & CLONE_CHILD_SETTID)
> --                put_user_u32(gettid(), child_tidptr);
> -+                put_user_u32(sys_gettid(), child_tidptr);
> -             if (flags & CLONE_PARENT_SETTID)
> --                put_user_u32(gettid(), parent_tidptr);
> -+                put_user_u32(sys_gettid(), parent_tidptr);
> -             ts = (TaskState *)cpu->opaque;
> -             if (flags & CLONE_SETTLS)
> -                 cpu_set_tls (env, newtls);
> -@@ -10621,7 +10622,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
> -         return TARGET_PAGE_SIZE;
> - #endif
> -     case TARGET_NR_gettid:
> --        return get_errno(gettid());
> -+        return get_errno(sys_gettid());
> - #ifdef TARGET_NR_readahead
> -     case TARGET_NR_readahead:
> - #if TARGET_ABI_BITS == 32
> ---
> -2.23.0
> -
> diff --git a/package/qemu/3.1.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> similarity index 95%
> rename from package/qemu/3.1.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> rename to package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> index a0c4a6203c..157d28b112 100644
> --- a/package/qemu/3.1.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> +++ b/package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> @@ -21,7 +21,7 @@ diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>   index 6db0758..2b3d116 100644
>   --- a/accel/tcg/user-exec.c
>   +++ b/accel/tcg/user-exec.c
> -@@ -463,7 +463,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
> +@@ -506,7 +506,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>    
>    #if defined(__NetBSD__)
>        pc = uc->uc_mcontext.__gregs[_REG_R15];
> diff --git a/package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> similarity index 100%
> rename from package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> rename to package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 29339ae296..dae11cb3fe 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,7 +1,7 @@
>   # Locally computed, tarball verified with GPG signature
> -sha256 b148fc3c7382c5addd915db433383160ca7b840bc6ea90bb0d35c6b253526d56  qemu-3.1.1.1.tar.xz
> +sha256 d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0  qemu-4.2.0.tar.xz
>   sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
> -sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
> +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
>   
>   # Locally computed
>   sha256 61091767ffd16002e77f005155d096208094e69dee35e6d5ddcaa6c8a13b5e26  qemu-b517e1dc3125a57555d67a8deed9eac7b42288e2.tar.gz
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 450ad61877..6794157709 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -8,7 +8,7 @@ ifeq ($(BR2_csky),y)
>   QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
>   QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
>   else
> -QEMU_VERSION = 3.1.1.1
> +QEMU_VERSION = 4.2.0
>   QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>   QEMU_SITE = http://download.qemu.org
>   endif
You'll may need to change the .mk file to fix the references libssh2. 
See 
https://git.qemu.org/?p=qemu.git;a=commit;h=b10d49d7619e4957b4b971f816661b57e5061d71

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
