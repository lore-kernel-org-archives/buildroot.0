From: Guo Ren <guoren@kernel.org>
Date: Sat, 1 Jun 2019 09:19:32 +0800
Subject: [Buildroot] [PATCH V4 10/11] configs/qemu_cskyXXX_virt: new
 defconfig
In-Reply-To: <20190531230920.302c0222@windsurf>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
 <1559284748-32011-11-git-send-email-guoren@kernel.org>
 <20190531230920.302c0222@windsurf>
Message-ID: <CAJF2gTQOA9=U+yrtUPyWCOXmi40Vvf=CS9u7ae+8+BA=Ftfikg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jun 1, 2019, 05:09 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Guo;
>
> On Fri, 31 May 2019 14:39:07 +0800
> guoren at kernel.org wrote:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Add C-SKY defconfig for QEMU virt machine.
> >
> > Tested with https://gitlab.com/c-sky/buildroot/pipelines
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  .gitlab-ci.yml                      |   4 +
> >  board/qemu/csky/610_defconfig       | 526
> +++++++++++++++++++++++++++++++++++
> >  board/qemu/csky/807_defconfig       | 531
> +++++++++++++++++++++++++++++++++++
> >  board/qemu/csky/810_defconfig       | 531
> +++++++++++++++++++++++++++++++++++
> >  board/qemu/csky/860_defconfig       | 533
> ++++++++++++++++++++++++++++++++++++
>
> These kernel defconfig files are too long, they contain lots of options
> that seem unnecessary. Could you trim them down by removing many
> unnecessary options ?
>
I'll try. See my next version of the patch.


> Also, perhaps there could be a file with the set of common options, and
> a fragment for each CPU core, to avoid all the duplication ?
>
Good idea, I'll do this.


> In addition, they should have a name that makes it clear they are Linux
> kernel configuration file.
>
Ok.


> >  configs/qemu_csky610_virt_defconfig |  29 ++
> >  configs/qemu_csky807_virt_defconfig |  30 ++
> >  configs/qemu_csky810_virt_defconfig |  30 ++
> >  configs/qemu_csky860_virt_defconfig |  30 ++
> >  9 files changed, 2244 insertions(+)
>
> Please add the appropriate board/qemu/csky/readme.txt file to explain
> how to run these in Qemu, and which Qemu version it was tested with.
>
Ok, another patch for board/qemu/csky/readme.txt


> Finally, make sure to add the appropriate entries to the DEVELOPERS
> file.
>
Ok, another patch


>
> > diff --git a/configs/qemu_csky860_virt_defconfig
> b/configs/qemu_csky860_virt_defconfig
> > new file mode 100644
> > index 0000000..118ad51
> > --- /dev/null
> > +++ b/configs/qemu_csky860_virt_defconfig
> > @@ -0,0 +1,30 @@
> > +# Architecture
> > +BR2_csky=y
> > +BR2_ck860=y
> > +
> > +# System
> > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>
> We typically don't enable mdev in minimal defconfigs.
>
En... this help to setup ttyS0-3, without the option, boot up to login will
fail.


> > +BR2_TARGET_ROOTFS_INITRAMFS=y
> > +
> > +# Toolchain
> > +BR2_OPTIMIZE_2=y
> > +BR2_SHARED_STATIC_LIBS=y
> > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > +BR2_PACKAGE_HOST_GDB=y
> > +BR2_TARGET_OPTIMIZATION="-mbacktrace"
>
> Please drop these options, and keep the default.
>
The -mbacktrace is necessary, it makes fp lr saved in stack. All other
archs default enable it in gcc, but ours is not default enabled in gcc. We
need enable it in buildroot and then perf callgraph work.


> > +
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/csky/860_defconfig"
> > +
> > +# Packages on board
> > +BR2_PACKAGE_LINUX_TOOLS_PERF=y
> > +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> > +BR2_PACKAGE_GDB=y
> > +BR2_PACKAGE_BASH=y
> > +BR2_PACKAGE_KMOD=y
> > +BR2_PACKAGE_UTIL_LINUX=y
> > +BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
>
> Ditto, please drop these "Packages on board" options: our defconfig
> should be minimal, i.e build just a bootloader (if needed), a Linux
> kernel image and the default Buildroot package set (just Busybox).
>
I'll try to remove these but we need minimal boot up the shell. See my next
version of the patch.

Best Regards
 Guo Ren
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190601/95ac4578/attachment.html>
