From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 21:56:03 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-17
In-Reply-To: <20180818060019.8702120DE6@mail.bootlin.com>
References: <20180818060019.8702120DE6@mail.bootlin.com>
Message-ID: <20180818215603.04843f8d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Hollis, Fabrice, Chris, Peter, there are some issues/questions for you
below.

On Sat, 18 Aug 2018 08:00:19 +0200 (CEST), Thomas Petazzoni wrote:

>       xtensa |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/bdf0360b0407acdbcf494e6efb4d76f772783f94 |     

Hollis autobuilder again failing to fetch.

>       mipsel |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6d3db8a67a1de75920624b3e13e8110e783ddbd9 |     
>       mipsel |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/253bde162b4419a282f58f7932b0c6027ec6c742 |     

static linking on MIPS for some reason pulls in the libboost_atomic
library. I reported this to Fabrice already.

>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a256f3bfb9aceb3ed122beed39d9555a5cb07274 |     
>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/212651b677cfb0763b34596d4f999103039d89bc |     

Two other static linking configuration (on Cortex-M4) causing the same
problem.

>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/77f538992ea5f58245016f1a09fa5048895be19a |     
>         m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/97f9b0636d692571b9dcf38543ca79fc9de55bb7 |     
>        sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/37571087efdb4e1785ea94af8c56eddc1305f881 |     
>        sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c830dc9cdbd4e08eda4ced4fa6213bff60c6706e |     

These ones are fixed by:

  https://git.buildroot.org/buildroot/commit/?id=5f6f910cc9978910ebab5e088cb7c3870371b382
  https://git.buildroot.org/buildroot/commit/?id=e2928dfa080658c35f6f0b7c9e62a3ade438a827

because the ARMv5, m68k and Sparc v8 architectures are now identified
as not providing "always lock-free int atomics".

>          arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/7d578300ff2c6c5e236c18eba7290739da245cc3 |     

Another timeout issue on Hollis autobuilder.

>        sparc |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/8546b7559e96ab0f3d2508722fd299e103e3457d | ORPH
>       mipsel |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba8a7dc1496ed9a63d408eb3d2683c485c273135 | ORPH

WARNING: 'makeinfo' is missing on your system.
         You should only need it if you modified a '.texi' file, or
         any other file indirectly affecting the aspect of the manual.
         You might want to install the Texinfo package:
         <http://www.gnu.org/software/texinfo/>
         The spurious makeinfo call might also be the consequence of
         using a buggy 'make' (AIX, DU, IRIX), in which case you might
         want to install GNU make:
         <http://www.gnu.org/software/make/>

I'm not sure why this happens only on Hollis autobuilder. We had it
with binutils/gdb in the past on other machines, so why does it happen
for Guile, but only on Hollis autobuilder ?

>       x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d037515c949a377d4ace48b81675eb79e5964790 |     

This was fixed yesterday, but I messed up the commit, so I fixed it again:

  https://git.buildroot.org/buildroot/commit/?id=cb8d1743cab1449b91afbabe38c64cbb85bef6ba

>          sh4 |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/2b18b9e1449f91d0c8d72ceadf298b5b37f5c9c4 |     


cc1: warnings being treated as errors
../py/objdict.c: In function 'dict_view_print':
../py/objdict.c:458: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:457: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:456: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:455: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:454: note: initialized from here

Not sure what is going on here, but it happens only on Hollis autobuilder:

  http://autobuild.buildroot.net/?reason=micropython%

Chris, perhaps you have an idea ?

>      aarch64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/36598fac615b3f138e41e8dd1df903558cde765c |     

This is due to a Qt method that has been removed in Qt 5.11. It can be
fixed by applying
https://src.fedoraproject.org/rpms/python-qt5/c/47fb7fdc5d16582772f9c3fc8a6a674a41a7f605?branch=master,
but we need to find a way to make this conditional on Qt 5.11 (indeed
with Qt 5.6, this should be preserved).

>         or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a3535cdf5e91df011a59a4b9f60d69195f5efdcb |     

Missing "double conversion" logic for OpenRISC. Peter (Seiderer),
perhaps you could have a look ? At
https://github.com/google/double-conversion/issues/73, the upstream
maintainer was OK with testing happening in Qemu.

>     mips64el |                   samba4-4.8.4 | NOK | http://autobuild.buildroot.net/results/1404a594583ff192d70086ef590f924472465c89 |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=6d3723147659542ec1cba4139981d75413d89edc

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
