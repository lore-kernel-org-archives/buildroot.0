From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 24 Dec 2014 09:03:01 +0000
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <20141223231052.6973e707@free-electrons.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
 <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
 <1419337919.2781.6.camel@synopsys.com>
 <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
 <1419345339.2781.9.camel@synopsys.com>
 <20141223205201.021ee085@free-electrons.com>
 <1419369534.3284.4.camel@synopsys.com>
 <20141223231052.6973e707@free-electrons.com>
Message-ID: <1419411780.3420.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2014-12-23 at 23:10 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 23 Dec 2014 21:18:56 +0000, Alexey Brodkin wrote:
> 
> > Interesting, then how it worked for me?
> > 
> > I have the same login prompt as usual:
> > --->---
> > Welcome to Buildroot
> > buildroot login:
> > --->---
> > 
> > Here I enter "root" as usual, press Enter and that's it.
> > "whoami" says "root" and I may modify any files etc.
> > 
> > What do I do wrong?
> 
> Weird, when I tested I had to add "console" to /etc/securetty,
> otherwise login would not let me log in as root. Are you using just
> Busybox, or some other login/getty implementation? Are you using an
> unmodified /etc/securetty?

Indeed it's strange.
I've just re-tested it and still see root login working perfectly.

I'm on mainline/master branch with my patch applied (no other changes):
--->---
(my patch) 7af7de3 system: run getty on boot console by default
f7add51 qemu: add host/target Linux version check
--->---

And this is output of "make savedefconfig":
--->---
BR2_x86_pentiumpro=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.18"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.18.config"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
--->---

Note that this is based on "qemu_x86_defconfig" and with my patch
applied that's why you don't see mention of "console".

You may try even without my patch and manually set
BR2_TARGET_GENERIC_GETTY_PORT=console

-Alexey
