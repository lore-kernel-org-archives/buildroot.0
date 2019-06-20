From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 20 Jun 2019 13:26:09 -0700
Subject: [Buildroot] [git commit] package/coreutils: allow building as
 individual binaries
In-Reply-To: <20190620201645.GK2216@scaer>
References: <20190620192137.DB4A482283@busybox.osuosl.org>
 <20190620201645.GK2216@scaer>
Message-ID: <CAGt4E5t11oJzwhmez27_5Fgh8tHQG=ugL8=+CqUNE-gOTA-qug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 at 13:16, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Thomas, Markus, All,
>
> On 2019-06-20 21:04 +0200, Thomas Petazzoni spake thusly:
> > We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> > so that coreutils can be built and installed as individual binaries.
> > It can be used if the target file system doesn't support symlinks or
> > symlinks are undesirable.
> [--SNIP--]
> > @@ -111,16 +130,28 @@ COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
> >  endif
> >
> >  # link for archaic shells
> > +ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
> > +define COREUTILS_CREATE_TEST_SYMLINK
> > +     ln -fs test $(TARGET_DIR)/usr/bin/[
> > +endef
> > +else
> >  define COREUTILS_CREATE_TEST_SYMLINK
> >       ln -fs coreutils $(TARGET_DIR)/usr/bin/[
> >  endef
> > +endif
> >  COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
>
> If we are single-binary, then test is it self a symlink to coreutils
> already, as done by the install of coreutils.
>
> If we're multi-binary, then test is standalone.
>
> So, in either case, doing the [ -> test symlink should have been valid,
> no?

You have a good point. I didn't really look into whether [ -> test
works even in the single binary case. It probably should work.

However, the code that existed before my change did [ -> coreutils,
and that definitely won't work with individual binaries. I guess I was
too narrowly focused on removing this symlink to coreutils.

Regards,
-Markus

> (sorry I did not reply earlier, I only thought about it after seeing
> Thomas' split patches.)
>
> Regards,
> Yann E. MORIN.
>
> >  # gnu thinks chroot is in bin, debian thinks it's in sbin
> > +ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
> > +define COREUTILS_FIX_CHROOT_LOCATION
> > +     mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin
> > +endef
> > +else
> >  define COREUTILS_FIX_CHROOT_LOCATION
> >       rm -f $(TARGET_DIR)/usr/bin/chroot
> >       ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
> >  endef
> > +endif
> >  COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
> >
> >  $(eval $(autotools-package))
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
