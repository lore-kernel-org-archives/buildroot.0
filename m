From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 4 Mar 2016 10:17:58 +0100
Subject: [Buildroot] [PATCH v2 2/4] libfslcodec: add missing configure
 options
In-Reply-To: <20151214212854.GB10029@t450s.lan>
References: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
 <1449755560-2911-3-git-send-email-gary.bisson@boundarydevices.com>
 <20151213203224.GC27769@free.fr> <20151214212854.GB10029@t450s.lan>
Message-ID: <20160304091758.GA20721@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Mon, Dec 14, 2015 at 10:28:54PM +0100, Gary Bisson wrote:
> Yann, All,
> 
> On Sun, Dec 13, 2015 at 09:32:24PM +0100, Yann E. MORIN wrote:
> > Gary, All,
> > 
> > On 2015-12-10 14:52 +0100, Gary Bisson spake thusly:
> > > Enable VPU and hard float support when the proper configuration is setup.
> > > BR2_ARM_EABIHF=y
> > > BR2_PACKAGE_IMX_VPU=y
> > > 
> > > See Yocto equivalent:
> > > https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
> > > multimedia/libfslcodec/libfslcodec.inc
> > > 
> > > Tested with the Linaro ARM 2014.09 toolchain.
> > > 
> > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > > ---
> > > 
> > > Thanks to those options, I could see that:
> > > - lib_jpeg_dec_arm11_elinux_novpu.so isn't copied
> > > - lib_peq_arm11_elinux.so.1.fhw is copied instead of the fsw version
> > > 
> > > Regards,
> > > Gary
> > > 
> > > ---
> > >  package/libfslcodec/libfslcodec.mk | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
> > > index f8c6aa8..05e5edb 100644
> > > --- a/package/libfslcodec/libfslcodec.mk
> > > +++ b/package/libfslcodec/libfslcodec.mk
> > > @@ -13,6 +13,14 @@ LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c
> > >  LIBFSLCODEC_LICENSE_FILES = EULA COPYING
> > >  LIBFSLCODEC_REDISTRIBUTE = NO
> > >  
> > > +ifeq ($(BR2_ARM_EABIHF),y)
> > > +LIBFSLCODEC_CONF_OPTS += --enable-fhw
> > > +endif
> > 
> > What about adding --disable-fhw when not EABIhf?
> 
> The configure only looks for enable-fhw and therefore considers the
> features is disabled by default.
> 
> > > +ifeq ($(BR2_PACKAGE_IMX_VPU),y)
> > > +LIBFSLCODEC_CONF_OPTS += --enable-vpu
> > > +endif
> > 
> > Ditto when imx-vpu is not enabled?
> 
> Same here for the vpu option, configure only looks for the enable
> option.

Sorry for reviving this thread (again), but I was thinking that maybe we
could merge the two "missing configure options" patches from the series
since they do not depend on the libraries location fix.

Then I could offer another version of the series with only the path fix.
I'm still unclear on which option would get those patches approved. I
understand the symbolic links aren't great. I'm considering removing
gst-fsl-plugins for GStreamer0.10 since Yocto did it:
https://github.com/Freescale/meta-fsl-arm/commit/83b240e7

Let me know your thoughts.

Thanks,
Gary
