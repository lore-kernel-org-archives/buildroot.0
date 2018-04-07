From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 08:20:46 +0200
Subject: [Buildroot] [PATCH v3 2/8] dumb-init: new package
In-Reply-To: <87o9iw57ix.fsf@paral.in>
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-3-christian@paral.in>
 <20180401144325.52bc543f@windsurf> <87o9iw57ix.fsf@paral.in>
Message-ID: <20180407082046.2b7a6d36@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 06 Apr 2018 17:50:30 -0400, Christian Stewart wrote:

> > So maybe what's happening is that dumb-init is *executed* inside the
> > container but is actually provided by the host environment outside the
> > container, and you want to be able to use the same dumb-init binary
> > regardless of what the container contains. Is that the use case ?  
> 
> The dumb-init process is executed inside the container and has no access
> to the host environment. If it is compiled dynamically, the container
> environment must match the target environment in terms of dynamically
> linked parts.

What is important here is that even though dumb-init is executed
*inside* the container, it is provided by the system *outside* the
container.

> > The next issue is that your package assumes that static linking is
> > possible. But Buildroot defaults to BR2_SHARED_LIBS, which means that
> > the toolchain may not necessarily provide libc.a and allow static
> > linking.  
> 
> I'm able to compile with BR2_SHARED_LIBS and still produce a static
> output with -static. Why is this possible? I remember seeing an email
> about this at some point, where it was stated that glibc.a or so was not
> produced with BR2_SHARED_LIBS. Why can I then compile this package in
> this way?

Could you try a completely dynamic build with uClibc and musl ?

Something like this:

BR2_arm=y
BR2_cortex_a8=y
BR2_SHARED_LIBS=y

> > Alternatively, you could decide to build dumb-init statically only
> > if !BR2_SHARED_LIBS, but that means that in the default Buildroot
> > configurations, dumb-init would be linked dynamically.  
> 
> This wouldn't work unfortunately in 95% of the intended cases where
> dumb-init would be used.

Let's see what the above test does. If it's able to build a static
binary even though BR2_SHARED_LIBS=y, then OK, we're good. Otherwise,
we'll have to find a different solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
