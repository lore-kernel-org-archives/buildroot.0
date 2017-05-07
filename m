From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 May 2017 21:43:48 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: fix unmet dependencies
In-Reply-To: <20170506212617.27587-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 6 May 2017 23:26:17 +0200")
References: <20170506212617.27587-1-yann.morin.1998@free.fr>
Message-ID: <87y3u8pi4r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, vcdbg is only supported in 32-bit mode. Furthermore, vcdbg
 > needs rpi-userland, which we currently only support in 32-bit mode.

 > Add a dependency on BR2_arm.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

I was wondering if these were just missing when the || BR2_aarch64 logic
was added, but rpi-userland really doesn't build in 64bit mode:

/home/peko/source/buildroot/output-rpi64/build/rpi-userland-f0642e3b58d8a140a3f7621630c15fbfa794b19d/build/inc/interface/vcos/vcos_assert.h:303:69: error: size of array ?vcos_static_assert? is negative
 #define vcos_static_assert(cond) __attribute__((unused)) extern int vcos_static_assert[(cond)?1:-1]
                                                                     ^
/home/peko/source/buildroot/output-rpi64/build/rpi-userland-f0642e3b58d8a140a3f7621630c15fbfa794b19d/interface/khronos/common/khrn_client_check_types.h:72:1: note: in expansion of macro ?vcos_static_assert?
 vcos_static_assert(sizeof(GLsizeiptr) == 4);

> ---
 >  package/rpi-firmware/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
 > index 4efef8691e..a7fa1c3b33 100644
 > --- a/package/rpi-firmware/Config.in
 > +++ b/package/rpi-firmware/Config.in
 > @@ -67,6 +67,7 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 
 >  config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 >  	bool "vcdbg"
 > +	depends on BR2_arm # rpi-userland
 >  	depends on BR2_TOOLCHAIN_USES_GLIBC
 >  	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
 >  	select BR2_PACKAGE_RPI_USERLAND

What is even more important than the rpi-userland dependency is the fact
that vcdgb is a prebuilt arm binary. You could argue that it perhaps
should have used 'depends on' instead of 'select' for rpi-userland, as
the dependency afaik is:

It doesn't make sense to debug the GPU communication if you don't use
the GPU driver.

Rather than any strong direct rpi-userland dependency by this binary,
but ok.

Committed after adjusting the comment, thanks.

-- 
Bye, Peter Korsgaard
