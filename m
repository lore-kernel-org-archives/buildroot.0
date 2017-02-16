From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Feb 2017 07:57:45 +0200
Subject: [Buildroot] uImage support for aarch64
In-Reply-To: <CAJJmP9DDR4B6miuUmJZC-ApNxbmwTUvUXUQFVBX11wYA99E36w@mail.gmail.com>
References: <CAJJmP9D0JFq8Wjbp2MX+mXdca6Up+3z0XJ1Xs3ojc8UcU2p11Q@mail.gmail.com>
 <20170214191756.s6huaepb46ocxni5@tarshish>
 <CAJJmP9DDR4B6miuUmJZC-ApNxbmwTUvUXUQFVBX11wYA99E36w@mail.gmail.com>
Message-ID: <20170216055745.wl66oauyj3padslh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Wed, Feb 15, 2017 at 03:58:46PM -0800, chris warth wrote:
> Thanks for the explanation of why uImage is deprecated for aarch64.

No. uImage is deprecated for ARM. Aarch64 never supported uImage.

> Does buildroot have support for building any compressed linux image
> format for aarch64?

The Aarch64 kernel provides various compressed image targets, Image.gz, 
Image.lzma, etc. See the complete list in arch/arm64/boot/Makefile. To make 
Buildroot generate one for you need to set BR2_LINUX_KERNEL_IMAGE_TARGET_NAME 
to the image name you need.

> It seems surprising, but the only available image format listed in
> linux/Config.in for aarch64 is BR2_LINUX_KERNEL_IMAGE.  uImage is not
> available and neither is zImage.  Am I missing some trick to creating
> compressed images?

The Aarch64 kernel supports neither uImage nor zImage (i.e., self extracting 
image). The job of uncompressing the kernel image on target is left to the 
bootloader.

baruch

> On Tue, Feb 14, 2017 at 11:17 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > uImage is deprecated on ARM 32bit as well. U-Boot added support for native
> > zImage a few years back.
> >
> > The problem with uImage is that kernel load address is hard codes in the
> > uImage header. This prevents multi-platform compatibility, since RAM physical
> > location and size varies on different platforms. zImage is much more flexible
> > in this regard.
> >
> > As for BR2_LINUX_KERNEL_APPENDED_UIMAGE, this is only useful when the
> > bootloader is too old to support device tree. Being a relatively new
> > architecture, and DT based from the start, I'm pretty sure there is no such
> > bootloader for ARM64. Besides, ARM64 does not support the appended DTB trick
> > to begin with.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
