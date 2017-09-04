From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Sep 2017 18:09:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] toolchain: detect external glibc in
	merged /usr
In-Reply-To: <20170903210043.19105-1-camh@xdna.net>
References: <20170903210043.19105-1-camh@xdna.net>
Message-ID: <20170904160923.GA5223@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On 2017-09-04 07:00 +1000, Cam Hutchison spake thusly:
> When using an external toolchain that was built with Buildroot and a
> merged /usr, the dynamic linker is actually in /usr/lib.
> 
> But the check_glibc macro limits the depth it is looking for the dynamic
> linker, and misses it when it is in /usr/lib because it is too deep.
> 
> We could fix that in two ways: increase the depth in which we look
> for it, or follow symlinks. We choose the second solution.
> 
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Reworded commit message (suggested by Yann)
> 
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index e9e36d2069..63ef6fb4b0 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -227,7 +227,7 @@ check_glibc_rpc_feature = \
>  #
>  check_glibc = \
>  	SYSROOT_DIR="$(strip $1)"; \
> -	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
> +	if test `find -L $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
>  		echo "Incorrect selection of the C library"; \
>  		exit -1; \
>  	fi; \
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
