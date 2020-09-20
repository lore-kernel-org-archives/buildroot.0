From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2020 23:12:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: disable the e2scrub
 stuff
In-Reply-To: <1600394250.18560.2.camel@aliyun.com>
References: <1600333425.32426.1.camel@aliyun.com>
 <20200917213935.67fc4894@windsurf.hq.k.grp>
 <1600394250.18560.2.camel@aliyun.com>
Message-ID: <20200920211236.GK2422@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tian, All,

On 2020-09-18 09:57 +0800, Tian Yuanhao via buildroot spake thusly:
> On ?, 2020-09-17 at 21:39 +0200, Thomas Petazzoni wrote:
> > On Thu, 17 Sep 2020 17:03:45 +0800
> > Tian Yuanhao via buildroot <buildroot@busybox.net> wrote:
> >?
> > > 
> > > diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> > > index eb82a55..cf6579d 100644
> > > --- a/package/e2fsprogs/e2fsprogs.mk
> > > +++ b/package/e2fsprogs/e2fsprogs.mk
> > > @@ -52,7 +52,10 @@ E2FSPROGS_CONF_OPTS = \
> > > ?	--disable-e2initrd-helper \
> > > ?	--disable-testio-debug \
> > > ?	--disable-rpath \
> > > -	--enable-symlink-install
> > > +	--enable-symlink-install \
> > > +	--with-crond-dir=no \
> > > +	--with-systemd-unit-dir=no \
> > > +	--with-udev-rules-dir=no
> > I'm not sure this is really a good solution. Indeed, we probably do
> > want to install udev rules or systemd services.
> > 
> > Thomas
> 
> '--with-crond-dir=no --with-systemd-unit-dir=no --with-udev-rules-dir=no'
> is approximately equal to '--disable-scrub' which does not exist.

But this is not very obvious. Also, even if one does not want e2scrub,
ont may still want the systemd units files and udev ruels to be
installed, sa Thomas already explained.

Furthermore, if one look at the e2fsprogs Mafiles, e2scrub is onlt build
on linux;

    $ cat configure.ac
    [...]
      1464 dnl e2scrub only builds on linux
      1465 dnl
      1466 E2SCRUB_CMT="$LINUX_CMT"
      1467 AC_SUBST(E2SCRUB_CMT)
    [...]

And so, following the E2SCRUB_CMT definition leads to:

    $ cat -n Makefile.in
    [...]
      16 @E2SCRUB_CMT at E2SCRUB_DIR= scrub
    [...]

So, if E2SCRUB_CMT is set (to a sharp sign), E2SCRUB_DIR is not set.
E2SCRUB_DIR is then used later on:

    $ cat -n Makefile.in
    [...]
      24 PROG_SUBDIRS=e2fsck $(DEBUGFS_DIR) misc $(RESIZE_DIR) tests/progs po \
      25         $(E2SCRUB_DIR)
    [...]

So, if we really want to be able to disable e2scrub, can we try to use:

    E2FSPROGS_MAKE_OPTS = E2SCRUB_DIR=
    E2FSPROGS_INSTALL_TARGET_OPTS = E2SCRUB_DIR= DESTDIR=$(TARGET_DIR) install

Could you give it a try, and respin a new patch, please?

> Android [1], Yocto [2] and PTXdist [3] do not install e2scrub. Therefore,
> I thought Buildroot should boldly use those options.
> [1]: https://android.googlesource.com/platform/external/e2fsprogs/+/refs/heads/master/Android.bp
> [2]: http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
> [3]: https://git.pengutronix.de/cgit/ptxdist/tree/rules/e2fsprogs.make

As far as I can tell, they all use different ways to disable e2scrub:

  - Android and PTXDist seem to do selective install, by only installing
    in select sub-dirs

  - the Yocto one seem to cherry-pick individual files from the
    'staging' areau, when assembling the package archive.

I.e. none of those three do explicitly disable e2scrub, they just don;t
install it.

But Buildroot does no selective install; we just rely on the package's
own 'make install' rule.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
