From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 10 Feb 2020 16:51:02 +0100
Subject: [Buildroot] [PATCH v2 5/7] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.0.p1.0
In-Reply-To: <CAMWBNu6Gnqxh+_fPzFJL6Tda3g=dWpcwkj0pH9TkPT-VutxKYQ@mail.gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-5-tuzakli.refik@gmail.com>
 <20200204231052.350677e5@windsurf>
 <CADCpmyPFFQO+0m3gK_825QHAMN18SeCOSLFFnyzswniZt5qN3Q@mail.gmail.com>
 <20200205174803.143caa52@windsurf>
 <CAMWBNu6Gnqxh+_fPzFJL6Tda3g=dWpcwkj0pH9TkPT-VutxKYQ@mail.gmail.com>
Message-ID: <20200210155102.GA335587@p1g2.work>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Refik,

On Wed, Feb 05, 2020 at 09:44:36PM +0300, Refik Tuzakli wrote:
> Hello,
> 
> Have nice vacation, Gary.
> 
> we don't need mesa3d to  work with opengl, opencl... if we use vivante
> dirver by NXP. it is  closed source and has limitations.

Yes you do need mesa3d otherwise you won't have any header and therefore
won't be able to build anything.

Yocto recipe explains it here:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc#n23

> For imx8 families it drops X11 and framebuffer backend for opengl support.
> Unfortunately, Gary is right. Instead of supporting mesa3d to enable it for
> imx users, they overwrite the opengl libraries in Yocto Project.
> There is etnaviv driver to use directly with mesa3d without any vivante
> driver. However it is new for gpu on imx8 families.
> So I can not make it work on imx8qxp.
> 
> Thomas was right about opengl framebuffer backend. Now NXP does not supply
> libGL-fb on imx-gpu-viv-6.4.0.p1.0.
> It is buggy gpu driver for 32 bit architecture(imx6 familes). In Yocto
> project, they solve the problem by creating dummy libGL.so for framebuffer
> backend.
> It is also weird. I gues we need to wait for better gpu driver.
> 
> Now I make weston and wayland work with vivante 6.4.0.p1.0 version on the
> opengl wayland backend. However,
> Freescale firmware is need to rearrange because after 6.4.0 there are
> neural network, openvx and vulkan support.
> If we add all these support, they occupy more than 125MB. I guess it is too
> much to allocate such space for libraries that we don't need.
> 
> Apart from freescale firmware, I plan to update weston for imx. I saw a
> discussion about it on Buildroot, too.
> 
> I work on imx8qxp mek board by NXP. I only test wayland weston on it.
> 
> It wasn't me because I am almost new to contribute to Buildroot :)
> 
> I have some experience about imx8 and  want to share.
> 
> Cheers,
> 
> On Wed, Feb 5, 2020 at 7:48 PM Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
> 
> > Hello,
> >
> > On Wed, 5 Feb 2020 16:54:15 +0100
> > Gary Bisson <bisson.gary@gmail.com> wrote:
> >
> > > I'm on vacation this week without any laptop around so my answer will
> > most
> > > likely be inaccurate.
> >
> > Thanks, enjoy your vacations! :-)
> >
> > > But I'll try off the top of my head:
> > > - the main goal was to copy the yocto recipe for the build cmds, the
> > links
> > > commands should match more or less
> > > - but openGL was indeed never properly supported anyway since it required
> > > to build mesa3d but overwrite the libGL library at the end (what was done
> > > by yocto at the time) which wasn't supported in BR
> >
> > Argh. Horrible. Why do they do that ?
> >
> > > - the only person I know who added some kind of openGL support in
> > Buildroot
> > > is you ;) (I recall a "imx-fix" branch in FE git server)
> >
> > Me Thomas, or Refik ? I might have submitted some OpenGL changes a
> > while ago, but I'm certainly not the only one.

You Thomas, sorry for the confusion. I don't think you ever pushed the
change as you were not happy with it at the time.

It was on http://git.free-electrons.com/, is a bootlin equivalent
existing?

Regards,
Gary
