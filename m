From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:53:48 +0200
Subject: [Buildroot] [PATCH 0/3] arch: fix MIPS NaN and floating-point
	handling
In-Reply-To: <cover.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <cover.1504432422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Not all architectures we support have support in upstream gcc, glibc,
binutils, and/or linux. In some cases, only a few specific cores do not
have that support.

Furthermore, some architecture, specific cores, or core behaviour/setup
(like the MIPS NaN support) got support in a specific gcc version.

Currently, we have to account for this in at least four locations:
  - the architecture
  - the toolchain backend choice (internal or externsal)
  - the gcc version choice
  - each external toolchain

This third series fixes the way we handle NaN and floating point in the
MIPS case.

Currently, they both depend on the gcc version. However, this is
opposite what we usually do in Buildroot: we let the user select their
hardware settings, and then limit the software list according to that
which suports the user's hardware.

So, now that we have a mean for architectures to specify the minimum gcc
version they require, we use that to limit the gcc version depending on
the NaN and FP settings the user did set.

And this concludes this three-series series (a meta-series, made up of
three series. It's series all the way down! Muahaha! ;-) )


Regards,
Yann E. MORIN.


The following changes since commit 41eeac74f986790fe26f03ebf05322120d2c04da

  package/gcc: slight cleanup and reorg in remaining arch depends (2017-09-03 11:14:53 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to a191b26508b5cddafe1059f13fcd2aa4b2ebd689

  toolchain/buildroot: glibc requires header >= 4.5 with NaN-2008 (2017-09-03 11:49:02 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      arch/mips: inverse the NaN logic
      arch/mips: inverse the mfpxx logic
      toolchain/buildroot: glibc requires header >= 4.5 with NaN-2008

 arch/Config.in.mips                     | 6 +++---
 package/gcc/gcc.mk                      | 2 ++
 toolchain/toolchain-buildroot/Config.in | 1 +
 toolchain/toolchain-common.in           | 4 ----
 4 files changed, 6 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
