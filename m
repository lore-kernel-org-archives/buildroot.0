From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 18:13:07 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
Message-ID: <20171107181307.58471ad9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 11:48:17 +0000, Chu, Zhuliang (NSB - CN/Shanghai)
wrote:

> I have seen your mail on the buildroot mailing list.
> I download your buildroot branch 'ppsh' and test it with my configurations.

First of all, thanks a lot for taking the time to test my patches and
reporting the issues. It is very, very useful feedback, so many thanks!

Unfortunately, your e-mail was too large to make it to the mailing
list, due to the huge attached file you had. Next time, it would be
better if you could upload the log file somewhere, and just give a link
in your e-mail.

See below my replies for the different issues your report.

> Test environment:
> when using your buildroot, I will execute the parallel build command 'make -j8'.
> when using mainstream buildroot, I will execute 'make -j1'.
> config?
> 1\ qemu_x86_defconfig
> 2\ my_private_configuration(it is ok in mainstream buildroot)
> 
> Q1: Compatibility Issues
> In qemu_x86_defconfig, mainstream and 'ppsh' is all ok because it is simple.
> In my private, if using 'make -j8' in the 'ppsh', there still has the first question as shows in lines 103-116 of the top-level Makefile.
> i.e.
> >>> openssl Configuring  
> checking whether we are using A... yes(A has been compiled)/no(A has not been compiled)
> 
> in mainstream buildroot, the order of package A is before openssl. So openssl is always support A.
> but in 'ppsh', openssl is always not support A. if once 'ppsh' is merged into the mainstream, there will cause software inconsistencies.

I don't understand this problem. Which "package A" are you referring
to ?

With the per-package SDK work, a given package will only see the
dependencies it has explicitly expressed in its .mk file. This is
entirely expected behavior.

Currently (without per-package SDK), a given package sees everything
that is in STAGING_DIR, even if it comes from packages it doesn't
depend on. Even though this means a package can pick up a dependency
that is not explicitly described in its .mk file, it is acceptable
today because the build order is guaranteed to be the same across
rebuilds of the same configuration. However, with top-level parallel
build, this build order guarantee goes away, which is the primary
motivation for moving to per-package SDK, as implemented in my patch
series.

Could you describe in more details the problem you're seeing?

I see two possibilities:

 - What is missing to build openssl is a dependency that is expressed
   in openssl.mk (i.e listed in OPENSSL_DEPENDENCIES). If that is what
   you're seeing, it is a bug in the per-package SDK, and I want to
   understand better to fix the problem.

 - What is missing to build openssl is a dependency that is *NOT*
   expressed in openssl.mk, and in this case, the fact that this
   dependency is no longer visible to the openssl configure script is
   the expected behavior.

> Q2: Space Expension
> in qemu_x86_defconfig, the size of output increased from 3.4G to 3.6G between mainstream with 'ppsh'.
> in my private, the rate of space occupancy growth is higher. it`s crazy from 3.6G to 9G .This obviously can not accept. (A large part of reason is that I use a very large toolchain-external which about 1.5G)
> Before a package only consumes one space, but now a package maybe reoccupied space below per-package.
> BEFORE(mainstream):
> 1.7G    ./build
> 115M    ./images
> 37M    ./target
> 1.8G    ./host
> 3.6G    .
> 
> NOW('ppsh')
> 1.7G    ./build
> 5.5G    ./per-package
> 115M    ./images
> 37M    ./target
> 1.8G    ./host
> 8.9G    .

Which tool (and options) have you used to calculate this size?

Indeed, we are using hardlinks, so files are not duplicated. Only files
that are overwritten get de-duplicated.

Could you investigate this a bit more, checking first if the tool you
use to calculate the size properly accounts for hard links ?

> Q3: ERROR: Could not generate syscalls.(uclibc_error.log)
> I have not solved this problem, I put the error message in the attachment

This is weird. I'll try to do a uClibc toolchain build, since I only
did a glibc toolchain build. Do you have a minimal defconfig to
reproduce this? Is it 100% reproducible?

> Q4: Ccache path needs to be fixed(ccache_error.log)
> When ccache is enabled, it will generate the 'command not found' error like below.
> make: /home/zhulianc/inprogress/orig/tpbuildroot/output/host/bin/ccache: Command not found
> this issue has been fix.

I haven't looked at ccache support to be compatible with per-package
SDK, so I'm not surprised it is broken, so it's glad to see you looked
into this.

> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index afbec44..66bfcad 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -50,6 +50,7 @@ BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
>  ifneq ($(BR_CCACHE_INITIAL_SETUP),)
>  define HOST_CCACHE_DO_INITIAL_SETUP
>      @$(call MESSAGE,"Applying initial settings")
> +    rsync -au --link-dest=$(HOST_DIR) $(HOST_DIR) $(call qstrip,$(BR2_HOST_DIR))
>      $(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
>      $(CCACHE) -s
>  endef

I don't think that's what we want. The global HOST_DIR (output/host)
should basically be empty during the entire build process. Instead,
what we want is to have the ccache host tools installed in the
per-package SDK. This means that all packages have to have a dependency
on host-ccache, which is not currently the case. So we probably instead
want something like:

ifeq ($(BR2_CCACHE),y)
$(2)_DEPENDENCIES += host-ccache
endif

in package/pkg-generic.mk. But of course, we need to exclude the
host-ccache package from this, otherwise we would have a circular
dependency. Do you want to try something like this?

Again, many thanks for this feedback. Hopefully we can solve the
various problems you have reported and make the per-package SDK
functionality suitable for merging in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
