From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 22:46:47 +0200
Subject: [Buildroot] [PATCH v2] package/flann: fix build with cmake >=
 3.11
In-Reply-To: <20180425211749.27138-1-romain.naour@gmail.com>
References: <20180425211749.27138-1-romain.naour@gmail.com>
Message-ID: <20180427224647.03dfc013@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Apr 2018 23:17:49 +0200, Romain Naour wrote:
> CMake < 3.11 doesn't support add_library() without any source file
> (i.e add_library(foo SHARED)). But flann CMake use a trick that use
> an empty string "" as source list (i.e add_library(foo SHARED "")).
> This look like a bug in CMake < 3.11.
> 
> With CMake >= 3.11, the new behaviour of add_library() break the
> existing flann CMake code.
> 
> From CMake Changelog [1]:
> "add_library() and add_executable() commands can now be called without
>  any sources and will not complain as long as sources are added later
>  via the target_sources() command."
> 
> Note: flann CMake code doesn't use target_sources() since no source file
> are provided intentionally since the flann shared library is created by
> linking with the flann_cpp_s static library with this line:
> 
> target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s -Wl,-no-whole-archive)
> 
> If you try to use "add_library(flann_cpp SHARED ${CPP_SOURCES})" (as it should
> be normally done), the link fail due to already defined symbol.
> 
> They are building the shared version using the static library "to speedup the
> build time" [3]
> 
> This issue is already reported upstream [2] with a proposed solution.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b2f/b2febfaf8c44ce477b3e4a5b9b976fd25e8d7454
> 
> [1] https://cmake.org/cmake/help/v3.11/release/3.11.html
> [2] https://github.com/mariusmuja/flann/issues/369
> [3] https://github.com/mariusmuja/flann/commit/0fd62b43be2fbb0b8d791ee36290791224dc030c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Davide Viti <zinosat@tiscali.it>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: improve the commit log (ThomasP)
> ---
>  .../flann/0001-src-cpp-fix-cmake-3.11-build.patch  | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/flann/0001-src-cpp-fix-cmake-3.11-build.patch

Thanks for the improved commit log. Applied to master!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
