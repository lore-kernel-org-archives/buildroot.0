From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 23:27:11 +0100
Subject: [Buildroot] [PATCH 10/10] gst1-imx: bump to version 0.12.0
In-Reply-To: <CAAMH-yufkAQV7p50daw=VYTGeM41RvtpYKsZGzRwZ2K_vKVbxQ@mail.gmail.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-11-git-send-email-gary.bisson@boundarydevices.com>
 <20160201214437.66ddff9e@free-electrons.com>
 <CAAMH-yufkAQV7p50daw=VYTGeM41RvtpYKsZGzRwZ2K_vKVbxQ@mail.gmail.com>
Message-ID: <20160201232711.1e2c85a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Feb 2016 22:20:36 +0100, Gary Bisson wrote:

> > So it no longer depends on the GPU stuff ?
> 
> No, you can build this package without the GPU backend which implies
> the GPU sinks won't be built. The end goal is for i.MX7 which doesn't
> have any GPU, right now I have to include the GPU binaries just to
> build the pxp/v4l plugins.

ACK, makes sense.

> >> -     depends on BR2_PACKAGE_LIBFSLVPUWRAP
> >>       select BR2_PACKAGE_GST1_PLUGINS_BASE
> >> +     select BR2_PACKAGE_GST1_IMX_IPU_PLUGIN
> >> +     select BR2_PACKAGE_GST1_IMX_PXP_PLUGIN
> >
> > This is weird. If you "select" these options here, it means that there
> > is no way to disable those options. So why are they options in the
> > first place ?
> 
> I just wanted to make it explicit that the package will at least build
> those two plugins. Then leaving it up to the user to select whichever
> plugin he wants. There actually is no option to disable plugins from
> the packages, it's all a question of dependency. As soon as the i.MX
> linux kernel is built, PXP and IPU will be. As soon as the GPU
> libraries are includes, GPU sink plugins will be built.

Hum, then it is not good, because it means that even if you disable the
GPU sink plugin options, but still have the GPU libraries enabled, the
GPU sink plugins will be installed on your target. This is very
confusing.

I think you should remove the sub-options, and then simply expand the
Config.in help text of the main option to say:

 - The IPU and PXP plugins are always built.
 - The GPU sink plugin is built when ... is enabled.
 - The ... plugin is built when ... is enabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
