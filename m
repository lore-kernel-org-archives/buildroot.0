From: Marc Chalain <marc.chalain@gmail.com>
Date: Fri, 19 Jun 2020 17:37:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpiod: add gpiod hardware
 handling daemon
In-Reply-To: <20200617223824.0ab717d2@windsurf.home>
References: <20200616164200.6399-1-marc.chalain@gmail.com>
 <20200617223824.0ab717d2@windsurf.home>
Message-ID: <CAAj6r7oaCxid93ovxKciNNTyGn+MQwvUPG73PjgX5F0ZDTm__w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Before to send a new patch I have some questions:

Le mer. 17 juin 2020 ? 22:38, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> On Tue, 16 Jun 2020 18:42:00 +0200
> mchalain <marc.chalain@gmail.com> wrote:
>
> > Gpiod is a little daemon to trig gpio event and launch scripts on level
> > changing events.
> > As udev or mdev, it reads rules files to attach scripts on events. and
> > launch the scripts with environment variables to describe the event.
> > It uses libgpiod to monitor the gpio and libconfig to read the rules.
> > It is tested on Raspberry Pi (0,3,4) with success, during few months.
> >
> > Signed-off-by: mchalain <marc.chalain@gmail.com>
>
> Thanks a lot for your contribution. I have not reviewed it carefully.
> However, while it looks potentially interesting, I am personally always
> a bit concerned in packaging software components that look like
> "personal projects". This project has only been written by you, there
> are no contributions from others, no stars, no fork on Github, nothing
> indicates that anyone but you is using gpiod.
>
> This project comes from a professional project. I didn't find any tool
to launch an application on a switch event. I thought that is stupid to
write
code in the application only for that, when there isn't time mandatory.
This is a personal project, but I hope to reuse it in the future.

So I am wondering if it is not too early to have that in Buildroot. On
> the other hand, you could certainly say that having it in Buildroot
> would give it some exposure that might encourage some users to try it
> out.
>
> Anyway, we will need your Signed-off-by to use your full first name and
> last name, properly capitalized.
>
>
> > diff --git a/package/gpiod/Config.in b/package/gpiod/Config.in
> > new file mode 100644
> > index 0000000000..e9d5dc47f9
> > --- /dev/null
> > +++ b/package/gpiod/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_GPIOD
> > +     bool "gpiod: gpio monitor daemon"
> > +     depends on BR2_USE_MMU
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>
> This needs a comment:
>
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8 # libgpiod
>
OK done

> > +     select BR2_PACKAGE_LIBGPIOD
> > +     select BR2_PACKAGE_LIBCONFIG
> > +     help
> > +       GPIOD monitors gpio events and start scripts.
> > +       The daemon loads rules defining a gpio and
> > +       the scripts to launch when the level of gpio changes.
> > +
> > +comment "gpiod: needs a toolchain w/ support of MMU and headers > 4.8"
> > +     depends on !BR2_USE_MMU
> > +     depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>
> No, this should be:
>
> comment "gpiod needs a toolchain w/ kernel headers >= 4.8"
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>
> Are you sure for  "depends on BR2_USE_MMU" and not "depends on
!BR2_USE_MMU" ?

> +RUNDIR=/var/run
> > +SBINDIR=/usr/sbin
> > +BINDIR=/usr/bin
> > +
> > +start() {
> > +     printf "Starting gpiod: "
> > +     start-stop-daemon -S -q --exec ${SBINDIR}/gpiod -- -D -p
> ${RUNDIR}/gpiod.pid
> > +     [ $? == 0 ] && echo "OK" || echo "FAILED"
> > +}
> > +stop() {
> > +     printf "Stopping gpiod: "
> > +     ${SBINDIR}/gpiod -K -p ${RUNDIR}/gpiod.pid
> > +     echo "OK"
> > +}
>
> Please follow the template package/busybox/S01syslogd for your init
> script.
>
> OK done

>
> > diff --git a/package/gpiod/gpiod.hash b/package/gpiod/gpiod.hash
> > new file mode 100644
> > index 0000000000..4a9c10297c
> > --- /dev/null
> > +++ b/package/gpiod/gpiod.hash
> > @@ -0,0 +1 @@
> > +sha256
> f7c12fafcfb02515ae34d9502b4121d7980606fb53b57bee35143bd985bfdddc
> gpiod-1.0.tar.gz
>
> We need a hash for the license file.
>
> OK done

> diff --git a/package/gpiod/gpiod.mk b/package/gpiod/gpiod.mk
> > new file mode 100644
> > index 0000000000..ed99f1d3be
> > --- /dev/null
> > +++ b/package/gpiod/gpiod.mk
> > @@ -0,0 +1,52 @@
> >
> +################################################################################
> > +#
> > +# gpiod
> > +#
> >
> +################################################################################
> > +
> > +GPIOD_VERSION = 1.0
> > +GPIOD_SITE = $(call github,mchalain,gpiod,$(GPIOD_VERSION))
>
> We need GPIOD_LICENSE and GPIOD_LICENSE_FILES.
>
> OK done

