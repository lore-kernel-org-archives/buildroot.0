From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 17:33:45 +0200
Subject: [Buildroot] [PATCH 0/3] core/pkg-kernel-config: ensure linux
 supports modules (branch yem/kernel-module)
In-Reply-To: <20150824161129.272f994c@pcviktorin.fit.vutbr.cz>
References: <cover.1440418870.git.yann.morin.1998@free.fr>
 <20150824161129.272f994c@pcviktorin.fit.vutbr.cz>
Message-ID: <20150824153345.GB3619@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2015-08-24 16:11 +0200, Jan Viktorin spake thusly:
> Hello Yann, all.
> 
> I've tried the patch series and it works. However, I've tried to do
> this for xtables-addons:
> 
> -LINUX_NEEDS_MODULES = y
> +#LINUX_NEEDS_MODULES = y
> 
> and the result is that it again compiles with CONFIG_MODULES=y (and it
> shouldn't). I was investigating why and couldn't find the answer. It
> just sets the CONFIG_MODULES=y everytime.
> 
> Simple test is possible:
> 
> 1) $ make olimex_a20_olinuxino_lime_defconfig
> 2) $ make linux-menuconfig
> 3) Check "Enable loadable module support" is (un)checked.
> 
> * For origin/master (7deaa27), it works as expected (unchecked).
> * After merge of morin-repo/yem/kernel-module (2af986e) it DOES NOT work
> as expected (checked).
> 
> Can you reproduce it as well?

I haven't eventried, but I guess Peter nailed it in his reply.

I'll fix and respin.

Regards,
Yann E. MORIN.

> Regards
> Jan Viktorin
> 
> On Mon, 24 Aug 2015 14:27:38 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Hello All!
> > 
> > This series fixes two standing issues with the way we handle packages
> > that build kernel modules:
> > 
> >   - first, the current check is broken, because $(LINUX_DIR) should be
> >     double-$ed, as it is used in a macro from an infra,
> > 
> >   - second, it is currently possible to (try to) build such packages
> >     without the kernel config havong CONFIG_MODULES set.
> > 
> > So, these three patches fix that:
> > 
> >   - introduce a new internal variable to tell the kernel to enable
> >     support for modules, LINUX_NEEDS_MODULES, that should be set
> > whenever a package wants to build a kernel modules, and is
> > automatically set by the kernel-module infra,
> > 
> >   - the (broken) check is no longer needed so removed,
> > 
> >   - a few packages that build kernel modules without using the
> >     kernel-module infra are fixed to manually set that variable.
> > 
> > I believe that should go into master, because:
> > 
> >   - it actually fixes build issues
> > 
> >   - the kernel-module infra is brand new in this release, and should
> > be fixed and stable prior to being released to the wide hostile world
> >     ;-) 
> > 
> > Thanks to Peter for suggesting the solution, and to No? and Jan for
> > their previous attempts that eventually led to this series.
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> > 
> > The following changes since commit
> > 7deaa277fd4c89c67de39ea21b4cd081ab85366f:
> > 
> >   arch/arm: add missing arm1136j-s variant (2015-08-24 00:43:12 +0200)
> > 
> > are available in the git repository at:
> > 
> >   git://git.busybox.net/~ymorin/git/buildroot yem/kernel-module
> > 
> > for you to fetch changes up to
> > 2af986ecd146d1dc6e7603bd93fac5420c459e41:
> > 
> >   packages: ensure linux supports modules even when not using
> > kernel-module (2015-08-24 14:14:23 +0200)
> > 
> > ----------------------------------------------------------------
> > Yann E. MORIN (3):
> >       core/pkg-kernel-module: ensure linux supports modules
> >       core/pkg-kernel-module: drop now-useles check for CONFIG_MODULES
> >       packages: ensure linux supports modules even when not using
> > kernel-module
> > 
> >  linux/linux.mk                           | 2 ++
> >  package/linux-fusion/linux-fusion.mk     | 9 ++++++---
> >  package/nvidia-driver/nvidia-driver.mk   | 4 ++++
> >  package/pkg-kernel-module.mk             | 9 +++++----
> >  package/racehound/racehound.mk           | 4 ++++
> >  package/rtai/rtai.mk                     | 4 ++++
> >  package/ti-gfx/ti-gfx.mk                 | 5 +++++
> >  package/xtables-addons/xtables-addons.mk | 4 ++++
> >  8 files changed, 34 insertions(+), 7 deletions(-)
> > 
> 
> 
> 
> -- 
>    Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
>    System Architect              Web:    www.RehiveTech.com
>    RehiveTech
>    Brno, Czech Republic

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
