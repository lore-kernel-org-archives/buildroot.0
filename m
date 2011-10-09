From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 9 Oct 2011 23:46:21 +0200
Subject: [Buildroot] [PATCH 9/9] toolchain: speed up sysroot lib copying
In-Reply-To: <00e260122ba4b08d9809dd9eaa00dc3a25f84dbd.1318182187.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <00e260122ba4b08d9809dd9eaa00dc3a25f84dbd.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110092346.22169.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 09 October 2011 19:44:32 Thomas Petazzoni wrote:
> From: Mike Frysinger <vapier@gentoo.org>
> 
> The copy_toolchain_lib_root helper searches the entire sysroot, but is
> only interested in files in certain subdirs.  So rather than waste time
> in walking the entire tree, walk the few subdirs at the depth level we
> are actually going to be poaching files from.
> 
> Some simplification suggested by Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> and Arnout Vandecappelle
> <arnout@mind.be>, added by Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

BTW, what's the policy when replying: should I also CC: Mike, as he's
the original author, or just the person that submitted the patch?

Regards,
Yann E. MORIN.

> ---
>  toolchain/helpers.mk |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 7f3efaa..5585f45 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -22,9 +22,8 @@ copy_toolchain_lib_root = \
>  	DESTDIR="$(strip $3)" ; \
>   \
>  	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
> -		find -L . -path "./lib/$${LIB}.*"     -o \
> -			  -path "./usr/lib/$${LIB}.*" -o \
> -			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
> +		find -L lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib* \
> +			-maxdepth 1 -name "$${LIB}.*" 2>/dev/null \
>  		)` ; \
>  	for FILE in $${LIBS} ; do \
>  		LIB=`basename $${FILE}`; \
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
