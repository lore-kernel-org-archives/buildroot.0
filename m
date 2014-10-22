From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Wed, 22 Oct 2014 11:40:35 -0300
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141022144035.GA14514@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann,

On Fri, Sep 26, 2014 at 08:22:54PM -0300, Guido Mart?nez wrote:
> Currently, if we run "make linux-rebuild", the device tree blob gets
> appended twice to the kernel image, rendering the latter append useless.

I'm still finding this problem on current BR. I believe it always
happens when one uses an appended DT, but I'm attaching a defconfig that
reproduces it just in case.

You can check that the problem exists by running linux-rebuild and
checking for some DT string.

   $ make
      [...]
   $ strings output/images/uImage | grep am335x-bone
   ti,am335x-bone
   $ make linux-rebuild
      [...]
   $ strings output/images/uImage | grep am335x-bone
   ti,am335x-bone
   ti,am335x-bone

I have a patch that fixes this for the uImage+dt case, but it messes up
some other builds. Likely, to properly fix this, it should be a pretty
invasive change. I think adding a output/build/linux-staging directory
and doing all the DT appends and uImage creation there (without messing
with the kernel tree) would work.

Cheers!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
-------------- next part --------------
BR2_arm=y
BR2_cortex_a8=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-boneblack"
