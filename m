From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 18:53:22 +0200
Subject: [Buildroot] [PATCH 00/20] Do not download auto-generated patches
Message-ID: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Patch https://patchwork.ozlabs.org/patch/782927/ sent by Julien
Boibessot made us realize that auto-generated patches such as the ones
provided by Github are not guaranteed to be stable over time. Indeed,
the "index" line of the patches contains short git hashes, and when
new commits are made to the Git repository, additional commits are
made, which can have short hashes conflicting with older ones, in
which case git increase the length of the "short hashes" to avoid the
conflict. This means the patch contents change, therefore its sha256
hash changes, and it breaks the download in Buildroot.

Since there is no solution to this problem, we simply decided that
auto-generated patches should not be downloaded by Buildroot using
<pkg>_PATCH, and should instead be stored in the tree.

This series:

 1. Updates the documentation about the hash file.

 2. Changes all packages that download Github.com patches. All
    packages that have a non-empty <pkg>_PATCH variable have been
    inspected, and only the ones downloading patches from Github are
    problematic.

Thomas

Thomas Petazzoni (20):
  docs/manual: update details about hashes
  efibootmgr: don't download patch from Github
  jack2: don't download patch from Github
  libstrophe: don't download patch from Github
  lxc: don't download patch from Github
  mediastreamer: don't download patch from Github
  numactl: don't download patches from Github
  openal: don't download patches from Github
  openssh: don't download patch from Github
  openzwave: don't download patch from Github
  poco: don't download patch from Github
  qt: don't download patch from Github
  rpm: don't download patches from Github
  scrub: don't download patch from Github
  sngrep: don't download patch from Github
  softether: don't download patch from Github
  systemd: don't download patches from Github
  tinycbor: on't download patch from Github
  trinity: don't download patches from Github
  wavpack: don't download patch from Github

 docs/manual/adding-packages-directory.txt          |   23 +-
 .../0001-dont-use-fshort-wchar-when-building.patch |   28 +
 ...bc.patch => 0002-Allow-build-with-uClibc.patch} |    0
 package/efibootmgr/efibootmgr.hash                 |    1 -
 package/efibootmgr/efibootmgr.mk                   |    3 -
 .../0001-Fix-initialization-in-test-iodelay.patch  |   65 +
 ...patch => 0002-Improve-check-for-ucontext.patch} |    0
 ...ce-support-depends-on-execinfo.h-existen.patch} |    0
 ...=> 0004-tests-define-__STDC_LIMIT_MACROS.patch} |    0
 package/jack2/jack2.hash                           |    1 -
 package/jack2/jack2.mk                             |    1 -
 .../libstrophe/0001-Namespace-SHA-functions.patch  |  189 ++
 ...nfable.patch => 0002-make-autoreconfable.patch} |    0
 package/libstrophe/libstrophe.hash                 |    1 -
 package/libstrophe/libstrophe.mk                   |    1 -
 .../lxc/0001-conf-fix-build-without-libcap.patch   |   31 +
 package/lxc/lxc.hash                               |    1 -
 package/lxc/lxc.mk                                 |    4 -
 ...ix-compilation-issue-with-latest-bctoobox.patch |   38 +
 package/mediastreamer/mediastreamer.hash           |    1 -
 package/mediastreamer/mediastreamer.mk             |    4 -
 ...-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch |   35 +
 ...-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch |   39 +
 package/numactl/numactl.hash                       |    2 -
 package/numactl/numactl.mk                         |    3 -
 .../0001-Build-NEON-code-with-mfpu-neon.patch      |   29 +
 ...heck-for-run-time-NEON-support-by-reading.patch |   67 +
 ...003-Properly-check-if-proc-cpuinfo-opened.patch |   24 +
 ...k-if-mfpu-neon-is-available-for-compiling.patch |   47 +
 ...tch => 0005-Fix-detection-of-C11-atomics.patch} |    0
 package/openal/openal.hash                         |    4 -
 package/openal/openal.mk                           |    5 -
 .../0001-configure-ac-detect-mips-abi.patch        |   44 +
 ...roperly-set-seccomp-audit-arch-for-mips64.patch |   63 +
 ...ch => 0003-fix-pam-uclibc-pthreads-clash.patch} |    0
 ...nclude.patch => 0004-fix-howmany-include.patch} |    0
 package/openssh/openssh.hash                       |    2 -
 package/openssh/openssh.mk                         |    6 +-
 .../openzwave/0001-Fix-compilation-of-MinOZW.patch |   37 +
 ...x-warning-on-wcsdup-implicit-declaration.patch} |    0
 ... 0003-Ensure-correct-git-repository-path.patch} |    0
 package/openzwave/openzwave.hash                   |    1 -
 package/openzwave/openzwave.mk                     |    6 -
 ...rsion-of-strerror_r-not-available-on-musl.patch |   33 +
 ...poco-add-the-staging-path-to-search-path.patch} |    0
 ...atch => 0003-fix-m68k-double-conv-detect.patch} |    0
 package/poco/poco.hash                             |    1 -
 package/poco/poco.mk                               |    1 -
 ...e-check-to-treat-alsalib-1.1.x-as-correct.patch |   29 +
 .../{0001-configure.patch => 0002-configure.patch} |    0
 ...system.patch => 0003-eglwsegl-use-system.patch} |    0
 ...-atomics.patch => 0004-fix-const-atomics.patch} |    0
 ...attr_np.patch => 0005-pthread_getattr_np.patch} |    0
 ...o-gui.patch => 0006-script-qtdbus-no-gui.patch} |    0
 ...-Add-initial-support-of-ARC-architecture.patch} |    0
 ... => 0008-Prevent-unaligned-access-on-ARC.patch} |    0
 ...on-constructor-error-for-legacy-c-compil.patch} |    0
 ...inclusion-order-when-building-statically.patch} |    0
 ...form-socklen_t-on-other-C-libraries-than.patch} |    0
 ...ith-ldl-option-only-when-it-is-supported.patch} |    0
 ...13-OpenGL-EGL-Avoid-X11-header-collision.patch} |    0
 package/qt/qt.hash                                 |    1 -
 package/qt/qt.mk                                   |    3 -
 ...ink-instead-of-compile-for-gcc-flags-test.patch |   33 +
 ...onfigure-ac-correct-stack-protector-check.patch |   45 +
 ...-to-enable-disable-sepdebugcrcfix-buildi.patch} |    0
 ...ugcrcfix.c-fix-build-with-recent-binutil.patch} |    0
 package/rpm/rpm.hash                               |    3 -
 package/rpm/rpm.mk                                 |    7 +-
 ...-sure-m4-macros-are-included-in-the-build.patch |   45 +
 package/scrub/scrub.hash                           |    1 -
 package/scrub/scrub.mk                             |    1 -
 ...001-autotools-fix-ncurses-wchar-detection.patch |  158 ++
 ...002-autotools-fix-ncurses-wchar-detection.patch |   45 +
 package/sngrep/sngrep.hash                         |    1 -
 package/sngrep/sngrep.mk                           |    4 -
 ...1-Create-autotools-plumbing-for-SoftEther.patch | 1879 ++++++++++++++++++++
 ...eate-libsoftether.so-and-dynamically-link.patch |  133 ++
 ...atch => 0003-use-fhs-install-directories.patch} |    0
 ...rking-softetherd-for-upstart-and-systemd.patch} |    0
 ...eDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch} |    0
 ...ross-compile.patch => 0006-cross-compile.patch} |    0
 .../{0005-iconv.patch => 0007-iconv.patch}         |    0
 .../{0006-librt.patch => 0008-librt.patch}         |    0
 ...onfig.patch => 0009-uclibc-ai-addrconfig.patch} |    0
 package/softether/softether.hash                   |    2 -
 package/softether/softether.mk                     |    3 -
 ...-of-null-pointer-p-question-dereferencing.patch |   28 +
 ...-resolved-simplify-alloc-size-calculation.patch |   51 +
 ...do-not-allocate-packets-with-minimum-size.patch |   48 +
 ...-getty-unit.patch => 0004-fix-getty-unit.patch} |    0
 ...atch => 0005-build-check-for-ln-relative.patch} |    0
 ...h => 0006-fix-am-path-libgcrypt-no-found.patch} |    0
 package/systemd/systemd.hash                       |    3 -
 package/systemd/systemd.mk                         |    5 -
 .../0001-Fix-static-compilation-of-json2cbor.patch |   28 +
 package/tinycbor/tinycbor.hash                     |    1 -
 package/tinycbor/tinycbor.mk                       |    4 -
 ...rspace-headers-for-ax25-instead-of-kernel.patch |   26 +
 ...002-fix-build-when_USE_BPF-is-not-defined.patch |   72 +
 .../0003-Check-for-bpf-attr-map-flags.patch        |   60 +
 ...4-get_syscall_entry-remove-SYSCALL_OFFSET.patch |   44 +
 ...x-cross-compile-detection-of-broken-ipv6.patch} |    0
 package/trinity/trinity.hash                       |    4 -
 package/trinity/trinity.mk                         |    5 -
 ...-19-new-dependency-on-wchar-t-by-removing.patch |   70 +
 package/wavpack/wavpack.hash                       |    1 -
 package/wavpack/wavpack.mk                         |    3 -
 108 files changed, 3583 insertions(+), 104 deletions(-)
 create mode 100644 package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
 rename package/efibootmgr/{0001-Allow-build-with-uClibc.patch => 0002-Allow-build-with-uClibc.patch} (100%)
 create mode 100644 package/jack2/0001-Fix-initialization-in-test-iodelay.patch
 rename package/jack2/{0001-Improve-check-for-ucontext.patch => 0002-Improve-check-for-ucontext.patch} (100%)
 rename package/jack2/{0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch => 0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch} (100%)
 rename package/jack2/{0003-tests-define-__STDC_LIMIT_MACROS.patch => 0004-tests-define-__STDC_LIMIT_MACROS.patch} (100%)
 create mode 100644 package/libstrophe/0001-Namespace-SHA-functions.patch
 rename package/libstrophe/{0001-make-autoreconfable.patch => 0002-make-autoreconfable.patch} (100%)
 create mode 100644 package/lxc/0001-conf-fix-build-without-libcap.patch
 create mode 100644 package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
 create mode 100644 package/numactl/0001-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch
 create mode 100644 package/numactl/0002-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch
 create mode 100644 package/openal/0001-Build-NEON-code-with-mfpu-neon.patch
 create mode 100644 package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch
 create mode 100644 package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch
 create mode 100644 package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch
 rename package/openal/{0001-Fix-detection-of-C11-atomics.patch => 0005-Fix-detection-of-C11-atomics.patch} (100%)
 create mode 100644 package/openssh/0001-configure-ac-detect-mips-abi.patch
 create mode 100644 package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
 rename package/openssh/{0001-fix-pam-uclibc-pthreads-clash.patch => 0003-fix-pam-uclibc-pthreads-clash.patch} (100%)
 rename package/openssh/{0002-fix-howmany-include.patch => 0004-fix-howmany-include.patch} (100%)
 create mode 100644 package/openzwave/0001-Fix-compilation-of-MinOZW.patch
 rename package/openzwave/{0001-Fix-warning-on-wcsdup-implicit-declaration.patch => 0002-Fix-warning-on-wcsdup-implicit-declaration.patch} (100%)
 rename package/openzwave/{0002-Ensure-correct-git-repository-path.patch => 0003-Ensure-correct-git-repository-path.patch} (100%)
 create mode 100644 package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch
 rename package/poco/{0001-poco-add-the-staging-path-to-search-path.patch => 0002-poco-add-the-staging-path-to-search-path.patch} (100%)
 rename package/poco/{0002-fix-m68k-double-conv-detect.patch => 0003-fix-m68k-double-conv-detect.patch} (100%)
 create mode 100644 package/qt/0001-alsatest-fix-the-check-to-treat-alsalib-1.1.x-as-correct.patch
 rename package/qt/{0001-configure.patch => 0002-configure.patch} (100%)
 rename package/qt/{0002-eglwsegl-use-system.patch => 0003-eglwsegl-use-system.patch} (100%)
 rename package/qt/{0003-fix-const-atomics.patch => 0004-fix-const-atomics.patch} (100%)
 rename package/qt/{0004-pthread_getattr_np.patch => 0005-pthread_getattr_np.patch} (100%)
 rename package/qt/{0005-script-qtdbus-no-gui.patch => 0006-script-qtdbus-no-gui.patch} (100%)
 rename package/qt/{0006-Add-initial-support-of-ARC-architecture.patch => 0007-Add-initial-support-of-ARC-architecture.patch} (100%)
 rename package/qt/{0007-Prevent-unaligned-access-on-ARC.patch => 0008-Prevent-unaligned-access-on-ARC.patch} (100%)
 rename package/qt/{0008-Fix-conversion-constructor-error-for-legacy-c-compil.patch => 0009-Fix-conversion-constructor-error-for-legacy-c-compil.patch} (100%)
 rename package/qt/{0009-Fix-library-inclusion-order-when-building-statically.patch => 0010-Fix-library-inclusion-order-when-building-statically.patch} (100%)
 rename package/qt/{0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch => 0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch} (100%)
 rename package/qt/{0011-Link-with-ldl-option-only-when-it-is-supported.patch => 0012-Link-with-ldl-option-only-when-it-is-supported.patch} (100%)
 rename package/qt/{0012-OpenGL-EGL-Avoid-X11-header-collision.patch => 0013-OpenGL-EGL-Avoid-X11-header-collision.patch} (100%)
 create mode 100644 package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
 create mode 100644 package/rpm/0002-configure-ac-correct-stack-protector-check.patch
 rename package/rpm/{0001-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch => 0003-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch} (100%)
 rename package/rpm/{0002-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch => 0004-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch} (100%)
 create mode 100644 package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch
 create mode 100644 package/sngrep/0001-autotools-fix-ncurses-wchar-detection.patch
 create mode 100644 package/sngrep/0002-autotools-fix-ncurses-wchar-detection.patch
 create mode 100644 package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
 create mode 100644 package/softether/0002-Create-libsoftether.so-and-dynamically-link.patch
 rename package/softether/{0001-use-fhs-install-directories.patch => 0003-use-fhs-install-directories.patch} (100%)
 rename package/softether/{0002-create-non-forking-softetherd-for-upstart-and-systemd.patch => 0004-create-non-forking-softetherd-for-upstart-and-systemd.patch} (100%)
 rename package/softether/{0003-change-GetExeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch => 0005-change-GetExeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch} (100%)
 rename package/softether/{0004-cross-compile.patch => 0006-cross-compile.patch} (100%)
 rename package/softether/{0005-iconv.patch => 0007-iconv.patch} (100%)
 rename package/softether/{0006-librt.patch => 0008-librt.patch} (100%)
 rename package/softether/{0007-uclibc-ai-addrconfig.patch => 0009-uclibc-ai-addrconfig.patch} (100%)
 create mode 100644 package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
 create mode 100644 package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
 create mode 100644 package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
 rename package/systemd/{0001-fix-getty-unit.patch => 0004-fix-getty-unit.patch} (100%)
 rename package/systemd/{0002-build-check-for-ln-relative.patch => 0005-build-check-for-ln-relative.patch} (100%)
 rename package/systemd/{0003-fix-am-path-libgcrypt-no-found.patch => 0006-fix-am-path-libgcrypt-no-found.patch} (100%)
 create mode 100644 package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch
 create mode 100644 package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
 create mode 100644 package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
 create mode 100644 package/trinity/0003-Check-for-bpf-attr-map-flags.patch
 create mode 100644 package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
 rename package/trinity/{0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch => 0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch} (100%)
 create mode 100644 package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch

-- 
2.9.4
