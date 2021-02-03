From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:09:26 +0100
Subject: [Buildroot] [PATCH 3/3] package/grpc: disable unnecessary build
 plugins
In-Reply-To: <20210203124325.18843-4-patrickdepinguin@gmail.com>
References: <20210203124325.18843-1-patrickdepinguin@gmail.com>
 <20210203124325.18843-4-patrickdepinguin@gmail.com>
Message-ID: <20210203220926.GN2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-03 13:43 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> grpc has plugins for multiple programming languages, which are needed on
> development machines only. Examples are grpc_cpp_plugin, grpc_ruby_plugin,
> etc.
> 
> Even though before commit fedf3318e3fd3c9ba57389ed2b36472f1a772b9e,
> grpc_cpp_plugin was not installed for target, all other plugins still were.
> This causes additional build time and rootfs space.
> 
> As Buildroot does not support building a development environment for target,
> these tools can be disabled.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/grpc/grpc.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index a8a3af89ef..27b28deff3 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -27,7 +27,14 @@ GRPC_CONF_OPTS = \
>  	-DgRPC_PROTOBUF_PROVIDER=package \
>  	-DgRPC_RE2_PROVIDER=package \
>  	-DgRPC_SSL_PROVIDER=package \
> -	-DgRPC_ZLIB_PROVIDER=package
> +	-DgRPC_ZLIB_PROVIDER=package \
> +	-DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF \
> +	-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
> +	-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
> +	-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
> +	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
> +	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
> +	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF

So I am OK with applying this patch in bulk, because it makes sense.

IIUC, the grpc_cpp_plugin will generate C++ code, and so the
grpc_node_plugin will generate JS code, and so on... Right?

If so, would it make sense to also trim the host variant further, too?

I.e. if there is no nodejs on the target, then no need for the node
plugin. Ditto, if there is no C++, then no need to build the cpp plugin,
right?

Oh, except those may also be used to build host packages, too... And we
do not have a good way to know what languages the host packages would
need... So in the end, we do not want to disable any plugin for the host
variant...

(Yeah, I'm thinking aloud, sorry for the noise...))

Damn, I already pushed, or I'd have added as a comment and to the
commit.

`nyway... Thanks for the fixes! :-)

Regards,
Yann E. MORIN.

>  # grpc can use __atomic builtins, so we need to link with
>  # libatomic when available
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
