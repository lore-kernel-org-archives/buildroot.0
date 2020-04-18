From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 18 Apr 2020 15:26:31 +0200
Subject: [Buildroot] [PATCH] package/environment-setup: new package
In-Reply-To: <20200418124525.GR5853@scaer>
References: <20200418103108.1877-1-angelo@amarulasolutions.com>
 <20200418124525.GR5853@scaer>
Message-ID: <CA+TH9VnHD6kTypO2KePO7X9fupOFShiKGxoes-8JpmiNjTArDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il giorno sab 18 apr 2020 alle ore 14:45 Yann E. MORIN <
yann.morin.1998@free.fr> ha scritto:

> Angelo, All,
>
> On 2020-04-18 12:31 +0200, Angelo Compagnucci spake thusly:
> > Install an helper script to setup a build environment
> > based on buildroot. It's useful when you export an sdk
> > and want to use buildroot to build an external project.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> >  docs/manual/using-buildroot-toolchain.txt     |  7 +++++
> >  package/Config.in                             |  1 +
> >  package/environment-setup/Config.in           |  6 ++++
> >  .../environment-setup/environment-setup.mk    | 28 +++++++++++++++++++
> >  4 files changed, 42 insertions(+)
> >  create mode 100644 package/environment-setup/Config.in
> >  create mode 100644 package/environment-setup/environment-setup.mk
> >
> > diff --git a/docs/manual/using-buildroot-toolchain.txt
> b/docs/manual/using-buildroot-toolchain.txt
> > index 0c0c35fced..15096cfec8 100644
> > --- a/docs/manual/using-buildroot-toolchain.txt
> > +++ b/docs/manual/using-buildroot-toolchain.txt
> > @@ -27,6 +27,13 @@ Upon extracting the SDK tarball, the user must run
> the script
> >  +relocate-sdk.sh+ (located at the top directory of the SDK), to make
> >  sure all paths are updated with the new location.
> >
> > +For your convenience, by selecting the package
> BR2_PACKAGE_ENVIRONMENT_SETUP,
> > +you can have a +setup-environment.sh+ script installed in
> +output/host/+.
> > +This script can be sourced with +. environment-setup.sh+ to launch
> > +the buildroot shell. Inside this shell, you will find an environment
> already
> > +set up with the correct PATH, the complete list of +target configure+
> > +variables and some useful commands like the +configure+ alias.
>
> I don't think this should warrant a blurb in the manual. Otherwise, you
> would have to add the same for the meson cross-compilation file that we
> provide. And the ones for cmake as well...
>
> Also. I don't like it being a package. There is no reason for that.
> Instead, install it like we do the similar other cross-compilaiton
> helpers, with the package that actually provides the tools:
>
>   - the mexon's cross-compilation file is installed by host-meson
>
>   - the cmake's toolchainfile.cmake and Buildroot.cmake files are
>     installed by the cmake infra (yeah, that's not so nice...)
>
> So, since this script is geared towards autotools, I guess host-autoconf
> should bear the burden of installing that file.
>

Why do you think it's geared toward autotools? By having path properly
configured, it's pretty universal, for example I can do a qmake well sure
the qmake from buildroot is used, or cmake.


> > diff --git a/package/environment-setup/Config.in
> b/package/environment-setup/Config.in
> > new file mode 100644
> > index 0000000000..f0fcc7d0f8
> > --- /dev/null
> > +++ b/package/environment-setup/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_ENVIRONMENT_SETUP
> > +     bool "Environment setup"
> > +     help
> > +       Install an helper script to setup a build environment
> > +       based on buildroot. It's useful when you export an sdk
> > +       and want to use buildroot to build an external project
> > diff --git a/package/environment-setup/environment-setup.mk
> b/package/environment-setup/environment-setup.mk
> > new file mode 100644
> > index 0000000000..840ee2a1a0
> > --- /dev/null
> > +++ b/package/environment-setup/environment-setup.mk
> > @@ -0,0 +1,28 @@
> >
> +################################################################################
> > +#
> > +# environment-setup
> > +#
> >
> +################################################################################
> > +
> > +ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup.sh
>
> Don't install that at the root of the host dir, that's ugly.
>

Why? This is common for other build systems like Yocto. This script is
intended to mimic that.


> > +ENVIRONMENT_SETUP_SED_EXP = --expression='s+$(HOST_DIR)+\$$SDK_PATH+g'
> > +
> > +define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
> > +     cp package/environment-setup/environment-setup.sh
> $(ENVIRONMENT_SETUP_FILE)
>
> package/environment-setup/environment-setup.sh is missing in your patch.
>

Ops.


> Also, I don't think it should spawn a shell. Instead, it should be a
> file that has to be sourced:
>
>     . /path/to/sdk-dir/usr/share/buildroot/autoconf-env
>

Well, if you intend to remove the .sh extension, no problem


>
> > +     for var in $(TARGET_CONFIGURE_OPTS); do \
>
> No-no: there are variables which values have spaces in them; that's not
> going to work very well for those...
>
> > +             echo export \"$$var\" | sed $(ENVIRONMENT_SETUP_SED_EXP)
> >> $(ENVIRONMENT_SETUP_FILE); \
>
> Why don't you just do (export can export multiple variables_:
>
>     printf 'export %s\n' '$(TARGET_CONFIGURE_OPTS)'
> >>$(ENVIRONMENT_SETUP_FILE)
>
> (use printf, not echo).
>

I will try


> > +     done
> > +     echo export \"CROSS_COMPILE=$(TARGET_CROSS)\" | sed
> $(ENVIRONMENT_SETUP_SED_EXP) >> $(ENVIRONMENT_SETUP_FILE)
>
> Is CROSS_COMPILE really a variable used by autotools?
>

No, but it is very useful in the contest of compiling other software.


> Yeah, kernel... But this file should be only autotools, like the ones
> we have for meson and cmake.
>
> > +     echo export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
> > +             --host=$(GNU_TARGET_NAME) \
> > +             --build=$(GNU_HOST_NAME) \
> > +             --prefix=/usr \
> > +             --exec-prefix=/usr \
> > +             --sysconfdir=/etc \
> > +             --localstatedir=/var \
> > +             --program-prefix=\" >> $(ENVIRONMENT_SETUP_FILE)
> > +     echo
> "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$
> \"" >> $(ENVIRONMENT_SETUP_FILE)
>
> Do not ever play with the PS1 of users: they all have their prompt very
> well crafted over the years! ;-] And this is absolutely not usefull for
> the purpose of that script.
>

> Regards,
> Yann E. MORIN.
>
> > +     echo alias "configure=\"./configure \$${CONFIGURE_FLAGS}\"" >>
> $(ENVIRONMENT_SETUP_FILE)
> > +endef
> > +
> > +$(eval $(generic-package))
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200418/dbda1f42/attachment.html>
