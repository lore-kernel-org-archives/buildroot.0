From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 16 Feb 2016 14:55:54 +0100
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
	available on the build host
In-Reply-To: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAHXCMMK33AqXM7wEQPCDycgiRWJJMxDcUH-+ZWW0pX7tYmAq-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca, all,

On Fri, Feb 5, 2016 at 12:07 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Currently all cmake packages depend on host-cmake. Unfortunately
> host-cmake takes a long time to configure and build: almost 7 minutes
> on a dual-core i5 with SSD. The time does not change even with ccache
> enabled.
>
> Indeed, building host-cmake is avoidable if it is already installed on
> the build host: CMake is supposed to be quite portable, and the only
> patch in Buildroot for the CMake package seems to only affect
> target-cmake.
>
> We avoid building host-cmake if cmake is already available on the host
> using a technique similar to the one used for host-tar and host-xzcat.
>
> First, we leverage the existing infrastructure in
> support/dependencies/dependencies.mk to set CMAKE to either "cmake" or
> "$(HOST_DIR)/usr/bin/cmake". In the latter case we also set
> BUILD_HOST_CMAKE = YES meaning we need to build and use host-cmake.
>
> Then in pkg-cmake.mk we launch $(CMAKE) instead of
> $(HOST_DIR)/usr/bin/cmake.
>
> Finally, we do skip adding the dependency on host-cmake for all cmake
> packages when $(BUILD_HOST_CMAKE) != YES.

Sorry for not spotting this earlier, but:
host-cmake has a dependency on host-pkgconf, which cmake (the host
program) may use at runtime to find the dependencies when it is
configuring a project.
In the BR host tree, pkg-config is a wrapper with environment
variables correctly preset to find stuff in the sysroot tree by
default.

Here is a test case:

A is a cmake-package depending on B.
B is a generic-package providing a *.pc file.
CMake uses its FindPkgConfig module to detect B.

So, currently we got:
- A depends on: B and host-cmake
- host-cmake depends on host-pkgconf
- When configuring A, host-cmake should use host-pkgconf to find B

With this patch, in the case cmake build is skipped, we get:
- A depends on: B
- When configuring A, cmake (from the host system) may use pkg-config
(from the host system) to find B, but this pkg-config won't have the
env. vars. correctly set to find B in the sysroot. In the best case,
it won't find B, in the worst case it will try to link against B from
the host system.

I'm not sure what it the best and clean way to handle this...
Maybe $(BUILD_HOST_CMAKE) != YES should be use to noop the
HOST_CMAKE_{CONFIGURE,BUILD,INSTALLL}_CMDS commands, but we keep the
dependency on host-cmake, so we don't lose host-cmake's dependencies.

Any thought about this?

>
> Unlike what we do for host-tar and host-xzcat, for host-cmake we do
> not add host-cmake to DEPENDENCIES_HOST_PREREQ. If we did, host-cmake
> would be a dependency for _any_ package when it's not installed on the
> host, even when no cmake package is selected.
>
> check-host-cmake.sh requires CMake to be at least 3.0 to consider it
> suitable. This is because older versions are affected by the bug
> described and fixed in Buildroot in ef2c1970e4bf ("cmake: add patch to
> fix Qt mkspecs detection"). The bug was fixed in upstream CMake in
> version 3.0 [0].
>
> Besides, among all the cmake packages currently in Buildroot, the
> highest version mentioned in cmake_minimum_required() is 3.0 (the
> grantlee package). Thus 3.0 should be enough to build all current
> packages. Of course, with the addition or bump of packages, the
> minimum required version will raise.
>
> Tested on:
>  - Ubuntu 14.04 without CMake, with official CMake (2.8), PPA CMake
>    (3.2)
>  - Ubuntu 15.10 without CMake, with official CMake (3.2)
>
> [0] https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Davide Viti <zinosat@tiscali.it>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>

[1] https://cmake.org/cmake/help/v3.4/module/FindPkgConfig.html

Regards,

-- 
Samuel
