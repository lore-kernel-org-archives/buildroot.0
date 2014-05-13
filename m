From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 17:33:15 -0700
Subject: [Buildroot] [PATCH v3 0/8] powerpc: powerpc64 and powerpc64le
	support
Message-ID: <1399941203-8282-1-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables powerpc64 and powerpc64le, adds support for some new cpus, and
cleans up some of the powerpc dependency cruft.

The one thing that dependencies aren't added to prevent:

Only linux kernel-3.12 and later support building for powerpc64le, but any of
the linux headers choices in buildroot work as headers.

--

since v2:
 - split out patches
 - prevent using too old glibc/binutils/gcc/gdb (2.19/2.24/4.8.2/7.7.1 are the earliest
   working versions, respectively)
 - remove BR2_POWERPC
 - add an extra '\n'
 - remove some powerpc dep cruft that wasn't needed

since v1:
 - remove altivec from generic + 64bit (power4 & 5 break that)
 - filter ppc64le first.
 - SPE config is a bool.


Cody P Schafer (8):
  package/gdb: add gdb 7.7.x (7.7.1) and 7.6.x (7.6.2)
  package/binutils: add depends for powerpc64le (only 2.24 works)
  powerpc: add BR2_POWERPC_CPU_HAS_SPE to replace adhoc deps/checks
  powerpc: add BR2_POWERPC_CPU_HAS_ALTIVEC to replace adhoc deps/checks
  powerpc: mark 32-bit only powerpc cpus to prep for adding powerpc64
    support
  powerpc: add power{4,5,6,7,8} cpus
  powerpc: remove unneeded dependencies
  powerpc: add powerpc64 and powerpc64le support

 Makefile                                    |  3 +-
 arch/Config.in                              | 21 ++++++++-
 arch/Config.in.powerpc                      | 71 ++++++++++++++++++++++++++---
 linux/Config.in                             |  3 +-
 package/Makefile.in                         |  2 +-
 package/binutils/Config.in.host             | 14 +++---
 package/efl/libevas/libevas.mk              |  2 +-
 package/ffmpeg/ffmpeg.mk                    |  5 +-
 package/gcc/Config.in.host                  | 10 ++--
 package/gdb/Config.in.host                  | 17 +++++--
 package/glibc/Config.in                     |  8 ++--
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  |  5 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk |  5 +-
 package/libatomic_ops/Config.in             |  2 +-
 package/mpg123/mpg123.mk                    |  4 +-
 package/openssl/openssl.mk                  |  6 +++
 package/systemd/Config.in                   |  3 +-
 package/vlc/vlc.mk                          |  3 +-
 toolchain/toolchain-buildroot/Config.in     |  5 +-
 19 files changed, 138 insertions(+), 51 deletions(-)

-- 
1.9.3
