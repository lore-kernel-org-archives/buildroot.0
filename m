From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:42:37 +0200
Subject: [Buildroot] [PATCH v7 08/31] package/kodi: bump to version
	17.1-Krypton
In-Reply-To: <fe62a0d1-d466-2d4d-22c4-d5165882dc7b@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <fe62a0d1-d466-2d4d-22c4-d5165882dc7b@t-online.de>
Message-ID: <20170429144237.65dadbba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 14:29:13 +0200, Bernd Kuhls wrote:

> > I don't understand why you have this !BR2_PACKAGE_RPI_USERLAND
> > dependency here. Can you explain?  
> 
> We need to rule out that a rbpi build is done with opengl/egl, otherwise
> the build will fail like this:
> http://forum.kodi.tv/showthread.php?tid=305752&pid=2569701#pid2569701

But rpi-userland doesn't provide OpenGL support, only OpenGLES, so how
is it possible to get a RPi build with OpenGL support ?


> Ok, sent patch: http://patchwork.ozlabs.org/patch/756733/

Thanks, looks good.


> > This looks a bit fishy. Why each option has a _OK option and a _TRUE
> > option? Is setting both really needed?  
> 
> Yes, otherwise host CPU features sneak into the build parameters,
> upstream does something similar:
> https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/
> FindSSE.cmake#L81

Hum, OK.

> > This looks very very weird. Why is LDGOLD related to RPi ?  
> 
> RPi and Linux are considered different platforms, both have their own
> ArchSetup.cmake:
> 
> https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/linux/
> ArchSetup.cmake
> https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/
> ArchSetup.cmake
> 
> LDGOLD is only used for the linux platform:
> https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/linux/
> ArchSetup.cmake#L34
> 
> If you think that treating Linux and RPi as separate platforms is weird
> then you are not alone, but it may change in Kodi 18:
> https://github.com/xbmc/xbmc/pull/12021 ;)

Ah, ok, makes sense. Well, considering them as separate platforms
doesn't, but the way you've handled the current situation makes sense.
What about adding a comment?

Also, I changed rbpi to rpi in the comments, thinking that rbpi was a
typo, but it apparently isn't.

> Because all these options do not exist in https://github.com/xbmc/xbmc/
> blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake

OK. Good reason to add a comment in the .mk file.

> > So this thing is the only reason why we need xmlstarlet built for the
> > host system?  
> 
> No, I plan to add more patches to control the skin addon(s) being used,
> also the default skin addon can then be changed using xmlstarlet:
> http://lists.busybox.net/pipermail/buildroot/2017-April/189753.html
> 
> I removed these patches from v6+ because Yann had problems with them:
> http://lists.busybox.net/pipermail/buildroot/2017-April/190190.html
> and, as feature patches, they should not block the version bump.

It is indeed a good idea to have separate those changes from the
version bump itself. Now the version bump has been merged, it is
possible to focus on this rather than having a too long patch series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
