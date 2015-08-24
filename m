From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:33:08 +0200
Subject: [Buildroot] [PATCH 2/4 v2] core/pkg-kernel-module: drop
 now-useles check for CONFIG_MODULES
In-Reply-To: <672d1cb2623b894cc263b04c7b796cc1ab1267f9.1440434894.git.yann.morin.1998@free.fr>
References: <cover.1440434894.git.yann.morin.1998@free.fr>
 <672d1cb2623b894cc263b04c7b796cc1ab1267f9.1440434894.git.yann.morin.1998@free.fr>
Message-ID: <55DB7F84.9080806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2015 06:50 PM, Yann E. MORIN wrote:
> Now that we force-enable support for modules in the kernel config, we
> need not check it.
> 
> Besides, the check was broken, because it did not use $$ to dereference
> LINUX_DIR, thus leading to systematic build failures when a package
> using the kernel-module infra was enabled.

 Would be nice to add:

This reverts commit 8df95d926e963601c727defeb4ab90ce2368da70
[pkg-kernel-module: die if kernel module support is disabled]


 Otherwise:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: No? Rubinstein <noe.rubinstein@gmail.com>
> Cc: Jan Viktorin <viktorin@rehivetech.com>
> 
> ---
> Changes v1 -> v2:
>   - the check was broken anyway
> ---
>  package/pkg-kernel-module.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> index f6730b8..200c91d 100644
> --- a/package/pkg-kernel-module.mk
> +++ b/package/pkg-kernel-module.mk
> @@ -65,10 +65,6 @@ $(2)_MODULE_SUBDIRS ?= .
>  # includes and other support files (Booo!)
>  define $(2)_KERNEL_MODULES_BUILD
>  	@$$(call MESSAGE,"Building kernel module(s)")
> -	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
> -		echo "ERROR: Kernel does not support loadable modules"; \
> -		exit 1; \
> -	fi
>  	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
>  		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
>  			-C $$(LINUX_DIR) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
