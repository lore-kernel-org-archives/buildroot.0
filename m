From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:45 +0300
Subject: [Buildroot] [PATCH 00/14] toolchain-external: remove support for
	glibc before 2.17
Message-ID: <cover.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed[1] recently on the list it is time to remove support for glibc 
older than 2.17. This does not mean that toolchains with old glibc will stop 
working. It only means that we stop fixing older glibc build issues. In 
particular, the need to link with librt for clock_* system calls.

The only significant user visible change in this series is the removal of 
CodeSourcery toolchains for x86 and sh.

Two patches update a comment section and the manual to take into account the 
removal of toolchain in this series and in previous commits. A few more 
per-package patches remove local patches for the glibc librt issue.

The first patch is an unrelated fix to the external toolchain section in the 
manual.

[1] http://patchwork.ozlabs.org/patch/773384/

Baruch Siach (14):
  docs/manual: update external toolchain advantages list
  toolchain: remove CodeSourcery x86 toolchain
  toolchain: remove CodeSourcery sh toolchain
  package: remove CodeSourcery sh dependencies
  toolchain-external: update list of toolchains
  docs/manual: drop mention of removed external toolchains
  swupdate: don't link with librt
  aiccu: don't link with librt
  libv4l: don't link with librt
  e2fsprogs: don't link with librt
  liboping: no need to check for clock_gettime
  openipmi: no need to check for clock_gettime
  lirc-tools: no need to check for clock_gettime
  softether: no need to check for clock_gettime

 Config.in.legacy                                   | 18 +++++++
 docs/manual/configure.txt                          | 16 +++---
 package/aiccu/0003-clock-suite-functions-fix.patch | 18 -------
 ...her-header.patch => 0003-if-ether-header.patch} |  0
 package/domoticz/Config.in                         |  3 --
 .../0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch | 35 -------------
 ...001-configure-also-check-for-clockgettime.patch | 39 ---------------
 package/liboping/liboping.mk                       |  2 -
 ...3-utils-qv4l2-Makefile.am-link-with-librt.patch | 29 -----------
 package/libv4l/libv4l.mk                           |  3 +-
 package/liquid-dsp/Config.in                       |  1 -
 ...onfigure-check-for-clock_gettime-in-librt.patch | 54 --------------------
 ...-use-of-functions-killed-in-kernel-4.8.0.patch} |  0
 package/lirc-tools/lirc-tools.mk                   |  2 -
 ...c-detect-lrt-requirement-for-clock_gettim.patch | 57 ----------------------
 package/prboom/Config.in                           |  2 -
 package/qt/Config.in                               |  7 +--
 package/softether/0006-librt.patch                 | 33 -------------
 ...onfig.patch => 0006-uclibc-ai-addrconfig.patch} |  0
 package/swupdate/swupdate.config                   |  2 +-
 toolchain/toolchain-external/Config.in             | 12 +----
 .../toolchain-external/pkg-toolchain-external.mk   |  3 +-
 .../toolchain-external-codesourcery-sh/Config.in   | 25 ----------
 .../Config.in.options                              |  9 ----
 .../toolchain-external-codesourcery-sh.hash        |  3 --
 .../toolchain-external-codesourcery-sh.mk          | 13 -----
 .../toolchain-external-codesourcery-x86/Config.in  | 29 -----------
 .../Config.in.options                              |  9 ----
 .../toolchain-external-codesourcery-x86.hash       |  3 --
 .../toolchain-external-codesourcery-x86.mk         | 12 -----
 30 files changed, 31 insertions(+), 408 deletions(-)
 delete mode 100644 package/aiccu/0003-clock-suite-functions-fix.patch
 rename package/aiccu/{0004-if-ether-header.patch => 0003-if-ether-header.patch} (100%)
 delete mode 100644 package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch
 delete mode 100644 package/liboping/0001-configure-also-check-for-clockgettime.patch
 delete mode 100644 package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch
 delete mode 100644 package/lirc-tools/0002-configure-check-for-clock_gettime-in-librt.patch
 rename package/lirc-tools/{0003-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch => 0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch} (100%)
 delete mode 100644 package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch
 delete mode 100644 package/softether/0006-librt.patch
 rename package/softether/{0007-uclibc-ai-addrconfig.patch => 0006-uclibc-ai-addrconfig.patch} (100%)
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk

-- 
2.11.0
