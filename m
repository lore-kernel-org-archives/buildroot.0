From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 14:43:25 +0200
Subject: [Buildroot] [PATCH v3 2/8] dumb-init: new package
In-Reply-To: <20180304004346.331-3-christian@paral.in>
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-3-christian@paral.in>
Message-ID: <20180401144325.52bc543f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Mar 2018 19:43:40 -0500, Christian Stewart wrote:
> dumb-init is a minimal init process to act as PID 1 for containers.
> 
> Static compilation is used, as dumb-init will typically be executed inside a
> container.

For the poor souls that are not Docker gurus, it is not immediately
clear why static linking is needed. dumb-init runs inside the
container, but the container is going to contain (!) other programs.
Will all those programs be statically linked ? Probably not.

So maybe what's happening is that dumb-init is *executed* inside the
container but is actually provided by the host environment outside the
container, and you want to be able to use the same dumb-init binary
regardless of what the container contains. Is that the use case ?

If so, extending the commit log would be nice.

The next issue is that your package assumes that static linking is
possible. But Buildroot defaults to BR2_SHARED_LIBS, which means that
the toolchain may not necessarily provide libc.a and allow static
linking.

So probably dumb-init should "depends on !BR2_SHARED_LIBS", which means
it wouldn't be visible by default. A Config.in comment would be needed,
like:

comment "dumb-init needs a toolchain w/ static library"
	depends on BR2_SHARED_LIBS

Alternatively, you could decide to build dumb-init statically only
if !BR2_SHARED_LIBS, but that means that in the default Buildroot
configurations, dumb-init would be linked dynamically.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
