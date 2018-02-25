From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 22:41:57 +0100
Subject: [Buildroot] [PATCH 1/1] check-bin-arch: skip /lib/modules to
 allow 32-bit userland on 64-bit arch
In-Reply-To: <20180220111156.31881-1-thomas.de_schampheleire@nokia.com>
References: <20180220111156.31881-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180225214157.GH2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-02-20 12:11 +0100, Thomas De Schampheleire spake thusly:
> The script check-bin-arch fails as follows on a config for PowerPC e6500
> (64-bit CPU) with BR2_ARCH="powerpc" (32-bit userland desired):
> 
> ERROR: architecture for "/lib/modules/..../lib/libcrc32c.ko"
>             is "PowerPC64", should be "PowerPC"
> 
> This situation is perfectly acceptable: the kernel is 64-bit and so are its
> modules, even though userland is 32-bit.
> 
> To keep check-bin-arch and its caller simple, just skip /lib/modules/
> entirely, like is done for /lib/firmware and some others.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/check-bin-arch | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> index 887b6613cd..f6a4569c62 100755
> --- a/support/scripts/check-bin-arch
> +++ b/support/scripts/check-bin-arch
> @@ -29,6 +29,14 @@ while read f; do
>  		continue
>  	fi
>  
> +	# Skip kernel modules
> +	# When building a 32-bit userland on 64-bit architectures, the kernel
> +	# and its modules may still be 64-bit. To keep the basic
> +	# check-bin-arch logic simple, just skip this directory.
> +	if [[ "${f}" =~ ^/lib/modules/.* ]]; then
> +		continue
> +	fi
> +
>  	# Skip files in /usr/share, several packages (qemu,
>  	# pru-software-support) legitimately install ELF binaries that
>  	# are not for the target architecture
> -- 
> 2.13.6
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
