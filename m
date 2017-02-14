From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Feb 2017 21:17:56 +0200
Subject: [Buildroot] uImage support for aarch64
In-Reply-To: <CAJJmP9D0JFq8Wjbp2MX+mXdca6Up+3z0XJ1Xs3ojc8UcU2p11Q@mail.gmail.com>
References: <CAJJmP9D0JFq8Wjbp2MX+mXdca6Up+3z0XJ1Xs3ojc8UcU2p11Q@mail.gmail.com>
Message-ID: <20170214191756.s6huaepb46ocxni5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cris,

On Tue, Feb 14, 2017 at 08:00:47AM -0800, chris warth wrote:
> Can anyone shed some light on why uImage with device tree is not a
> supported format for the aarch64 architecture under Buildroot?  (see
> the definition of BR2_LINUX_KERNEL_APPENDED_UIMAGE in linux/Config.in)
> 
> The appended uImage options in linux/Config.in seem to be dependent on
> the BR2_arm or BR2_armeb.  In fact the base uImage format does not
> appear to be supported for BR2_aarch64 at all.
> 
> Is this an oversight or is there a technical challenge to supporting
> AARCH64 images in uImage format?

uImage is deprecated on ARM 32bit as well. U-Boot added support for native 
zImage a few years back.

The problem with uImage is that kernel load address is hard codes in the 
uImage header. This prevents multi-platform compatibility, since RAM physical 
location and size varies on different platforms. zImage is much more flexible 
in this regard.

As for BR2_LINUX_KERNEL_APPENDED_UIMAGE, this is only useful when the 
bootloader is too old to support device tree. Being a relatively new 
architecture, and DT based from the start, I'm pretty sure there is no such 
bootloader for ARM64. Besides, ARM64 does not support the appended DTB trick 
to begin with.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
