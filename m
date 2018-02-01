From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Feb 2018 11:20:39 +0200
Subject: [Buildroot] [PATCH] imx-alsa-plugins: new package
In-Reply-To: <1517476011.2404.9.camel@embedded.rocks>
References: <20180128212346.23249-1-joerg.krause@embedded.rocks>
 <20180201085554.GA690@gmail.com>
 <1517476011.2404.9.camel@embedded.rocks>
Message-ID: <20180201092039.hl4li2jfkkm66inx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Thu, Feb 01, 2018 at 10:06:51AM +0100, J?rg Krause wrote:
> On Thu, 2018-02-01 at 09:55 +0100, Marcus Folkesson wrote:
> > On Sun, Jan 28, 2018 at 10:23:46PM +0100, J?rg Krause wrote: 
> > > diff --git a/package/freescale-imx/imx-alsa-plugins/Config.in b/package/freescale-imx/imx-alsa-plugins/Config.in
> > > new file mode 100644
> > > index 0000000000..57ce6216f3
> > > --- /dev/null
> > > +++ b/package/freescale-imx/imx-alsa-plugins/Config.in
> > > @@ -0,0 +1,23 @@
> > > +config BR2_PACKAGE_IMX_ALSA_PLUGINS
> > > +	bool "imx-alsa-plugins"
> > > +	depends on BR2_arm # Only relevant for i.MX
> > > +	depends on BR2_LINUX_KERNEL
> > > +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> > > +	select BR2_PACKAGE_ALSA_LIB
> > > +	help
> > > +	  ALSA plugins specific for the Freescale i.MX platform. It
> > > +	  requires a kernel that includes the i.MX specific headers
> > > +	  to be built.
> > > +
> > > +	  The following plugins are provided so far:
> > > +	    * Rate Converter Plugin Using Freescale ASRC Hardware
> > > +	      Resampler (i.MX53 and most i.MX6)
> > > +
> > > +	  This package is provided by Freescale as-is and doesn't have
> > > +	  an upstream.
> > > +
> > > +comment "imx-alsa-libs needs an imx-specific Linux kernel to be built"
> > > +	depends on BR2_arm && !BR2_LINUX_KERNEL
> > > +
> > > +comment "imx-alsa-libs needs a toolchain w/ threads"
> > > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> > 
> > Should we not be depend on BR2_arm here as well?
> 
> There are two comments. One for the imx-specific Linux kernel and one
> for the threads-dependency.

But we don't want the threads dependency comment to show when the architecture 
is something other than arm. This is because adding threads support would only 
eliminate the comment, but the imx-alsa-plugins package will still not be 
selectable.

We usually do this in a separate 'depends' line, so:

comment "imx-alsa-libs needs a toolchain w/ threads"
    depends on BR2_arm
    depends on !BR2_TOOLCHAIN_HAS_THREADS

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
