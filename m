From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 26 Nov 2019 14:59:59 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-kconfig: fix reconfigure for
 kconfig packages
In-Reply-To: <20191126145837.3a28e202@windsurf>
References: <1574771063-29218-1-git-send-email-angelo@amarulasolutions.com>
 <20191126141838.74d804f8@windsurf>
 <CA+_SqVZMB3yr9ALL-M4Wb9cX7FNGUVxEmM0b2d8=vszT+uN67g@mail.gmail.com>
 <20191126142916.1def6761@windsurf>
 <CA+_SqVYc-Rm3rw240LH37CVuZQaD6vt0iKvt=mQjeR4Pj3izug@mail.gmail.com>
 <20191126145837.3a28e202@windsurf>
Message-ID: <CA+_SqVZPd=-+sPJKnvFvBDA_0fzQCxeppbYvshTFfnRcp6t-hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 26, 2019 at 2:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 26 Nov 2019 14:55:12 +0100
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > > Instead of just reworking the commit message, I think it would instead
> > > make sense to "git checkout 4b81badbcc0b25678ac6627548160702731cf393"
> > > and test what was the behavior back then.
> >
> > Checked out at 4b81badbcc0b25678ac6627548160702731cf393
> >
> > $ make linux-reconfigure
> > umask 0022 && make -C /home/angelo/DEV/BUILDROOT/buildroot
> > O=/home/angelo/DEV/BUILDROOT/br_qemu_arm/. linux-reconfigure
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_staging_installed
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_target_installed
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_images_installed
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_host_installed
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_built
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_kconfig_fixup_done
> > rm -f /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.stamp_configured
> > /bin/sed -i -e "/\\<CONFIG_KERNEL_GZIP\\>/d"
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > echo 'CONFIG_KERNEL_GZIP=y' >>
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > /bin/sed -i -e "/\\<CONFIG_KERNEL_XZ\\>/d"
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > echo '# CONFIG_KERNEL_XZ is not set' >>
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > /bin/sed -i -e "/\\<CONFIG_CPU_LITTLE_ENDIAN\\>/d"
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > echo 'CONFIG_CPU_LITTLE_ENDIAN=y' >>
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > /bin/sed -i -e "/\\<CONFIG_AEABI\\>/d"
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > echo 'CONFIG_AEABI=y' >>
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > # As the kernel gets compiled before root filesystems are
> > # built, we create a fake cpio file. It'll be
> > # replaced later by the real cpio archive, and the kernel will be
> > # rebuilt using the linux-rebuild-with-initramfs target.
> > /bin/sed -i -e "/\\<CONFIG_DEVTMPFS\\>/d"
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > echo 'CONFIG_DEVTMPFS=y' >>
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > /bin/sed -i -e "/\\<CONFIG_DEVTMPFS_MOUNT\\>/d"
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > echo 'CONFIG_DEVTMPFS_MOUNT=y' >>
> > /home/angelo/DEV/BUILDROOT/br_qemu_arm/build/linux-4.7/.config
> > scripts/kconfig/conf  --olddefconfig Kconfig
>
> So indeed, it only redoes the fixups, and does not regenerate the
> .config from scratch. So there was no regression introduced later, it's
> just that from the start, the -reconfigure behavior did not match what
> the commit log said.

Indeed, so I supposed v3 og the patch has a more suitable commit message.

Thanks again!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
