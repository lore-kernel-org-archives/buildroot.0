From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 23:50:17 +0200
Subject: [Buildroot] [PATCH 0/9 v2] musl: add compatibility cdefs.h header
	(branch yem/cdefs)
Message-ID: <cover.1471556612.git.yann.morin.1998@free.fr>
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
be used in more and more packages as time passed, so that, decades
later,
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


As a bonus, and certainly *not* for master, the last patch in the series
adds a paranoid-like check for the use of cdefs,h, so that we can catch
it. It defaults to not checking, so as to minimise the impact it would
have on picky packages. See the commit f orthat patch for more in depth
explanations.


Changes v1 -> v2:
  - only use extra downloads, in case we need to add more files in the
    future  (Arnout)
  - add headers a license files  (Arnout)
  - some typoes, as usual  (Arnout)
  - add more macros (__THROW and __NTH()) as they are quite often used
    even if we currently patch them out
  - fix the rpcbind patch as accepted upstream


Regards,
Yann E. MORIN.


The following changes since commit 0d68771e5493442443db3956b85ec0083f5facf4

  libconfuse: add optional dependency on gettext (2016-08-18 23:30:50 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to 730ac6e801be3f22ed86d9c9b3752106cb990bf5

  build/advanced: add option to check for use of cdefs.h (2016-08-18 23:42:11 +0200)


----------------------------------------------------------------
Yann E. MORIN (9):
      package/musl-compat-headers: provide compatibility headers not in musl
      package/rpcbind: fix musl build
      package/aircrack-ng: drop a musl-compatibility patch
      package/android-tools: drop musl-compatibility cdefs patching out
      package/bcusdk: drop a musl-compatibility patch
      package/libsepol: drop a musl-compatibility patch
      package/linknx: drop a musl-compatibility patch
      package/qlibc: drop a musl-compatibility patch
      build/advanced: add option to check for use of cdefs.h

 Config.in                                          |   52 +
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
 package/musl-compat-headers/cdefs.h.in             |   92 ++
 .../musl-compat-headers.hash}                      |    0
 package/musl-compat-headers/musl-compat-headers.mk |   40 +
 package/musl/Config.in                             |    3 +-
 package/musl/musl.mk                               |   10 +-
 package/netbsd-queue/Config.in                     |    2 -
 package/netbsd-queue/netbsd-queue.mk               |   24 -
 ...l-build-by-removing-usage-of-internal-gli.patch |   59 --
 .../0003-src-remove-use-of-the-__P-macro.patch     |  243 +++++
 toolchain/cdefs.h.in                               |    8 +
 toolchain/toolchain-external/Config.in             |    3 +-
 toolchain/toolchain-external/toolchain-external.mk |   10 +-
 toolchain/toolchain.mk                             |   30 +
 24 files changed, 527 insertions(+), 1487 deletions(-)
 delete mode 100644 package/aircrack-ng/0004-fix-musl-build.patch
 rename package/android-tools/{0005-fix-big-endian-build.patch => 0006-fix-big-endian-build.patch} (100%)
 create mode 100644 package/android-tools/0007-include-cdefs-h-when-needed.patch
 delete mode 100644 package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
 rename package/bcusdk/{0002-fd_set-requires-inclusion-of-sys-select.h.patch => 0001-fd_set-requires-inclusion-of-sys-select.h.patch} (100%)
 delete mode 100644 package/libsepol/0005-replace-cdefs.patch
 delete mode 100644 package/linknx/0002-musl-cdefs.patch
 create mode 100644 package/musl-compat-headers/Config.in
 create mode 100644 package/musl-compat-headers/cdefs.h.in
 rename package/{netbsd-queue/netbsd-queue.hash => musl-compat-headers/musl-compat-headers.hash} (100%)
 create mode 100644 package/musl-compat-headers/musl-compat-headers.mk
 delete mode 100644 package/netbsd-queue/Config.in
 delete mode 100644 package/netbsd-queue/netbsd-queue.mk
 delete mode 100644 package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
 create mode 100644 package/rpcbind/0003-src-remove-use-of-the-__P-macro.patch
 create mode 100644 toolchain/cdefs.h.in

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
