From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 May 2021 18:44:13 +0200
Subject: [Buildroot] [git commit] package/rocksdb: bump to version 6.20.3
Message-ID: <20210518162036.06646814CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b84acf3f1d91aaa6f280bbb62cce04cb661ef0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh first patch
- Add BR2_PACKAGE_ROCKSDB_ARCH_SUPPORTS due to toku_time.h which has
  been added in version 6.16.3 by
  https://github.com/facebook/rocksdb/commit/98236fb10ecdbe6e7e8ef5cfb11e1f11dcb72f84
  and contains the following blob:

 #if defined(__x86_64__) || defined(__i386__)
  uint32_t lo, hi;
  __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
  return (uint64_t)hi << 32 | lo;
 #elif defined(__aarch64__)
  uint64_t result;
  __asm __volatile__("mrs %[rt], cntvct_el0" : [ rt ] "=r"(result));
  return result;
 #elif defined(__powerpc__)
  return __ppc_get_timebase();
 #else
 #error No timer implementation for this platform
 #endif

- Also drop second patch and disable build on powerpc as it seems that
  upstream is not really testing powerpc (patch not merged after more
  than one year + build failure with uclibc/musl only fixed on ppc64:
  https://github.com/facebook/rocksdb/commit/24b7ebee80ab282e073fd541d5b807d4a0bbbfab)

- Update hash of README.md (change not related to license:
  https://github.com/facebook/rocksdb/commit/f4ade82ad29790b1e0d99188e0b26e5b805c7243)

As a side effect, this will remove the autobuilder failures on arm,
powerpc and m68k

https://github.com/facebook/rocksdb/blob/v6.20.3/HISTORY.md

Fixes:
 - http://autobuild.buildroot.org/results/059ebe270e6e7c23e40060c4cf0112c4cd72b0e7
 - http://autobuild.buildroot.org/results/f007412f29ab2e03a6904e2f548e77654abde6de
 - http://autobuild.buildroot.org/results/83505f78fcb4d925779177411d830bea127b6800

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...d_tools-build_detect_platform-fix-C-tests.patch |   96 +-
 ...8-compatiblity-fix-CRC32-C-implementation.patch | 3787 --------------------
 package/rocksdb/Config.in                          |   10 +
 package/rocksdb/rocksdb.hash                       |    4 +-
 package/rocksdb/rocksdb.mk                         |    2 +-
 5 files changed, 61 insertions(+), 3838 deletions(-)

Patch is too large, so refusing to show it
