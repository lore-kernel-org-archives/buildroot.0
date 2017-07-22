From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 01:36:53 +0200
Subject: [Buildroot] [PATCH 13/20] package/skeleton: make it a virtual
 package
In-Reply-To: <3a434b0c0be62999b357b2ad81ab62bfed9e97d7.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <3a434b0c0be62999b357b2ad81ab62bfed9e97d7.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <b922d29e-33d5-3310-feca-70fbc6ac93a7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> We now have two packages that can act as a skeleton, skeleton-common,
> also known as our default skeleton, and skeleton-custom.
> 
> This means that the skeleton package can be a standard virtual package
> now.
> 
> Well, except that, besides being a virtual package, it also provides
> variables and macros that can be used by the other skeletons and/or the
> init systems.

 I guess this is a left-over from when you hadn't moved everything to system.mk
yet...

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 On this patch, I do have kind of big comments.

[snip]
> diff --git a/package/skeleton-custom/Config.in b/package/skeleton-custom/Config.in
> index b12bd8f73c..601c3b247e 100644
> --- a/package/skeleton-custom/Config.in
> +++ b/package/skeleton-custom/Config.in
> @@ -1,3 +1,6 @@
>  config BR2_PACKAGE_SKELETON_CUSTOM
>  	bool
> -	select BR2_PACKAGE_SKELETON
> +	select BR2_PACKAGE_HAS_SKELETON
> +
> +config BR2_PACKAGE_PROVIDES_SKELETON
> +	default "skeleton-custom" if BR2_PACKAGE_SKELETON_CUSTOM

 In almost all virtual package providers, we do it like:

if BR2_PACKAGE_SKELETON_CUSTOM
config BR2_PACKAGE_PROVIDES_SKELETON
	default "skeleton-custom"
endif

[snip]
>  config BR2_PACKAGE_SKELETON
>  	bool
> -	help
> -	  The basic skeleton for your rootfs.
> +	default y

 For most virtual packages, we don't define the Kconfig symbol (e.g. there is no
BR2_PACKAGE_EGL). Do we need it for skeleton?

> +
> +config BR2_PACKAGE_HAS_SKELETON
> +	bool

 We also don't really need this. It is used by packages that need the virtual
package to check if there is a provider for it. But no package 'depends on'
skeleton (or rather, all of them do), so we don't need this.

> +
> +config BR2_PACKAGE_PROVIDES_SKELETON
> +	string

 This one we do need :-)

[snip]
> diff --git a/system/Config.in b/system/Config.in
> index c27b013784..75b6a8edac 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -1,5 +1,9 @@
>  menu "System configuration"
>  
> +# Note: usually, it is not possible to select a provider of a virtual
> +# package.

 This is not true cryptodev, jpeg and mysql do exactly that. libressl/openssl
will also do it that way. In fact, a choice is in a way the better way to do it,
because then you're guaranteed not to have conflicting providers.

 So this entire comment is wrong and can be removed. IMO.

 Regards,
 Arnout

> But here we have an exception: there are only two providers
> +# and they only get selected each by separate entries in this choice.
> +# So this is a safe situation.
>  choice
>  	prompt "Root FS skeleton"
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
