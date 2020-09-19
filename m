From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Sep 2020 10:18:18 +0200
Subject: [Buildroot] [PATCH] package/grpc: fix build on ubuntu gcc 4.8
In-Reply-To: <20200915161107.1826-1-buildroot@heine.tech>
References: <20200915161107.1826-1-buildroot@heine.tech>
Message-ID: <20200919081818.GJ2422@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-09-15 18:11 +0200, Michael Nosthoff via buildroot spake thusly:
> gcc 4.8 on ubuntu 14.04 does some broken optimization at link-time
> which causes grpc to create a grpc_cpp_plugin which quits because
> of a failing assertion. The created plugin is itself used during
> compilation which lets the build fail.
> With the added -Wl,--no-as-needed flag the LTO is disabled and grpc
> compiles successfully.
> 
> fixes:
> - http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e
> - http://autobuild.buildroot.net/results/3ebb2880b9b3fd5154979016391dde897e2c039c
> - http://autobuild.buildroot.net/results/c2078e821e0728fe980be2c849c25d82e791a4c2
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/grpc/grpc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 2114f98e40..4db309d4e9 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -72,5 +72,12 @@ HOST_GRPC_CONF_OPTS = \
>  	-DgRPC_ZLIB_PROVIDER=package \
>  	-DgRPC_ABSL_PROVIDER=package
>  
> +#With gcc 4.8 (at least on ubuntu) there is a bug in LTO which breaks the linkage of
> +#the grpc_cpp_plugin with libprotobuf and pthread. This additional flag fixes this.
> +ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
> +HOST_GRPC_CONF_OPTS += \
> +	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS) -Wl,--no-as-needed"
> +endif

I was wondering how much harm that would do to use that unconditionally.

However, we are really only impacted by that old Ubuntu 14.04 gcc-4.8
compiler (it may in fact be a bug in ld, not gcc, so binutils 2.24).

We also have not seen that issue on any of our other autobuilders, and
no user has reported that issue (that I am aware of).

So, in the end, I believe this condition _is_ the safe bet.

Applied to master, after re-wrapping the comment. Thanks! :-)

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> -- 
> 2.25.1
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
