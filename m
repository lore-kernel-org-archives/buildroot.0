From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 7 Mar 2016 11:07:10 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-03
In-Reply-To: <20160304212419.6529ec0c@free-electrons.com>
References: <20160304073022.647E6102375@stock.ovh.net>
 <CAAMH-ytHBRRC7A3aOynB6TVyJgr82dge8s1pMemreE4N_aXF5w@mail.gmail.com>
 <20160304212419.6529ec0c@free-electrons.com>
Message-ID: <CAAMH-yvg94GdZ-cdDi_CyoHod3MMbiZzbgvxDA1BhTyAXzC2=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Mar 4, 2016 at 9:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Gary,
>
> On Fri, 4 Mar 2016 16:13:29 +0100, Gary Bisson wrote:
>
> > > Classification of failures by reason
> > > ====================================
> > >
> > >               host-libcap-2.24 | 22
> > >      python-cryptography-1.2.2 | 22
> > >            libimxvpuapi-0.10.1 | 5
> >
> > I've looked at the libimxvpuapi failures and they are actually imx-vpu failures.
> >
> > The latest imx-vpu only builds if the PLATFORM is MX27, MX53 or MX6Q
> > but our default is MX25. So the imx-vpu package just does nothing and
> > then libimxvpuapi fails during configuration because libvpu is
> > missing.
>
> Thanks for investigating!

NP, actually I suspect this issue has been there for quite some time.

> > I'm looking into a solution but those FREESCALE_IMX_PLATFORM_* are not
> > easy to play with.
>
> What do you find not easy with those options?

The problem with those platform variables is that you can't select
them nor you can make imx-vpu easily dependent of them.

It requires to change all the packages that select imx-vpu
(libimxvpuapi, libfslvpuwrap, gst-fsl-plugins) with redundant
information like:
depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS || \
        BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || \
        BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
        BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

Although I don't think it's possible, it'd be great to have a macro like:
depends on FREESCALE_IMX_PLATFORM_HAS_VPU()

And then the macro would be defined in freescale-imx.mk to easily
update it in the future.

Or we could drop old platforms support as well as gstreamer0.10 fsl
plugins like Yocto did, keeping only mx51/53/6q which are the only we
truly support.
https://github.com/Freescale/meta-fsl-arm/commit/83b240e7
https://github.com/Freescale/meta-fsl-arm/commit/3b698004

However I plan on adding MX6UL and MX7 platforms definition which
don't have any VPU.

Let me know your thoughts.

Regards,
Gary
