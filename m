From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:58 +0200
Subject: [Buildroot] [PATCH 0/24 v5] arch: move atomics to arch,
	not toolchain (branch yem/atomics)
Message-ID: <cover.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a follow-up to, and includes Anton's series, to introduce
awareness of atomic operations, so pacjages can be hidden-away on
architectures that do not provide atomic operations.

We've discussed this with Thomas on IRC and on the list, and although
this comes late in the cycle, we both consider this to be materials for
the *current* release.

I tried to cover all bases here, but there are architectures I have
close-to-zero knowledge of, so please speak up if you disagree on my
proposal.

The series is split in thre parts:

  - patches 1..7 renames the option, and moves it out of toolchain and
    to an architecture option, and add the option to the manual;

  - patches 8..11 hides more packages due to their requiring atomics

  - patches 12..24 convert all our architectures to selectively declare
    their (non-)support for atomic ops, to finally get rid of the
    generic default value.


Changes v4 -> v5:
  - enhance the manual  (Thomas DS)
  - misc typoes  (Thomas DS)

Changes v3 -> v4:
  - rename the option into an architecture option  (Yann)


Regards,
Yann E. MORIN.


The following changes since commit 4e116bf3696234347a2628cda78b976ac70ba6da:

  postgresql: remove devfiles from target (2014-08-17 21:16:34 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/atomics

for you to fetch changes up to a2b1d4aad5e0611dce67c2bfed7cb724d0b6843a:

  arch: remove no-longer default on atomics option (2014-08-17 21:24:30 +0200)

----------------------------------------------------------------
Anton Kolesov (5):
      manual: document dependencies on atomic operations
      cairo: add dependency on atomic operations
      pulseaudio: add dependency on atomic operations
      libftdi: add dependency on atomic operations
      msgpack: add dependency on atomic operations

Yann E. MORIN (19):
      arch: add an option to specify if the arch has atomic ops
      package/icu: use the new ARCH_HAS_ATOMICS as dependency
      package/libtorrent: use the new ARCH_HAS_ATOMICS as dependency
      package/jack2: use the new ARCH_HAS_ATOMICS as dependency
      package/thrift: use the new ARCH_HAS_ATOMICS as dependency
      toolchain: drop the now-unused old BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
      arch/arm: always has atomic ops
      arch/avr32: always has atomic ops
      arch/bfin: always has atomic ops
      arch/m68k: always has atomic ops
      arch/microblaze: always has atomic ops
      arch/mips: always has atomic ops
      arch/nios2: always has atomic ops
      arch/powerpc: always has atomic ops
      arch/sh: always has atomic ops
      arch/sparc: always has atomic ops
      arch/x86: all x86 but i386 has atomics operations
      arch/xtensa: always has atomic ops
      arch: remove no-longer default on atomics option

 arch/Config.in                                 |  4 ++++
 arch/Config.in.aarch64                         |  3 +++
 arch/Config.in.arc                             |  2 +-
 arch/Config.in.arm                             |  3 +++
 arch/Config.in.avr32                           |  3 +++
 arch/Config.in.bfin                            |  3 +++
 arch/Config.in.m68k                            |  3 +++
 arch/Config.in.microblaze                      |  3 +++
 arch/Config.in.mips                            |  3 +++
 arch/Config.in.nios2                           |  3 +++
 arch/Config.in.powerpc                         |  3 +++
 arch/Config.in.sh                              |  3 +++
 arch/Config.in.sparc                           |  3 +++
 arch/Config.in.x86                             |  3 +++
 arch/Config.in.xtensa                          |  3 +++
 docs/manual/adding-packages-directory.txt      |  5 +++++
 package/beecrypt/Config.in                     | 12 ++++++------
 package/cairo/Config.in                        |  1 +
 package/cppcms/Config.in                       |  7 ++++---
 package/efl/libevas-generic-loaders/Config.in  |  2 ++
 package/gstreamer/gst-plugins-good/Config.in   |  7 +++++++
 package/gstreamer1/gst1-plugins-good/Config.in |  7 +++++++
 package/icu/Config.in                          |  7 ++++---
 package/jack2/Config.in                        |  7 ++++---
 package/libftdi/Config.in                      |  2 ++
 package/libgtk2/Config.in                      |  2 ++
 package/librsvg/Config.in                      |  2 ++
 package/libsvg-cairo/Config.in                 |  1 +
 package/libtorrent/Config.in                   |  8 ++++----
 package/mpd/Config.in                          |  2 ++
 package/msgpack/Config.in                      |  4 ++--
 package/openocd/Config.in                      |  1 +
 package/pango/Config.in                        |  2 ++
 package/php/Config.ext                         |  8 ++++----
 package/pulseaudio/Config.in                   |  2 ++
 package/python-msgpack/Config.in               |  4 ++--
 package/qt5/qt5base/Config.in                  |  5 +----
 package/rtorrent/Config.in                     |  8 ++++----
 package/thrift/Config.in                       |  8 ++++----
 package/webkit/Config.in                       |  2 ++
 package/weston/Config.in                       |  2 ++
 toolchain/toolchain-common.in                  |  4 ----
 42 files changed, 123 insertions(+), 44 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
