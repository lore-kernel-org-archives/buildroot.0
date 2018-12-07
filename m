From: robert rose <robertroyrose@gmail.com>
Date: Fri, 7 Dec 2018 10:03:54 -0800
Subject: [Buildroot] [PATCH 1/1] package/grpc: add explicitly link with
 libatomic
In-Reply-To: <20181207171241.27832-1-ryan.barnett@rockwellcollins.com>
References: <20181207171241.27832-1-ryan.barnett@rockwellcollins.com>
Message-ID: <CALxq1w6st690FcKphMKmPYLoaVG03+hn3Y1ivGWuoo5nUf1-iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Robert Rose <robertroyrose@gmail.com>

On Fri, Dec 7, 2018 at 9:12 AM Ryan Barnett <
ryan.barnett@rockwellcollins.com> wrote:

> On some architectures, you must link with libatomic, on some other
> architectures, they are available built-in, but in all cases, linking
> against libatomic does not harm.
>
> Fixes:
>
> http://autobuild.buildroot.org/results/2f2/2f208fbfe4e9da94be5b9c030dbd278cb8ba053c/
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  package/grpc/grpc.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 6ca6536fff..527c7fa7e2 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -23,6 +23,12 @@ GRPC_CONF_OPTS = \
>         -DgRPC_ZLIB_PROVIDER=package \
>         -DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
>
> +# grpc can uses __atomic builtins, so we need to link with
> +# libatomic for the architectures who need libatomic.
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GRPC_CONF_OPTS += -DCMAKE_C_STANDARD_LIBRARIES="-latomic"
> +endif
> +
>  HOST_GRPC_CONF_OPTS = \
>         -D_gRPC_CARES_LIBRARIES=cares \
>         -DgRPC_CARES_PROVIDER=none \
> --
> 2.17.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181207/f3b0fdcf/attachment.html>
