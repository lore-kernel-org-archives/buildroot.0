From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Mon, 12 Jun 2017 15:20:32 +0200
Subject: [Buildroot] [PATCH] syslinux: Add patch to build with the
 latest gnu-efi release
In-Reply-To: <20170611153750.22323da6@windsurf.home>
References: <1497003638-17662-1-git-send-email-benoit.allard@greenbone.net>
 <20170611153750.22323da6@windsurf.home>
Message-ID: <20170612152032.5c2c99ae@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Jun 2017 15:37:50 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Fri,  9 Jun 2017 12:20:38 +0200, Beno?t Allard wrote:
> > Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> > ---
> >  ...definition-is-now-part-of-the-exports-of-.patch | 37
> > ++++++++++++++++++++++ ..._BASE_CODE-struct-has-been-renamed-to-EFI.patch
> > | 30
> > ++++++++++++++++++ ...longjump-calls-to-fit-the-new-declaration.patch
> > | 37 ++++++++++++++++++++++ 3 files changed, 104 insertions(+)
> > create mode 100644
> > boot/syslinux/0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
> > create mode 100644
> > boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch
> > create mode 100644
> > boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch
> 
> I've applied your patch. It does fix some build issues with gnu-efi.

Thanks about that !

> However here the build of syslinux doesn't complete successfully. With
> the following defconfig:
> 
> BR2_x86_64=y
> BR2_x86_core2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.02-1096-g54a5333.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_SYSLINUX=y
> BR2_TARGET_SYSLINUX_ISOLINUX=y
> BR2_TARGET_SYSLINUX_EFI=y
> 
> I get:
> 
> /home/thomas/projets/buildroot/output/host/usr/bin/x86_64-linux-gcc /home/thomas/projets/buildroot/output/build/syslinux-6.03/efi/wrapper.c
> -o
> wrapper /home/thomas/projets/buildroot/output/build/syslinux-6.03/efi64/efi/wrapper
> syslinux.so syslinux.efi
> make[5]: /home/thomas/projets/buildroot/output/build/syslinux-6.03/efi64/efi/wrapper:
> Command not found
> 
> The problem is that it builds a tool called "wrapper" with the
> cross-compiler, and then tries to run it on the host. It might work if
> your host and target use the same architecture and libc. Here, I'm
> using the same architecture (x86-64) but not the same libc (glibc for
> the host, uclibc for the target).
> 
> Do you think you could have a look?

I just sent a patch about that. Thanks for noticing, and reporting the
issue.

> 
> > +Subject: [PATCH 1/3] The VPrint definition is now part of the
> > exports of
> > + gnu-efi
> 
> Nit: please use 'git format-patch -N' to generate your patches. This
> will generate patches with [PATCH] as a prefix instead of [PATCH X/Y].
> Indeed, the 1/3, 2/3 and 3/3 in your patches don't make sense: your
> patches are patches 7, 8 and 9! To avoid this, in Buildroot, we have
> decided to not add numbering inside the patches themselves.
> 

Maybe it would make sense to add the '-N' to the example command-lines
in the manual ? ;) ( That would be section 21.5.2 and 21.5.4)

Thanks !
Ben.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170612/4e925a6a/attachment.asc>
