From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Jan 2017 10:54:39 +0100
Subject: [Buildroot] [PATCH 1/1] rpm: disable static build support
In-Reply-To: <20170107003006.17188-1-james.knight@rockwellcollins.com>
References: <20170107003006.17188-1-james.knight@rockwellcollins.com>
Message-ID: <20170107095439.GB3378@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-01-06 19:30 -0500, James Knight spake thusly:
> The RPM package requires dynamic linking support (dlfcn.h) for its
> capabilities related to plugins (and possibly more). The following
> commit adds a dependency to !BR2_STATIC_LIBS.
> 
> Indirectly fixes (see [1]):
> 
>   http://autobuild.buildroot.net/results/139/1394a6e43529a3969572912dcbdd5606770beeeb/
>   http://autobuild.buildroot.net/results/f4f/f4f8d21e70fcd79668847407586db2bf3e56feb5/
>   http://autobuild.buildroot.net/results/80e/80e40419d657ee16b4d38f08d894822e532ab63d/
>   http://autobuild.buildroot.net/results/f36/f368e1e7310a3cf8266fd351b8b76496868af7e7/

Although I agree that a depednency on !static is correct because of the
use of dlfcn.h et al., the autobuild failures you report are, as you
said, unrelated: rpm fails to build because it does not link with -lz.

So I don't think they should be in the commit log. You may put them in
a post-commit-log (after the --- line), though.

> [1]: https://github.com/rpm-software-management/rpm/pull/118

And I tend to agree with there reasoning. Besides, this is not enough
because popt then fails to link because it misses symbols from libintl.
And so on...

> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Otherwise, I'm OK with that.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/rpm/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 8b7705d..9b4c8a7 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -1,10 +1,11 @@
> -comment "rpm needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "rpm needs a toolchain w/ dynamic library and threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	depends on BR2_USE_MMU
>  
>  config BR2_PACKAGE_RPM
>  	bool "rpm"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
>  	depends on BR2_USE_MMU # fork()
> -- 
> 2.8.4.windows.1
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
