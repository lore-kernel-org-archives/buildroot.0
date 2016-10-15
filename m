From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:44:29 +0200
Subject: [Buildroot] [PATCH v3 1/8] package/pkg-cmake.mk: fix build type
 and optimization flags
In-Reply-To: <CAHXCMM+1cbRY11V4cKHB=dCScSG7KGGraFz2NkWsWH+1tiG7XQ@mail.gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-2-s.martin49@gmail.com>
 <20161015122557.25fd074f@free-electrons.com>
 <CAHXCMM+1cbRY11V4cKHB=dCScSG7KGGraFz2NkWsWH+1tiG7XQ@mail.gmail.com>
Message-ID: <20161015124429.181dcdb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 12:34:29 +0200, Samuel Martin wrote:

> > Can't we tell CMake to not do all this crap, and simply not add
> > -g/-O<x> options by itself ?  
> 
> As discussed IRL, this solution is kind of the optimal one, not the
> best one but the one that is the closest to what BR is trying to do in
> all cases.

Just to expand on that, a few more details from our discussions:

 - If we don't pass a CMAKE_BUILD_TYPE, then CMake doesn't pass any
   compiler flags. This would be ideal, but unfortunately some packages
   force their own build type in their CMakeLists.txt), and in this case
   CMake passes its own compiler flags. Which would mean some packages
   may always be built in debug mode, or always be built in release,
   depending on what they have chosen in their CMakeLists.txt to be the
   default, and this wouldn't be affected by the Buildroot
   configuration.

   Due to this, we *want* to force CMAKE_BUILD_TYPE, as it ensures all
   CMake packages are built in a way that is as close as possible to
   the selected Buildroot configuration.

 - There is no way to tell CMake to not pass compiler flags and to
   ignore the build type written in the CMakeLists.txt file. We could
   patch CMake for that, but we are now using the system-provided cmake
   when it's available, so we can hardly relying on cmake patching.

Bottom line: your patch is indeed the best we can do. It's not perfect,
but we can't easily do better.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
