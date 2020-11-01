From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2020 11:14:24 +0100
Subject: [Buildroot] [PATCH] package/uhd: fix build with riscV
In-Reply-To: <20201030153145.1198183-1-gwenj@trabucayre.com>
References: <20201030153145.1198183-1-gwenj@trabucayre.com>
Message-ID: <20201101101424.GC2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-10-30 16:31 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> UHD with riscV CPU fails to build with error like:
> /xxx/output-1/build/uhd-3.15.0.0/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:190:2: error: #error msgpack-c supports only big endian and little endian
>   190 | #error msgpack-c supports only big endian and little endian
>       |  ^~~~~
> 
> msgpack, required by MPMD, support many architecture but not riscV, and,
> consequently is unable to determine the endianess.

The issue is two folds:
 1. uhd bundles (or re-implements?) its own copy of msgpack-c;
 2. the bundled msgpack-c borked its detection of the endianness.

So, I think a better solution would be to actually fix the endian
detection [0]. Indeed, a CPU is either big or little endian [1], so
failing to detect actually detect that is pretty serious...

[0] uhd-3.15.0.0/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h

[1] Yeah, back in the good old days, we had mixed endian CPUs that were
word-swapped, but those really no longer exist, and are definitely not a
target for Buildroot.

Regards,
Yann E. MORIN.

> This patch add a depends on !(BR2_RISCV_64 || BR2_RISCV_32) to disable MPMD
> for riscV target.
> Since E300 and E320 needs MPMD, the select is replaced by depends on
> 
> Fixes:
> - http://autobuild.buildroot.net/results/b501a8bf90f2eb10c3f98f26a52539392d320088/
> - http://autobuild.buildroot.net/results/f7ae898c6ecdfa568eb97f7cae6447e97ce306a0/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/uhd/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uhd/Config.in b/package/uhd/Config.in
> index 32cb4cf89d..cf4f470629 100644
> --- a/package/uhd/Config.in
> +++ b/package/uhd/Config.in
> @@ -45,13 +45,13 @@ config BR2_PACKAGE_UHD_B200
>  
>  config BR2_PACKAGE_UHD_E300
>  	bool "E300 support"
> -	select BR2_PACKAGE_UHD_MPMD
> +	depends on BR2_PACKAGE_UHD_MPMD
>  	help
>  	  enable E300 support
>  
>  config BR2_PACKAGE_UHD_E320
>  	bool "E320 support"
> -	select BR2_PACKAGE_UHD_MPMD
> +	depends on BR2_PACKAGE_UHD_MPMD
>  	help
>  	  enable E320 support
>  
> @@ -62,6 +62,7 @@ config BR2_PACKAGE_UHD_EXAMPLES
>  
>  config BR2_PACKAGE_UHD_MPMD
>  	bool "MPMD support"
> +	depends on !(BR2_RISCV_64 || BR2_RISCV_32)
>  	help
>  	  enable MPMD support
>  
> -- 
> 2.20.1
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
