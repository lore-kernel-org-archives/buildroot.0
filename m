From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 4 Jun 2021 20:37:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: disable parallel build
In-Reply-To: <20210517074411.GR2506@scaer>
References: <20210516202828.321469-1-fontaine.fabrice@gmail.com>
 <20210517074411.GR2506@scaer>
Message-ID: <CAPi7W82V4XDKO_eiShfaR5VUUNANZ3K316Kx8MrMA6MuKMqPmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le lun. 17 mai 2021 ? 09:44, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> +Pascal for commit cb0ce03ba636
>
> On 2021-05-16 22:28 +0200, Fabrice Fontaine spake thusly:
> > Parallel build is broken since bump to version 2.03.13 in commit
> > 80997acd3587a4528f8877d9e8a502c39ed800c5:
> [--SNIP--]
> > Fixes:
> >  - http://autobuild.buildroot.org/results/30359c351a6ce2f9139494a531e036f0b0406ccf
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/lvm2/lvm2.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> > index 224dbf5d54..509b979294 100644
> > --- a/package/lvm2/lvm2.mk
> > +++ b/package/lvm2/lvm2.mk
> > @@ -11,6 +11,8 @@ LVM2_INSTALL_STAGING = YES
> >  LVM2_LICENSE = GPL-2.0, LGPL-2.1
> >  LVM2_LICENSE_FILES = COPYING COPYING.LIB
> >  LVM2_CPE_ID_PRODUCT = redhat
> > +# parallel build issues
> > +LVM2_MAKE = $(MAKE1)
>
> This is unfortuantely not sufficient:
Even if this is not sufficient, disabling parallel build is still
needed to avoid the build failure related to dmsetup being truncated
or main being undefined.
There are 5 build failures today due to this issue.
>
>     [...] /usr/bin/make -j1 DESTDIR=/home/ymorin/dev/buildroot/O/target install_device-mapper install_systemd_units install_systemd_generators -C /home/ymorin/dev/buildroot/O/build/lvm2-2.03.12/
>     [...]
>     /usr/bin/make -C scripts install_systemd_generators
>         [INSTALL] systemd_generators
>     /usr/bin/install: cannot stat 'lvm2_activation_generator_systemd_red_hat': No such file or directory
>     make[3]: *** [Makefile:86: install_systemd_generators] Error 1
>     make[2]: *** [Makefile:141: install_systemd_generators] Error 2
>     make[1]: *** [package/pkg-generic.mk:341: /home/ymorin/dev/buildroot/O/build/lvm2-2.03.12/.stamp_target_installed] Error 2
>     make: *** [Makefile:23: _all] Error 2
>
> This is probably because, in the systemd case, we force the installation
> of systemd stuff:
>
>    66 ifeq ($(BR2_INIT_SYSTEMD),y)
>    67 LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
>    68 endif
>
> But nothing ensures they are actually built.
>
> I suspect commit cb0ce03ba636 (package/lvm2: install systemd units and
> generators) is no longer valid after the bump to 2.03.x
>
> Pascal, you came up with the systemd integration. Could you also have a
> look at this build failure, please?
>
>     http://autobuild.buildroot.org/results/30359c351a6ce2f9139494a531e036f0b0406ccf
>
> Regards,
> Yann E. MORIN.
>
> >  # Make sure that binaries and libraries are installed with write
> >  # permissions for the owner. We disable NLS because it's broken, and
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