> +GPIOD_MAKE_OPTS+=prefix=/usr
> > +GPIOD_MAKE_OPTS+=sysconfdir=/etc/gpiod
>
> Just one assignment, and unconditional:
>
> GPIOD_MAKE_OPTS = \
>         prefix=/usr \
>         sysconfdir=/etc/gpiod
>
> > +#GPIOD_MAKE_OPTS+=DEBUG=y
>
> Drop comments please.
>
> OK done

> > +
> > +GPIOD_KCONFIG_FILE=$(GPIOD_PKGDIR)/gpiod_defconfig
> > +GPIOD_KCONFIG_EDITORS = config
> > +GPIOD_KCONFIG_OPTS = $(GPIOD_MAKE_OPTS)
> > +
> > +GPIOD_DEPENDENCIES += libgpiod
> > +GPIOD_DEPENDENCIES += libconfig
>
> One line for dependencies, and unconditional:
>
> GPIOD_DEPENDENCIES = libgpiod libconfig
>
> OK done

> > +define GPIOD_LIBCONFIG_OPTS
> > +     $(call KCONFIG_ENABLE_OPT,LIBCONFIG,$(@D)/.config)
> > +endef
> > +
> > +define GPIOD_KCONFIG_FIXUP_CMDS
> > +     $(GPIOD_LIBCONFIG_OPTS)
> > +endef
> > +
> > +define GPIOD_BUILD_CMDS
> > +     $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
> > +             $(MAKE1) -C $(@D) $(GPIOD_MAKE_OPTS)
> > +endef
> > +
> > +define GPIOD_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -d -m 755 $(TARGET_DIR)/etc/gpiod/rules.d
>
> Why do you need this ?
>
> For the same reason as the gpiod_defconfig is empty. LIBCONFIG is the only
option of gpiod.
In a future version, I would like to remove the dependencies to libconfig,
and I prepared that here.
I will remove the configuration in the makefile, and add the entry in the
configuration file.

> +     $(MAKE) -C $(@D) $(GPIOD_MAKE_OPTS) \
> > +             DESTDIR="$(TARGET_DIR)" DEVINSTALL=n install
>
> I don't think you need DEVINSTALL=n here
>
> Yes, it's right. This option disallows the headers files, but there aren't
headers files.

> +endef
> > +
> > +define GPIOD_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 644 $(GPIOD_PKGDIR)/gpiod.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/gpiod.service
>
> This is OK. Perhaps use $(@D) instead of $(GPIOD_PKGDIR)
>
> However, the service file was missing in your patch.
>
> OK done

> > +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +     ln -fs ../../../../usr/lib/systemd/system/gpiod.service \
> > +
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/gpiod.service
>
> These two commands are not needed, systemd preset-all is going to take
> care of this.
>
> OK thank, I remembered to need that, a few years ago.

> +endef
> > +define GPIOD_INSTALL_INIT_SYSV
> > +     $(INSTALL) -D -m 755 $(GPIOD_PKGDIR)/S20gpiod \
> > +             $(TARGET_DIR)/etc/init.d/S20gpiod
> > +endef
> > +
> > +$(eval $(kconfig-package))
>
> I'm a bit skeptical on the usage of kconfig-package here. You are *not*
> using kconfig at all. You have a makefile that emulates some of the
> kconfig behavior, but you're not using kconfig. So if we later change
> how kconfig-package behave, to use some kconfig functionality that you
> do not emulate, things will no longer work for the gpiod package.
>
> Big question... I can use CONFIGURE_CMDS, but if the kconfig system from
the
kernel changes, what will you do ?
The version compatibility of each build system is a debate in development
community
for many years,
I remember of many discussions about the version of autotools and m4, the
discussions
about the best usage between to load all makefiles only once or to run each
one by one.
And I don't speak about the trolls about the best tools "autotools more
stable
"scons easer with python" "cmake the greatest", some people add another
wrapper
arount cmake.
I prefer to use only Makefile, it's proof, flexible and it does a good job.
I'm sure that
in 10 or 20 years, some body will be able to write and correct a Makefile.
After I can write a CONFIGURE_CMDS to do the same as kconfig-package but
it's less flexible to change the options (yes the only one option of the
application ;)
Tell me your preference.

> diff --git a/package/gpiod/gpiod_defconfig b/package/gpiod/gpiod_defconfig
> > new file mode 100644
> > index 0000000000..e69de29bb2
>
> So it's just empty ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200619/ae3c4475/attachment.html>
