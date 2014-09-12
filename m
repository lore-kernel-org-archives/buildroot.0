From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 17:11:06 +0200
Subject: [Buildroot] [PATCH] rpi-userland: Add patches to fix
 compilation with musl libc
In-Reply-To: <4834283.TufUKxLIMj@hyperion>
References: <1410486339-2001-1-git-send-email-maarten@treewalker.org>
 <20140912093253.6ef35267@free-electrons.com>
 <4834283.TufUKxLIMj@hyperion>
Message-ID: <20140912171106.246cfd12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Fri, 12 Sep 2014 16:56:37 +0200, Maarten ter Huurne wrote:

> That's what you'd expect from the HAVE_* name, but there isn't a timer_h 
> check in the rpi-userland build system. There is a hardcoded "CFLAGS+=-
> D_HAVE_TIMER_T" for a single application inside rpi-userland, the other 
> applications don't define it.
> 
> The reason I wrote "every application" is that this header can be indirectly 
> included by applications using EGL:
> 
> $ output/host/usr/bin/pkg-config --cflags egl
> -I/home/mth/pi/buildroot/output/host/usr/arm-pingux-linux-
> musleabihf/sysroot/usr/include/
> -I/home/mth/pi/buildroot/output/host/usr/arm-pingux-linux-
> musleabihf/sysroot/usr/include/interface/vcos/pthreads/
> -I/home/mth/pi/buildroot/output/host/usr/arm-pingux-linux-
> musleabihf/sysroot/usr/include/interface/vmcs_host/linux/
> 
> In theory -D_HAVE_TIMER_H could be added to Cflags in egl.pc, but that might 
> interfere with application packages. At least in the context of Buildroot, 
> where none of the supported libcs require this typedef, disabling this check 
> is the safest approach, in my opinion.
> 
> Also I wonder if there really is a platform on which this typedef helps: it 
> would only help on a platform that does implement POSIX timers (it's an 
> optional feature), but for some reason doesn't define timer_t. It just 
> doesn't sound very likely...
> 
> Looking at the header again, I see it doesn't actually use timer_t anywhere. 
> In fact, nowhere in the entire rpi_userland package is timer_t used. So the 
> whole check + typedef can just be removed.

Ok, thanks a lot for the explanation. Then just remove the definition,
and submit the patch upstream.

> 
> > Also, could you submit those patches upstream? We don't like much to
> > carry a lot of patches in Buildroot, so the more patches can be merged
> > upstream, the better.
> 
> https://github.com/raspberrypi/userland/issues/202
> https://github.com/raspberrypi/userland/pull/201

Great!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
