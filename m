From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2019 23:54:45 +0200
Subject: [Buildroot] [PATCH: for-master 3/3] package/gcc: allow uclibc
 only for gcc or1k (5.x)
In-Reply-To: <20190817112638.11289-3-romain.naour@gmail.com>
References: <20190817112638.11289-1-romain.naour@gmail.com>
 <20190817112638.11289-3-romain.naour@gmail.com>
Message-ID: <4449f34f-e335-b3a9-e324-38f0356e22a6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 13:26, Romain Naour wrote:
> uClibc doesn't build with the upstream binutils and gcc or1k
> port due to the following error:
> 
> LD libuClibc-1.0.31.so
> /opt/openrisc--uclibc--bleeding-edge-1/lib/gcc/or1k-buildroot-linux-uclibc/9.2.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
> libc/libc_so.a(or1k_clone.os): pc-relative relocation against dynamic symbol
> __syscall_error
> 
> See:
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/270854456
> 
> This error message come from a new check in binutils 2.32.x:
> 
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=f2c1801f6255a3f9f483ae2f07c7d7da0ddae4af
> 
> This issue has been reported on the uClibc-ng mailing list:
> https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html
> 
> For now, disable uClibc if gcc 9.1 is used for or1k.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
> ---
>  package/gcc/Config.in.host | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 9b0fbf7d11..4bd0fc6d7c 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -61,6 +61,9 @@ config BR2_GCC_VERSION_9_X
>  	bool "gcc 9.x"
>  	# or1k needs binutils >= 2.32
>  	depends on !BR2_or1k || (BR2_or1k && !BR2_BINUTILS_VERSION_2_30_X && !BR2_BINUTILS_VERSION_2_31_X)
> +	# uClibc doesn't build with upstream or1k gcc
> +	# https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html
> +	depends on !BR2_or1k || (BR2_or1k && !BR2_TOOLCHAIN_USES_UCLIBC)

 I've inverted the logic here as well, and applied to master, thanks.

 Regards,
 Arnout

>  	# powerpc spe support has been deprecated since gcc 8.x.
>  	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
>  	depends on !BR2_powerpc_SPE
> 
