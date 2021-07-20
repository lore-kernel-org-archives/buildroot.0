From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jul 2021 14:08:34 -0600
Subject: [Buildroot] [PATCH v2] package/gcc: fix libsanitizer in gcc
 11.1, 10.3 for linux 5.13
In-Reply-To: <20210705125139.1516789-1-fido_max@inbox.ru>
References: <20210705125139.1516789-1-fido_max@inbox.ru>
Message-ID: <CADvTj4qM2WevDuBcbVwwzKE3=v3Ej+we7_d674Ji=Tfa-Qh80w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 5, 2021 at 6:49 AM Maxim Kochetkov via buildroot
<buildroot@busybox.net> wrote:
>
> Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161
>
> But gcc's libsanitizer uses <linux/cyclades.h> header.
> This issue is fixed by:
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8
>
> Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be deleted.
> So we need to add this patch for 10.3 and 11.1 to fix build with linux kernel 5.13.
>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...er-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>  ...er-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
>  create mode 100644 package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
>
> diff --git a/package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> new file mode 100644
> index 0000000000..da979a309f
> --- /dev/null
> +++ b/package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> @@ -0,0 +1,123 @@
> +From a7e72b282177fbaa6a852324641c871313d326da Mon Sep 17 00:00:00 2001
> +From: Tamar Christina <tamar.christina@arm.com>
> +Date: Fri, 21 May 2021 10:30:59 +0100
> +Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
> +
> +The Linux kernel has removed the interface to cyclades from
> +the latest kernel headers[1] due to them being orphaned for the
> +past 13 years.
> +
> +libsanitizer uses this header when compiling against glibc, but
> +glibcs itself doesn't seem to have any references to cyclades.
> +
> +Further more it seems that the driver is broken in the kernel and
> +the firmware doesn't seem to be available anymore.
> +
> +As such since this is breaking the build of libsanitizer (and so the
> +GCC bootstrap[2]) I propose to remove this.
> +
> +[1] https://lkml.org/lkml/2021/3/2/153
> +[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
> +
> +libsanitizer/ChangeLog:
> +
> +       PR sanitizer/100379
> +       * sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
> +       llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
> +       * sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
> +       * sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> +
> +(cherry picked from commit 745dae5923aba02982563481d75a21595df22ff8)
> +---
> + .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
> + .../sanitizer_platform_limits_posix.cpp               | 11 -----------
> + .../sanitizer_platform_limits_posix.h                 | 10 ----------
> + 3 files changed, 30 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +index 490a04b2181..42e43a04441 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
> +-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
> +-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
> +-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
> +-  _(CYGETTHRESH, WRITE, sizeof(int));
> +-  _(CYGETTIMEOUT, WRITE, sizeof(int));
> +-  _(CYSETDEFTHRESH, NONE, 0);
> +-  _(CYSETDEFTIMEOUT, NONE, 0);
> +-  _(CYSETTHRESH, NONE, 0);
> +-  _(CYSETTIMEOUT, NONE, 0);
> +   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
> +   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
> +   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +index aa845df4dde..badf6a401cc 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +@@ -130,7 +130,6 @@ typedef struct user_fpregs elf_fpregset_t;
> + # include <sys/procfs.h>
> + #endif
> + #include <sys/user.h>
> +-#include <linux/cyclades.h>
> + #include <linux/if_eql.h>
> + #include <linux/if_plip.h>
> + #include <linux/lp.h>
> +@@ -443,7 +442,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
> +-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
> + #if EV_VERSION > (0x010000)
> +   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
> + #else
> +@@ -809,15 +807,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> + #endif // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
> +-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
> +-  unsigned IOCTL_CYGETMON = CYGETMON;
> +-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
> +-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
> +-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
> +-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
> +-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
> +-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
> +   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
> +   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
> +   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +index d82fd5e4005..dc6423bc297 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +@@ -974,7 +974,6 @@ extern unsigned struct_vt_mode_sz;
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> + extern unsigned struct_ax25_parms_struct_sz;
> +-extern unsigned struct_cyclades_monitor_sz;
> + extern unsigned struct_input_keymap_entry_sz;
> + extern unsigned struct_ipx_config_data_sz;
> + extern unsigned struct_kbdiacrs_sz;
> +@@ -1319,15 +1318,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
> + #endif  // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-extern unsigned IOCTL_CYGETDEFTHRESH;
> +-extern unsigned IOCTL_CYGETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYGETMON;
> +-extern unsigned IOCTL_CYGETTHRESH;
> +-extern unsigned IOCTL_CYGETTIMEOUT;
> +-extern unsigned IOCTL_CYSETDEFTHRESH;
> +-extern unsigned IOCTL_CYSETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYSETTHRESH;
> +-extern unsigned IOCTL_CYSETTIMEOUT;
> + extern unsigned IOCTL_EQL_EMANCIPATE;
> + extern unsigned IOCTL_EQL_ENSLAVE;
> + extern unsigned IOCTL_EQL_GETMASTRCFG;
> +--
> +2.31.1
> +
> diff --git a/package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> new file mode 100644
> index 0000000000..78208d7348
> --- /dev/null
> +++ b/package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> @@ -0,0 +1,123 @@
> +From 2bf34b9f4e446bf9be7f04458058dd5319fb396e Mon Sep 17 00:00:00 2001
> +From: Tamar Christina <tamar.christina@arm.com>
> +Date: Fri, 21 May 2021 10:30:59 +0100
> +Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
> +
> +The Linux kernel has removed the interface to cyclades from
> +the latest kernel headers[1] due to them being orphaned for the
> +past 13 years.
> +
> +libsanitizer uses this header when compiling against glibc, but
> +glibcs itself doesn't seem to have any references to cyclades.
> +
> +Further more it seems that the driver is broken in the kernel and
> +the firmware doesn't seem to be available anymore.
> +
> +As such since this is breaking the build of libsanitizer (and so the
> +GCC bootstrap[2]) I propose to remove this.
> +
> +[1] https://lkml.org/lkml/2021/3/2/153
> +[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
> +
> +libsanitizer/ChangeLog:
> +
> +       PR sanitizer/100379
> +       * sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
> +       llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
> +       * sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
> +       * sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> +
> +(cherry picked from commit 745dae5923aba02982563481d75a21595df22ff8)
> +---
> + .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
> + .../sanitizer_platform_limits_posix.cpp               | 11 -----------
> + .../sanitizer_platform_limits_posix.h                 | 10 ----------
> + 3 files changed, 30 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +index 490a04b2181..42e43a04441 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
> +-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
> +-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
> +-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
> +-  _(CYGETTHRESH, WRITE, sizeof(int));
> +-  _(CYGETTIMEOUT, WRITE, sizeof(int));
> +-  _(CYSETDEFTHRESH, NONE, 0);
> +-  _(CYSETDEFTIMEOUT, NONE, 0);
> +-  _(CYSETTHRESH, NONE, 0);
> +-  _(CYSETTIMEOUT, NONE, 0);
> +   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
> +   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
> +   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +index 1427cec48c4..025e575b5bc 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +@@ -131,7 +131,6 @@ typedef struct user_fpregs elf_fpregset_t;
> + # include <sys/procfs.h>
> + #endif
> + #include <sys/user.h>
> +-#include <linux/cyclades.h>
> + #include <linux/if_eql.h>
> + #include <linux/if_plip.h>
> + #include <linux/lp.h>
> +@@ -449,7 +448,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
> +-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
> + #if EV_VERSION > (0x010000)
> +   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
> + #else
> +@@ -815,15 +813,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> + #endif // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
> +-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
> +-  unsigned IOCTL_CYGETMON = CYGETMON;
> +-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
> +-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
> +-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
> +-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
> +-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
> +-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
> +   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
> +   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
> +   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +index 0812039b038..83861105a50 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +@@ -981,7 +981,6 @@ extern unsigned struct_vt_mode_sz;
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> + extern unsigned struct_ax25_parms_struct_sz;
> +-extern unsigned struct_cyclades_monitor_sz;
> + extern unsigned struct_input_keymap_entry_sz;
> + extern unsigned struct_ipx_config_data_sz;
> + extern unsigned struct_kbdiacrs_sz;
> +@@ -1326,15 +1325,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
> + #endif  // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-extern unsigned IOCTL_CYGETDEFTHRESH;
> +-extern unsigned IOCTL_CYGETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYGETMON;
> +-extern unsigned IOCTL_CYGETTHRESH;
> +-extern unsigned IOCTL_CYGETTIMEOUT;
> +-extern unsigned IOCTL_CYSETDEFTHRESH;
> +-extern unsigned IOCTL_CYSETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYSETTHRESH;
> +-extern unsigned IOCTL_CYSETTIMEOUT;
> + extern unsigned IOCTL_EQL_EMANCIPATE;
> + extern unsigned IOCTL_EQL_ENSLAVE;
> + extern unsigned IOCTL_EQL_GETMASTRCFG;
> +--
> +2.31.1
> +
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
