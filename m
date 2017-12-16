From: Kees van Unen <keesvanunen@hotmail.com>
Date: Sat, 16 Dec 2017 10:52:28 +0000
Subject: [Buildroot] FW: [PATCH] package/cmake: bump version to 3.10.0 and
 add license hash
In-Reply-To: <877etnj677.fsf@home.blind.guru>
References: <20171210233349.24682-1-mlang@blind.guru>
 <20171212070736.04953cff@windsurf.png.is.keysight.com>
 <20171212123040.35400bc4@windsurf>,<877etnj677.fsf@home.blind.guru>
Message-ID: <c65619d0edef4b85bf8d0d78bd373e76@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensMario Lang
Verzonden: zaterdag 16 december 2017 11:52:12 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: Thomas Petazzoni
CC: buildroot at buildroot.org
Onderwerp: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.10.0 and add license hash

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> And I had to revert it, because it was causing gazillions of build
> failures of host-cmake:
>
>   http://autobuild.buildroot.net/?reason=host-cmake-3.10.0
>
> Indeed, CMake is now using the emplace_hint method, which is only
> available in C++11, so it probably requires gcc 4.7 or gcc 4.8, and the
> CMake package doesn't account for this dependency.
>
> The gotcha is that it's not going to be easy to solve. Indeed, our
> current logic is:
>
>  1. If there is a suitable CMake available on the system, we use it
>
>  2. If there's no suitable CMake available on the system, we build our
>     own.
>
> In situation (1), we are still good, no problem. But in situation (2),
> what do we do if we cannot built CMake at all because the host compiler
> is too old ? The only option would be to prevent the user from enabling
> any package that will need host-cmake. This means all cmake-based
> packages, and all their reverse dependencies.
>
> Really, that's quite a bit of work. Perhaps this should instead be
> taken as a bug/regression to CMake, and see if they are willing to use
> a different approach when emplace_hint is not available ?

To move to C++11 was apparently intentional, and not an oversight.
Quoting the release notes of 3.10:

"
Deprecated and Removed Features?

     * Support for building CMake itself with C++98 compilers was
       dropped. CMake is now implemented using C++11.
"

6 years after the standard was released, some projects are
starting to move to it.  LLVM comes to mind, which you also can't build
without C++11 anymore.

> Seems like emplace_hint() is adding a new element to a container, with
> a hint as to where it should be added. So I believe this is an
> optimization, so perhaps if emplace_hint() is not available, CMake
> could fallback on just inserting the element in the container.

This particular case might be patchable, but the explicit notice quoted
above makes me think it might not be worthwhile to try and write a
backporting patch.

> Mario, are you interested in looking into this ?

Yes, actually, I am.  However, I am a bit to rooky to Buildroot to
understand enough about how you handle backwards compatibility in
general.  My gut feeling as a C++11 fan would be to just accept the fact
that C++11 is going to be required by projects in the future.  However,
I gather Buildroot has official minimal compiler requirements which are
likely dictated by toolchains provided by other vendors?

In the meantime, since I found this notice in 3.10, we might consider
moving cmake at least to 3.9?

--
CYa,
  ?????
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
