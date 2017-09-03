From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:44:28 +0200
Subject: [Buildroot] [PATCH 0/8] arch: some require a minimal gcc version
In-Reply-To: <cover.1504430497.git.yann.morin.1998@free.fr>
References: <cover.1504430497.git.yann.morin.1998@free.fr>
Message-ID: <cover.1504431850.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Not all architectures we support have support in upstream gcc, glibc,
binutils, and/or linux. In some cases, only a few specific cores do not
have that support.

Furthermore, some architecture, or specific cores, got support in a
specific gcc version.

Currently, we have to account for this in at least three locations:
  - the toolchain backend choice (internal or externsal)
  - the gcc version choice
  - each external toolchain

While a previous series handled the case for the internal backend, this
second series caters to the minimal required gcc version.

New blind options are added, that archicetures or individual cores may
select, to indicate they were introduced, or started to be supported in
a specific gcc version.

The gcc version choice, as well as external toolchains, are then
converted from ad-hoc (and sometimes incorrect) architecture
dependencies, over to use these new required gcc version depednencies.

Note: the custom external toolchain is also converted, but this may
cause a regression, in case a user has a custom toolchain with support
for a specific arch or core back-ported. See the corresponding commit
log for more details. In case this regression is deemed too important,
we can simply drop the patch on the floor, in which case we could have
the inverse situation, where a user uses a too old external toolchain
in which the specific arch/core has not been back-ported, thus causing
build failures.


Regards,
Yann E. MORIN.


The following changes since commit 0335a8a1164bfeb7c006c7d248d8f1923069c98f

  arc/bfin: remove 60x cores (2017-09-03 11:09:53 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 41eeac74f986790fe26f03ebf05322120d2c04da

  package/gcc: slight cleanup and reorg in remaining arch depends (2017-09-03 11:14:53 +0200)


----------------------------------------------------------------
Yann E. MORIN (8):
      arch: introduce minimal required gcc version
      package/gcc: hide versions too old for the current arch
      toolchain/external-custom: hide versions too old for the current arch
      toolchain/external: hide versions too old for the current arch
      arch/bfin: needs gcc >= 6
      arch/mips: some variants need different gcc versions
      arch/arm: some variants need different gcc versions
      package/gcc: slight cleanup and reorg in remaining arch depends

 arch/Config.in                                     | 22 ++++++++++++++++
 arch/Config.in.arm                                 |  6 +++++
 arch/Config.in.mips                                |  7 ++++++
 package/gcc/Config.in.host                         | 29 +++++++---------------
 .../Config.in                                      |  1 +
 .../Config.in                                      |  1 +
 .../Config.in                                      |  1 +
 .../Config.in                                      |  1 +
 .../toolchain-external-codesourcery-arm/Config.in  |  6 ++---
 .../toolchain-external-codesourcery-mips/Config.in |  2 ++
 .../Config.in                                      |  1 +
 .../toolchain-external-custom/Config.in.options    | 15 +++++++++++
 .../toolchain-external-linaro-aarch64/Config.in    |  1 +
 .../toolchain-external-linaro-arm/Config.in        |  2 ++
 .../toolchain-external-linaro-armeb/Config.in      |  2 ++
 .../toolchain-external-synopsys-arc/Config.in      |  1 +
 16 files changed, 74 insertions(+), 24 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
