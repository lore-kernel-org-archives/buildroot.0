From: bruce bushby <bruce.bushby@gmail.com>
Date: Tue, 24 Jun 2014 21:47:18 +0100
Subject: [Buildroot] dtb or dtsi ?
In-Reply-To: <CAAXf6LXV=jRqpCpx5FU31cNVcVXe_wNK6ut6GvWQzOF1bcrbLA@mail.gmail.com>
References: <CAHvj1qbZWcdUvq7du=Xo2KXpA_WjXvPr8+wg61niR7TeLVToRw@mail.gmail.com>
 <CAAXf6LXV=jRqpCpx5FU31cNVcVXe_wNK6ut6GvWQzOF1bcrbLA@mail.gmail.com>
Message-ID: <CAHvj1qZ10p-6ju73YS+Z4mePBEzV9rbR7F1MkUmfa51y5jbt9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thank you for the explanation, makes a lot more sense now. It is as you say:
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-cubietruck.dts:/include/
"sun7i-a20.dtsi"
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-cubietruck.dts:/include/
"sunxi-common-regulators.dtsi"

the dts files include the dtsi files.

I looked a little closer at my error:
    ....  No rule to make target `arch/arm/boot/dts/sun7i-a20.dtb'

One look in the "dts" Makefile further explained things:
[bruce at core buildroot]$ cat
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/Makefile
| egrep "sun7|cub"
sun4i-a10-cubieboard.dtb \
sun7i-a20-cubieboard2.dtb \
sun7i-a20-cubietruck.dtb \
sun7i-a20-i12-tvbox.dtb \
sun7i-a20-olinuxino-micro.dtb
dove-cubox.dtb \
[bruce at core buildroot]$


Cheers
Bruce









On Tue, Jun 24, 2014 at 10:36 AM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Bruce,
>
> On Tue, Jun 24, 2014 at 11:22 AM, bruce bushby <bruce.bushby@gmail.com>
> wrote:
> > Hi
> >
> >
> > Apologies if these are junior/lazy questions....but I've been struggling
> for
> > 5 days now :(
> >
> > What is the difference between "dtb" and "dtsi"?
> >
>
> dtb = device tree blob
> dts = device tree source
> dtsi = like dts, but I think the 'i' is to indicate that this file is
> supposed to be included in another dts(i) file.
>
> The dtb is the compiled version of the dts(i).
>
> >
> > I find that buildroot appends ".dtb" to the name defined by:
> > BR2_LINUX_KERNEL_INTREE_DTS_NAME
> >
> > rather then append "dtsi"  ...what am I missing?
> >
> >
> > I feel I should be using
> > BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20.dtsi"
>
> You should set a 'dts' file here, not dtsi. The dtsi is supposed to be
> included from a toplevel dts file, and there exist make rules to
> convert dts->dtb but not dtsi->dtb.
> Note: the compilation step is done by dtc (device tree compiler).
>
> >
> >
> > make[1]: Entering directory
> >
> `/disk/software/drone/buildroot/output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee'
> > make[2]: *** No rule to make target `arch/arm/boot/dts/sun7i-a20.dtb'.
> > Stop.
> > make[1]: *** [sun7i-a20.dtb] Error 2
> >
> >
> >
>
> You should find/create the proper .dts file instead, then this step will
> work.
>
>
> >  ....Do I still need "fex" if i am using "dts"?
>
> I suppose not. According to wikipedia fex is a proprietary alternative
> to device trees, and so you shouldn't need both. I haven't worked with
> fex nor allwinner before.
>
>
>
> Best regards,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140624/bf2b2851/attachment.html>
