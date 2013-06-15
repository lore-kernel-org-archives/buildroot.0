From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jun 2013 18:28:18 +0200
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <CALo-6+jW937J=BmkEpDPe65LCrXUaKUeyWrNestbi2dHmciq-g@mail.gmail.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
 <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
 <CALo-6+jEOu+5pTr2oizokQexOdm1EimxYhM-Q1sHEnJ_oBFMog@mail.gmail.com>
 <20130614222254.56e49fcb@skate>
 <CALo-6+jW937J=BmkEpDPe65LCrXUaKUeyWrNestbi2dHmciq-g@mail.gmail.com>
Message-ID: <20130615182818.4c685515@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Fri, 14 Jun 2013 13:58:57 -0700, Charles Krinke wrote:

> Behind my comments is the issue of TI's practices and I hope we dont
> make it worse by tweaking buildroot in an unusual direction, but I
> will, as usual, follow your lead.
> 
> My perspective is from working with the TI AM3517_evm for the last
> year. One of the issues is the fact that TI supplies their kernel
> source out-of-tree as a distribution release. As a consequence no one
> cannot expect kernel.org kernels to work properly for at least this
> reference design.  That is, the TI kernel modifications never made it
> into the mainline kernel, so we have a non-kernel.org situation to
> start with. This should cause buildroot to tread carefully unless we
> also get the patches from TI that change a standard kernel into a
> TI-special kernel.

As Yann already highlighted, we already have in Buildroot several cases
where we're using other kernels than the mainline one: the
rpi_defconfig, phy3250_defconfig, nitrogen6x_defconfig,
gnublin_defconfig, ea3250_defconfig, fdi3250_defconfig,
beaglebone_defconfig, arm_foundationv8_defconfig. All of these default
configurations are using special kernel trees from custom Git trees. I
believe we clearly would all prefer the support for those platforms to
be available in the mainline Linux kernel, but on the other hand, when
one has an embedded Linux project to make, one isn't necessarily given
the time required to mainline the entire kernel support for the
hardware platform.

Another example are the Freescale specific libraries packaged in
package/freescale-imx/. From package/freescale-imx/imx-lib/Config.in:

comment "imx-lib needs an imx-specific kernel to be built"
        depends on BR2_arm && !BR2_LINUX_KERNEL

config BR2_PACKAGE_IMX_LIB
        bool "imx-lib"
        depends on BR2_LINUX_KERNEL
        depends on BR2_arm # Only relevant for i.MX
        help
          Library of userspace helpers specific for the Freescale i.MX
          platform. It wraps the kernel interfaces for some i.MX platform
          specific drivers. It requires a kernel that includes the i.MX
          specific headers to be built.

          This library is provided by Freescale as-is and doesn't have
          an upstream.

The TI-specific kernel modules needed to enable graphics features fall
in exactly the same category, and I don't see why we wouldn't support
them in Buildroot.

Again, having fully open-source and mainline support for those graphics
features would be a lot better, but we also have for now to live with
what exists, and allow Buildroot users to easily enable OpenGL and
similar technologies when they do AM3xxx or OMAP3 based projects.

> On the Graphics_SDK, since this is a product that TI releases along
> with their kernel from time-to-time. Since this is also not an
> opensource project, I have some angst with patching the released
> Graphics_SDK. This doesnt make any sense to me since this product
> along with the kernel are releases from TI.

I'm still not sure to understand your concerns. Is it a licensing
concern? A Buildroot packaging complexity concern? Something else?

> So, I guess the key issue is mixing distribution releases from a
> vendor with traditional, well-known opensource projects and how
> buildroot can best move forward.

My vision is that Buildroot already has pretty good support for many of
the well-known opensource projects used in embedded systems, and the
community has been very good at maintaining and increasing a large
number of such packages. However, one area where I believe Buildroot is
lacking is in supporting the multimedia features of many ARM SoCs, and
even though today such features are generally supported through
specific kernels and binary-only libraries, having support for such
features in Buildroot is important if we want Buildroot to remain
relevant for embedded systems where those features are needed.

Of course, I'm all open to listen to your concerns, and I'm interested
in understanding in more details what your concerns are.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
