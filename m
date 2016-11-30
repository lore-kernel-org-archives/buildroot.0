From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:06 +0100
Subject: [Buildroot] [PATCH 0/8] arch/arm: allow selecting AArch64 cores
Message-ID: <cover.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, originally written by Thomas, allows selecting a specific
AArch64 core anong the few currently existing cores. It also allows
selecting those cores in 32-bit mode.

The series now handles arm (aka AArch32) and AArch64 as a single
architecture, not unlike what we do for the i386 and x86-64.

We so far had no way to optimise for a specific AArch64 core, and would
just let gcc decide based on its default settings. Having a selection,
like we have for all architectures, allows to optimise the generated
code for the actual core on the target.

Furthermore, AArch64 cores are totally capable of running 32-bit code,
in 32-bit mode, like x86_64 cores do in 32-bit mode.

Then, we also allow to select the floating point strategy for those
cores. Unlike 32-bit cores, all current AArch64 core have a VFP unit
with NEON extensions; yet, we still allow selecting soft-float (e.g.
when in 32-bit mode, to keep compatibility with soft-float binary
blobs).

Finally, we add an entry for each of the three currently existing
AArch64 cores, Cortex-A53, A57 and A72.


Regards,
Yann E. MORIN.


The following changes since commit 0689e77eecb88dc204688e9db670d56e4366f83f

  uclibc: disable posix_madvise for noMMU (2016-11-30 16:14:47 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 7cdaae6e62c3a98dceecd5b195ef16f425621cee

  arch/Config.in.arm: add Cortex-A57 and Cortex-A72 (2016-11-30 18:57:14 +0100)


----------------------------------------------------------------
Matt Flax (1):
      arch/Config.in.arm: Add Cortex-A53 CPU

Thomas Petazzoni (6):
      arch: merge Config.in.aarch64 into Config.in.arm
      arch/Config.in.arm: prepare addition of 64 bits cores
      arch/Config.in.arm: add BR2_ARM_CPU_ARMV8
      arch/Config.in.arm: add FPU related options for ARMv8 cores
      arch/Config.in.arm: specify ABI for ARM64
      arch/Config.in.arm: add Cortex-A57 and Cortex-A72

Yann E. MORIN (1):
      arch/arm: drop legacy dependency for floating point strategy

 arch/Config.in         |  6 +---
 arch/Config.in.aarch64 |  7 ----
 arch/Config.in.arm     | 93 ++++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 87 insertions(+), 19 deletions(-)
 delete mode 100644 arch/Config.in.aarch64

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
