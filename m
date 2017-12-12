From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 12:30:40 +0100
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.10.0 and
 add license hash
In-Reply-To: <20171212070736.04953cff@windsurf.png.is.keysight.com>
References: <20171210233349.24682-1-mlang@blind.guru>
 <20171212070736.04953cff@windsurf.png.is.keysight.com>
Message-ID: <20171212123040.35400bc4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 07:07:36 +0100, Thomas Petazzoni wrote:

> On Mon, 11 Dec 2017 00:33:49 +0100, Mario Lang wrote:
> > Signed-off-by: Mario Lang <mlang@blind.guru>
> > ---
> >  package/cmake/cmake.hash | 5 +++--
> >  package/cmake/cmake.mk   | 4 ++--
> >  2 files changed, 5 insertions(+), 4 deletions(-)  
> 
> Applied to master, thanks.

And I had to revert it, because it was causing gazillions of build
failures of host-cmake:

  http://autobuild.buildroot.net/?reason=host-cmake-3.10.0

Indeed, CMake is now using the emplace_hint method, which is only
available in C++11, so it probably requires gcc 4.7 or gcc 4.8, and the
CMake package doesn't account for this dependency.

The gotcha is that it's not going to be easy to solve. Indeed, our
current logic is:

 1. If there is a suitable CMake available on the system, we use it

 2. If there's no suitable CMake available on the system, we build our
    own.

In situation (1), we are still good, no problem. But in situation (2),
what do we do if we cannot built CMake at all because the host compiler
is too old ? The only option would be to prevent the user from enabling
any package that will need host-cmake. This means all cmake-based
packages, and all their reverse dependencies.

Really, that's quite a bit of work. Perhaps this should instead be
taken as a bug/regression to CMake, and see if they are willing to use
a different approach when emplace_hint is not available ?

Seems like emplace_hint() is adding a new element to a container, with
a hint as to where it should be added. So I believe this is an
optimization, so perhaps if emplace_hint() is not available, CMake
could fallback on just inserting the element in the container.

Mario, are you interested in looking into this ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
