From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 10:22:44 +0100
Subject: [Buildroot] [PATCH 1/3] package/eudev: introduce a host variant
In-Reply-To: <CAJ4jsaeyk1SiZsZRBLcCCMPZhrQDmoT4-BP6JU4927PTW4uwOA@mail.gmail.com>
 (Carlos Santos's message of "Mon, 28 Oct 2019 23:54:39 -0300")
References: <cover.1572303270.git.yann.morin.1998@free.fr>
 <205a3ececc3ca9da9ab5829b7498141d8904c84d.1572303270.git.yann.morin.1998@free.fr>
 <CAJ4jsaeyk1SiZsZRBLcCCMPZhrQDmoT4-BP6JU4927PTW4uwOA@mail.gmail.com>
Message-ID: <87o8xz6h3v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <unixmania@gmail.com> writes:

Hi,

 >> +HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 >> +HOST_EUDEV_CONF_OPTS = \
 >> +       --disable-manpages \
 >> +       --sbindir=$(HOST_DIR)/sbin \
 >> +       --libexecdir=$(HOST_DIR)/lib \
 >> +       --with-rootlibdir=$(HOST_DIR)/lib \
 >> +       --disable-introspection \
 >> +       --disable-kmod \
 >> +       --disable-blkid \
 >> +       --disable-rule-generator \
 >> +       --enable-hwdb \
 >> +       --disable-selinux

 > This uses the default --prefix=$(HOST_DIR), which ruins the --rut
 > argument of udevadm and is r=teh reason why the file copies are
 > required in the following patches. Use this, instead:

 > # Use custom configuration commands because the default --prefix="$(HOST_DIR)"
 > # argument ruins the "udevadm hwdb --update --root <path>" command, making the
 > # root be $(HOST_DIR)/<path>. We also customize sysconfdir to create hwdb.bin
 > # at /usr/lib/udev if systemd is selected.
 > define HOST_EUDEV_CONFIGURE_CMDS
 >     (cd $(@D); rm -rf config.cache; \
 >     $(HOST_CONFIGURE_OPTS) \
 >     ./configure \
 >         --enable-shared --disable-static \
 >         --disable-manpages \
 >         --sysconfdir=$(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc) \
 >         --sbindir=/sbin \
 >         --libexecdir=/lib \
 >         --with-rootlibdir=/lib \
 >         --disable-introspection \
 >         --disable-kmod \
 >         --disable-blkid \
 >         --disable-rule-generator \
 >         --enable-hwdb \
 >         --disable-selinux \
 >     )
 > endef

 > # We just want udevadm
 > define HOST_EUDEV_INSTALL_CMDS
 >     $(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
 >         $(HOST_DIR)/bin/udevadm
 > endef

As long as this is the only reason for having host-eudev, this is indeed
simpler and means that we can have a single TARGET_FINALIZE hook.

-- 
Bye, Peter Korsgaard
