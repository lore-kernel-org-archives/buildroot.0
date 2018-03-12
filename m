From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 12 Mar 2018 21:00:04 +0100
Subject: [Buildroot] [PATCH] cmake: Fix RPATH for host libraries built
 by CMake
In-Reply-To: <ef04ec321632c14eb54ccc7bbd3638d60f602d3e.1520880682.git.jan.kundrat@cesnet.cz>
References: <ef04ec321632c14eb54ccc7bbd3638d60f602d3e.1520880682.git.jan.kundrat@cesnet.cz>
Message-ID: <CAHXCMM+Bk4w6Rzh+RJ=wTKViB==1TRBPf78buYH8qqkjGUFX9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan, all,

On Mon, Mar 12, 2018 at 7:41 PM, Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
> The host shared libraries produced by CMake were missing a proper
> DT_RPATH. That became a problem because the DT_RPATH handling is not
> transitive by design.
>
> Consider the following scenario:
>
> - pkg-a provides a library (`liba`) which links to `libpcre`
> - pkg-b provides a binary (`foo`) and a shared library (`libb`) which is
> needed by that binary
> - `libb` links to `liba`
> - pkg-a and pkg-b are both built by CMake
>
> In this scenario, `foo` is correctly marked with DT_RPATH pointing to
> host/lib/, but that path is not used when (recursively) resolving PCRE's
> symbols in `liba`. When attempting to run the `foo` binary, the linker
> correctly finds both `liba` and `libb`, but it cannot find the
> libpcre.so as built by Buildroot for host.
>
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/pkg-cmake.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 14ffe4a88f..9b07798a1e 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -132,6 +132,7 @@ define $(2)_CONFIGURE_CMDS
>                 -DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
>                 -DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
>                 -DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
> +               -DCMAKE_SHARED_LINKER_FLAGS="$$(HOST_LDFLAGS)" \

hmm... I though this was already in Buildroot... I must mix up with
something else :-/

>                 -DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
>                 -DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
>                 -DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
> --
> 2.16.2
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regard,

-- 
Samuel
