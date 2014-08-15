From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Aug 2014 00:04:07 +0200
Subject: [Buildroot] [PATCH 1 of 5 v4 for 2014.08] Makefile:
 unconditionally include pkg-utils.mk
In-Reply-To: <232206819ca1e46d14b1.1408110034@localhost>
References: <patchbomb.1408110033@localhost>
 <232206819ca1e46d14b1.1408110034@localhost>
Message-ID: <20140815220407.GA27341@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-15 15:40 +0200, Thomas De Schampheleire spake thusly:
> Currently, pkg-utils.mk (included via package/Makefile.in) is only included
> when a configuration file already exists. This means that none of the
> utilities it defines are available without .config.
> 
> In particular:
> - the MESSAGE macro, causing pretty build output. Since some make targets
>   can be run even without .config, like 'make manual', not having this
>   pretty printing is odd.
> 
> - pkgname, pkgdir: in a subsequent patch, these functions will be used for
>   the generation of the manual, and since this should work also without
>   .config, we need these functions to be available.
> 
> This patch moves the include of pkg-utils.mk from package/Makefile.in to
> Makefile, outside of the check for .config.
> 
> This is a quick fix. The full solution involves to minimize the amount of
> Makefile code that is guarded by a check on .config. This approach will be
> taken in the 2014.11 release cycle.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested by generating the manual with and without a .config.
Tested that running make with no .config will popup the menuconfig.
Tested that a defconfig still builds OK.

Regards,
Yann E. MORIN.

> ---
> v4: no changes
> v3: new patch, fixing the issue detected by Yann that 'make manual' no
> longer worked without .config
> 
>  Makefile            |  2 ++
>  package/Makefile.in |  1 -
>  2 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff -r 3bcf63a46bc1 -r 232206819ca1 Makefile
> --- a/Makefile	Tue Aug 05 18:25:11 2014 -0300
> +++ b/Makefile	Wed Aug 13 11:30:25 2014 +0200
> @@ -271,6 +271,8 @@
>  # Causes breakage with packages that needs host-ruby
>  unexport RUBYOPT
>  
> +include package/pkg-utils.mk
> +
>  ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  ################################################################################
> diff -r 3bcf63a46bc1 -r 232206819ca1 package/Makefile.in
> --- a/package/Makefile.in	Tue Aug 05 18:25:11 2014 -0300
> +++ b/package/Makefile.in	Wed Aug 13 11:30:25 2014 +0200
> @@ -385,7 +385,6 @@
>  SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
>  endif
>  
> -include package/pkg-utils.mk
>  include package/pkg-download.mk
>  include package/pkg-autotools.mk
>  include package/pkg-cmake.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
