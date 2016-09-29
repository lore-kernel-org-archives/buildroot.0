From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2016 11:27:36 +0200
Subject: [Buildroot] [PATCH] package/opencv3: fix CMAKE_CXX_FLAGS
In-Reply-To: <1475088032-30321-1-git-send-email-jcmvbkbc@gmail.com>
References: <1475088032-30321-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160929112736.27dc4474@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Samuel in Cc: there is a CMake issue below.

On Wed, 28 Sep 2016 11:40:32 -0700, Max Filippov wrote:
> The commit 4904c4c "package/opencv3: use BR2_TOOLCHAIN_HAS_LIBATOMIC"
> overrides CMAKE_CXX_FLAGS with the single -latomic, losing all ABI
> CFLAGS that are passed there by default. This breaks build on xtensa
> where ABI CFLAGS contain important code generation options.
> 
> Append $(TARGET_CXXFLAGS) to CMAKE_CXX_FLAGS along with -latomic.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/7f1c96abd8fbb5b358a07100ab623316e9bb9dcd
>   http://autobuild.buildroot.net/results/e0c93d0f6d1da0d62d4dbba211a275bfe75e9645
>   http://autobuild.buildroot.net/results/53e7e4b4b6a7b48b8012799d7507f7594dbf01b2
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/opencv3/opencv3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 2529de9..10660a9 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -12,7 +12,7 @@ OPENCV3_LICENSE_FILES = LICENSE
>  
>  # Uses __atomic_fetch_add_4
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-latomic"
> +OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"

There is something fishy going on here. Indeed,
support/misc/toolchainfile.cmake.in contains:

  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")

So it should normally always prefix CMAKE_CXX_FLAGS with
TARGET_CXXFLAGS. Can you check the toolchain.cmake file that gets
generated during your build? Does it contains the Xtensa specific
CXXFLAGS ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
