From: Maarten ter Huurne <maarten@treewalker.org>
Date: Fri, 12 Sep 2014 16:56:37 +0200
Subject: [Buildroot] [PATCH] rpi-userland: Add patches to fix
	compilation with musl libc
In-Reply-To: <20140912093253.6ef35267@free-electrons.com>
References: <1410486339-2001-1-git-send-email-maarten@treewalker.org>
 <20140912093253.6ef35267@free-electrons.com>
Message-ID: <4834283.TufUKxLIMj@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 12 September 2014 09:32:53 Thomas Petazzoni wrote:

> Thanks. The naming of the patch files as well as the descriptions are
> good, but each patch is missing a SoB line, which we require. See
> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of
> _the_package_patches.

I'll add those and resubmit.

> > diff --git
> > a/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
> > b/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
> > new file mode 100644
> > index 0000000..e51a93f
> > --- /dev/null
> > +++
> > b/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
> > @@ -0,0 +1,22 @@
> > +I don't know which platform is missing the timer_t definition, but it
> > would +be better to check for that platform specifically instead of
> > explicitly +excluding platforms that do have it.
> > +
> > +This fixes compilation with musl libc, which does define timer_t but
> > does +not define __timer_t.
> > +
> > +Note that _HAVE_TIMER_T suggests it would prevent breakage, but it is
> > +unrealistic to expect every application to set that macro. Not even all
> > CMake +files in the userland package itself set it...
> > +
> > +---
> > userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe.org/interface/vcos/pt
> > hreads/vcos_platform.h	2014-08-05 19:43:53.000000000 +0200 ++++
> > rpi-userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe/interface/vcos/pt
> > hreads/vcos_platform.h	2014-09-11 21:04:36.418943953 +0200 +@@ -120,7
> > +120,7 @@
> > +
> > + #define VCOS_ONCE_INIT        PTHREAD_ONCE_INIT
> > +
> > +-#if defined(__arm__) && !defined(_HAVE_TIMER_T) && !defined(ANDROID)
> > ++#if 0
> > + typedef __timer_t timer_t;
> > + #endif
> > + typedef struct VCOS_TIMER_T
> 
> I'm just not entirely convinced by this one: it should be the job of
> the rpi-userland build system to check for timer_t, and define
> HAVE_TIMER_T accordingly. It's definitely not the job of each and every
> application to set that macro, but really rpi-userland's build system.

That's what you'd expect from the HAVE_* name, but there isn't a timer_h 
check in the rpi-userland build system. There is a hardcoded "CFLAGS+=-
D_HAVE_TIMER_T" for a single application inside rpi-userland, the other 
applications don't define it.

The reason I wrote "every application" is that this header can be indirectly 
included by applications using EGL:

$ output/host/usr/bin/pkg-config --cflags egl
-I/home/mth/pi/buildroot/output/host/usr/arm-pingux-linux-
musleabihf/sysroot/usr/include/
-I/home/mth/pi/buildroot/output/host/usr/arm-pingux-linux-
musleabihf/sysroot/usr/include/interface/vcos/pthreads/
-I/home/mth/pi/buildroot/output/host/usr/arm-pingux-linux-
musleabihf/sysroot/usr/include/interface/vmcs_host/linux/

In theory -D_HAVE_TIMER_H could be added to Cflags in egl.pc, but that might 
interfere with application packages. At least in the context of Buildroot, 
where none of the supported libcs require this typedef, disabling this check 
is the safest approach, in my opinion.

Also I wonder if there really is a platform on which this typedef helps: it 
would only help on a platform that does implement POSIX timers (it's an 
optional feature), but for some reason doesn't define timer_t. It just 
doesn't sound very likely...

Looking at the header again, I see it doesn't actually use timer_t anywhere. 
In fact, nowhere in the entire rpi_userland package is timer_t used. So the 
whole check + typedef can just be removed.

> Also, could you submit those patches upstream? We don't like much to
> carry a lot of patches in Buildroot, so the more patches can be merged
> upstream, the better.

https://github.com/raspberrypi/userland/issues/202
https://github.com/raspberrypi/userland/pull/201

Bye,
		Maarten
