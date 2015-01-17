From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 17 Jan 2015 01:11:03 +0100
Subject: [Buildroot] [PATCH v5 07/15] xdriver_xf86-video-imx-viv: new
	package
In-Reply-To: <20150116171533.64116d5f@free-electrons.com>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1673331.jGUK3KeLGv@aquila> <20150116171533.64116d5f@free-electrons.com>
Message-ID: <1664407.TbGWHQXnSi@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 16 January 2015 17:15:33 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Fri, 16 Jan 2015 17:04:20 +0100, J?r?me Pouiller wrote:
> 
> > > The world of OpenGL stuff will always surprise me. Why on earth does a
> > > X.org driver that uses a proprietary OpenGL implementation needs
> > > Mesa3D ?!?
> > 
> > In fact, xf86-video-imx-viv does not depends directly on mesa3d. However, it 
> > depend on xorg server compiled with --enable-dri --enable-glx. But, these 
> > options are enabled only if BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.
> 
> Maybe this should be changed, so that other drivers can enable it,
> without referencing Mesa related options, no?
> 
> Also, the code in the xserver package does:
> 
> ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
> XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
> else
> XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
> endif
> 
> So it really builds mesa as well. Is this needed ?
We cannot use gpu-viv-bin-mx6q to compile Xorg with DRI and GLX since 
it does not provide all necessary files. Especially, OpenGL headers 
(GL/gl.h, GL/glx.h, ...) are missing[1]. We may solve this issue using
"opengl-registry" posted by Yann a few months ago. It may be 
sufficient.

Note that the current implementation is same than the one used in Yocto
and it is officially supported by Freescale. (I do not say it is the
right way, but it is a sufficient justification for many users)


[1] https://community.freescale.com/thread/312546

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
