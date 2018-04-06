From: Christian Stewart <christian@paral.in>
Date: Fri, 06 Apr 2018 17:50:30 -0400
Subject: [Buildroot] [PATCH v3 2/8] dumb-init: new package
In-Reply-To: <20180401144325.52bc543f@windsurf>
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-3-christian@paral.in> <20180401144325.52bc543f@windsurf>
Message-ID: <87o9iw57ix.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Revisiting this now.

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> On Sat,  3 Mar 2018 19:43:40 -0500, Christian Stewart wrote:
>> dumb-init is a minimal init process to act as PID 1 for containers.
>> 
>> Static compilation is used, as dumb-init will typically be executed inside a
>> container.

> So maybe what's happening is that dumb-init is *executed* inside the
> container but is actually provided by the host environment outside the
> container, and you want to be able to use the same dumb-init binary
> regardless of what the container contains. Is that the use case ?

The dumb-init process is executed inside the container and has no access
to the host environment. If it is compiled dynamically, the container
environment must match the target environment in terms of dynamically
linked parts.

> The next issue is that your package assumes that static linking is
> possible. But Buildroot defaults to BR2_SHARED_LIBS, which means that
> the toolchain may not necessarily provide libc.a and allow static
> linking.

I'm able to compile with BR2_SHARED_LIBS and still produce a static
output with -static. Why is this possible? I remember seeing an email
about this at some point, where it was stated that glibc.a or so was not
produced with BR2_SHARED_LIBS. Why can I then compile this package in
this way?

> Alternatively, you could decide to build dumb-init statically only
> if !BR2_SHARED_LIBS, but that means that in the default Buildroot
> configurations, dumb-init would be linked dynamically.

This wouldn't work unfortunately in 95% of the intended cases where
dumb-init would be used.

Best,
Christian Stewart
