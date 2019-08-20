From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@collabora.com>
Date: Tue, 20 Aug 2019 07:43:59 -0400
Subject: [Buildroot] Buildroot raspberrypi3_qt5we_defconfig no longer
 builds
In-Reply-To: <20190818144317.487720fc@windsurf.home>
References: <20190810103022.4b2f16f8@windsurf.home>
 <20190813124803.6dgpy73pln2hcjrn@archlinux.localdomain>
 <20190818144317.487720fc@windsurf.home>
Message-ID: <20190820114359.cw5qcdpku37q26ic@archlinux.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Aug 18, 2019 at 02:43:17PM +0200, Thomas Petazzoni wrote:
> Hello Ga?l,
> 
> On Tue, 13 Aug 2019 08:48:03 -0400
> Ga?l PORTAY <gael.portay@collabora.com> wrote:
> 
> > > The error is:
> > > 
> > > error: stdlib.h: No such file or directory
> > >  #include_next <stdlib.h>
> > >                ^~~~~~~~~~
> > > compilation terminated.
> > > 
> > > When building qt5webengine. Could you have a look and propose a patch
> > > to address this issue ?
> > 
> > I will have a look to it. Probably later that week.
> 
> Have you had the chance to look into this ? It failed again in the last
> Gitlab CI pipeline:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/273673252.
> 

I had a look that week end.

I observed that there is some -isystem CFLAGS in the generated ninja
files.

	-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libpng16
	-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
	-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/freetype2

If I substitute the -isystem in -I, the file compile then but webgengine
fails to the next subproject with -isystem flags.

IIUC, qtwebengine uses qmake that uses ng to generate ninja files.

I am looking for the culprit that introduces the -isystem flags. I am
not yet familiar with ng/ninja, and I have basic knowledge of
qmake only.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Ga?l
