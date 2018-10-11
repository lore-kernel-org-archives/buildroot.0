From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 10:12:21 +0200
Subject: [Buildroot] [PATCH 1/1] open-plc-utils: fix build with static
 musl
In-Reply-To: <20181009192102.13223-1-fontaine.fabrice@gmail.com>
References: <20181009192102.13223-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011101221.47d280d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue,  9 Oct 2018 21:21:02 +0200, Fabrice Fontaine wrote:
> Pass -static to EXTRA_LDFLAGS to fix following issue:
> /home/buildroot/autobuild/run/instance-3/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545: undefined reference to `raise'
> 
> Move EXTRA_CFLAGS and this new variable to OPEN_PLC_UTILS_MAKE_OPTS for
> readability
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for investigating this, however, I believe we need a better fix.

> +OPEN_PLC_UTILS_MAKE_OPTS = EXTRA_CFLAGS="-D__UCLIBC__"
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +OPEN_PLC_UTILS_MAKE_OPTS += EXTRA_LDFLAGS=-static
> +endif

The crux of the matter is that open-plc-utils defines its own
CFLAGS/LDFLAGS/CXXFLAGS, without obeying to the ones passed in the
environment. -static is already in TARGET_LDFLAGS when
BR2_STATIC_LIBS=y, so there's no need to repeat this condition.

So, I would suggest to do this instead:

# blabla keep comment about __UCLIBC__
OPEN_PLC_UTILS_MAKE_OPTS = \
	EXTRA_CFLAGS="$(TARGET_CFLAGS) -D__UCLIBC__" \
	EXTRA_CXXFLAGS="$(TARGET_CXXFLAGS)" \
	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"

This should fix the static linking issue, but also more generally
ensure that our flags are taken into account during the build.

Could you check if this works better, and if it does, send an updated
version of the patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
