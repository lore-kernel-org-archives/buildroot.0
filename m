From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 8 Sep 2016 21:51:55 +0200
Subject: [Buildroot] [PATCHv6] core: don't build host-cmake if it is
 available on the build host
In-Reply-To: <1473201140-28745-1-git-send-email-yann.morin.1998@free.fr>
References: <1473201140-28745-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <907756e1-8e2d-d0b5-9da7-8d9f4e909010@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On 07/09/2016 00:32, Yann E. MORIN wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
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
> Thus we automatically skip building host-cmake and use the one on the
> system if:
>  - cmake is available on the system and
>  - it is recent enough.
> 
> First, we leverage the existing infrastructure in
> support/dependencies/dependencies.mk to find out whether there's a
> suitable cmake executable on the system. Its path can be passed in the
> BR2_CMAKE environment variable, otherwise it defaults to "cmake". If
> it is enabled, found and suitable then we set BR2_CMAKE_HOST_DEPENDENCY
> to empty; otherwise we set BR2_CMAKE_HOST_DEPENDENCY to 'host-cmake' and
> override BR2_CMAKE with "$(HOST_DIR)/usr/bin/cmake" to revert to using
> our own cmake (the old behaviour).
> 
> Then in pkg-cmake.mk we replace the hard-coded dependency on host-cmake
> to using the BR2_CMAKE_HOST_DEPENDENCY variable, and we use $(BR2_CMAKE)
> instead of $(HOST_DIR)/usr/bin/cmake.
> 
> Unlike what we do for host-tar and host-xzcat, for host-cmake we do
> not add host-cmake to DEPENDENCIES_HOST_PREREQ. If we did, host-cmake
> would be a dependency for _any_ package when it's not installed on the
> host, even when no cmake package is selected.
> 
> Cmake versions older than 3.0 are affected by the bug described and
> fixed in Buildroot in ef2c1970e4bf ("cmake: add patch to fix Qt mkspecs
> detection"). The bug was fixed in upstream CMake in version 3.0 [0].
> 
> Amongst all the cmake packages currently in Buildroot, the currently
> highest version mentioned in cmake_minimum_required() is 3.1 (grantlee
> and opencv3).
> 
> Thus we use 3.1 as the lowest required cmake for now, until a package is
> bumped, or a new package added, with a higher required version.
> 
> We then ensure, as a post-patch hook in the cmake infra, that no
> package requires a cmake version higher than what we do in Buildroot.
> If that's not the case, this is considered an error and the build is
> aborted. We use a post-patch hook rather a more obvious pre-configure
> hook because it is then easier to check the requirements of a package
> without having to build all its dependencies first.
> 
> However, the target cmake requires up to cmake 3.4 for running its
> tests; and they do not get built in our case. Bumping the required host
> cmake minimum version for the whole of Buildroot would almost always
> defeat the purpose of this change. So we just exclude the target cmake
> from the version check.
> 
> [0] https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Davide Viti <zinosat@tiscali.it>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> Tested-by: Romain Naour <romain.naour@gmail.com>
> [yann.morin.1998 at free.fr:
>   - simplify logic in check-host-cmake.mk;
>   - set and use BR2_CMAKE_HOST_DEPENDENCY, drop USE_SYSTEM_CMAKE;
>   - bump to cmake 3.1 for grantlee and opencv;
>   - add the post-patch hook; exclude target cmake from the check.
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
