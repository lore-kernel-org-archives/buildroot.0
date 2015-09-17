From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 23:27:42 +0200
Subject: [Buildroot] [PATCH] make: requires dynamic libraries
In-Reply-To: <1442450292-13794-1-git-send-email-ryanbarnett3@gmail.com>
References: <1442450292-13794-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150917232742.6b253d01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Wed, 16 Sep 2015 19:38:12 -0500, Ryan Barnett wrote:
> While attempting to build make in a static library only configuration
> the following error will be shown:
> 
>  gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or
>  directory
>   #   include <dlfcn.h>
> 
> Fix this by depending make on !BR2_STATIC_LIBS.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/814/8143ae0afac139845e5016058d85c800dc8527ad
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>

Unfortunately, I believe this is not the proper fix. If you use
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config
and build just the make package, it builds just fine:

$ file output/target/usr/bin/make 
output/target/usr/bin/make: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, stripped

The file gc_pthread_redirects.h comes, I believe, from bdwgc, which got
built before make in the autobuild test case you're pointing to. This
header file is known to incorrectly include <dlfcn.h>, unless
GC_NO_DLOPEN is specified. See what is done in guile.mk for example to
pass GC_NO_DLOPEN when BR2_STATIC_LIBS=y.

I believe the chain is that you have bdwgc that gets built, then guile,
then make. In this case, make detects the availability of guile and
uses it, which is the reason why gc_pthread_redirects.h gets included
by make.

So I suggest one of the two options:

 * Make the optional dependency of make on guile explicit in make.mk,
   and pass GC_NO_DLOPEN when we're building statically.

 * Disable guile support completely in make. I don't think we care
   about having guile support in make in the context of Buildroot, so
   this is probably the easiest solution.

Consequently, I've marked your patch as Rejected in patchwork. Can you
send a patch implementing one of the two options above?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
