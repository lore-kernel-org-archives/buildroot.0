From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 21 Sep 2016 10:32:58 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160921060213.2f292837@free-electrons.com>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
 <20160920224355.l76a3kggupuiugok@t450s.lan>
 <20160921060213.2f292837@free-electrons.com>
Message-ID: <20160921083258.4ngcz3pphrgjyp46@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Wed, Sep 21, 2016 at 06:02:13AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 21 Sep 2016 00:43:55 +0200, Gary Bisson wrote:
> 
> > Well in most cases it isn't possible, here are some details:
> > - BR2_PACKAGE_IMX_GPU_VIV and BR2_PACKAGE_IMX_GPU_VIV_G2D depends on
> >   BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q which isn't selectable.
> > - We can't select BR2_LINUX_KERNEL since it needs to be a i.MX kernel.
> > - BR2_PACKAGE_LIBIMXVPUAPI depends on the i.MX SoC being used which
> >   cannot be selectable (MX5 or MX6)
> 
> OK, indeed many of the sub-options cannot "select" their dependencies.
> 
> > I guess I can select IMX_CODEC though, I'll add that to the V2.
> 
> OK. Another possibility is to say that all sub-options should use
> "depends on", for consistency. I don't have a strong feeling about this
> either way.

I'm ok with a few select, it sounds more user-friendly than depends-only
but I don't have a strong opinion on it either.

> > >  1/ Add an explicit --enable-<foo> for each option  
> > 
> > This was on purpose since the package only look for --disable-foo
> > options. All the plugins are enabled by default, see patch in package:
> > https://github.com/Freescale/gstreamer-imx/commit/989ab048
> > 
> > I can still do:
> > ifeq ($(BR2_PACKAGE_FOO),y)
> 
> Here add the dependency addition.
> 
> > else
> > BAZ_CONF_OPTS += --disable-foo
> > endif
> > 
> > But my opinion is that --enable-foo is misleading.
> 
> Why? There are two options here:
> 
>  1/ --enable-<foo> doesn't exist and would cause a failure if passed.
>     In this case indeed, don't pass it. And add a quick comment above,
>     like "# There's no --enable-<foo> option".

No, as pointed above in the package repo, the --enable-foo doesn't exist
and is discarded. It doesn't introduce any error, but it is just that we
are passing arguments that we know are discarded, is it really
necessary? I might go with the comment although there's no failure if
the option is passed, what do you think?

Regards,
Gary
