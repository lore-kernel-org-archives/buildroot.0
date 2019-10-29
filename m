From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 29 Oct 2019 19:23:59 -0300
Subject: [Buildroot] [PATCH 1/3] package/eudev: introduce a host variant
In-Reply-To: <87o8xz6h3v.fsf@dell.be.48ers.dk>
References: <cover.1572303270.git.yann.morin.1998@free.fr>
 <205a3ececc3ca9da9ab5829b7498141d8904c84d.1572303270.git.yann.morin.1998@free.fr>
 <CAJ4jsaeyk1SiZsZRBLcCCMPZhrQDmoT4-BP6JU4927PTW4uwOA@mail.gmail.com>
 <87o8xz6h3v.fsf@dell.be.48ers.dk>
Message-ID: <CAJ4jsaf2x-tThs2FO85WOD7d+_vDrdx-JMNE2XTnP-H3Lztqzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 29, 2019 at 6:22 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Carlos" == Carlos Santos <unixmania@gmail.com> writes:
>
> Hi,
>
>  >> +HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
>  >> +HOST_EUDEV_CONF_OPTS = \
>  >> +       --disable-manpages \
>  >> +       --sbindir=$(HOST_DIR)/sbin \
>  >> +       --libexecdir=$(HOST_DIR)/lib \
>  >> +       --with-rootlibdir=$(HOST_DIR)/lib \
>  >> +       --disable-introspection \
>  >> +       --disable-kmod \
>  >> +       --disable-blkid \
>  >> +       --disable-rule-generator \
>  >> +       --enable-hwdb \
>  >> +       --disable-selinux
>
>  > This uses the default --prefix=$(HOST_DIR), which ruins the --rut
>  > argument of udevadm and is r=teh reason why the file copies are
>  > required in the following patches. Use this, instead:
>
>  > # Use custom configuration commands because the default --prefix="$(HOST_DIR)"
>  > # argument ruins the "udevadm hwdb --update --root <path>" command, making the
>  > # root be $(HOST_DIR)/<path>. We also customize sysconfdir to create hwdb.bin
>  > # at /usr/lib/udev if systemd is selected.
>  > define HOST_EUDEV_CONFIGURE_CMDS
>  >     (cd $(@D); rm -rf config.cache; \
>  >     $(HOST_CONFIGURE_OPTS) \
>  >     ./configure \
>  >         --enable-shared --disable-static \
>  >         --disable-manpages \
>  >         --sysconfdir=$(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc) \
>  >         --sbindir=/sbin \
>  >         --libexecdir=/lib \
>  >         --with-rootlibdir=/lib \
>  >         --disable-introspection \
>  >         --disable-kmod \
>  >         --disable-blkid \
>  >         --disable-rule-generator \
>  >         --enable-hwdb \
>  >         --disable-selinux \
>  >     )
>  > endef
>
>  > # We just want udevadm
>  > define HOST_EUDEV_INSTALL_CMDS
>  >     $(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
>  >         $(HOST_DIR)/bin/udevadm
>  > endef
>
> As long as this is the only reason for having host-eudev, this is indeed
> simpler and means that we can have a single TARGET_FINALIZE hook.
>
> --
> Bye, Peter Korsgaard

I just noticed that eudev by default looks for .hwdb files in
/usr/lib/udev/hwdb.d/ and /etc/udev/hwdb.d/ an that systemd looks for
hwdb.bin at /etc/udev/ too.

So we could simplify the the patches by omitting the --sysconfdir
argument and removing both hwdb.d directories in the rootfs-pre-cmd
hooks.

We could also make the removal optional (default yes) for the cases in
which the user wants to rebuild the database at run-time (e.g. after
adding .hwdb files). I'm not a fan of feature provisioning but  it
would be much harder to do this otherwise.

Finally, the hooks could be moved to a single location instead of
repeated in package/eudev.mk and package/systemd.mk. package/udev.mk
would be the ideal location but virtual packages can't have hooks.

Anyway, these are just optional improvements that can be made later.

-- 
Carlos Santos <unixmania@gmail.com>
