From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 09:41:58 +0100
Subject: [Buildroot] [PATCH v5 07/15] xdriver_xf86-video-imx-viv: new
	package
In-Reply-To: <20150119222043.GF4217@free.fr>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1664407.TbGWHQXnSi@sagittea> <20150119222043.GF4217@free.fr>
Message-ID: <2046060.LHRJYafqiX@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On Monday 19 January 2015 23:20:43 Yann E. MORIN wrote:
> J?r?me, All,
> 
> On 2015-01-17 01:11 +0100, J?r?me Pouiller spake thusly:
> > On Friday 16 January 2015 17:15:33 Thomas Petazzoni wrote:
> > > Dear J?r?me Pouiller,
> > > 
> > > On Fri, 16 Jan 2015 17:04:20 +0100, J?r?me Pouiller wrote:
> > > 
> > > > > The world of OpenGL stuff will always surprise me. Why on earth does a
> > > > > X.org driver that uses a proprietary OpenGL implementation needs
> > > > > Mesa3D ?!?
> > > > 
> > > > In fact, xf86-video-imx-viv does not depends directly on mesa3d. However, it 
> > > > depend on xorg server compiled with --enable-dri --enable-glx. But, these 
> > > > options are enabled only if BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.
> > > 
> > > Maybe this should be changed, so that other drivers can enable it,
> > > without referencing Mesa related options, no?
> > > 
> > > Also, the code in the xserver package does:
> > > 
> > > ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> > > XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
> > > XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
> > > else
> > > XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
> > > endif
> > > 
> > > So it really builds mesa as well. Is this needed ?
> > We cannot use gpu-viv-bin-mx6q to compile Xorg with DRI and GLX since 
> > it does not provide all necessary files. Especially, OpenGL headers 
> > (GL/gl.h, GL/glx.h, ...) are missing[1]. We may solve this issue using
> > "opengl-registry" posted by Yann a few months ago. It may be 
> > sufficient.
> 
> For the records, I've posted an updated series:
>     http://lists.busybox.net/pipermail/buildroot/2015-January/117642.html
> 
> Care to see if it is posible to update your series to use the Khronos
> registry/ies? If so, it would great if you could review/ack the patches
> so they get applied soon, so you can in turn repost an updated series of
> yours! ;-)

I am able to build xorg-xserver w/ --enable-dri --enable-glx and 
without mesa3d. Instead of mesa3d, I built opengl-registry and a libGL
provider (I used gpu-viv-bin-mx6q, but it should also work with 
nvidia-driver).

In add, I need to manually add gl.pc, dri.pc and GL/internal/dri_interface.h
(picked from mesa3d)

I will try to generate a cleaner patch in order to begin a discussion 
about this issue.

However, I think this work is an improvement of dri/glx support and is
not really related to "Xorg support for iMX6" series.

[...]
-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
