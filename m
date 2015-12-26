From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2015 17:05:42 +0100
Subject: [Buildroot] [PATCH 0/5 v2] arch/arm: properly handle ARM processors
	with optional VFP units (branch yem/arm-vfp-2)
Message-ID: <cover.1451145472.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Certain ARM SoCs are not guaranteed to have a VFP. For example, on
Cortex-A9, the availability of a VFP is optional. Such ARM processors
select one of the BR2_ARM_CPU_MAYBE_HAS_VFPVx options to indicate the
potential availability of such FPUs.

Then, Config.in.arm provides a "choice" that allows to select which
floating point strategy to use. VFPv3 is provided as a possible
strategy when either the VFPv3 is guaranteed to be available
(BR2_ARM_CPU_HAS_VFPV3) or when it *might* be available
(BR2_ARM_CPU_MAYBE_HAS_VFPV3).

The problem is that once a given floating point strategy has been
selected, the BR2_ARM_CPU_HAS_VFPx symbol does not get enabled, even
if the selected floating point strategy clearly indicates that this
given VFP version is available.

Taking again the example of Cortex-A9, if you select the VFPv3
strategy, then BR2_ARM_CPU_HAS_VFPV2 and BR2_ARM_CPU_HAS_VFPV3 still
remain disabled.

Due to this, packages that use the BR2_ARM_CPU_HAS_VFPVx symbols
(currently ffmpeg, gstreamer1, mpg123 and nodejs) do not realize that
the processor has a VFP.

To solve this, we add a new boolean option that the user may enable to
confirm whether the CPU actually has a VFP unit, like we already have
for the NEON extension case.

So, you end up with up to five things to choose:

 - The processor core, which defines if a VFP is available or might be
   available

 - The availibilty of the NEON extension.

 - The availability of the VFP unit, in case the selection of the
   processor core doesn't allow to know if a VFP is available or not.
   This new configuration option will select the appropriate
   BR2_ARM_CPU_HAS_VFPVx symbols so that packages looking at such
   symbols will find the right values.

 - The ABI to use, EABI of EABIhf, depending on whether the CPU does
   have a VFP unit or not.

 - The chosen floating point strategy.


(This intro is basically what Thomas wrote in his proposal [0], adapted
to this new series.)


Changes v1 -> v2:
  - squash the additional choice into a single boolean
  - reorder the NEON option
  - only show EABIhf when a VFP unit is present
  - only show VFP strategies when a VFP unit is present
  - only show the Arago external toolchain when a VFP unit is present


Regards,
Yann E. MORIN.


The following changes since commit 3068555c47c15afb62988d35e5e148dc691c6eb9:

  python-ipaddress: new package (2015-12-25 19:48:22 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/arm-vfp-2

for you to fetch changes up to 3b91070c5e3b2bd39c1c263f8b9dd3733a03e409:

  toolchain/external: Arago armv7 toolchain really requires a VFPv3 (2015-12-26 16:54:03 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      arch/arm: reorder NEON option
      arch/arm: add option to enable an optional VFP unit
      arch/arm: only expose EABIhf when the CPU *has* a VFP unit
      arch/arm: only expose VFP in FP strategy when the CPU *has* a VFP unit
      toolchain/external: Arago armv7 toolchain really requires a VFPv3

 arch/Config.in.arm                     | 39 ++++++++++++++++++++--------------
 toolchain/toolchain-external/Config.in |  2 +-
 2 files changed, 24 insertions(+), 17 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
