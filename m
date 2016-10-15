From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 17:35:43 +0200
Subject: [Buildroot] [PATCH v3 6/8] package/opencv3: fix CMAKE_CXX_FLAGS
In-Reply-To: <20161015094437.6989-7-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-7-s.martin49@gmail.com>
Message-ID: <a9b59faa-aa01-014a-44b6-bff841862a8a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 11:44, Samuel Martin wrote:
> From: Max Filippov <jcmvbkbc@gmail.com>
> 
> The commit 4904c4c "package/opencv3: use BR2_TOOLCHAIN_HAS_LIBATOMIC"
> overrides CMAKE_CXX_FLAGS with the single -latomic, losing all ABI
> CFLAGS that are passed there by default. This breaks build on xtensa
> where ABI CFLAGS contain important code generation options.

 Really, these important ABI flags should be added to the wrapper and not just
passed as CFLAGS. Still, this patch is correct, so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

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
>  endif
>  
>  # OpenCV component options
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
