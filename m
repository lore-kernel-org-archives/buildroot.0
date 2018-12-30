From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 18:10:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/gettext: Turn into virtual
 package
In-Reply-To: <20181223150448.21980-2-vadim4j@gmail.com>
References: <20181223150448.21980-1-vadim4j@gmail.com>
 <20181223150448.21980-2-vadim4j@gmail.com>
Message-ID: <20181230181026.3ce6aca3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

First of all, thanks a *lot* for pursuing this work, it is really nice
to see some progress in this area. Every time host-gettext is building
on my machine, I'm really annoyed, and remember about the need to have
gettext-tiny support. See below for some comment.

On Sun, 23 Dec 2018 17:04:47 +0200, Vadim Kochan wrote:

> diff --git a/package/gettext/Config.in b/package/gettext/Config.in
> index e55663b1d7..9546468571 100644
> --- a/package/gettext/Config.in
> +++ b/package/gettext/Config.in
> @@ -1,5 +1,12 @@
> -config BR2_PACKAGE_GETTEXT
> +menuconfig BR2_PACKAGE_GETTEXT
>  	bool "gettext"
> +	select BR2_PACKAGE_HAS_GETTEXT
> +
> +if BR2_PACKAGE_GETTEXT
> +
> +config BR2_PACKAGE_GETTEXT_GNU
> +	bool "gettext-gnu"
> +	default y
>  	depends on BR2_USE_WCHAR
>  	help
>  	  The GNU `gettext' utilities are a set of tools that provide a
> @@ -12,14 +19,23 @@ config BR2_PACKAGE_GETTEXT
>  
>  	  http://www.gnu.org/software/gettext/
>  
> -if BR2_PACKAGE_GETTEXT
> +comment "gettext-gnu needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
>  	bool
>  	default y if BR2_SYSTEM_ENABLE_NLS
>  	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
>  
> -endif
> +config BR2_PACKAGE_PROVIDES_GETTEXT
> +	string
> +	default "gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
>  
> -comment "gettext needs a toolchain w/ wchar"
> -	depends on !BR2_USE_WCHAR
> +config BR2_PACKAGE_HAS_GETTEXT
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
> +	string
> +	default "host-gettext-gnu"
> +
> +endif

I'm not convinced by how this virtual package is handled in Config.in.
In fact, if you apply both of your patches, it's broken, you have:

config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
        string
        default "host-gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
        default "host-gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY

which means that when the target package is not selected, the
host-gettext virtual package doesn't "point" to anything. And indeed:
do a simple build with nothing enable, and run "make host-flex". It
will fail with:

make[1]: *** No rule to make target 'host-', needed by '/home/thomas/projets/buildroot/output/build/host-gettext/.stamp_configured'.  Stop.
make: *** [Makefile:84: _all] Error 2

Because the host-gettext virtual package has no provider.

So let's analyze this in detail.

First, for the *target* gettext virtual package, what do we want. I
guess what we want is simply:

 - To use the full gettext when BR2_TARGET_ENABLE_NLS=y

 - To use gettext-tiny when BR2_TARGET_ENABLE_NLS is disabled

I don't see any meaningful use case for full gettext with
BR2_TARGET_ENABLE_NLS disabled, or for gettext-tiny with
BR2_TARGET_ENABLE_NLS=y.

To me, this means that for the target package,
package/gettext/Config.in shouldn't offer a choice between full and
tiny: it should automatically use full or tiny depending on the
BR2_TARGET_ENABLE_NLS value.

Now, there is the question of what to do with the host-gettext virtual
package, i.e in which case it should use the full host gettext or host
gettext-tiny.

So, we need host-gettext for two things:

 - Some packages explicitly need it.

 - Some packages need it through TARGET_NLS_DEPENDENCIES

 - Some packages need it through <pkg>_GETTEXTIZE = YES

So we need to understand if the rule is as simple as: full host gettext
when BR2_TARGET_ENABLE_NLS=y and tiny host gettext when
BR2_TARGET_ENABLE_NLS is disabled, or whether it is possible to use
gettext tiny for host gettext when BR2_TARGET_ENABLE_NLS=y.

Do you have some ideas about this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
