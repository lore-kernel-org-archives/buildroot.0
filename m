From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 26 Nov 2019 14:55:12 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-kconfig: fix reconfigure for
 kconfig packages
In-Reply-To: <20191126142916.1def6761@windsurf>
References: <1574771063-29218-1-git-send-email-angelo@amarulasolutions.com>
 <20191126141838.74d804f8@windsurf>
 <CA+_SqVZMB3yr9ALL-M4Wb9cX7FNGUVxEmM0b2d8=vszT+uN67g@mail.gmail.com>
 <20191126142916.1def6761@windsurf>
Message-ID: <CA+_SqVYc-Rm3rw240LH37CVuZQaD6vt0iKvt=mQjeR4Pj3izug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 26, 2019 at 2:29 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 26 Nov 2019 14:22:26 +0100
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > > Are you sure it was regressed ? When I read the code at commit
> > > 4b81badbcc0b25678ac6627548160702731cf393, I don't see even back then
> > > how linux-reconfigure would trigger a complete reconfiguration. Have
> > > you actually verified that it was working as expected back at commit
> > > 4b81badbcc0b25678ac6627548160702731cf393 ? Indeed, at commit
> > > 4b81badbcc0b25678ac6627548160702731cf393, we were already only removing
> > > the stamp_kconfig_fixup_done stamp file, so my understanding is rather
> > > that commit 4b81badbcc0b25678ac6627548160702731cf393 doesn't implement
> > > what the commit log says.
> >
> > Not tested that commit really, I guessed based on what the commit messages said.
> >
> > I'll rework the commit message .
>
> Instead of just reworking the commit message, I think it would instead
> make sense to "git checkout 4b81badbcc0b25678ac6627548160702731cf393"
> and test what was the behavior back then.

Checked out at 4b81badbcc0b25678ac6627548160702731cf393

$ make linux-reconfigure
umask 0022 && make -C /home/angelo/DEV/BUILDROOT/buildroot
O=/home/angelo/DEV/BUILDROOT/br_qemu_arm/. linux-reconfigure
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_staging_installed
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_target_installed
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_images_installed
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_host_installed
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_built
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_kconfig_fixup_done
rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_configured
/bin/sed -i -e "/\\<CONFIG_KERNEL_GZIP\\>/d"
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
echo 'CONFIG_KERNEL_GZIP=y' >>
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
/bin/sed -i -e "/\\<CONFIG_KERNEL_XZ\\>/d"
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
echo '# CONFIG_KERNEL_XZ is not set' >>
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
/bin/sed -i -e "/\\<CONFIG_CPU_LITTLE_ENDIAN\\>/d"
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
echo 'CONFIG_CPU_LITTLE_ENDIAN=y' >>
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
/bin/sed -i -e "/\\<CONFIG_AEABI\\>/d"
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
echo 'CONFIG_AEABI=y' >>
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
# As the kernel gets compiled before root filesystems are
# built, we create a fake cpio file. It'll be
# replaced later by the real cpio archive, and the kernel will be
# rebuilt using the linux-rebuild-with-initramfs target.
/bin/sed -i -e "/\\<CONFIG_DEVTMPFS\\>/d"
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
echo 'CONFIG_DEVTMPFS=y' >>
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
/bin/sed -i -e "/\\<CONFIG_DEVTMPFS_MOUNT\\>/d"
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
echo 'CONFIG_DEVTMPFS_MOUNT=y' >>
/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
scripts/kconfig/conf  --olddefconfig Kconfig
#
# configuration written to .config
#
>>> linux 4.7 Configuring
>>> linux 4.7 Building

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
