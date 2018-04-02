From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 08:51:15 +0200
Subject: [Buildroot] [PATCH v4 10/11] package/mesa3d: enable OpenCL
 support
In-Reply-To: <CAPP7BN2mqQ1kV9_hkn2K7FgY3T0OWFrsvrJcZzSMi0Pj9OMg1Q@mail.gmail.com>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-11-valentin.korenblit@smile.fr>
 <20180401233226.76803d73@windsurf>
 <CAPP7BN2mqQ1kV9_hkn2K7FgY3T0OWFrsvrJcZzSMi0Pj9OMg1Q@mail.gmail.com>
Message-ID: <20180402085115.350f9b6b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Erik,

On Mon, 2 Apr 2018 07:23:23 +0200, Erik Larsson wrote:

> > This is certainly not really understanding how OpenCL works, but why do
> > you need this Gallium driver compiled in? Does the result only works on
> > a system with an AMD GPU ?  
> 
> What about creating a virtual package for OpenCL just as with OpenVG?

We will certainly need something like this at some point. Though I
believe it can be handled separately from Valentin's series. I think in
Valentin's series the only package that will need to be reworked to
make use of an opencl virtual package is clinfo, and it will be
trivial to convert it to use the opencl virtual package instead of
directly mesa3d.

> I've started to work on patch series were OpenCL is a virtual package
> but I'm not 100% finished. I still need more testing and add some
> packages that do not use the new virtual package of OpenCL. I also
> need to add more platforms that provide OpenCL. I've pushed some
> patches to GitHub that is my draft/work-in-progress branch,
> https://github.com/ortogonal/buildroot/commits/wip/opencl. If you like
> it I can speed up the work with it!

This definitely looks nice to have. You forgot to update the
<pkg>_PROVIDES line in the OpenCL providers. For example:

IMX_GPU_VIV_PROVIDES = libegl libgles libopenvg

must be updated to:

IMX_GPU_VIV_PROVIDES = libegl libgles libopenvg libopencl

Your tesseract-ocr change doesn't look good:

+config BR2_PACKAGE_TESSERACT_OCR_OPENCL_SUPPORT
+	bool "tesseract-ocr with OpenCL support"
+	depends on BR2_PACKAGE_HAS_LIBOPENVG

The last line should be about BR2_PACKAGE_HAS_LIBOPENCL.

Also, in all packages, we want to pass an explicit --enable-<foo> to
enable the feature, instead of letting the autodetection do its work.
So typically, we want:

ifeq ($(BR2_<pkg>_FEATURE),y)
<pkg>_DEPENDENCIES += libfeature
<pkg>_CONF_OPTS += --enable-feature
else
<pkg>_CONF_OPTS += disable-feature
endif

There are a few other nits here and there that will be either to point
when the series gets posted. But generally, it looks simple and
straightforward, so it's on the right track!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
