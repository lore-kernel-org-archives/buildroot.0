From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 01:21:19 +0100
Subject: [Buildroot] [PATCH 39/84 RFC] docs/manual: use 'menuconfig'
 when there are more than 5 sub-options
In-Reply-To: <b99c60174e89c794c76df7cb0c2bdd79ddace67c.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <b99c60174e89c794c76df7cb0c2bdd79ddace67c.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <568474FF.1080701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
> When a package has a lot of sub-options, the layout in menuconfig (the
> mconf UI) is quickly getting messy.
> 
> Using 'menuconfig' (the kconfig keyword) will automatically create a
> sub-menu, which provides a cleaner layout.
> 
> Document that, with 5 or more options, a 'menuconfig' should be used
> instead of a simple 'config'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Note: 5 is arbitrary. We could tweak it to a bit more, but on small
> terminals (the smallest supported is 80x24), there are only 10 lines
> for the menu entries, so 5 looks like a good compromise. YMMV.
> ---
>  docs/manual/adding-packages-directory.txt | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 2b9e714..df3011b 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -79,6 +79,34 @@ The sub-options will be cleanly indented below the main symbol when it
>  is enabled, and will be properly hidden when the symbol is disabled.
>  
>  
> +If your package has 5 or more options, then you should use +menuconfig+
> +to define the main symbol; this will ensure that all the package's
> +sub-options are automaticaly classified in a sub-menu:
> +
> +---------------------------
> +menuconfig BR2_PACKAGE_LIBFOO
> +	bool "libfoo"
> +	help
> +	  This is a comment that explains what libfoo is.
> +
> +	  http://foosoftware.org/libfoo/
> +
> +if BR2_PACKAGE_LIBFOO
> +
> +config BR2_PACKAGE_LIBFOO_BAR
> +	bool "bar support"
> +	help
> +	  This is a comment that briefly explains what
> +	  bar support is, if it's not obvious.

 Again the wrapping.


 Regards,
 Arnout

> +
> +endif # BR2_PACKAGE_LIBFOO
> +---------------------------
> +
> +In any case, ensure that there is no +comment+ or other symbol in-between
> +the main symbol (be it +config+ or +menuconfig+) and the +if+ clause,
> +otherwise 'Kconfig' will not properly classify the sub-options.
> +
> +
>  Finally you have to add your new +libfoo/Config.in+ to
>  +package/Config.in+ (or in a category subdirectory if you decided to
>  put your package in one of the existing categories). The files
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
