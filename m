From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 11 Mar 2019 07:48:19 +0100
Subject: [Buildroot] [PATCH 0/4] toolchain: PIC/PIE and
 -fstack-protector-strong for all
Message-ID: <17889_1552286905_5C8604B9_17889_106_1_421580f0-fa59-4179-a32b-e62d7cab7acf@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

Currently, our hardening options make a few assumptions, which although
reasonable, limit their usefulness.

For starters, -fstack-protector-strong has been seen to be backported
to gcc versions older than 4.9. Then, PIC/PIE is currently restricted
and enforced by RELRO_FULL, although it is completely orthogonal.

This series first ensures that -fstackprotector-strong can be enabled
for toolchains with gcc older than 4.9, by dropping the restriction in
Kconfig, but adding a check, at 'configure time', that the toolchain
actually supports it.

It is easy to test the check actually works for toolchains that lack
-fstack-protector-strong with this defconfig:
    BR2_arm=y
    BR2_SSP_STRONG=y
    BR2_TOOLCHAIN_EXTERNAL=y

Which yields a result like we have for the other checks:
    >>> toolchain-external-codesourcery-arm 2014.05-29 Configuring
    SSP option -fstack-protector-strong not available in this toolchain, please select another SSP level
    package/pkg-generic.mk:228: recipe for target [...] failed
    [...]
    make: *** [_all] Error 2

Finally, the last patch in the series allows for PIC/PIE to be enabled
without any RELRO option. It is easy to test that PIC/PIE works without
RELRO, with this defconfig:
    BR2_arm=y
    BR2_PIC_PIE=y
    BR2_TOOLCHAIN_EXTERNAL=y

And then build (e.g.) busybox, which would yield results not unlike:
    $ make busybox-depends
    $ BR2_DEBUG_WRAPPER=2 make busybox-build
    [...]
    Toolchain wrapper executing:
    [...]
    '-fPIE'
    '-pie'
    [...]
    $ file output/build/busybox-1.29.3/busybox
    output/build/busybox-1.29.3/busybox: ELF 32-bit LSB shared object,
    ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter
    /lib/ld-linux.so.3, for GNU/Linux 2.6.16, not stripped

Compared to a build without PIC/PIE:
    output/build/busybox-1.29.3/busybox: ELF 32-bit LSB executable, [...]

Note that the restrictions around PIC/PIE are not lifted: we're still
avoiding it for specific cases (static, kernel, uboot...)


Regards,
Yann E. MORIN.


The following changes since commit 7144c8169755b58ffbad27e0e5ff0963df2fda2d

  package/sqlcipher: fix static build (2019-03-09 21:46:55 +0100)


are available as patches in this mail series,

for you to apply patches up to ff11160a5d2c236a33140b74035f3e43837bc381

  toolchain: allow PIC/PIE without RELRO (2019-03-11 07:40:17 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      toolchain: set the ssp gcc option in kconfig
      toolchain: check the SSP option is known
      toolchain: -fstack-protector-strong can be back-ported
      toolchain: allow PIC/PIE without RELRO

 Config.in                                            | 20 +++++++++++++++++---
 toolchain/helpers.mk                                 |  8 ++++++++
 .../toolchain-external/pkg-toolchain-external.mk     |  2 +-
 toolchain/toolchain-wrapper.c                        | 12 +++---------
 toolchain/toolchain-wrapper.mk                       | 12 ++++++------
 5 files changed, 35 insertions(+), 19 deletions(-)

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
