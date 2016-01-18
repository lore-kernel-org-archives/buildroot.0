From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 21:24:53 +0100
Subject: [Buildroot] [PATCH 0/8] Remove uClibc version selection: always use
	uClibc-ng
Message-ID: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since April 2015, the uClibc-ng has done very regular releases of the
uClibc C library, and is the de-facto active replacement of the now
defunct uClibc project.

uClibc 0.9.33 is going to be 4 years old in the coming months, and we
already need 50+ patches to make it somewhat usable.

It is therefore time to simply offer uClibc-ng as our only supported
uClibc version, and remove the options of using uClibc 0.9.33 and
uClibc-snapshot. To achieve this, this patch series:

 - Removes references to the BR2_UCLIBC_VERSION_SNAPSHOT option from
   various packages: libunwind, lttng-babeltrace, mongrel2, vlc and
   samba4. The dependencies of those packages are updated, and will
   now allow in many cases to build such packages with uClibc-ng, and
   sometimes with musl when possible.

 - Removes the uClibc 0.9.33 and uClibc snapshot options.

 - Removes the support for version selection in the uclibc package.

Best regards,

Thomas

Thomas Petazzoni (8):
  libunwind: fix C library dependency
  lttng-babeltrace: make available for all C libraries
  mongrel2: allow using uClibc but only on certain architectures
  vlc: remove dependency on C library
  samba4: remove dependency on specific C libraries
  uclibc: remove 0.9.33 version
  uclibc: remove support for the snapshot version
  uclibc: remove version selection

 package/libunwind/Config.in                        |   31 +-
 package/lttng-babeltrace/Config.in                 |    6 +-
 package/mongrel2/Config.in                         |   22 +-
 package/samba4/Config.in                           |    7 +-
 .../0001-bits-time.h-sync-with-glibc-2.16.patch    |   37 -
 .../uclibc/0.9.33.2/0003-Add-dup3-syscall.patch    |   54 -
 ...deps-add-__kernel_long-and-__kernel_ulong.patch |  381 ------
 ...estore-stack-pointer-just-after-return-fr.patch |   42 -
 ...e.S-Add-missing-IT-instruction-for-Thumb2.patch |   29 -
 ...8-arm-move-check-for-BX-to-its-own-header.patch |  257 ----
 .../0.9.33.2/0009-mips64-fix-n64-interp.patch      |   51 -
 ...0010-Rules.mak-fix-breakage-from-603af30d.patch |   31 -
 ...11-libc-add-non-standard-execvpe-function.patch |  163 ---
 .../0012-libc-stdlib-add-mkostemp-helpers.patch    |  155 ---
 ...ventfd-Implement-eventfd2-and-fix-eventfd.patch |   64 -
 .../uclibc/0.9.33.2/0015-add-posix_madvise.c.patch |   61 -
 ...ptl-sh-fix-race-condition-in-lll_wait_tid.patch |   38 -
 ...d-SIGCANCEL-to-the-list-of-blocked-signal.patch |   37 -
 ...18-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch |   52 -
 ...nclude-elf.h-update-for-ELFOSABI_-changes.patch |   34 -
 ...0020-update-ptrace.h-to-latest-from-glibc.patch |  113 --
 ...x-authnone_marshal-in-multithreading-cont.patch |  128 --
 ...t-__syscall_error-callers-to-use-a0-for-a.patch |   57 -
 ...-instead-of-v0-for-__syscall_error-argume.patch |   63 -
 ...se-.arm-mode-for-resolver-unconditionally.patch |   29 -
 ...s-getpid-behave-similar-to-the-common-one.patch |   53 -
 ...yscalls.h-allow-immediate-values-as-6th-s.patch |   33 -
 .../0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch |   57 -
 .../0029-inet-rpc-fix-build-in-NPTL-case.patch     |   58 -
 ...plement-assignment-allocation-m-character.patch |  190 ---
 ...map-sys_mmap2-do-unsigned-shift-of-offset.patch |   35 -
 .../0.9.33.2/0033-rpmatch-backport-function.patch  |   78 --
 .../0.9.33.2/0034-statfs-support-f_frsize.patch    |  189 ---
 ...5-socket.h-pull-socket_type.h-from-eglibc.patch | 1374 --------------------
 package/uclibc/0.9.33.2/0036-mount.h-update.patch  |   91 --
 ...n_bits_syscall_h-do-not-leave-undefined-S.patch |   38 -
 ...38-libc-sysdeps-sync-bits-in.h-with-glibc.patch |  117 --
 ...-reuse-free-slots-at-the-end-of-exit-func.patch |   43 -
 ...ame-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch |  200 ---
 .../0.9.33.2/0041-libc-add-posix_fallocate.patch   |  337 -----
 ...-fix-overflow-checking-in-int_add_no_wrap.patch |   44 -
 ...Add-missing-SYMBOL_PREFIX-to-symbol-names.patch |   86 --
 ...inet-do-not-filter-responses-in-res_query.patch |   46 -
 ...-Remove-pragma-weak-for-undeclared-symbol.patch |   39 -
 ...tting-the-nameserver-from-_res-state-afte.patch |   34 -
 ...-use-fputws_unlocked-S-F-instead-of-fputw.patch |   30 -
 ...48-Fix-a-problem-with-scanning-wide-chars.patch |   66 -
 ...agileness-in-dlopen-do_dlopen-wrapper-wor.patch |   66 -
 ...lopen-implementation-from-statically-link.patch |   60 -
 ...ce-fix-backtrace-for-statically-linked-ap.patch |  168 ---
 ...libubacktrace-fix-build-due-to-some-typos.patch |   39 -
 ...plicitly-include-uClibc_page.h-to-make-PA.patch |   30 -
 ...se-new-bits-scheme-for-arch-specific-flag.patch |  284 ----
 ...5-siginfo_h-add-a-missing-function-member.patch |   66 -
 ...-_NSIG-to-128-not-129.-This-matches-glibc.patch |   43 -
 ...EV_PAD_SIZE-takes-__WORDSIZE-into-account.patch |   70 -
 ...atus.h-correctly-interpret-status-0x007f-.patch |   54 -
 ...58-test-tls-fix-build-with-newer-binutils.patch |   37 -
 .../0.9.33.2/0059-test-cater-for-config.patch      |   81 --
 .../0.9.33.2/0060-test-Fix-math-c-dependency.patch |   30 -
 .../0.9.33.2/0061-fix-sparc-networking.patch       |   39 -
 ...ibdl-Also-include-dl-tls.h-for-for-SHARED.patch |   58 -
 ...nptl-remove-duplicate-vfork-in-libpthread.patch |  691 ----------
 ...erpc-update-ptrace.h-to-latest-from-glibc.patch |  134 --
 ...parc-update-ptrace.h-to-latest-from-glibc.patch |  151 ---
 ...clude-__iconv_codesets-into-iconv-utility.patch |   79 --
 .../0066-mips-rename-siginfo-_timer-members.patch  |  157 ---
 ...-guard-tcb-offsets.h-include-with-RESET_P.patch |   31 -
 ...t-implementations-conditional-compilation.patch |   58 -
 .../0069-Add-missing-C99-float-ld-wrappers.patch   |  870 -------------
 ...-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch |   89 --
 .../0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch  |   56 -
 package/uclibc/Config.in                           |   67 +-
 package/uclibc/uClibc-0.9.33.config                |  277 ----
 package/uclibc/uClibc-snapshot.config              |   41 -
 package/uclibc/uclibc.hash                         |    6 -
 package/uclibc/uclibc.mk                           |   17 +-
 package/vlc/Config.in                              |    8 +-
 78 files changed, 52 insertions(+), 8985 deletions(-)
 delete mode 100644 package/uclibc/0.9.33.2/0001-bits-time.h-sync-with-glibc-2.16.patch
 delete mode 100644 package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch
 delete mode 100644 package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
 delete mode 100644 package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
 delete mode 100644 package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
 delete mode 100644 package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch
 delete mode 100644 package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch
 delete mode 100644 package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch
 delete mode 100644 package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch
 delete mode 100644 package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch
 delete mode 100644 package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch
 delete mode 100644 package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch
 delete mode 100644 package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
 delete mode 100644 package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
 delete mode 100644 package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
 delete mode 100644 package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch
 delete mode 100644 package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch
 delete mode 100644 package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
 delete mode 100644 package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
 delete mode 100644 package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
 delete mode 100644 package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch
 delete mode 100644 package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
 delete mode 100644 package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
 delete mode 100644 package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
 delete mode 100644 package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch
 delete mode 100644 package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch
 delete mode 100644 package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
 delete mode 100644 package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch
 delete mode 100644 package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch
 delete mode 100644 package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch
 delete mode 100644 package/uclibc/0.9.33.2/0036-mount.h-update.patch
 delete mode 100644 package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
 delete mode 100644 package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch
 delete mode 100644 package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
 delete mode 100644 package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
 delete mode 100644 package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch
 delete mode 100644 package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch
 delete mode 100644 package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
 delete mode 100644 package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch
 delete mode 100644 package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch
 delete mode 100644 package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
 delete mode 100644 package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
 delete mode 100644 package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch
 delete mode 100644 package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
 delete mode 100644 package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch
 delete mode 100644 package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
 delete mode 100644 package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch
 delete mode 100644 package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
 delete mode 100644 package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch
 delete mode 100644 package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch
 delete mode 100644 package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
 delete mode 100644 package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
 delete mode 100644 package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
 delete mode 100644 package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch
 delete mode 100644 package/uclibc/0.9.33.2/0059-test-cater-for-config.patch
 delete mode 100644 package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch
 delete mode 100644 package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch
 delete mode 100644 package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
 delete mode 100644 package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch
 delete mode 100644 package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch
 delete mode 100644 package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch
 delete mode 100644 package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch
 delete mode 100644 package/uclibc/0.9.33.2/0066-mips-rename-siginfo-_timer-members.patch
 delete mode 100644 package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
 delete mode 100644 package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch
 delete mode 100644 package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch
 delete mode 100644 package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch
 delete mode 100644 package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
 delete mode 100644 package/uclibc/uClibc-0.9.33.config
 delete mode 100644 package/uclibc/uClibc-snapshot.config

-- 
2.6.4
