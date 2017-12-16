From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 13:34:39 +0100
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.10.0 and
 add license hash
In-Reply-To: <877etnj677.fsf@home.blind.guru>
References: <20171210233349.24682-1-mlang@blind.guru>
 <20171212070736.04953cff@windsurf.png.is.keysight.com>
 <20171212123040.35400bc4@windsurf> <877etnj677.fsf@home.blind.guru>
Message-ID: <20171216133439.58247290@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Dec 2017 11:52:12 +0100, Mario Lang wrote:

> To move to C++11 was apparently intentional, and not an oversight.
> Quoting the release notes of 3.10:
> 
> "
> Deprecated and Removed Features?
> 
>      * Support for building CMake itself with C++98 compilers was
>        dropped. CMake is now implemented using C++11.
> "
> 
> 6 years after the standard was released, some projects are
> starting to move to it.  LLVM comes to mind, which you also can't build
> without C++11 anymore.
> 
> > Seems like emplace_hint() is adding a new element to a container, with
> > a hint as to where it should be added. So I believe this is an
> > optimization, so perhaps if emplace_hint() is not available, CMake
> > could fallback on just inserting the element in the container.  
> 
> This particular case might be patchable, but the explicit notice quoted
> above makes me think it might not be worthwhile to try and write a
> backporting patch.

OK, thanks for the investigation.

> > Mario, are you interested in looking into this ?  
> 
> Yes, actually, I am.  However, I am a bit to rooky to Buildroot to
> understand enough about how you handle backwards compatibility in
> general.  My gut feeling as a C++11 fan would be to just accept the fact
> that C++11 is going to be required by projects in the future.  However,
> I gather Buildroot has official minimal compiler requirements which are
> likely dictated by toolchains provided by other vendors?

We can already have dependencies on gcc versions, both for the host
compiler and the target compiler, see BR2_HOST_GCC_AT_LEAST_ for the
host compiler version dependencies and BR2_TOOLCHAIN_GCC_AT_LEAST_ for
the target compiler version dependencies.

However, the problem is that we would have to propagate this dependency
to all packages using cmake, and all their reverse dependencies. It's
definitely not impossible, but it's going to be quite a few packages.

Also, it is complicated by the fact that we should not add this
dependency if cmake is already installed system-wide, as we only build
host-cmake if we can't find a suitable cmake version.

Basically, it all boils down to have a Config.in option that tells us
whether we need to build host-cmake or not, and whether we *can* build
it, and add this dependency to all cmake packages and their reverse
dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
