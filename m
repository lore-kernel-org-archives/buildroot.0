From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Aug 2016 22:49:58 +0200
Subject: [Buildroot] [PATCH 0/8] musl: add compatibility cdefs.h header
	(branch yem/cdefs)
Message-ID: <cover.1471033837.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an ateempt at quiescing, once and for all, all the build
failures under musl, due to missing non-standard header cdefs.h.

sys/cdefs.h is a non-standrad header, originating from glibc. Its goal
is two fold:

  - first, it hides away legacy compiler specifities by providing macros
    to declare prototypes and so on; this is *really* legacy, and
    targets pre-ANSI compilers (that is, I was already born, but had no
    idea what ANSI was, nor what a compiler was, for that matters);

  - second, it provides macros to begin and end C declarations in
    headers that can be included from C++ code. This is so trivial that
    the need for a macro is not even obvious to begin with.

Of course, this header is totally non-standard, and the macros it
defines are definitely non-standard as well. However, it has started to
be used in more and more packages as time passed, so that, decades later,
its use is so widespread that eradicating it is an impossible task.

But then enters musl, a strict standard-compliant C library, with as few
non-standard externsions as possible (if at all?). musl does not provide
a sys/cdefs.h headers, so a lot of code breaks with musl.

To make matters more intractable, sys/cdefs.h is included from inside
many other headers from glibc, making its macros available to a wide
audience without realizing they need a non-standard header.

Fixing all those bodies of code is nigh impossible, so instead we
provide a strictly-minimal sys/cdefs.h, that defines only the three
strictly-required macros:

  - __P() to declare function prototypes;
  - __BEGIN_DECLS and __END_DECLS to enclose C declarations.

When (if!) more are needed, they can be added later.

The basic idea was suggested by Thomas P. on IRC. Thanks! :-)

This then allows us to drop quite a few patches that were removing use
of cdefs.h. However, including sys/cdefs.h has been added to two
packages that were relying on other glibc headers to include it.

Regards,
Yann E. MORIN.


The following changes since commit f0e1381ef91ac85ad4fc9ab3db30057279ffe7c5

  toolchain: Bump ARC tools to arc-2016.09-eng008 (2016-08-11 15:07:06 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d4d54fc8edf86a9c69e7f1593004e698a4614bbb

  package/qlibc: drop a musl-compatibility patch (2016-08-12 22:28:57 +0200)


----------------------------------------------------------------
Yann E. MORIN (8):
      package/netbsd-compat-headers: provide compatibility headers not in musl
      package/rpcbind: include cdefs.h where needed
      package/aircrack-ng: drop a musl-compatibility patch
      package/android-tools: drop musl-compatibility cdefs patching out
      package/bcusdk: drop a musl-compatibility patch
      package/libsepol: drop a musl-compatibility patch
      package/linknx: drop a musl-compatibility patch
      package/qlibc: drop a musl-compatibility patch

 package/Config.in                                  |    2 +-
 package/aircrack-ng/0004-fix-musl-build.patch      |   53 -
 .../0004-Fix-build-issue-with-musl.patch           |  181 +---
 ...build.patch => 0006-fix-big-endian-build.patch} |    0
 .../0007-include-cdefs-h-when-needed.patch         |   41 +
 ...t-use-the-non-standard-sys-cdefs.h-header.patch |   48 -
 ...d_set-requires-inclusion-of-sys-select.h.patch} |    0
 package/libsepol/0005-replace-cdefs.patch          | 1074 --------------------
 package/linknx/0002-musl-cdefs.patch               |   37 -
 package/musl-compat-headers/Config.in              |    2 +
 package/musl-compat-headers/cdefs.h                |   40 +
 .../musl-compat-headers.hash}                      |    0
 package/musl-compat-headers/musl-compat-headers.mk |   29 +
 package/musl/Config.in                             |    3 +-
 package/musl/musl.mk                               |   10 +-
 package/netbsd-queue/Config.in                     |    2 -
 package/netbsd-queue/netbsd-queue.mk               |   24 -
 ...l-build-by-removing-usage-of-internal-gli.patch |   59 --
 ...003-src-include-cdefs.h-for-the-__P-macro.patch |  126 +++
 toolchain/toolchain-external/Config.in             |    3 +-
 toolchain/toolchain-external/toolchain-external.mk |   10 +-
 21 files changed, 257 insertions(+), 1487 deletions(-)
 delete mode 100644 package/aircrack-ng/0004-fix-musl-build.patch
 rename package/android-tools/{0005-fix-big-endian-build.patch => 0006-fix-big-endian-build.patch} (100%)
 create mode 100644 package/android-tools/0007-include-cdefs-h-when-needed.patch
 delete mode 100644 package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
 rename package/bcusdk/{0002-fd_set-requires-inclusion-of-sys-select.h.patch => 0001-fd_set-requires-inclusion-of-sys-select.h.patch} (100%)
 delete mode 100644 package/libsepol/0005-replace-cdefs.patch
 delete mode 100644 package/linknx/0002-musl-cdefs.patch
 create mode 100644 package/musl-compat-headers/Config.in
 create mode 100644 package/musl-compat-headers/cdefs.h
 rename package/{netbsd-queue/netbsd-queue.hash => musl-compat-headers/musl-compat-headers.hash} (100%)
 create mode 100644 package/musl-compat-headers/musl-compat-headers.mk
 delete mode 100644 package/netbsd-queue/Config.in
 delete mode 100644 package/netbsd-queue/netbsd-queue.mk
 delete mode 100644 package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
 create mode 100644 package/rpcbind/0003-src-include-cdefs.h-for-the-__P-macro.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
