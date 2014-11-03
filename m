From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 3 Nov 2014 14:47:48 -0800
Subject: [Buildroot] [PATCH v2] gst1-plugins-imx: add package
In-Reply-To: <5457F8C5.5000708@mind.be>
References: <1414636344-8152-1-git-send-email-bisson.gary@gmail.com>
 <5457F8C5.5000708@mind.be>
Message-ID: <CADCpmyOMtq1vf9TtZJ-=JaRR67qiSQoX5k5CZ7T0jqYav2GWeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Luca, All,

On Mon, Nov 3, 2014 at 1:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Gary,
>
>  Thanks for your continued effort on this package. I still have some
> feedback,
> however.


No problem ;-)


> [snip]
> >  source "package/gstreamer1/gst1-plugins-good/Config.in"
> >  source "package/gstreamer1/gst1-plugins-bad/Config.in"
> >  source "package/gstreamer1/gst1-plugins-ugly/Config.in"
> > +source "package/gstreamer1/gst1-plugins-imx/Config.in"
>
>  I'm sorry to return to the naming issue, but shouldn't the package be
> called
> gst1-imx instead of gst1-plugins-imx? We don't use 'plugins' in any other
> gst
> package (except the official plugin bundles), and upstream also doesn't
> have
> 'plugins' in the name.


I see your point and really changing the name doesn't bother me, we just
need to agree on something. How do we organize a vote? irc? ;-) So far
Peter K suggested "gstreamer1-imx", Arnout "gst1-imx" and mine
"gst1-plugins-imx". As a reminder the git repo name is "gstreamer-imx" and
the Yocto recipe is "gstreamer1.0-plugins-imx". Since the first version of
this patch have been integrated two plugins:gst1-libav and gst1-validate
which tends towards a gst1-<name> convention.


> [snip]
> > +config BR2_PACKAGE_GST1_PLUGINS_IMX
> > +     bool "gst1-plugins-imx"
> > +     depends on BR2_LINUX_KERNEL
>
>  Put here a # libfslvpuwrap to make the reason explicit.


Ok


> > +     depends on BR2_arm # Only relevant for i.MX
> > +     depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
> > +     depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>
>  This should be a select.
>

We unfortunately discussed that before and Yann came to the conclusion it
wasn't possible for now [1]. Otherwise this requires reworking all the iMX
platforms selections in freescale-imx packages.

> +     depends on BR2_PACKAGE_LIBFSLVPUWRAP
>
>  This should be a select.
>

As the previous one must be a "depends", this one has to be the same.
Otherwise it gives a "recursive dependency detected!" error:
package/freescale-imx/gpu-viv-bin-mx6q/Config.in:5: symbol
BR2_PACKAGE_GPU_VIV_BIN_MX6Q depends on BR2_PACKAGE_FREESCALE_IMX
package/freescale-imx/Config.in:1: symbol BR2_PACKAGE_FREESCALE_IMX is
selected by BR2_PACKAGE_LIBFSLVPUWRAP
package/libfslvpuwrap/Config.in:5: symbol BR2_PACKAGE_LIBFSLVPUWRAP is
selected by BR2_PACKAGE_GST1_PLUGINS_IMX
package/gstreamer1/gst1-plugins-imx/Config.in:9: symbol
BR2_PACKAGE_GST1_PLUGINS_IMX depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q


> > +     select BR2_PACKAGE_GST1_PLUGINS_BASE
> > +     help
> > +       This is a set of GStreamer 1.0 plugins for plugins for
> Freescale's
> > +       i.MX platform, with emphasis on video en/decoding using the i.MX
> > +       VPU engine.
> > +
> > +       Currently, this software has been tested only with the i.MX6 SoC
> > +       family and requires a kernel that includes the i.MX6 specific
> > +       headers to be built.
>
>  As far as I understand, it's _only_ for i.MX6 and i.MX7, not for the older
> ones. So perhaps that should be clarified.
>

Ok. This came from the Git repo readme, I will clarify on iMX6 only but I'd
rather not state iMX7 not for people to be confused.

> +
> > +       The software as a whole is currently in beta stage.
> > +
> > +       More info at https://github.com/Freescale/gstreamer-imx
>
>  Leave out the 'More info at'.


Ok.

[snip]
> > +define GST1_PLUGINS_IMX_CONFIGURE_CMDS
> > +     (cd $(@D); \
> > +             $(TARGET_CONFIGURE_OPTS)        \
> > +             $(HOST_DIR)/usr/bin/python2 ./waf configure \
> > +             $(GST1_PLUGINS_IMX_CONF_OPTS) \
> > +     )
>
>  I realize that this is probably just copy-paste from somewhere else, but
> there
> is no need at all for the ()s. It just forks another shell with no good
> reason.


Ok.

Once we all agree on the naming + dependency issue I will submit a v3.

Thanks,
Gary

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/109264.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141103/8caea031/attachment.html>
